install:
	@yarn

setup:
	@sls dynamodb remove && sls dynamodb install

run:
	@sls offline start --dontPrintOutput

lint:
	@echo 'linting…'
	@npx eslint src

lint-fix:
	@echo 'lint-fixing…'
	@npx eslint src --fix

lint-watch:
	@set +e
	@npx nodemon --watch src -q --exec 'make lint-fix'

test:
	@npx jest --config jest.config.js

test-watch:
	@set +e
	@npx jest --watch --config jest.config.js

test-coverage:
	@npx jest --coverage --config jest.config.js

deploy:
	@sls deploy --verbose --stage dev --region eu-west-1

deploy-production:
	@sls deploy --verbose --stage production --region eu-west-1

destroy:
	@sls remove --verbose --stage dev --region eu-west-1

destroy-production:
	@sls remove --verbose --stage production --region eu-west-1