module Squash
  module UserAssociations
    extend ActiveSupport::Concern

    included do
      has_many :assigned_bugs, dependent: :nullify, inverse_of: :assigned_user, class_name: 'Squash::Bug', foreign_key: 'assigned_user_id'
      has_many :owned_projects, dependent: :restrict_with_exception, class_name: 'Squash::Project', foreign_key: 'owner_id', inverse_of: :owner
      has_many :comments, dependent: :nullify, inverse_of: :user
      has_many :events, dependent: :nullify, inverse_of: :user
      has_many :memberships, dependent: :delete_all, inverse_of: :user
      has_many :watches, dependent: :delete_all, inverse_of: :user
      has_many :user_events, dependent: :delete_all, inverse_of: :user
      has_many :emails, dependent: :delete_all, inverse_of: :user
      has_many :notification_thresholds, dependent: :delete_all, inverse_of: :user
      has_many :member_projects, through: :memberships, source: :project
    end
  end
end