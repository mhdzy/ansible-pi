source "{{ commands_file }}"

export R_HOME="$(echo $({{ r_install_bin_dir }}/R RHOME | tail -n 1))"
pathappend "{{ r_install_bin_dir }}"
