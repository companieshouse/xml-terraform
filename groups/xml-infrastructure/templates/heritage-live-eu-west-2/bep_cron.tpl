###########################################STAGING / PREPRODUCTION CRON #################

*/1 * * * * /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#########################FormProcess#########################################
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh General >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Incorporations >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh SameDayIncorporations >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Shuttles >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Accounts >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Mortgages >/dev/null 2>&1
#########################OTHER SCHEDULED JOBS################################
*/1 0-23 * * * /home/xml/efbackend/CreateCerts.sh >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/formResponse.sh >/dev/null 2>&1
*/1 0-23 * * * /home/xml/efbackend/emailDispatcher.sh >/dev/null 2>&1
