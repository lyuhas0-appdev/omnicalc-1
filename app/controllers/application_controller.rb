

class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end
  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb"})
  end
  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end
  def calculate_square_root
    @num = params.fetch("user_number").to_f
    @sqrt_of_num = @num ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end
  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end
  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    apr_month = @apr/12/100
    @years =params.fetch("user_years").to_f
    months = @years*12
    @principal = params.fetch("user_principal").to_f

    @payment = (apr_month*(@principal))/(1-((1+apr_month))**(-1*months))

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end
  def calculate_random
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @output = rand(@min..@max)
    
    render({ :template => "calculation_templates/random_results.html.erb"})
  end
end
