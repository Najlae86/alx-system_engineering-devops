#!/usr/bin/env bash
# using puppet to make changes to the configuration file

file { 'ect/ssh/ssh_cofig':
	ensure => present.

content =>"

	#SSH client configuration
	host*
	IdentityFile ~/.ssh/school
	PasswordAuthentification no
	",

}
