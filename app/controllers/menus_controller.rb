class MenusController < ApplicationController
  
  before_filter :authenticate
  before_filter :authenticate_with_admin
  
  def index
    @menus = Menu.ordered
    switch_to_admin_layout
  end

  def new
    @menu = Menu.new
    switch_to_admin_layout
  end

  def edit
    @menu = Menu.find(params[:id])
    switch_to_admin_layout
  end

  def create
    @menu = Menu.new(params[:menu])
    if @menu.save
      redirect_to menus_path, notice: t('menus.create.notice')
    else
      render action: "new", warning: t('menus.create.warning'), layout: 'admin'
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      redirect_to menus_path, notice: t('menus.update.notice')
    else
      render action: "edit", warning: t('menus.update.warning'), layout: 'admin'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_url, notice: t('menus.destroy.notice')
  end
end
