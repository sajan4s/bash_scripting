#!/bin/bash

# Print usernames of all users on a Linux system together with their home directories.

awk -F":" -v OFS=':' '{print $1, $7}' /etc/passwd > /var/log/user.txt