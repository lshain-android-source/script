#!/bin/bash

PROJECT_PATH=""
PROJECT_GIT_PATH=""
CUR_PATH=$PWD

cat $CUR_PATH/private_project | while read p
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
			  if ! test -d $CUR_PATH/../$PROJECT_PATH
			  then
				  mkdir -pv $CUR_PATH/../$PROJECT_PATH
			  fi
			  
              cd $CUR_PATH/../$PROJECT_PATH
              git clone "$PROJECT_GIT_PATH".git
              PROJECT_PATH=""
              PROJECT_GIT_PATH=""
         fi
    fi
done

