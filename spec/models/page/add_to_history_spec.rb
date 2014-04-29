require 'spec_helper'

describe Page, "#add_to_history" do
  it "records events with timestamps" do
    page = Page.new

    page.add_to_history('Foo')
    page.add_to_history('Bar')

    page.history.length.should == 2
    page.history[0][:event].should == 'Foo'
    page.history[0][:recorded_at].should <= Time.now
    page.history[1][:event].should == 'Bar'
    page.history[1][:recorded_at].should <= Time.now
  end
end
