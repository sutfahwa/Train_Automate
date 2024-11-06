*** Variables ***
${username}        qsquad
${password}        password
${url}             http://webapp-qa.mellow.io/
${browser}         chrome
### Login Page ###

${usernameField}        id=username-input
${passwordField}        id=password-input
${loginBtn}             id=login-btn
${successMessage}      //*[@class="notification-message"]


### Logout ###
${avatarBtn}            //*[@class="avatar-name"]
${LogoutBtn}            id=logout-btn

### Menu ###
${AppMenu}                        //*[@class="app-menu-icon"]
${TodoMenu}                       id=app-icon-todo
${visitorMene}                    id=app-icon-guest-management
