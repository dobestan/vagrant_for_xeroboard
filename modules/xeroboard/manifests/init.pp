class xeroboard {
  exec { "rm-var-www":
    command => "sudo rm -rf /var/www",
    require => Service["apache2"]
  }

  exec { "git-clone-xe-core":
    command => "sudo git clone https://github.com/xpressengine/xe-core.git /var/www",
    require => Exec["rm-var-www"]
  }

  exec { "chmod-707-on-var-www":
    command => "sudo chmod 707 /var/www",
    require => Exec["git-clone-xe-core"]
  }
}
