extends Area2D

var playerInArea := false; var playerStarted := false;
var userWord := ""
var currWord := ""

#this is a test

var dict_normal: Array[String] = ["compile", "debug", "commit", "push", "merge", "deploy", "refactor", "optimize", "variable", "function", "class", "object", "module", "import", "export", "package", "library", "framework", "runtime", "sandbox", "frontend", "backend", "database", "schema", "query", "index", "foreign", "primary", "latency", "caching", "feature", "ticket", "backlog", "sprint", "deadline", "milestone", "review", "approve", "feedback", "roadmap", "testing", "unit", "integration", "coverage", "mock", "stub", "staging", "pipeline", "logs", "monitor", "intern", "mentor", "standup", "pairing", "handoff", "spec", "design", "prototype", "iterate", "polish", "keyboard", "terminal", "editor", "cursor", "branch", "revert", "conflict", "resolve", "snapshot", "version", "hacking", "track", "sponsor", "workshop", "submission", "demo", "expo", "idea", "concept", "storyboard", "narrative", "dialog", "choice", "outcome", "progress", "focus", "sprinting", "shipped", "shippedit", "hotfix", "patch", "release", "done", "success", "failure", "retry", "escape"]
var dict_horror: Array[String] = ["compile", "debug", "commit", "push --force", "merge --force", "deploy", "kill", "optimize", "hello", "function", "class", "object", "module", "import", "export", "package", "backlog", "not by AI", "deadline", "milestone", "review", "disapprove", "feedback", "roadmap", "testing", "I am not a robot", "integration", "coverage", "mock", "stub",  "editor", "family", "revert", "conflict", "resolve", "hacking", "track", "not by AI", "workshop", "submission", "demo", "expo", "why?", "dialog", "abracadabra", "outcome", "progress", "focus", "suffering", "shipped", "did you commit?", "hotfix", "patch", "pain", "done", "success", "failure", "retry", "escape"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea and Input.is_action_just_pressed("interact"):
		typingGame()
	if not playerInArea and playerStarted:
		currWord = ""
		userWord = ""
		$userText.release_focus()
		$wordLabel.text = "Go to your computer and press 'Enter'"
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Node2D":
		playerInArea = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Node2D":
		playerInArea = false
		
func typingGame():
	
	var rng := RandomNumberGenerator.new()
	
	if $"../../CanvasLayer/stressbar".value > 50:
		var randInt: int = rng.randi_range(0, 58)
		$wordLabel.text = dict_horror[randInt]
		currWord = dict_horror[randInt]
	else:
		var randInt: int = rng.randi_range(0, 96)
		$wordLabel.text = dict_normal[randInt]
		currWord = dict_normal[randInt]
	reset_state();
	playerStarted = true;

func _on_user_text_text_submitted(new_text: String) -> void:
	if new_text == currWord:
		$"../../projectbar".value += 10
	else:
		$"../../CanvasLayer/stressbar".value += 10
	reset_state();
	
func reset_state():
	$userText.text = ""
	$userText.grab_focus()
