class PasswordController < ApplicationController
  def check
    @user = params[:userid]
    @pass = params[:password]
    session[:permitted] = false
    if @pass == nil || @user == nil
      flash[:alert] = ""
    elsif !good_length?(@user) #should be true
      flash[:alert] = "Your username must be at least 6 characters long."
    elsif !good_length?(@pass) #should be true
      flash[:alert] = "Your password must be at least 6 characters long."
    elsif has_special_char?(@user) #should be false
      flash[:alert] = "Your username cannot contain #, !, or $."
    elsif !has_special_char?(@pass) #should be true
      flash[:alert] = "Your password must contain #, !, or $."
    elsif @user == @pass
      flash[:alert] = "Your username and password cannot be the same."
    else
      redirect_to action: 'welcome'
    end
  end

  def good_length?(string)
    if string.length >= 6
      true
    else
      false
    end
  end

  def has_special_char?(string) #password should be true, user should be false
    if string =~ /[!#$]/
      true
    else
      false
    end
  end

end
