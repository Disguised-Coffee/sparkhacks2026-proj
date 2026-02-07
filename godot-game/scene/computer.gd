extends Area2D

var playerInArea := false
var userWord := ""
var currWord := ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea and Input.is_action_just_pressed("interact"):
		typingGame()
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Node2D":
		playerInArea = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Node2D":
		playerInArea = false
		
func typingGame():
	var dict: Array[String] = ["compile", "debug", "commit", "push", "merge", "deploy", "refactor", "optimize", "variable", "function", "class", "object", "module", "import", "export", "package", "library", "framework", "runtime", "sandbox", "frontend", "backend", "database", "schema", "query", "index", "foreign", "primary", "latency", "caching", "feature", "ticket", "backlog", "sprint", "deadline", "milestone", "review", "approve", "feedback", "roadmap", "testing", "unit", "integration", "coverage", "mock", "stub", "staging", "pipeline", "logs", "monitor", "intern", "mentor", "standup", "pairing", "handoff", "spec", "design", "prototype", "iterate", "polish", "keyboard", "terminal", "editor", "cursor", "branch", "revert", "conflict", "resolve", "snapshot", "version", "SparkHacks", "hacking", "Devpost", "hackpack", "track", "sponsor", "workshop", "submission", "demo", "expo", "idea", "concept", "storyboard", "narrative", "dialog", "choice", "outcome", "progress", "focus", "sprinting", "shipped", "shippedit", "hotfix", "patch", "release", "done", "success", "failure", "retry", "escape"]
	var rng := RandomNumberGenerator.new()
	var randInd: int = rng.randi_range(0, 99)
	$wordLabel.text = dict[randInd]
	currWord = dict[randInd]
	$userText.text = ""
	$userText.grab_focus()

func _on_user_text_text_submitted(new_text: String) -> void:
	if new_text == currWord:
		$"../../projectbar".value += 10
	else:
		$"../../stressbar".value += 10
