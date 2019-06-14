module RedactorCapsens
  class Engine < Rails::Engine
    isolate_namespace RedactorCapsens
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include RedactorCapsens::Helpers
      end
    end

    initializer "redactor_devise" do |app|
      ActionController::Base.send :include, RedactorCapsens::Devise
    end
  end
end
