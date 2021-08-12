############ 1 ############ LOAD CRON FROM TEMPLATE
#*/1 * * * * ${HOME}/supportscripts/load_cron.sh >> ${HOME}/load_cron.log

#LIVE#########################LIVE SERVICE PROCESSING START########################
#LIVE#########################Form Partition#######################################
#LIVE# Monday to Tuesday
#LIVE*/1 * * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-19 * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 22-23 * * 1-2 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE# Wednesday
#LIVE*/1 * * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-18 * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 22-23 * * 3 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE# Thursday
#LIVE*/1 * * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-18 * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 22-23 * * 4 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE# Friday
#LIVE*/1 * * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-18 * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 22-23 * * 5 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE# Saturday
#LIVE*/1 0-23 * * 6 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-6 * * 6 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE# Sunday
#LIVE*/1 0-23 * * 0 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 0-18 * * 0 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE#*/1 20-23 * * 0 /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#LIVE
#LIVE#########################LIVE SERVICE PROCESSING END#########################
#LIVE
#LIVE#########################FormProcess#########################################
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh General >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Incorporations >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh SameDayIncorporations >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Shuttles >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Accounts >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Mortgages >/dev/null 2>&1
#LIVE#########################OTHER SCHEDULED JOBS################################
#LIVE*/1 0-23 * * * /home/xml/efbackend/CreateCerts.sh >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/formResponse.sh >/dev/null 2>&1
#LIVE*/1 0-23 * * * /home/xml/efbackend/emailDispatcher.sh >/dev/null 2>&1
#LIVE00 4 * * * /home/xml/supportscripts/corporationTax.sh >/dev/null 2>&1
#LIVE###email poll reminders every morning at 4-30am
#LIVE30 4 * * * /home/xml/efbackend/emailPollReminder.sh >/dev/null 2>&1
#LIVE###email unpolled submission report every Monday Morning at 5-30am
#LIVE10 20 * * * /home/xml/efbackend/efimport.sh >/dev/null 2>&1
#LIVE59 23 * * * /home/xml/efbackend/getFilingStats.pl xml >/dev/null 2>&1
#LIVE3 * * * * /home/xml/efbackend/xmlDigestCacheDelete.sh >/dev/null 2>&1
#LIVE#ensure weeding runs AFTER archiving
#LIVE14,44 * * * * /home/xml/efbackend/formArchive.sh 365 >/dev/null 2>&1
#LIVE6,36 * * * * /home/xml/efbackend/weed.sh xml >/dev/null 2>&1
#LIVE#delete the xml tif and txt files
#LIVE02 02 * * * find /mnt/filling/image/xmlgw -type f -mtime +10  -exec rm -f {} ; >/dev/null 2>&1
#LIVE######################################SUPPORT SECTION START##############################
#LIVE*/1 * * * * /home/xml/supportscripts/checkapache.sh >/dev/null 2>&1
#LIVE0 11,16 * * * /home/xml/efbackend/produceStats.sh SupportHourlyStatsReport "sbasile@companieshouse.gov.uk,tjohn@companieshouse.gov.uk,mwilliams5@companieshouse.gov.uk,dcornelius@companieshouse.gov.uk,678104@gmail.com" >/dev/null 2>&1
#LIVE*/1 * * * * /home/xml/supportscripts/errorlogcheck.sh -700 >/dev/null 2>&1
#LIVE*/10 0-23 * * * /home/xml/efbackend/monitorLCKfilesWarn.sh >/dev/null 2>&1
#LIVE*/1 * * * * /home/xml/supportscripts/checkformprocess.sh >/dev/null 2>&1
#LIVE4,34 * * * * /home/xml/supportscripts/filinqueuecheck.sh email 100 >/dev/null 2>&1
#LIVE0 8-17 * * * /home/xml/supportscripts/updateXMLFormDetail.sh >/dev/null 2>&1
#LIVE0 10 * * * /home/xml/supportscripts/failedCerts.sh >/dev/null 2>&1
#LIVE05 10 * * * /home/xml/supportscripts/failedMortCerts.sh >/dev/null 2>&1
#LIVE*/15 7-18 * * * /home/xml/supportscripts/status7TNEP.sh >/dev/null 2>&1
#LIVE*/15 7-18 * * * /home/xml/efbackend/updateGenBarcodeSub.sh >/dev/null 2>&1
#LIVE#cron back up script 1st of the month
#LIVE0 6 1 * * /home/xml/crontabBakUp.sh >/dev/null 2>&1
#LIVE#########################################################################################
#LIVE#####################################STATS GENERATION START##############################
#LIVE55 6 * * * /home/xml/efbackend/produceStats.sh FiveDayProcessingReportEW "internalstats@companieshouse.gov.uk" 2wkago_5to5_working_days_ew >/dev/null 2>&1
#LIVE30 2 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterTotalReport "sreadman@companieshouse.gov.uk, internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE20 20 * * * /home/xml/efbackend/produceFTPStats.sh XMLAccountPaymentsReport 172.16.200.33 ${ USER } ${ PASSWORD } 8to8 >/dev/null 2>&1
#LIVE45 23 * * * /home/xml/efbackend/authLastFiled.sh > /tmp/sb.txt 2>&1
#LIVE30 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterAcceptReport "sreadman@companieshouse.gov.uk,cyoude@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE55 6 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectReport "sreadman@companieshouse.gov.uk,cyoude@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE55 2 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectReport "internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE53 13 * * * /home/xml/efbackend/produceStats.sh HourlyINCDocStatsReport "internalstats@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE10 1 1 * * /home/xml/efbackend/produceStats.sh HourlyINCDocStatsReport "gevans@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE10 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterAcceptLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE20 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterRejectLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE30 1 1 * * /home/xml/efbackend/produceStats.sh XMLPresenterTotalLLPReport "internalstats@companieshouse.gov.uk, sreadman@companieshouse.gov.uk" month >/dev/null 2>&1
#LIVE
#LIVE# MAW. 08/09/2015: Now this next line is just to produce a copy of the one above, so that is can be processed for Catherine Youde
#LIVE# the ftp details are obviously rubbish as it does not get copied anywhere just gets left in /mnt/nfs/ewf/archive/ewf/data/archive/statsReport/
#LIVE# this is the file that then gets processed by a script (ppXMLPresenterRejectReport.pl) to de-duplicate the reject reasons for Catherine.
#LIVE56 6 1 * * /home/xml/efbackend/produceFTPStats.sh XMLPresenterRejectReport 172.16.200.33 ${ USER } ${ PASSWORD } month >/dev/null 2>&1
#LIVE50 6-18 * * * /home/xml/efbackend/produceStats.sh HourlyGeneralDocStatsReport "dcornelius@companieshouse.gov.uk,internalstats@companieshouse.gov.uk" now  >/dev/null 2>&1
#LIVE5 5 1 * * /home/xml/efbackend/produceStats.sh HMRCDownloadReport "ACINotify@companieshouse.gov.uk" month  >/dev/null 2>&1
#LIVE#########################################################################################


#STAGE###########################################STAGING / PREPRODUCTION CRON ######################################################################
#STAGE
#STAGE*/1 * * * * /home/xml/efbackend/formPartition.sh >/dev/null 2>&1
#STAGE#########################FormProcess#########################################
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh General >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Incorporations >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh SameDayIncorporations >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Shuttles >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Accounts >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formProcess.sh Mortgages >/dev/null 2>&1
#STAGE#########################OTHER SCHEDULED JOBS################################
#STAGE*/1 0-23 * * * /home/xml/efbackend/CreateCerts.sh >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/formResponse.sh >/dev/null 2>&1
#STAGE*/1 0-23 * * * /home/xml/efbackend/emailDispatcher.sh >/dev/null 2>&1
