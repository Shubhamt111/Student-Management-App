window.addEventListener('load', function() {
    fetch('/api/students')
        .then(response => response.json())
        .then(data => {
            const list = document.getElementById('students-list');
            list.innerHTML = '';
            data.forEach(student => {
                const div = document.createElement('div');
                div.innerHTML = `
                    <strong>${student.name}</strong> (${student.email}) - ${student.course}
                    <button onclick="deleteStudent(${student.id})">Delete</button>
                `;
                list.appendChild(div);
            });
        });
});

function deleteStudent(id) {
    fetch(`/api/students/${id}`, {
        method: 'DELETE'
    }).then(() => {
        alert('Student deleted successfully!');
        location.reload();
    });
}
