task :environment do
  $:.unshift 'lib'
  $:.unshift '.'
  require 'greek'
end

namespace :db do
  desc "auto_migrate the models"
  task :init => [:environment] do
    DataMapper.auto_migrate!
  end

  desc "create welcome Post"
  task :welcome => [:environment] do
    post = Post.new(:title => 'Welcome!', :summary => 'Read on my friend, feel welcome.', :body => 'Welcome to the very first post')
    post.make_slug!
    post.save
  end

  desc "create dummy Event"
  task :event => [:environment] do
    post = Post.new(:title => 'Party Paradise', :summary => 'Check out the biggest event coming!', :body => 'Event details to have the **Time of your life**', :event => true)
    post.make_slug!
    post.save
  end

  desc "create required Pages"
  task :pages => [:environment] do
    ["About","Media","Contact"].each do |page|
      Page.create(:title => page, :slug => page.downcase, :body => 'Page content goes here.')
    end
  end

  desc "add greek alpabets"
  task :greekify do
    grk_alphabet = %w(Alpha\ a Beta\ b Gamma\ g Delta\ d Epsilon\ e Zeta\ z Eta\ h Theta\ th Iota\ i Kappa\ k Lambda\ l Mu\ m Nu\ n Xi\ x Omicron\ o Pi\ p Rho\ r Sigma\ s Tau\ t Upsilon\ u Phi\ ph Chi\ ch Psi\ ps Omega\ o)
    grk_alphabet.each do |pc|
      pcname = pc.split
      GreekClass.create(:name => pcname[0], :slug => pcname[1])
    end
  end

  desc "add brothers from config/brothers.yaml"
  task :brothers do
    require 'yaml'
    BROS = YAML.load_file("#{root_dir}/config/brothers.yml")
    brothers.each do |bro|
      GreekClass.
    end
  end

  task :bootstrap => [:init, :welcome, :event, :pages, :greekify, :brothers]
end
