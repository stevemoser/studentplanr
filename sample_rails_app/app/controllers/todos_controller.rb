class TodosController < ApplicationController
  # GET /todos
  # GET /todos.xml
  def index
    @todos = Todos.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todos = Todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todos = Todos.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1/edit
  def edit
    @todos = Todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todos = Todos.new(params[:todos])

    respond_to do |format|
      if @todos.save
        flash[:notice] = 'Todos was successfully created.'
        format.html { redirect_to(@todos) }
        format.xml  { render :xml => @todos, :status => :created, :location => @todos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todos = Todos.find(params[:id])

    respond_to do |format|
      if @todos.update_attributes(params[:todos])
        flash[:notice] = 'Todos was successfully updated.'
        format.html { redirect_to(@todos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy
    @todos = Todos.find(params[:id])
    @todos.destroy

    respond_to do |format|
      format.html { redirect_to(todos_url) }
      format.xml  { head :ok }
    end
  end
end
