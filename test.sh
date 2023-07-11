function check_root() {
    # Checking for root access and proceed if it is present
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message
        echo_error 'Run me as root.'
        echo_info 'try sudo ./install.sh'
        exit 1
    fi
}


read -p "Do you want to update system? [y/n]" val
if [ "$val" = "y" ]; then
  echo " "
  sudo apt update -y && sudo apt upgrade -y
else 
echo " "
  echo "Moving on.."
fi