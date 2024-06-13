import React from 'react';
import './App.css';
import logo from './DecryptogenTech-Logo.png';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="Decryptogen Tech Logo" />
        <p>Welcome to the <span style={{color: "red"}}>Devops Workshop</span> 2024</p>
      </header>
    </div>
  );
}

export default App;
