class JobApplicationPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.job.employer != user
  end

  def destroy?
    # a job application will be updated just by the applicant
    record.applicant == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
