require 'spec_helper'

describe Question do
  before do
    @question = Question.new(content: "Example Question")
  end
  
  subject { @question }
  
  it { should respond_to(:content) }
  
  it { should be_valid }
end
