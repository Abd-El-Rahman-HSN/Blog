RailsAdmin.config do |config|

  config.actions do
  end

  config.model Comment do
    edit do
      field :name
      field :body
    end
  end
  config.model Category do
    edit do
      field :name
    end
  end
  config.model Post do
    list do
      exclude_fields :body
    end
    edit do
      # For RailsAdmin >= 0.5.0
      field :title
      field :image
      field :body, :ck_editor
      field :category do
        nested_form false
      end
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end
  config.model User do
    list do
      exclude_fields :reset_password_sent_at, :remember_created_at
    end
    edit do
      # For RailsAdmin >= 0.5.0
      exclude_fields :reset_password_sent_at, :remember_created_at, :sign_in_count,
                     :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.authorize_with do
    redirect_to main_app.root_path unless current_user
  end
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
