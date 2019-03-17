#!/bin/bash

#send bash email -s is modifier for subject
#
#mail -s 'Eagle Landing Report'<< EOF
#Line 1 of my email
#Line 2 of my email
#Something something Danger Zone
#Last line of my email
#EOF
#
mail -s 'Eagle Landing Report' jason.bourne@cia.gov << EOF
Hello,

I would like to inform you that the Eagle has landed.

All relevant instructions have been forwarded to previously designated operatives.
You have the green light for the operation.

Yours Sincerely,

Pamela Landy
Deputy Director/Operations
Central Intelligence Agency
EOF
