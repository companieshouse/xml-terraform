#!/bin/bash
# Redirect the user-data output to the console logs
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
#Generate new cloudwatch conf file with updated log group and load into cw agent service
python /root/cw_log_conf.py \
 -g ${LOG_GROUP_NAME} \
 -o "amazon-cloudwatch-agent.log" \
 -l "/var/log/httpd/access_log" "/var/log/httpd/error_log"
. /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:amazon-cloudwatch-agent.log -s
#Create key:value variable
cat <<EOF >>inputs.json
${XML_FRONTEND_INPUTS}
EOF
#Create the TNSNames.ora file for Oracle
/usr/local/bin/j2 -f json /usr/lib/oracle/11.2/client64/lib/tnsnames.j2 inputs.json > /usr/lib/oracle/11.2/client64/lib/tnsnames.ora
#Remove unnecessary files
rm /etc/httpd/conf.d/welcome.conf
rm /etc/httpd/conf.d/ssl.conf
rm /etc/httpd/conf.d/perl.conf
#Create and populate httpd config
/usr/local/bin/j2 -f json /etc/httpd/conf/httpd.conf.j2 inputs.json > /etc/httpd/conf/httpd.conf
#Create and populate the perl config
/usr/local/bin/j2 -f json /etc/httpd/conf.d/perl.conf.j2 inputs.json > /etc/httpd/conf.d/perl.conf
#Run Ansible playbook for Frontend deployment using provided inputs
/usr/local/bin/ansible-playbook /root/frontend_deployment.yml -e '${ANSIBLE_INPUTS}'