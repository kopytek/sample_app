rspec-mocks is used to create dynamic "doubles", which stand in for real
objects in examples. You can stub return values and/or set message
expectations:

    describe Account do
      context "when closed" do
        it "logs an account closed message" do
          logger = double()
          account = Account.new
          account.logger = logger

          logger.should_receive(:account_closed).with(account)

          account.close
        end
      end
    end

## Issues

The documentation for rspec-mocks is a work in progress. We'll be adding
Cucumber features over time, and clarifying existing ones.  If you have
specific features you'd like to see added, find the existing documentation
incomplete or confusing, or, better yet, wish to write a missing Cucumber
feature yourself, please [submit an
issue](http://github.com/rspec/rspec-mocks/issues) or a [pull
request](http://github.com/rspec/rspec-mocks).
