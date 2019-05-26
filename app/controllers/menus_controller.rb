class MenusController < ApplicationController

  before_action :authenticate
  before_action -> { require_permission_to 'write_menus' }

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
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path, notice: t('menus.create.notice')
    else
      render action: "new", warning: t('menus.create.warning'), layout: 'admin'
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
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

  def reorder
    menu = Menu.find(params[:id])
    @menus = menu.self_and_siblings.ordered
    switch_to_admin_layout
  end

  def sort
    params[:menu].each_with_index do |id, index|
      Menu.update(id, position: index+1)
    end
    render nothing: true
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def menu_params
    params.require(:menu).permit(:name, :path, :parent_id, :parent_menu_name)
  end
end
