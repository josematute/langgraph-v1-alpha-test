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
