# -----------------------------------------------------------------------------
#    Faalis - Basic website skel engine
#    Copyright (C) 2012-2013 Yellowen
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
# -----------------------------------------------------------------------------

# Some useful steps for cucumber scenarios

Then(/^I should get unknown format exception$/) do

  #Then ("I should get '406' status code")
  # @exception.should_not be_nil
  # @exception.class.should be(ActionController::UnknownFormat)
end

Then(/^action should not be found$/) do
  if Capybara.current_driver == :webkit
    page.status_code should == 404
  else
    @exception.should_not be_nil
    @exception.class.should be(AbstractController::ActionNotFound)
  end
end

Then(/^I debug/) do
  binding.pry
end
