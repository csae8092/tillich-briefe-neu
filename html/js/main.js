/**
 * Toggles highlight for elements based on a checkbox state
 * @param {HTMLInputElement} checkbox - The checkbox element
 */
function toggleHighlight(checkbox) {
    // Use the checkbox's value as the data-bs-target
    const dataTarget = checkbox.value;

    // Select all elements with the specified data-bs-target
    const elements = document.querySelectorAll(`[data-bs-target="#${dataTarget}"]`);
    console.log(elements)
    
    // Add or remove the highlight class based on the checkbox state
    if (checkbox.checked) {
        elements.forEach(element => element.classList.add('highlight'));
    } else {
        elements.forEach(element => element.classList.remove('highlight'));
    }
}
