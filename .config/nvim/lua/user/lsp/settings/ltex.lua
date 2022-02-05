return {
	settings = {
		ltex = {
			language = "en-US",
			additionalRules = {
				enablePickyRules = true,
				languageModel = "$HOME/.n-grams/",
			},
			dictionary = {
				["en-US"] = { "Ripgrep", "ripgrep", "Laravel", "laravel", "TODO", "Vue", "vue", "Vuex", "Vuex" },
			},
			disabledRules = {},
			hiddenFalsePositives = {},
		},
	},
}
