class RawnessesController < ApplicationController
  # GET /rawnesses
  # GET /rawnesses.xml
  def index
    @rawnesses = Rawness.all
    @CSMP = String.new # Why you ask? Go=> http://stackoverflow.com/questions/5751552/highcharts-how-to-use-javascript-variable-as-series-data-source
    @Biology = String.new
    @Education = String.new
    @Nursing = String.new
    @Business = String.new
    
# For Pie Chart
    @percentagesAll = Rawness.find(:all, :conditions => ["year = 2011"])# 

    @pArray = Array.new
    @percentagesAll.each do |p|  
      @pArray <<  p.money
    end
    
    temp = 0
    @pArray.each do |t|
      temp += t
    end  
    @pArray << temp
    @pArray << @pArray.length
    
    i=0
    while (i < @pArray.length-2) # get percentages on all
      @pArray[i] = (@pArray[i] / @pArray[@pArray.length-2]) * 100 # -2 is sum
      @pArray[i] = @pArray[i].round(2)
      i += 1
    end
    i=0
    while (i < @pArray.length-2) 
      @pArray[@pArray.length-1] += @pArray[i]
      i += 1
    end
    @pArray[@pArray.length-1] /= 100 #other
    puts @pArray
# End of pie chart stuff
    
   @rawnesses.each do |rawness|
    if rawness.department == "CSMP"
      @CSMP += "#{rawness.money},"
    elsif rawness.department == "Biology"
      @Biology += "#{rawness.money},"
    elsif rawness.department == "Education"
      @Education += "#{rawness.money},"
    elsif rawness.department == "Nursing"
      @Nursing += "#{rawness.money},"
    elsif rawness.department == "Business"
      @Business += "#{rawness.money},"      
    end
   end
   #Need to chop last char to eliminate extra "," added above on last addition
   @CSMP = @CSMP.chop
   @Biology = @Biology.chop
   @Education = @Education.chop
   @Nursing = @Nursing.chop
   @Business = @Business.chop
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rawnesses }
    end
  end

  # GET /rawnesses/1
  # GET /rawnesses/1.xml
  def show
    @rawness = Rawness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rawness }
    end
  end

  # GET /rawnesses/new
  # GET /rawnesses/new.xml
  def new
    @rawness = Rawness.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rawness }
    end
  end

  # GET /rawnesses/1/edit
  def edit
    @rawness = Rawness.find(params[:id])
  end

  # POST /rawnesses
  # POST /rawnesses.xml
  def create
    @rawness = Rawness.new(params[:rawness])

    respond_to do |format|
      if @rawness.save
        format.html { redirect_to(@rawness, :notice => 'Rawness was successfully created.') }
        format.xml  { render :xml => @rawness, :status => :created, :location => @rawness }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rawness.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rawnesses/1
  # PUT /rawnesses/1.xml
  def update
    @rawness = Rawness.find(params[:id])

    respond_to do |format|
      if @rawness.update_attributes(params[:rawness])
        format.html { redirect_to(@rawness, :notice => 'Rawness was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rawness.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rawnesses/1
  # DELETE /rawnesses/1.xml
  def destroy
    @rawness = Rawness.find(params[:id])
    @rawness.destroy

    respond_to do |format|
      format.html { redirect_to(rawnesses_url) }
      format.xml  { head :ok }
    end
  end
end
