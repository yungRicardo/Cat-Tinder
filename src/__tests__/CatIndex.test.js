import { render, screen } from "@testing-library/react";
import { MemoryRouter } from 'react-router-dom';
import CatIndex from "../pages/CatIndex";
import mockCats from '../mockCats'; // Ensure this import path is correct

describe("<CatIndex />", () => {
   it("renders without crashing", () => {
      render(<CatIndex cats={mockCats} />);
      const catCardElements = screen.getAllByTestId('cat-card');
      expect(catCardElements.length).toBeGreaterThan(0); // This asserts that there are one or more elements with this test ID
   });

   it("renders cat cards", () => {
      render(
      <MemoryRouter>
         <CatIndex cats={mockCats} />
      </MemoryRouter>
      );
      mockCats.forEach((cat) => {
      const catName = screen.getByText(cat.name);
      expect(catName).toBeInTheDocument();
      });
   });
});
