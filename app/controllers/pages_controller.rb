
class PagesController < ApplicationController
  #shows all of the pages
  def index
    @pages = Page.all
    #render index.html.erb
  end

  #show a single page
  def show
    @page = Page.find(params[:id])
    #render show.html.erb
  end

  #shows the create form
  #new page in memory not in database
  def new
    @page = Page.new
    #render new.html.erb
  end

  #POST
  #try add on to database
  def create
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  #show the edit form
  def edit
    @page = Page.find(params[:id])
    # render edit.html.erb
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(pages_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  def destroy 
    Page.find(params[:id]).destroy 
    redirect_to pages_path
  end
  #CRUD-Create Read Update Destroy

  private 

  def pages_params
    #attr_accessors
    # { page: { title: 'new'  ...}}
    params.require(:page).permit(:title, :author, :body)
    #{title: 'new' ...}
  end
end


