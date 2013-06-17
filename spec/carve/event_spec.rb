require 'spec_helper'

describe Carve::Event do
  let(:subject)   { Carve::Event }

  context "incorrect secret api key" do
    before do
      Carve.secret_api_key = "incorrect_secret_api_key"
    end

    describe "attempt .all" do
      before do
        @response = subject.all
      end

      it do
        @response.success.should be_false
        @response.error.message.should_not be_empty
      end
    end
  end

  context "correct secret api key" do
    before do
      Carve.secret_api_key = ENV['CARVE_SECRET_API_KEY']
    end

    describe ".all" do
      before do
        @response = subject.all(attrs)
      end

      context "default" do
        let(:attrs) { {} }

        it do
          @response.success.should be_true
          @response.events.count.should eq 10
        end
      end

      context "filters" do
        let(:attrs) { {count: 20, type: "document.done"} }

        it do
          @response.success.should be_true
          @response.events.count.should eq 20
        end
      end
    end
  end
end
