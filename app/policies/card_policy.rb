class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:collection).where(collections: { user_id: user.id })
    end
  end

  def index?
    user.present?
  end

  def show?
    record.collection.user == user
  end

  def new?
    true
  end

  def create?
    record.collection.user == user
  end

  def edit?
    update?
  end

  def update?
    record.collection.user == user
  end

  def destroy?
    record.collection.user == user
  end
end
