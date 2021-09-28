return {
	Name = "give";
	Aliases = {};
	Description = "Gives a tool";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "players";
			Name = "player";
			Description = "the player to give the tool";
		},
		{
			Type = "tool";
			Name = "toolname";
			Description = "the tool to give";
		}
	};
}