# swag-labs-robot-test-automation
Swag labs - https://www.saucedemo.com - Automation test scripts using Robot framework

**Set-up**
Execution setup includes Python and Robot framework libraries

After setting up python in system -> navigate to project root in terminal -> run command: pip install

**Execution**
Execution commands based on tags:
1. To run login test: robot --include LOGIN .
2. To run products test: robot --include PRODUCT .
3. To run cart test: robot --include CART .
4. To run E2E flow with checkout: robot --include CHECKOUT .
5. To run all test scenarios: robot --include REGRESSION .
