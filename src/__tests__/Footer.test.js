import { render, screen } from '@testing-library/react';
import Footer from '../components/Footer';

test('renders Footer component', () => {
   render(<Footer />);
   // Test for clickable links in your footer
   // const privacyPolicyLink = screen.getByRole('link', { name: /privacy policy/i });
   // expect(privacyPolicyLink).toHaveAttribute('href', '/privacy-policy');
   expect(screen.getByText('© 2023 Cat Tinder. All rights reserved.')).toBeInTheDocument();
});
