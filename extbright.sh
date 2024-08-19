#!/usr/bin/env bash

# Author: autom4il
# Date: 19/08/2024
# Desc: Control external monitor brightness

value="$1"

if [[ "${value}" -lt 10 ]] || [[ "${value}" -gt 100 ]]
then
  echo "[Warning] Invalid value. Value must be between 10 and 100."
  exit 1
fi

ddcutil setvcp 10 "${value}"

current_ext_brightness=$(ddcutil getvcp 10 | cut -d "=" -f 2 | sed s'/, max value//'g | xargs)
echo "Brightness: ${current_ext_brightness}%"
