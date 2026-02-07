import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";

function Home() {
  return (
    <>
      <iframe
        src="/godot/godot-game.html"
        style={{ width: "80vw", height: "80vh", border: "none" }}></iframe>
      <h1>WORKAHOLIC</h1>
    </>
  );
}

function NotFound() {
  return (
    <div>
      <h1>404 asdasd - Page Not Found</h1>
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
