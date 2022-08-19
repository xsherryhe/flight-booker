module DateManager
  def format_date(date)
    date.strftime('%m/%d/%Y')
  end

  def parse_date_from_params(param_name, params)
    date_components = []
    %w[1 2 3].each do |num|
      date_component = params["#{param_name}(#{num}i)"]
      return nil if date_component.blank?

      date_components << date_component.to_i
    end

    Date.new(*date_components)
  end
end
