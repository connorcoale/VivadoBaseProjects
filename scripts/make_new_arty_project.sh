#!/bin/bash

# Necessary Function
function renameFilesRecursively () {

  SEARCH_PATH="$1"
  SEARCH="$2"
  REPLACE="$3"

  find ${SEARCH_PATH} -type f -name "*${SEARCH}*" | while read FILENAME ; do
      NEW_FILENAME="$(echo ${FILENAME} | sed -e "s/${SEARCH}/${REPLACE}/g")";
      mv "${FILENAME}" "${NEW_FILENAME}";
  done

}

# Get new project name
new_projname=$1

# Copy base project
cp -R /home/connor/VivadoBaseProjects/ArtyBaseProject $new_projname
# In new project, replace all filenames and file contents to new project name
cd $new_projname
renameFilesRecursively . ArtyBaseProject $new_projname
find . -type f -exec sed -i s/ArtyBaseProject/$new_projname/g {} +
