class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    owner? || admin?
  end

  def update?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  private

  def owner?
    # user: current user
    # record: instance of object that we are authorizing (authorize @restaurant)
    # record is the same as @restaurant
    record.user == user
  end

  def admin?
    user.admin
  end
end
