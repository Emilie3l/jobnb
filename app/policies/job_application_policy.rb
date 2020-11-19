class JobApplicationPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.job.employer != user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
