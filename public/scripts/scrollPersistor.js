window.addEventListener('load', (event) => {
    //set the comments session storage to 0 because we have left the comments page
    sessionStorage.setItem('commentSP', 0)
    if (sessionStorage.getItem('mainSP') == null){
        sessionStorage.setItem('mainSP', 0)
    }
    window.scroll(0, sessionStorage.getItem('mainSP'))
  });

setInterval(() => {
    sessionStorage.setItem('mainSP', window.scrollY)
}, 250)