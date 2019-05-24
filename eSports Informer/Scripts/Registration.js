function checkAll() {
    var validChecks = 0;
    if (checkUsername())
        validChecks++;
    if (checkPassword())
        validChecks++;
    if (checkConfirmPassword())
        validChecks++;
    if (checkEmail())
        validChecks++;
    if (checkGender())
        validChecks++;
    if (checkPlayedGames())
        validChecks++;
    if (checkRegion())
        validChecks++;
    if (checkCaptcha())
        validChecks++;

    if (validChecks === 8)
        return true;
    return false;
}

function checkUsername() {
    var validUsername = /^[a-zA-Z\-]+$/;
    var username = document.getElementById("nickname").value;
    if (!validUsername.test(username)) {
        document.getElementById('nicknameErr').innerHTML = "Please enter a valid username";
        return false;
    }
    else {
        document.getElementById('nicknameErr').innerHTML = "";
        return true;
    }
}

function checkPassword() {
    var password = document.getElementById("password").value;
    var passwordCheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    if (!passwordCheck.test(password)) {
        document.getElementById('passwordErr').innerHTML = "Please enter a password with at least 8 characters, 1 letter and 1 number";
        return false;
    }
    else {
        document.getElementById('passwordErr').innerHTML = "";
        return true;
    }
}

function checkConfirmPassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    if (password === confirmPassword) {
        document.getElementById('confirmPasswordErr').innerHTML = "";
        return true;
    }
    else {
        document.getElementById('confirmPasswordErr').innerHTML = "The passwords in password and confirm password aren't identical. Please make sure to type the same password";
        return false;
    }
}

function checkEmail() {
    var email = document.getElementById("email").value;
    var validEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!validEmail.test(email)) {
        document.getElementById('emailErr').innerHTML = "Please enter a valid email adress";
        return false;
    }
    else {
        document.getElementById('emailErr').innerHTML = "";
        return true;
    }
}

function checkGender() {
    var isChecked = false;
    var gender = document.getElementsByName("gender");
    for (var i = 0; i < gender.length && isChecked == false; i++) {
        if (gender[i].checked) {
            isChecked = true;
        }
    }
    if (!isChecked) {
        document.getElementById('genderErr').innerHTML = "Please select a gender";
    }
    else {
        document.getElementById('genderErr').innerHTML = "";
    }
    return isChecked;
}

function checkRegion() {
    var region = document.getElementById("region").value;
    if (region === "Select your region") {
        document.getElementById('regionErr').innerHTML = "Please select a region";
        return false;
    }
    else {
        document.getElementById('regionErr').innerHTML = "";
        return true;
    }
}

function checkPlayedGames() {
    var isChecked = false;
    var playedGames = document.getElementsByName("playedGames");
    for (var i = 0; i < playedGames.length && isChecked == false; i++) {
        if (playedGames[i].checked) {
            isChecked = true;
        }
    }
    if (!isChecked) {
        document.getElementById('playedGamesErr').innerHTML = "Please select at least 1 played game";
    }
    else {
        document.getElementById('playedGamesErr').innerHTML = "";
    }
    return isChecked;
}

function checkCaptcha() {
    var v = grecaptcha.getResponse();
    if (v.length == 0) {
        document.getElementById('captchaErr').innerHTML = "You can't leave Captcha Code empty";
        return false;
    }
    else {
        document.getElementById('captchaErr').innerHTML = "Captcha completed";
        return true;
    }
}

function clearErr(err) {
    document.getElementById(err).innerHTML = "";
}