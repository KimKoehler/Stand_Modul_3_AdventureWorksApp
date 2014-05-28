require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CompanyController < Rho::RhoController
  include BrowserHelper

  # GET /Company
  def index
    render :action => :index
  end

  end
