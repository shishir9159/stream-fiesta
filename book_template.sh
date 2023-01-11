#!/bin/bash

############################################################
############################################################
#                 Book Metadata Templating                 #
############################################################
############################################################

# Comic Book
# Amazon Metadata

LARGEST_BOOK_FILE=$(find "${TARGET_DIRECTORY}" -type f -name "*.djvu" -o -name "*.epub" -o -name "*.mobi" -o -name "*.pdf" | sort -nr | head -1)

# List