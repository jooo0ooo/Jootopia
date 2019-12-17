<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<title>${pageName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="icon" href="/resources/img/head.png" />
<style>
html {
    height: 100%;
}
body {
    height: 100%;
    margin: 0;
}

body {
    font-family: "Helvetica Neue";
    font-size: 20px;
    font-weight: normal;
}

section {
    max-width: 450px;
    margin: 50px auto;
}

#speech-buble {
    position: fixed;
    margin: 0 auto;
    margin-left: 250px;
    margin-top: 15px;
    z-index: -1;



    max-width: 255px;
    max-width: 160px;
    word-wrap: break-word;
    margin-bottom: 20px;
    line-height: 24px;
    
    /*position: relative;*/
    padding: 10px 20px;
    padding: 0px 15px;
    color: white;
    background: #0B93F6;;
    border-radius: 25px;
    float: right;
}
#speech-buble:before {
    content: "";
    position: absolute;
    z-index: 2;
    bottom: -2px;
    left: -7px;
    height: 20px;
    border-left: 20px solid #0B93F6;;
    border-bottom-right-radius: 16px 14px;
    -webkit-transform: translate(0, -2px);
}
#speech-buble:after {
    content: "";
    position: absolute;
    z-index: 3;
    bottom: -2px;
    left: 4px;
    width: 26px;
    height: 20px;
    background: white;
    border-bottom-right-radius: 10px;
    -webkit-transform: translate(-30px, -2px);
}

#speech-buble p {
    margin: 10px 0;
}
</style>
</head>
<body>
<div style="height: 100%;  max-width: 440px; width: 100%; margin: 0 auto;">
    <img id="speaking-joo" src="/resources/img/joo_with_jacket.png" width="50%" style="position: fixed; margin: 0 auto; max-width: 220px; z-index: -1;">
    <div id="speech-buble" class="first-section">
        <p>Hi! I'm Joo!</p>
    </div>
    <a href="#second-section" id="first-section" style="height: 100%; width: 100%; float: right;">1st section</a>
    <a href="#third-section" id="second-section" style="height: 100%; width: 100%; float: right;">2nd section</a>
    <a href="#fourth-section" id="third-section" style="height: 100%; width: 100%; float: right;">3rd section</a>
    <a href="#fifth-section" id="fourth-section" style="height: 100%; width: 100%; float: right;">4th section</a>
    <a href="#sixth-section" id="fifth-section" style="height: 100%; width: 100%; float: right;">5th section</a>
    <a href="#seventh-section" id="sixth-section" style="height: 100%; width: 100%; float: right;">6th section</a>
    <a href="#eighth-section" id="seventh-section" style="height: 100%; width: 100%; float: right;">7th section</a>
    <a href="#first-section" id="eighth-section" style="height: 100%; width: 100%; float: right;">8th section</a>
</div>
<link rel="icon" href="/resources/img/head.png" />
<script>
var speechBubles = document.getElementById("speech-buble");
var joo = document.getElementById('speaking-joo');
joo.style.marginTop = (speechBubles.getBoundingClientRect().top + speechBubles.clientHeight) / 3 * 2 + 'px';

window.onload=function() {

    if(window.innerWidth < 440) {
            speechBubles.style.maxWidth = (window.innerWidth / 2) - 60 + 'px';
            speechBubles.style.marginLeft = (window.innerWidth / 2) + 20 + 'px';
    }

    fadeIn(joo, 50);
    fadeIn(speechBubles, 100);

}

window.onscroll=function() {
    
    var scrollTop = window.scrollY || document.documentElement.scrollTop;
    if(scrollTop < window.innerHeight) {
        
        if(!speechBubles.classList.contains('first-section')) {
            
            removeSBClass();
            speechBubles.classList.add('first-section');
            fadeIn(speechBubles, 100, "<p>Hi! I'm Joo</p>");

        }

    } else if (scrollTop >= window.innerHeight && scrollTop < window.innerHeight * 2) {
        
        if(!speechBubles.classList.contains('second-section')) {

            removeSBClass();
            speechBubles.classList.add('second-section');
            fadeIn(speechBubles, 100, "<p>Welcome to Jootopia!</p>");

        }

    } else if (scrollTop >= window.innerHeight * 2 && scrollTop < window.innerHeight * 3) {

        if(!speechBubles.classList.contains('third-section')) {

            removeSBClass();
            speechBubles.classList.add('third-section');
            fadeIn(speechBubles, 100, "<p>This is a website for showing off my ability and connections</p>");

        }

    } else if (scrollTop >= window.innerHeight * 3 && scrollTop < window.innerHeight * 4) {

        if(!speechBubles.classList.contains('fourth-section')) {

            removeSBClass();
            speechBubles.classList.add('fourth-section');
            fadeIn(speechBubles, 100, "<p>Are you curious?</p>");
        
        }

    } else if (scrollTop >= window.innerHeight * 4 && scrollTop < window.innerHeight * 5) {

        if(!speechBubles.classList.contains('fifth-section')) {

            removeSBClass();
            speechBubles.classList.add('fifth-section');
            fadeIn(speechBubles, 100, "<p>Shall we look around?</p>");
        }

    }

};

function fadeIn(target, time, message) {
    var level = 0;
    var inTimer = null;
    inTimer = setInterval(function() {
        level = fadeInAction(target, level, inTimer, message);
    }, time);
}

function fadeInAction(target, level, inTimer, message) {
    level = level + 0.1;
    changeOpacity(target, level, message);
    if(level > 1) {
        clearInterval(inTimer);
    }
    return level;
}

function fadeOut(target) {
    var level = 1;
    var outTimer = null;
    outTimer = setInterval( function() {
        level = fadeOutAction(target, level, outTimer);
    }, 50);
}

function fadeOutAction(target, level, outTimer) {
    level = level - 0.1;
    chageOpacity(target, level);
    if(level < 0) {
        clearInterval(outTimer);
    }
    return level;
}

function changeOpacity(target, level, message) {
    if(level == 0.1) {
        if(message) {
            target.innerHTML = message;
        }
    }
    var obj = target;
    obj.style.opacity = level;
    obj.style.MozOpaicty = level;
    obj.style.KhtmlOpacity = level;
    obj.style.MsFilter = "'progid: DXImageTransform.Microsoft.Alpha(Opacity='" + (level * 100) + ")''";
    obj.style.filter = "alpha(opacity=" + (level * 100) + ");";
}

function removeSBClass() {
    speechBubles.classList.remove('first-section');
    speechBubles.classList.remove('second-section');
    speechBubles.classList.remove('third-section');
    speechBubles.classList.remove('fourth-section');
    speechBubles.classList.remove('fifth-section');
}

</script>
</body>

</html>