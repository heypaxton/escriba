require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EntryController < Rho::RhoController
  include BrowserHelper

  #GET /Entry
  def index
    @entries = Entry.find(:all)
    render
  end

  # GET /Entry/{1}
  def show
    @entry = Entry.find(@params['id'])
    if @entry
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Entry/new
  def new
    @entry = Entry.new
    render :action => :new
  end

  # GET /Entry/{1}/edit
  def edit
    @entry = Entry.find(@params['id'])
    if @entry
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Entry/create
  def create
    @entry = Entry.create(@params['entry'])
    redirect :action => :index
  end

  # POST /Entry/{1}/update
  def update
    @entry = Entry.find(@params['id'])
    @entry.update_attributes(@params['entry']) if @entry
    redirect :action => :index
  end

  # POST /Entry/{1}/delete
  def delete
    @entry = Entry.find(@params['id'])
    @entry.destroy if @entry
    redirect :action => :index
  end
end
