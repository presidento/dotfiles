#!/usr/bin/env python3
'''
Add Jira references to git commit message

Usage: the same as the git commit-msg hook

The first command line parameter is the commit message file.
The name of the branch is extracted from git commands.
'''

import subprocess
import re
import sys
from io import StringIO
import os

commit_msg_file = sys.argv[1]

def run_cmd(*args):
    try:
        return subprocess.check_output(args).decode().strip()
    except subprocess.CalledProcessError:
        sys.exit(0)

def get_file_contents(filename):
    with open(filename) as f:
        return f.read().strip()

def get_branch_name():
    git_dir = os.path.dirname(os.path.dirname(__file__))
    if os.path.isdir(git_dir + '/rebase-merge'):
        return get_file_contents(git_dir + '/rebase-merge/head-name')
    return run_cmd('git', 'symbolic-ref', '-q', 'HEAD')
    
branch_path = get_branch_name()
match = re.search(r'((BSP|BSPTD|BSPPDP)\-?(\d+))$', branch_path)

if not match:
    sys.exit(0)

jira_project = match.group(2)
jira_id = match.group(3)
jira_text = 'References: jira {project}-{id}'.format(project=jira_project, id=jira_id) 

msg_text = ''
with open(commit_msg_file, 'r') as msg_file:
    for line in msg_file:
        msg_text += line

jira_text_was_written = False
if jira_text not in msg_text:
    with open(commit_msg_file, 'w') as msg_file:
        for line in StringIO(msg_text):
            if 'Signed-off-by: ' in line and not jira_text_was_written:
                jira_text_was_written = True
                msg_file.write(jira_text + '\n')
            msg_file.write(line)

