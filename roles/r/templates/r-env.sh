
if [[ -z $R_SETUP_FLAG ]]; then
  export PATH="{{ r_install_bin_dir }}:$PATH"
fi

export R_SETUP_FLAG=1
