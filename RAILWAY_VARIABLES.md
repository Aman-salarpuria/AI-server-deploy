# Railway Environment Variables

Add these environment variables in your Railway project settings:

| Variable | Description | Example | Required |
|----------|-------------|---------|----------|
| `SUPABASE_URL` | Your Supabase project URL | `https://your-project.supabase.co` | Yes |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` | Yes |
| `SUPABASE_ANON_KEY` | Supabase anonymous key | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` | Yes |
| `OPENROUTER_API_KEY` | OpenRouter API key | `sk-or-v1-...` | Yes |
| `OPENROUTER_BASE_URL` | OpenRouter API base URL | `https://openrouter.ai/api/v1` | No (default) |
| `OPENROUTER_DEFAULT_MODEL` | Default AI model | `openai/gpt-4o-mini` | No (default) |
| `EXTRACTOR_A_MODEL` | AI model for extraction A | `openai/gpt-4o-mini` | No (default) |
| `EXTRACTOR_B_MODEL` | AI model for extraction B | `openai/gpt-4o-mini` | No (default) |
| `JWT_SECRET` | Secret for JWT tokens | `your-random-secret-here` | Yes |
| `JWT_ALGORITHM` | JWT algorithm | `HS256` | No (default) |
| `LOG_LEVEL` | Logging level | `INFO` | No (default) |
| `ENVIRONMENT` | Environment name | `production` | No (default) |

## How to Add Variables in Railway

1. Go to your Railway project
2. Click on the "Variables" tab
3. Add each variable with its value
4. Click "Save Changes"

## Important Notes

- Never commit actual secrets to git
- Use strong, random values for `JWT_SECRET`
- Obtain Supabase keys from your Supabase project settings
- Obtain OpenRouter API key from https://openrouter.ai/keys
