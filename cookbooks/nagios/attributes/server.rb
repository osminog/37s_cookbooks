nagios Mash.new unless attribute?("nagios")

nagios[:root] = "/etc/nagios3"
nagios[:config_subdir] = "conf.d"
nagios[:users] = Mash.new
nagios[:users]["admin"] = "casp3end6e"
