#!/bin/bash

/root/user.sh

if [[ ! -f /var/log/current_users ]]
then
    md5sum /var/log/user.txt > /var/log/current_users
fi

md5sum --check /var/log/current_users
i=$?

if [[ $i -eq 1 ]]
then
  date_time=`date | awk '{print $2,$3,$6,$4}'`
  echo "${date_time} changes occurred" >> /var/log/user_changes
  md5sum /var/log/user.txt > /var/log/current_users
  exit 1
fi