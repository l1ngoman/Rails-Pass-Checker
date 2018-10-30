class PasswordController < ApplicationController
  def check
    @user = params[:userid]
    @pass = params[:password]
    if @pass == nil || @user == nil
      @msg = ""
    elsif !good_length?(@user) #should be true
      @msg = "Your username must be at least 6 characters long."
    elsif !good_length?(@pass) #should be true
      @msg = "Your password must be at least 6 characters long."
    elsif has_special_char?(@user) #should be false
      @msg = "Your username cannot contain #, !, or $."
    elsif !has_special_char?(@pass) #should be true
      @msg = "Your password must contain #, !, or $."
    elsif @user == @pass
      @msg = "Your username and password cannot be the same."
    else
      @msg = "That's a great username/password combo!"
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
