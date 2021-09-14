window.addEventListener('load', (event) => {
    if (sessionStorage.getItem('commentSP') == null){
        sessionStorage.setItem('commentSP', 0)
    }
    window.scroll(0, sessionStorage.getItem('commentSP'))
  });

setInterval(() => {
    sessionStorage.setItem('commentSP', window.scrollY)
}, 250)