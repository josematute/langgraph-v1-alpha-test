#!/bin/bash

# Python Project Setup Script with Virtual Environment

echo "🚀 Starting Python project setup..."

# Create virtual environment
echo "📦 Creating virtual environment..."
if python3 -m venv venv; then
    echo "✅ Virtual environment created successfully!"
else
    echo "❌ Failed to create virtual environment"
    exit 1
fi

# Activate virtual environment
echo "🔌 Activating virtual environment..."
source venv/bin/activate

# Show environment info
echo "🐍 Virtual environment activated!"
echo "📍 Current Python: $(which python)"
echo "📋 Python version: $(python --version)"

# Create requirements.txt with python-dotenv
echo "📝 Creating requirements.txt..."
cat > requirements.txt << EOF
python-dotenv==1.0.0
EOF
echo "✅ requirements.txt created!"

# Create .gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << EOF
# Virtual Environment
venv/
env/
ENV/

# Python
__pycache__/
*.py[cod]
*$py.class
.Python
var/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# OS
.DS_Store
EOF
echo "✅ .gitignore created!"

# Install requirements
echo "⬇️  Installing requirements..."
if pip install -r requirements.txt; then
    echo "✅ Requirements installed successfully!"
else
    echo "❌ Failed to install requirements"
    exit 1
fi

# Create empty .env file
echo "🔧 Creating .env file..."
touch .env
echo "✅ .env file created!"

# Create main.py with hello world
echo "📄 Creating main.py..."
cat > main.py << EOF
#!/usr/bin/env python3
"""
Simple Hello World script to test the Python environment setup.
"""

import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

def main():
    print("🎉 Hello World from Python!")
    print(f"🐍 Python executable: {os.sys.executable}")
    print(f"📂 Current working directory: {os.getcwd()}")
    print("✨ Environment setup is working correctly!")

if __name__ == "__main__":
    main()
EOF
echo "✅ main.py created!"

# Test the setup
echo "🧪 Testing the setup..."
if python main.py; then
    echo ""
    echo "🎊 SUCCESS! Your Python project is ready!"
    echo "💡 To get started:"
    echo "   • Add your environment variables to .env"
    echo "   • Install additional packages: pip install <package>"
    echo "   • Update requirements.txt: pip freeze > requirements.txt"
    echo "   • Activate venv anytime: source venv/bin/activate"
else
    echo "❌ Setup test failed"
    exit 1
fi
