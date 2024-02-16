import { render, screen } from "@testing-library/react"
import { BrowserRouter } from "react-router-dom"
import userEvent from "@testing-library/user-event"
import Header from "../components/Header"
import Cat_Logo from '../assets/cat_logo.webp'

describe("<Header />", () => {
   it("renders without crashing", () => {
      const div = document.createElement("div")
      render(
         <BrowserRouter>
         <Header />
         </BrowserRouter>,
         div
      )
   })
   it("renders a logo with a src and alt", () => {
      const div = document.createElement("div")
      render(
         <BrowserRouter>
         <Header />
         </BrowserRouter>,
         div
      )
   })
   it("has clickable links", () => {
      render(
         <BrowserRouter>
         <Header />
         </BrowserRouter>
      )
   })
   it("renders a logo with a src and alt", () => {
      const div = document.createElement("div")
      render(
         <BrowserRouter>
            <Header />
         </BrowserRouter>,
         div
      )
      const logo = screen.getByRole("img")
      expect(logo).toHaveAttribute("src", "cat_logo.webp")
      expect(logo).toHaveAttribute("alt", "Cat Tinder logo with outline of cat")
   })
   it("has clickable links", () => {
      render(
         <BrowserRouter>
            <Header />
         </BrowserRouter>
      )
      userEvent.click(screen.getByText("Meet the Cats"))
      expect(screen.getByText("Meet the Cats")).toBeInTheDocument()
      userEvent.click(screen.getByText("Add a New Cat"))
      expect(screen.getByText("Add a New Cat")).toBeInTheDocument()
      userEvent.click(screen.getByText("Adopt a Cat!"))
      expect(screen.getByText("Adopt a Cat!")).toBeInTheDocument()
   })
})