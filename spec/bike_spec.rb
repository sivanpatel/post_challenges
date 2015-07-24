require 'bike'

describe Bike do

  it "recognizes report broken method" do
    expect(subject).to respond_to :report_broken
  end

  it "broken only if reported" do
    subject.report_broken
    expect(subject).to be_broken
    expect(subject).not_to be_working
  end

end