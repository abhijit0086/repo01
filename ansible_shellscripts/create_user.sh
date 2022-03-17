#!/bin/bash

username=ansadmin
password=p@ssword

if id "ansadmin" >/dev/null 2>&1; then
  echo "user exists"
else
  echo "user does not exist"
  useradd -m -p "$password" "$username"
  if id "ansadmin" >/dev/null 2>&1; then
    echo "\"$username\" has been added to system!"
  else
    "Failed to add a user!"
  fi
fi
