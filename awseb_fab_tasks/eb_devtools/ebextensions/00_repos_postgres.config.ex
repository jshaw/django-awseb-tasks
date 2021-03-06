files:
  "/etc/yum.repos.d/pgdg-93-redhat.repo":
    mode: "000644"
    owner: root
    group: root
    content: |
      [pgdg93]
      name=PostgreSQL 9.3 $releasever - $basearch
      baseurl=http://yum.postgresql.org/9.3/redhat/rhel-6-$basearch
      enabled=1
      gpgcheck=1
      gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG-93

      [pgdg93-source]
      name=PostgreSQL 9.3 $releasever - $basearch - Source
      failovermethod=priority
      baseurl=http://yum.postgresql.org/srpms/9.3/redhat/rhel-6-$basearch
      enabled=0
      gpgcheck=1
      gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG-93

commands:
  epel_repo:
    command: yum-config-manager -y --enable epel
  remi_repo:
    command: yum-config-manager -y --enable remi

packages:
  rpm:
    pgdg-redhat93-9.3-1: 'http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm'
    remi: 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'