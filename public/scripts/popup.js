let popupElement = document.querySelector(".popup")
let popupButton = document.querySelector(".popup-cancel")

popupElement.classList.add("popup-showing")

popupButton.addEventListener("click", () => {
    popupElement.classList.remove("popup-showing")
})

setTimeout(() => {
    popupElement.classList.remove("popup-showing")
}, 3000)