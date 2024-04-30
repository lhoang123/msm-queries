class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("an_id")

    matching_records =  Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def junior

    @youngest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).last

    @youngest_director_name = @youngest_director.name
    @youngest_director_dob = @youngest_director.dob

    render({ :template => "director_templates/junior"})
  end

  def senior
    @oldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first

    @oldest_director_name = @oldest_director.name
    @oldest_director_dob = @oldest_director.dob

    render({ :template => "director_templates/senior"})
  end

end
