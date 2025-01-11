document.getElementById('student-form').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const course = document.getElementById('course').value;

    fetch('/api/students', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ name, email, course })
    }).then(response => response.json()).then(student => {
        alert('Student added successfully!');
    });

    document.getElementById('student-form').reset();
});