//Enable all tooltips
let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
let tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
})

document.getElementById('generate-button').addEventListener("click", generateLink);

new ClipboardJS('#generate-button', {
    text: generateUrl
});

function generateLink() {
    const urlButtonDiv = document.getElementById('url-button-div');
    urlButtonDiv.style.display = "block";

    const urlButton = document.getElementById('url-button');
    urlButton.innerHTML = `<code>${generateUrl()}</code>`

}

function generateUrl() {
    const privateKey = document.getElementById('privateID').value;
    const groupID = document.getElementById('groupID').value;
    const baseURL = 'https://www.zootle.me'
    // const baseURL = 'http://127.0.0.1:5000'
    return `${baseURL}/bib?groupID=${groupID}&privateKey=${privateKey}`
}

