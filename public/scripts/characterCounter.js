let countForm = document.querySelector("textarea")
let countDisplayer = document.querySelector(".character-count")
countDisplayer.textContent = countForm.value.length
countForm.addEventListener("input", (e) => {
    console.log(countDisplayer.textContent = countForm.value.length)
})


