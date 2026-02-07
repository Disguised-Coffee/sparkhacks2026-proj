import { useState } from "react";
// import reactLogo from "./assets/react.svg";
// import viteLogo from "/vite.svg";
import "./App.css";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <iframe
        src="godot/godot-game.html"
        style={{ width: "100%", height: "600px", border: "none" }}></iframe>
      <p className="read-the-docs">Click on the Vite and React logos to learn more</p>
      blah
    </>
  );
}

export default App;
