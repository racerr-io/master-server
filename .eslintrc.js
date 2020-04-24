module.exports = {
    parser: "@typescript-eslint/parser", // Specifies the ESLint parser
    extends: [
        "eslint:recommended",
        "plugin:@typescript-eslint/eslint-recommended",
        "prettier/@typescript-eslint",
        "plugin:prettier/recommended"
    ],
    parserOptions: {
        ecmaVersion: 6,
        sourceType: "module",
        ecmaFeatures: {
            modules: true
        }
    }
};