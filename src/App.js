import Header from './components/Header';
import Footer from './components/Footer';
import { Routes, Route } from "react-router-dom";
import Home from './pages/Home';
import CatEdit from './pages/CatEdit';
import CatIndex from './pages/CatIndex';
import CatNew from './pages/CatNew';
import CatShow from './pages/CatShow';
import NotFound from './pages/NotFound';
import mockCats from './mockCats';


function App() {
  return (
    <>
    <Header />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/catedit" element={<CatEdit />} />
        <Route path="/catindex" element={<CatIndex cats={mockCats} />} />
        <Route path="/catnew" element={<CatNew />} />
        <Route path="/catshow/:id" element={<CatShow cats={mockCats} />} />
        <Route path="*" element={<NotFound />} />
      </Routes>


    <Footer />
    </>
  );
}

export default App;



