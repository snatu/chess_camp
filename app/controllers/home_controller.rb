class HomeController < ApplicationController
  def index
    @unpaid_registrations = Registration.deposit_only.by_student.paginate(:page => params[:page]).per_page(10)
  end

  def about
  end

  def contact
  end

  def camp_payment
  end
  
  def privacy
  end
  
end
