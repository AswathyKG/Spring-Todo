
    const nav = document.querySelector('.nav')
    window.addEventListener('scroll', fixNav)

    function fixNav() {
        if(window.scrollY > nav.offsetHeight + 150) {
            nav.classList.add('active')
            document.getElementById('logo').src = 'image/logo-black.png';
        } else {
            nav.classList.remove('active')
            document.getElementById('logo').src = 'image/logo-white.png';
        }
    }