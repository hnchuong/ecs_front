class HomeController < ApplicationController
  def index
    @local_records = LocalRecord.all
  end
end
