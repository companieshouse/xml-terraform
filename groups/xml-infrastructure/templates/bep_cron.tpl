#########################LIVE SERVICE PROCESSING START########################
#########################Form Partition#######################################
# Monday to Tuesday
*/1 * * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-19 * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 22-23 * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1

# Wednesday
*/1 * * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-18 * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 22-23 * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1

# Thursday
*/1 * * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-18 * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 22-23 * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1

# Friday
*/1 * * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-18 * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 22-23 * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1

# Saturday
*/1 0-23 * * 6 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-6 * * 6 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1

# Sunday
/1 0-23 * * 0 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 0-18 * * 0 /home/ewfbeplive/efbackend/formPartition.sh >/dev/null 2>&1
#*/1 20-23 * * 0 /home/ewfbeplive/efbackend/formPartition.sh >/dev/null 2>&1

#########################LIVE SERVICE PROCESSING END#########################

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
00 4 * * * /home/xml/efbackend/corporationTax.sh >/dev/null 2>&1
###email poll reminders every morning at 4-30am
30 4 * * * /home/xml/efbackend/emailPollReminder.sh >/dev/null 2>&1
###email unpolled submission report every Monday Morning at 5-30am
10 20 * * * /home/xml/efbackend/efimport.sh >/dev/null 2>&1
59 23 * * * /home/xml/efbackend/getFilingStats.pl xml >/dev/null 2>&1
3 * * * * /home/xml/efbackend/xmlDigestCacheDelete.sh >/dev/null 2>&1
#ensure weeding runs AFTER archiving
14,44 * * * * /home/xml/efbackend/formArchive.sh 365 >/dev/null 2>&1
6,36 * * * * /home/xml/efbackend/weed.sh xml >/dev/null 2>&1
#delete the xml tif and txt files
02 02 * * * find /mnt/filling/image/xmlgw -type f -mtime +10  -exec rm -f {} ; >/dev/null 2>&1
######################################SUPPORT SECTION START##############################
*/1 * * * * /home/xmlbeplive/checkapache.sh >/dev/null 2>&1
0 11,16 * * * /home/xml/efbackend/produceStats.sh SupportHourlyStatsReport "sbasile@companieshouse.gov.uk,tjohn@companieshouse.gov.uk,mwilliams5@companieshouse.gov.uk,dcornelius@companieshouse.gov.uk,678104@gmail.com" >/dev/null 2>&1
*/1 * * * * /home/xml/errorlogcheck.sh -700 >/dev/null 2>&1
*/10 0-23 * * * /home/xml/efbackend/monitorLCKfilesWarn.sh >/dev/null 2>&1
*/1 * * * * /home/xml/checkformprocess.sh >/dev/null 2>&1
4,34 * * * * /home/xml/efbackend/filinqueuecheck.sh email 100 >/dev/null 2>&1
0 8-17 * * * /home/xmlbeplive/updateXMLFormDetail.sh >/dev/null 2>&1
0 10 * * * /home/xmlbeplive/failedCerts.sh >/dev/null 2>&1
05 10 * * * /home/xmlbeplive/failedMortCerts.sh >/dev/null 2>&1
*/15 7-18 * * * /home/xmlbeplive/efbackend/status7TNEP.sh >/dev/null 2>&1
*/15 7-18 * * * /home/xmlbeplive/efbackend/updateGenBarcodeSub.sh >/dev/null 2>&1
#########################################################################################
#####################################STATS GENERATION START##############################
55 6 * * * /home/xmlbeplive/efbackend/produceStats.sh FiveDayProcessingReportEW "internalstats@companieshouse.gov.uk" 2wkago_5to5_working_days_ew >/dev/null 2>&1
30 2 1 * * /home/xmlbeplive/efbackend/produceStats.sh XMLPresenterTotalReport "sreadman@companieshouse.gov.uk, internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
20 20 * * * /home/xmlbeplive/efbackend/produceFTPStats.sh XMLAccountPaymentsReport 172.16.200.33 ${ USER } ${ PASSWORD } 8to8 >/dev/null 2>&1
45 23 * * * /home/xml/efbackend/authLastFiled.sh > /tmp/sb.txt 2>&1
30 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterAcceptReport "sreadman@companieshouse.gov.uk,cyoude@companieshouse.gov.uk" month >/dev/null 2>&1
55 6 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectReport "sreadman@companieshouse.gov.uk,cyoude@companieshouse.gov.uk" month >/dev/null 2>&1
55 2 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectReport "internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
53 13 * * * /home/xml/efbackend/produceStats.sh HourlyINCDocStatsReport "internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
10 1 1 * * /home/xml/efbackend/produceStats.sh HourlyINCDocStatsReport "gevans@companieshouse.gov.uk" month >/dev/null 2>&1
10 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterAcceptLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1
20 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1
30 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterTotalLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1

# MAW. 08/09/2015: Now this next line is just to produce a copy of the one above, so that is can be processed for Catherine Youde
# the ftp details are obviously rubbish as it does not get copied anywhere just gets left in /mnt/nfs/ewf/archive/ewf/data/archive/statsReport/
# this is the file that then gets processed by a script (ppXMLPresenterRejectReport.pl) to de-duplicate the reject reasons for Catherine.
56 6 1 * * /home/xml/efbackend/produceFTPStats.sh XMLPresenterRejectReport aaa aaa aaa month >/dev/null 2>&1
50 6-18 * * * /home/xml/efbackend/produceStats.sh HourlyGeneralDocStatsReport "dcornelius@companieshouse.gov.uk,internalstats@companieshouse.gov.uk" now  >/dev/null 2>&1
5 5 1 * * /home/xml/efbackend/produceStats.sh HMRCDownloadReport "ACINotify@companieshouse.gov.uk" month  >/dev/null 2>&1
#########################################################################################

#cron back up script 1st of the month
0 6 1 * * /home/xml/crontabBakUp.sh >/dev/null 2>&1
