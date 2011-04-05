require 'sinatra'

helpers do
  # same as erb, but strip blank lines
  def erb_nbl(*args)
    erb(*args).chomp.split("\n").
    select { |line| line.strip.length > 0 }.
    join("\n")
  end
end

get '/:sx/:ex/:sy/:ey' do |sx, ex, sy, ey|
  @sx, @ex, @sy, @ey = sx.to_i, ex.to_i, sy.to_i, ey.to_i
  @title = "Table of powers (#{@sx} <= x <= #{@ex}; #{@sy} <= y <= #{@ey})"
  erb_nbl :powertable
end

get '/:ex/:ey' do |ex, ey|
  @sx, @ex, @sy, @ey = 1, ex.to_i, 1, ey.to_i
  @title = "Table of powers (#{@sx} <= x <= #{@ex}; #{@sy} <= y <= #{@ey})"
  erb_nbl :powertable
end

get '/' { erb_nbl :index }
