import { render, screen } from '@testing-library/react';
import NotFound from '../pages/NotFound';

test('renders NotFound component', () => {
   render(<NotFound />);
   expect(screen.getByText('404 Not Found')).toBeInTheDocument(); // Update based on your NotFound component's content
});
