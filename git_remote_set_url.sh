#!/bin/bash

PROJECT_PATH=""
PROJECT_GIT_PATH=""
CUR_PATH=$PWD

cat $CUR_PATH/project | while read p
do
    if [ "$PROJECT_PATH" = "" ]
    then
         PROJECT_PATH=$p
         continue
    fi

    if [ "$PROJECT_GIT_PATH" = "" ]
    then
         PROJECT_GIT_PATH=$p
    fi

    if [ "$PROJECT_PATH" != "" ]
    then 
         if [ "$PROJECT_GIT_PATH" != "" ]
         then
              cd $CUR_PATH/../$PROJECT_PATH
              git remote set-url origin git@lshain-android-source.github.com:"$PROJECT_GIT_PATH".git
              PROJECT_PATH=""
              PROJECT_GIT_PATH=""
         fi
    fi
done

