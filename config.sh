#!/bin/bash


# config set
# config current-context/env      (get)


#------------------------------------------------------------------------------
# sets the variables and
# cleans the unneeded during after run-time stuff
#------------------------------------------------------------------------------

createConfigFile(){
    # set a default configuration file
    exit
}
eof func createConfigFile

doParseConfFile() {
  # set config

  #
  #Conf file is parsed with sed and then evaluated as simple variable assignments
  #First sed parsing key values (supports also = surrounded with spaces)
  #Second sed removes spaces around = sign for valid variable assignment
  #Futher sed treatment can be added
  #All other not matching text in conf file will be removed (including # or ; commentary and other)
  #Be aware that single line shell commands can be also evaluated from this config file!
  config=stream-fiesta.conf
  CFG_CONTENT=$(echo "${config}" | sed -r '/[^=]+=[^=]+/!d' | sed -r 's/\s+=\s/=/g')
  eval "{$CFG_CONTENT}"
}
eof func doParseConfFile

setParseConfFile() {
    exit
}
eof func setParseConfFile

doParseConfFile(){

    # search current directory, and then default location
    if [ -f "$(dirname "$0")"/stream-fiesta.conf ]; then
        config="$1"
    elif [ -f ~/.config/stream-fiesta.conf ];then
        createConfigFile
    fi

    # however if there is a host dependant cnf file override it
    test -f "$config" \
    && config="$config.cnf" # need works

    # yet finally override if passed as argument to this function
    # if the the ini file is not passed define the default host independent ini file
    test -z "$1" || config=$1;shift 1;


    test -z "$2" || ini_section=$2;shift 1;
    doLog "DEBUG read configuration file : $config"
    doLog "INFO read [$ini_section] section from config file"

    # debug echo "@doParseConfFile config:: $config"
    # could be later on parametrized ...
    test -z "$ini_section" && ini_section='MAIN_SETTINGS'

#   error
    doLog "DEBUG reading: the following configuration file"
    doLog "DEBUG ""$config"
    ( set -o posix ; set ) | sort >"$tmp_dir"/vars.before

    eval "$(sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
        -e 's/#.*$//' \
        -e 's/[[:space:]]*$//' \
        -e 's/^[[:space:]]*//' \
        -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
        < "$config" \
        | sed -n -e "/^\[$ini_section\]/,/^\s*\[/{/^[^#].*\=.*/p;}")"

    ( set -o posix ; set ) | sort >"$tmp_dir/vars.after"

    doLog "INFO added the following vars from section: [$ini_section]"
    cmd="$(comm -3 "$tmp_dir"/vars.before "$tmp_dir"/vars.after | perl -ne 's#\s+##g;print "\n $_ "' )"
    echo -e "$cmd"
    echo -e "$cmd" >> "$log_file"
    echo -e "\n\n"
    sleep 1; printf "\033[2J";printf "\033[0;0H" # and clear the screen
}
eof func doParseConfFile