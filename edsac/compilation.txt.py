import re
import sys
import os
import shutil
import codecs

paste_variable = re.compile("(?<=%).+(?=%)")
copy_variable = re.compile("(?<=\$).+(?=\$)")

paste_variables = []
copy_variables = {}

line_number = 0
file = open(sys.argv[1], "r", encoding='utf-8')
file_data = file.read()
file.close()
for line in file_data.split('\n'):
    line_number += 1
    
    match_paste = paste_variable.search(line)
    if match_paste:
        paste_variables.append(match_paste.group(0))
    
    match_copy = copy_variable.search(line)
    if match_copy:
        copy_variables[match_copy.group(0)] = line_number

for match in paste_variables:
    file_data = file_data.replace('%' + match + '%', str(copy_variables[match]))
    file_data = file_data.replace('$' + match + '$', '')
    
for key in copy_variables:
    file_data = file_data.replace('$' + key + '$', '')
   
new_file_name = sys.argv[1].split('.')[0] + "-compiled" + '.' + sys.argv[1].split('.')[1]
if os.path.exists(new_file_name):
    os.remove(new_file_name)
new_file = open(new_file_name, "w", encoding='utf-8')
new_file.write(file_data)
new_file.close()