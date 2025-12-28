import React from 'react';

function App() {
    const [message, setMessage] = React.useState('');

    React.useEffect(() => {
        fetch('/api/message')
            .then(response => response.json())
            .then(data => setMessage(data.message));
    }, []);

    return (
        <div>
            <h1>Welcome to My Multi-Tier Web App!</h1>
            <p>Message from backend: {message}</p>
        </div>
    );
}

export default App;
