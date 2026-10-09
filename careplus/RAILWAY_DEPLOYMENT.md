# Railway Deployment Guide

This guide will help you deploy the CarePlus AI server to Railway.

## Prerequisites

- Railway account (sign up at [railway.app](https://railway.app))
- Git repository with the code
- Supabase project URL and keys
- OpenRouter API key

## Step 1: Install Railway CLI (Optional)

If you prefer command-line deployment:

```bash
npm install -g @railway/cli
railway login
```

## Step 2: Create a New Railway Project

### Option A: Using Railway CLI

```bash
cd C:\Users\Aman Salarpuria\Desktop\CarePlus\careplus
railway init
railway up
```

### Option B: Using Railway Web UI

1. Go to [railway.app](https://railway.app) and log in
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Select your repository
5. Click "Deploy Now"

## Step 3: Configure Environment Variables

In Railway, go to your project settings and add these environment variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `SUPABASE_URL` | Your Supabase project URL | `https://your-project.supabase.co` |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |
| `SUPABASE_ANON_KEY` | Supabase anonymous key | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |
| `OPENROUTER_API_KEY` | OpenRouter API key | `sk-or-v1-...` |
| `OPENROUTER_BASE_URL` | OpenRouter API base URL | `https://openrouter.ai/api/v1` |
| `OPENROUTER_DEFAULT_MODEL` | Default AI model | `openai/gpt-4o-mini` |
| `EXTRACTOR_A_MODEL` | AI model for extraction A | `openai/gpt-4o-mini` |
| `EXTRACTOR_B_MODEL` | AI model for extraction B | `openai/gpt-4o-mini` |
| `JWT_SECRET` | Secret for JWT tokens | `your-random-secret-here` |
| `JWT_ALGORITHM` | JWT algorithm | `HS256` |
| `LOG_LEVEL` | Logging level | `INFO` |
| `ENVIRONMENT` | Environment name | `production` |

## Step 4: Configure Build Settings

The `railway.json` file is already configured with:
- Dockerfile build
- Health check on `/health` endpoint
- Auto-restart on failure

## Step 5: Deploy

### Using CLI

```bash
railway up
```

### Using Web UI

Railway will automatically deploy when you push to the connected GitHub branch.

## Step 6: Get the Deployment URL

After deployment, Railway will provide a public URL like:
```
https://your-app-name.up.railway.app
```

## Step 7: Update Frontend Configuration

Update your frontend applications to use the new Railway URL:

**Doctor Frontend (CarePlus-frontend/.env):**
```env
VITE_API_URL=https://your-app-name.up.railway.app
```

**Mobile App (careplus-mobile/.env):**
```env
VITE_API_URL=https://your-app-name.up.railway.app
```

## Troubleshooting

### View Logs

```bash
railway logs
```

Or check the logs tab in Railway web UI.

### Health Check

The health endpoint is available at:
```
https://your-app-name.up.railway.app/health
```

### Common Issues

1. **Build fails**: Check that all dependencies are in `pyproject.toml`
2. **Runtime errors**: Check logs for missing environment variables
3. **Database connection**: Verify Supabase URL and keys are correct
4. **API errors**: Verify OpenRouter API key is valid

## Monitoring

Railway provides built-in monitoring for:
- CPU usage
- Memory usage
- Request logs
- Error rates

Access these from the Railway dashboard.
