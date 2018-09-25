#!/bin/sh -x

# Install Mailhog
sudo yum install -y daemonize.x86_64

wget https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64
sudo chown root:root MailHog_linux_amd64
sudo chmod +x MailHog_linux_amd64
sudo mv MailHog_linux_amd64 /usr/sbin/mailhog
wget https://raw.githubusercontent.com/geerlingguy/ansible-role-mailhog/master/templates/mailhog.init.j2
sudo chown root:root mailhog.init.j2
sudo chmod +x mailhog.init.j2
sudo mv mailhog.init.j2 /etc/init.d/mailhog
sudo sed -i 's/{{ mailhog_install_dir }}/\/usr\/sbin/' /etc/init.d/mailhog
sudo sed -i 's/{{ mailhog_daemonize_bin_path }}/\/usr\/sbin\/daemonize/' /etc/init.d/mailhog

sudo systemctl enable mailhog

wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
sudo chown root:root mhsendmail_linux_amd64
sudo chmod +x mhsendmail_linux_amd64
sudo mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail
sudo sed -i 's/sendmail_path = \/usr\/sbin\/sendmail -t -i/sendmail_path = \/usr\/local\/bin\/mhsendmail/' /etc/php.ini
