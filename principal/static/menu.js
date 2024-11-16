document.addEventListener('DOMContentLoaded', function() {
    const dropdownToggle = document.querySelector('.dropdown-toggle');
    const dropdownMenu = document.querySelector('.dropdown');

    dropdownToggle.addEventListener('mouseover', function() {
        dropdownMenu.style.display = 'block';
    });

    dropdownToggle.addEventListener('mouseout', function() {
        dropdownMenu.style.display = 'none';
    });

    dropdownMenu.addEventListener('mouseover', function() {
        dropdownMenu.style.display = 'block';
    });

    dropdownMenu.addEventListener('mouseout', function() {
        dropdownMenu.style.display = 'none';
    });
});
