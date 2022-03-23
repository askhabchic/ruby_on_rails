sudo apt-get update
sudo apt-get install -y curl 
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y postgresql-14.2
sudo apt-get install -y libpq-dev
sudo apt-get install -y nodejs
sudo apt-get install gnupg

sudo -u postgres psql --command "CREATE ROLE vagrant_db WITH SUPERUSER CREATEDB LOGIN"

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.7
source /home/vagrant/.rvm/scripts/rvm
echo "gem: --no-document" >> ~/.gemrc

gem install rails -v 2.3.6
gem install puma

sudo seed -i 's/127.0.0.1/0.0.0.0/' /etc/hosts

mkdir /home/vagrant/site
cd /home/vagrant/site
rails new foubarre -d postgresql
cd fubar
rails g scaffold component great_data
echo "Component.create(great_data: 'foo_bar_name')" >> db/seeds.rb
bundle install
sed -i -e "s/username: fubar/username: vagrant/g" config/database.yml
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
sed -i "2iroot to: 'components#index'" config/routes.rb
echo "<h1><%=Rails.env%></h1>">app/views/components/index.html.erb

export SECRET_KEY_BASE='rake secret'
puma -e production -b 'tcp://0.0.0.0:3000' config.ru
sudo usermod -p vagrant vagrant