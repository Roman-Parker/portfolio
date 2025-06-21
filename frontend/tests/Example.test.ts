import { describe, it, expect } from "vitest";

console.log("Test file is being executed!");

describe("Basic test", () => {
    it("should pass", () => {
        expect(1 + 1).toBe(2);
    });
});
