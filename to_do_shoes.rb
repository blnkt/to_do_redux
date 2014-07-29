require "to_do"

Shoes.app {
        stack {
          button "Add List" do
            append { para "#{test_me}"}
          end
          button "Exit program" do
          end
        }
      }
