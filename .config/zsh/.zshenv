mkdir -p ~/.cache

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# postgres
export PGSERVICEFILE="$XDG_CONFIG_HOME/postgresql/pg_service.conf"

# snowflake
export SNOWFLAKE_HOME="$XDG_CONFIG_HOME/snowflake"

# codex
mkdir -p "$XDG_CONFIG_HOME/codex"
export CODEX_HOME="$XDG_CONFIG_HOME/codex"


