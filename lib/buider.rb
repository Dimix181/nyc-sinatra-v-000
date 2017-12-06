class Builder

 def build_objects(figure_name=nil, title_name=nil, landmark_name=nil)

   figure = Figure.find_or_create_by(name: figure_name) if figure_name !=nil
   title  = Title.find_or_create_by(name: title_name) if title_name !=nil
   landmark = Landmark.find_or_create_by(name: landmark_name) if landmark_name !=nil

      figure.titles << title if title !=nil
      figure.titlefigures.build(title: title)
      figure.landmarks << landmark if landmark !=nil
      figure.save
      figure
  end


end
