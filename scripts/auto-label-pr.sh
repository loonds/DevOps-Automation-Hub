#!/bin/bash

PR_TITLE=$(jq -r '.pull_request.title' "$GITHUB_EVENT_PATH")

if [[ "$PR_TITLE" == *"fix"* ]]; then
  LABEL="bug"
elif [[ "$PR_TITLE" == *"feat"* ]]; then
  LABEL="enhancement"
else
  LABEL="misc"
fi

gh pr edit "$PR_NUMBER" --add-label "$LABEL"
