# ag_assignment
AutoGravity's assignment for the QA Engineer Role

Instructions to run test suite

1. Install any gems and their dependencies

    $ bundle install

2. Run test with:

    $ bundle exec cucumber features/credit_application.feature

Some bumps I ran into...
1. Web app responsiveness doesn't render well. When smaller elements heavily overlap.
2. Several different flows for vehicle selection made it difficult to write concrete steps.
3. Lack of usable ID/class names, nearly everything is dynamic.
4. Inconsistent element naming conventions.
5. Inconsistent button text IE: "Next" button vs "NEXT" button.
6. Attempted different methods of explicit waits with WaitUtil being the most successful.
