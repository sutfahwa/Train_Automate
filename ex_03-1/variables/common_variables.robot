*** Variables ***
${url}                          http://webapp-qa.mellow.io/#/announce
${browser}                      Chrome
${username}                     qsquad
${password}                     password

# Login page
${usernameInput}                id=username-input
${passwordInput}                id=password-input
${loginBtn}                     id=login-btn
${successMessage}               class=notification-message
${errorMessage}                 class=notification-error

${navBar}                       id=navigation-bar
${avatarIcon}                   class=avatar-icon
${logoutBtn}                    id=logout-btn

${profileMenuList}              id=profile-menu-list
${loginContainer}               id=login-inner-container

${notificationSuccessToast}     class=notification-success
