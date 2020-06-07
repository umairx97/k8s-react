import React from 'react'
import { render } from '@testing-library/react'
import App from './App'

test('renders Welcome to React text', () => {
  const { getByText } = render(<App />)
  const linkElement = getByText(/Welcome to fail React/i)
  expect(linkElement).toBeInTheDocument()
})
