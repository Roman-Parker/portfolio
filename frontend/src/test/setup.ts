import { vi, beforeAll, afterAll } from 'vitest';

// Mock `console.warn` to avoid Vue warnings in tests
beforeAll(() => {
    vi.spyOn(console, 'warn').mockImplementation(() => { });
});

afterAll(() => {
    vi.restoreAllMocks();
});
