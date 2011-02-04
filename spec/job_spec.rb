require 'spec_helper'

describe RightThing::Job do

  before do
    RightThing::Job.stub(:open).and_return(File.read(File.dirname(__FILE__) + "/support/response.xml"))
  end

  describe ".all" do
    before do
      @jobs = RightThing::Job.all("http://www.candidatecare.com/srccsh/ws_req_feed.guid?o=true&f=indeed&d=medimmune.candidatecare.com")
    end

    it 'returns a list of all jobs' do
      @jobs.size.should == 2
    end

    it 'has the correct attributes' do
      job = @jobs.first

      job.should == {
        :title            => "Bilingual Retail Store Management - CA - Salinas",
        :date             => Time.mktime(2009, 5, 12, 17, 23, 20),
        :reference_number => '414841',
        :url              => 'http://cvs.candidatecare.com/srccsh/RTI.home?r=414841&d=cvs.candidatecare.com&pmrb=indeed',
        :company          => 'CVS Pharmacy',
        :city             => 'Salinas',
        :state            => 'CA',
        :country          => 'USA',
        :postal_code      => '93901',
        :description      => 'CVS Caremark is the only fully integrated pharmacy health care company in the United States.',
      }
    end
  end

end
