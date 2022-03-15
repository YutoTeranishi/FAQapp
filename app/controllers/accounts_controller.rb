class AccountsController < ApplicationController
  layout 'QandA'
  before_action :authenticate_account!,only: [:login_check, :index]
  def index
    @msg='this is sample page'
    redirect_to controller: :'people',params:{'account_id':current_account}
=begin
    if current_account then
      redirect_to '/questions/'
    else
      redirect_to '/people/new'
    end
=end
  end

  def login_check
    @account = current_account
    @msg = 'account created at:' + @account.created_at.to_s
  end
end
