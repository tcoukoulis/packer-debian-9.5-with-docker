#!/bin/bash

# UseDNS  
#         Specifies whether sshd(8) should look up the remote host name, and to
#         check that the resolved host name for the remote IP address maps back to
#         the very same IP address.
#
#         If this option is set to no (the default) then only addresses and not
#         host names may be used in ~/.ssh/authorized_keys from and sshd_config
#         Match Host directives.
echo "UseDNS no" >> /etc/ssh/sshd_config

# GSSAPIAuthentication
#         Specifies whether user authentication based on GSSAPI is allowed.  The
#         default is no.
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
