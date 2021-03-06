# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lockdown}
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Stone"]
  s.date = %q{2009-05-19}
  s.description = %q{Lockdown is an authorization system for RubyOnRails (ver >= 2.1).}
  s.email = %q{andy@stonean.com}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "lib/lockdown.rb", "lib/lockdown/context.rb", "lib/lockdown/database.rb", "lib/lockdown/frameworks/rails.rb", "lib/lockdown/frameworks/rails/controller.rb", "lib/lockdown/frameworks/rails/view.rb", "lib/lockdown/helper.rb", "lib/lockdown/orms/active_record.rb", "lib/lockdown/permission.rb", "lib/lockdown/rules.rb", "lib/lockdown/session.rb", "lib/lockdown/system.rb", "rails_generators/lockdown/lockdown_generator.rb", "rails_generators/lockdown/templates/app/controllers/permissions_controller.rb", "rails_generators/lockdown/templates/app/controllers/sessions_controller.rb", "rails_generators/lockdown/templates/app/controllers/user_groups_controller.rb", "rails_generators/lockdown/templates/app/controllers/users_controller.rb", "rails_generators/lockdown/templates/app/helpers/permissions_helper.rb", "rails_generators/lockdown/templates/app/helpers/user_groups_helper.rb", "rails_generators/lockdown/templates/app/helpers/users_helper.rb", "rails_generators/lockdown/templates/app/models/permission.rb", "rails_generators/lockdown/templates/app/models/profile.rb", "rails_generators/lockdown/templates/app/models/user.rb", "rails_generators/lockdown/templates/app/models/user_group.rb", "rails_generators/lockdown/templates/app/views/permissions/index.html.erb", "rails_generators/lockdown/templates/app/views/permissions/show.html.erb", "rails_generators/lockdown/templates/app/views/sessions/new.html.erb", "rails_generators/lockdown/templates/app/views/user_groups/edit.html.erb", "rails_generators/lockdown/templates/app/views/user_groups/index.html.erb", "rails_generators/lockdown/templates/app/views/user_groups/new.html.erb", "rails_generators/lockdown/templates/app/views/user_groups/show.html.erb", "rails_generators/lockdown/templates/app/views/users/edit.html.erb", "rails_generators/lockdown/templates/app/views/users/index.html.erb", "rails_generators/lockdown/templates/app/views/users/new.html.erb", "rails_generators/lockdown/templates/app/views/users/show.html.erb", "rails_generators/lockdown/templates/config/initializers/lockit.rb", "rails_generators/lockdown/templates/db/migrate/create_admin_user.rb", "rails_generators/lockdown/templates/db/migrate/create_permissions.rb", "rails_generators/lockdown/templates/db/migrate/create_profiles.rb", "rails_generators/lockdown/templates/db/migrate/create_user_groups.rb", "rails_generators/lockdown/templates/db/migrate/create_users.rb", "rails_generators/lockdown/templates/lib/lockdown/README", "rails_generators/lockdown/templates/lib/lockdown/init.rb", "spec/lockdown/database_spec.rb", "spec/lockdown/frameworks/rails/controller_spec.rb", "spec/lockdown/frameworks/rails/view_spec.rb", "spec/lockdown/frameworks/rails_spec.rb", "spec/lockdown/permission_spec.rb", "spec/lockdown/rules_spec.rb", "spec/lockdown/session_spec.rb", "spec/lockdown/system_spec.rb", "spec/lockdown_spec.rb", "spec/rcov.opts", "spec/spec.opts", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://stonean.com/wiki/lockdown}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{lockdown}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Lockdown is an authorization system for RubyOnRails (ver >= 2}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end