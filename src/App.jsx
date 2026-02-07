import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";

function Home() {
  return (
    <>
      <iframe
        src="/godot/godot-game.html"
        style={{ width: "100%", height: "600px", border: "none" }}></iframe>
      <p className="read-the-docs">Click on the Vite and React logos to learn more</p>
      testing another deployment
    </>
  );
}

function NotFound() {
  return (
    <div>
      <h1>404 - Page Not Found</h1>
      <p>The page you're looking for doesn't exist.</p>
      <a href="/">Go back home</a>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
