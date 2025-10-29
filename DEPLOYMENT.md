# 🚀 Deployment Guide - LeetCode AI Solver

## 📋 Deployment Checklist

### Pre-Deployment
- [ ] API key configured in `.env`
- [ ] All dependencies installed
- [ ] Tests passing locally
- [ ] Environment variables set
- [ ] CORS configured for production

### Production Deployment
- [ ] Backend deployed to Vercel
- [ ] Frontend deployed to Vercel/Netlify
- [ ] Environment variables set on hosting platform
- [ ] Custom domain configured (optional)
- [ ] SSL certificate active

## 🌐 Backend Deployment (Vercel)

### 1. Prepare for Deployment
```bash
cd backend
git init
git add .
git commit -m "Initial deployment"
```

### 2. Deploy to Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

### 3. Set Environment Variables
```bash
# Set API key
vercel env add GEMINI_API_KEY production
# Enter your API key when prompted

# Set other variables
vercel env add API_TIMEOUT production
vercel env add MAX_OUTPUT_TOKENS production
vercel env add TEMPERATURE production
```

### 4. Verify Deployment
- Visit your Vercel URL
- Check `/health` endpoint
- Test `/solve` endpoint
- Verify `/docs` page

## 🎨 Frontend Deployment

### Option 1: Vercel
```bash
cd Leet-Code-AI
vercel --prod
```

### Option 2: Netlify
```bash
cd Leet-Code-AI
npm run build
# Upload dist folder to Netlify
```

### Update API URLs
```javascript
// In api.js or config file
const API_BASE_URLS = [
  'https://your-backend-url.vercel.app',
  'http://localhost:5000' // Keep for local development
];
```

## 🔧 Environment Configuration

### Backend Environment Variables
```env
# Production .env (on Vercel)
GEMINI_API_KEY=your_actual_api_key
GEMINI_API_ENDPOINT=https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent
API_TIMEOUT=30
MAX_OUTPUT_TOKENS=1500
TEMPERATURE=0.1
TOP_P=0.8
PORT=5000
FLASK_DEBUG=False
```

### Frontend Environment Variables
```env
# Frontend .env
VITE_API_URL=https://your-backend-url.vercel.app
VITE_APP_NAME=LeetCode AI Solver
```

## 🏗️ Vercel Configuration

### vercel.json (Backend)
```json
{
  "version": 2,
  "builds": [
    {
      "src": "api/index.py",
      "use": "@vercel/python"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "api/index.py"
    }
  ],
  "env": {
    "PYTHONPATH": "."
  }
}
```

### vercel.json (Frontend)
```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build",
      "config": {
        "distDir": "dist"
      }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
```

## 🔒 Security Configuration

### CORS Setup
```python
# In index.py
from flask_cors import CORS

app = Flask(__name__)
CORS(app, origins=[
    "https://your-frontend-domain.vercel.app",
    "http://localhost:5173"  # For development
])
```

### API Key Security
- Never commit API keys to git
- Use environment variables
- Rotate keys regularly
- Monitor usage quotas

## 📊 Monitoring & Health Checks

### Health Check Endpoint
```python
@app.route("/health")
def health_check():
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.utcnow().isoformat(),
        "version": "1.0.0",
        "api_configured": bool(os.getenv("GEMINI_API_KEY")),
        "fallback_available": True
    })
```

### Monitoring Setup
- Set up Vercel Analytics
- Configure error tracking
- Monitor API usage
- Set up uptime monitoring

## 🚀 Deployment Scripts

### deploy-backend.bat
```batch
@echo off
echo Deploying Backend to Vercel...
cd backend
git add .
git commit -m "Deploy: %date% %time%"
vercel --prod
echo Backend deployed successfully!
```

### deploy-frontend.bat
```batch
@echo off
echo Deploying Frontend to Vercel...
cd Leet-Code-AI
npm run build
vercel --prod
echo Frontend deployed successfully!
```

### deploy-all.bat
```batch
@echo off
echo Deploying Full Stack Application...
call deploy-backend.bat
call deploy-frontend.bat
echo Full deployment complete!
echo Backend: Check Vercel dashboard
echo Frontend: Check Vercel dashboard
```

## 🔄 CI/CD Pipeline

### GitHub Actions (Optional)
```yaml
# .github/workflows/deploy.yml
name: Deploy to Vercel
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy Backend
        run: |
          cd backend
          vercel --prod --token ${{ secrets.VERCEL_TOKEN }}
      - name: Deploy Frontend
        run: |
          cd Leet-Code-AI
          vercel --prod --token ${{ secrets.VERCEL_TOKEN }}
```

## 🧪 Post-Deployment Testing

### Automated Tests
```bash
# Test backend endpoints
curl https://your-backend-url.vercel.app/health
curl -X POST https://your-backend-url.vercel.app/solve \
  -H "Content-Type: application/json" \
  -d '{"problem": "Two Sum problem"}'

# Test frontend
curl https://your-frontend-url.vercel.app
```

### Manual Testing Checklist
- [ ] Homepage loads correctly
- [ ] API endpoints respond
- [ ] Problem solving works
- [ ] Error handling functions
- [ ] Mobile responsiveness
- [ ] Cross-browser compatibility

## 🔧 Troubleshooting

### Common Issues

#### 1. API Key Not Working
```bash
# Check environment variables
vercel env ls

# Update API key
vercel env rm GEMINI_API_KEY production
vercel env add GEMINI_API_KEY production
```

#### 2. CORS Errors
```python
# Update CORS configuration
CORS(app, origins=["*"])  # For testing only
```

#### 3. Build Failures
```bash
# Check build logs
vercel logs your-deployment-url

# Clear cache and redeploy
vercel --prod --force
```

#### 4. Function Timeout
```json
// In vercel.json
{
  "functions": {
    "api/index.py": {
      "maxDuration": 30
    }
  }
}
```

## 📈 Performance Optimization

### Backend Optimization
- Enable response compression
- Implement caching headers
- Optimize API response size
- Use connection pooling

### Frontend Optimization
- Enable code splitting
- Optimize bundle size
- Implement lazy loading
- Use CDN for assets

## 🔄 Rollback Strategy

### Quick Rollback
```bash
# Rollback to previous deployment
vercel rollback your-deployment-url

# Or redeploy specific commit
git checkout previous-commit-hash
vercel --prod
```

### Database Rollback (If applicable)
- Backup before deployment
- Test rollback procedures
- Document rollback steps
- Monitor after rollback

---

**Your LeetCode AI Solver is now ready for production! 🎉**

### Quick Links After Deployment
- **Backend API**: https://your-backend-url.vercel.app
- **Frontend**: https://your-frontend-url.vercel.app
- **Health Check**: https://your-backend-url.vercel.app/health
- **API Docs**: https://your-backend-url.vercel.app/docs