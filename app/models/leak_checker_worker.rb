class LeakCheckerWorker
  attr_reader :projects

  def initialize
    @projects = Project.unleaked
  end

  def call
    projects.each do |project|
      LeakChecker.new(project).call
    end
  end
end
