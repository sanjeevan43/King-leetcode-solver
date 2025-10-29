# 🚀 LeetCode AI Solver

A full-stack application that provides complete, working solutions to LeetCode problems using AI assistance with intelligent fallback mechanisms.

## 🎯 Key Features

### ✨ Core Capabilities
- **Complete Working Code**: Generates executable solutions, not just algorithms
- **Multi-Language Support**: Python, JavaScript, Java, C++, C#, Go, Rust, TypeScript
- **AI-Powered Solutions**: Uses Gemini AI for intelligent problem solving
- **Smart Fallback System**: 15+ built-in solutions for common problems when offline
- **Real-Time Problem Detection**: Automatically identifies problem types and patterns

### 🛡️ Reliability Features
- **Offline Capability**: Works without internet using built-in solutions
- **Error Handling**: Graceful fallback when external APIs fail
- **Input Validation**: Ensures only LeetCode problems are processed
- **Health Monitoring**: Real-time API status and configuration checks

## 🏗️ Architecture

### Backend API (`/backend`)
```
backend/
├── api/
│   ├── index.py              # Main Flask application
│   ├── fallback.py           # Core fallback solutions
│   └── extended_fallback.py  # Extended problem solutions
├── config.py                 # Centralized configuration
├── .env                      # Environment variables
├── requirements.txt          # Python dependencies
└── vercel.json              # Deployment configuration
```

### Frontend UI (`/Leet-Code-AI`)
- **React + Vite**: Modern frontend framework
- **Tailwind CSS**: Utility-first styling
- **Component Library**: Reusable UI components
- **API Integration**: Seamless backend communication

## 🚀 Quick Start

### 1. Clone & Setup
```bash
git clone <repository-url>
cd profile
```

### 2. One-Click Start
```bash
start-app.bat
```
This automatically:
- Sets up backend API
- Configures environment
- Installs dependencies
- Starts both frontend and backend

### 3. Access Applications
- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:5000
- **API Docs**: http://localhost:5000/docs
- **Health Check**: http://localhost:5000/health

## 🔧 Configuration

### Environment Variables (`.env`)
```env
GEMINI_API_KEY=your_api_key_here          # Gemini AI API key
API_TIMEOUT=30                            # Request timeout (seconds)
MAX_OUTPUT_TOKENS=1500                    # AI response limit
TEMPERATURE=0.1                           # AI creativity (0.0-1.0)
PORT=5000                                 # Server port
```

### API Key Setup
1. Get free API key: https://makersuite.google.com/app/apikey
2. Run setup script: `python setup_api.py`
3. Or manually edit `.env` file

## 📊 Supported Problem Types

### Built-in Solutions (No API Key Required)
1. **Two Sum** - Hash map approach
2. **Valid Parentheses** - Stack-based matching
3. **Palindrome Check** - Two-pointer technique
4. **Maximum Subarray** - Kadane's algorithm
5. **Binary Search** - Divide and conquer
6. **Merge Sorted Arrays** - Two-pointer merge
7. **Climbing Stairs** - Dynamic programming
8. **Best Time to Buy Stock** - Single pass optimization
9. **Contains Duplicate** - Hash set detection
10. **Product Except Self** - Two-pass technique
11. **Find Minimum in Rotated Array** - Modified binary search
12. **Container With Most Water** - Two-pointer optimization
13. **3Sum** - Sorted array + two pointers
14. **Longest Substring Without Repeating** - Sliding window
15. **Reverse String/Array** - Two-pointer swap

### AI-Enhanced Solutions (With API Key)
- **Any LeetCode Problem**: Complete working solutions
- **Multiple Languages**: Support for 8+ programming languages
- **Optimized Algorithms**: Best time/space complexity
- **Detailed Explanations**: Step-by-step solution breakdown

## 🌐 API Endpoints

### Core Endpoints
```http
GET  /                    # API information
GET  /health             # System health check
GET  /docs               # Interactive documentation
POST /solve              # Solve LeetCode problems
```

### Request Format
```json
{
  "problem": "Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.",
  "language": "python"
}
```

### Response Format
```json
{
  "status": "success",
  "solution": "```python\nclass Solution:\n    def twoSum(self, nums, target):\n        # Complete implementation\n        return result\n```\n\nTime Complexity: O(n)\nSpace Complexity: O(n)\n\nExplanation: [detailed explanation]",
  "problem": "original problem text"
}
```

## 🔄 Deployment

### Local Development
```bash
# Backend only
cd backend
python run_server.py

# Full stack
start-app.bat
```

### Production Deployment
```bash
# Deploy to Vercel
cd backend
vercel --prod

# Or use deployment script
deploy.bat
```

### Environment Setup for Production
1. Set environment variables on hosting platform
2. Configure CORS for frontend domain
3. Update API URLs in frontend configuration

## 🧪 Testing

### Manual Testing
```bash
# Test API endpoints
python backend/test_api.py

# Browser testing
open backend/test-local.html
```

### Health Checks
- **API Status**: GET `/health`
- **Configuration**: Check API key setup
- **Fallback System**: Verify offline functionality

## 🛠️ Development

### Adding New Problem Types
1. **Identify Pattern**: Add keywords to problem detection
2. **Create Solution**: Add function in `extended_fallback.py`
3. **Update Router**: Add condition in `generate_fallback_solution()`
4. **Test**: Verify with sample problems

### Extending Language Support
1. **Add Templates**: Update `getSolutionTemplates()` in `api.js`
2. **Add Explanations**: Update `getExplanation()` method
3. **Update Formats**: Add language format in `.env`

## 📈 Performance

### Optimization Features
- **Caching**: Built-in solution caching
- **Timeout Handling**: Configurable request timeouts
- **Error Recovery**: Automatic fallback mechanisms
- **Resource Management**: Efficient memory usage

### Scalability
- **Stateless Design**: Easy horizontal scaling
- **Microservice Architecture**: Independent frontend/backend
- **CDN Ready**: Static asset optimization
- **Database Free**: No persistent storage requirements

## 🔒 Security

### Input Validation
- **Problem Filtering**: Only accepts LeetCode-style problems
- **Sanitization**: Clean input processing
- **Rate Limiting**: Configurable request limits
- **CORS Protection**: Cross-origin request security

### API Security
- **Environment Variables**: Secure credential storage
- **Error Handling**: No sensitive data in error messages
- **Timeout Protection**: Prevents hanging requests

## 🤝 Contributing

### Development Setup
1. Fork repository
2. Create feature branch
3. Follow coding standards
4. Add tests for new features
5. Submit pull request

### Code Standards
- **Python**: PEP 8 compliance
- **JavaScript**: ESLint configuration
- **Documentation**: Comprehensive comments
- **Testing**: Unit tests for new features

## 📝 License

MIT License - See LICENSE file for details

## 🆘 Support

### Common Issues
1. **API Key Not Working**: Check key validity and permissions
2. **Offline Mode**: Verify fallback solutions are working
3. **CORS Errors**: Update frontend API configuration
4. **Deployment Issues**: Check environment variable setup

### Getting Help
- **Documentation**: Check `/docs` endpoint
- **Health Check**: Use `/health` for diagnostics
- **Logs**: Check console output for error details

---

**Built with ❤️ for the coding community**