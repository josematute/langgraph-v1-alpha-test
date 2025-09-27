"""
Utility functions for saving workflow diagrams
"""
import os
from datetime import datetime


def save_workflow_diagram(chain, filename=None, directory="diagrams"):
    """
    Save workflow diagram to file
    
    Args:
        chain: The LangGraph chain object
        filename: Optional custom filename (without extension)
        directory: Directory to save diagrams (default: "diagrams")
    
    Returns:
        str: Full path of saved file
    """
    # Create directory if it doesn't exist
    if not os.path.exists(directory):
        os.makedirs(directory)
        print(f"📁 Created directory: {directory}")
    
    # Generate filename if not provided
    if filename is None:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"workflow_{timestamp}"
    
    # Ensure .png extension
    if not filename.endswith('.png'):
        filename += '.png'
    
    # Full path
    filepath = os.path.join(directory, filename)
    
    try:
        # Get diagram data and save
        png_data = chain.get_graph().draw_mermaid_png()
        with open(filepath, "wb") as f:
            f.write(png_data)
        
        print(f"✅ Workflow diagram saved: {filepath}")
        return filepath
        
    except Exception as e:
        print(f"❌ Failed to save diagram: {e}")
        return None


def quick_save_diagram(chain, name="workflow"):
    """
    Quick save to current directory with simple name
    
    Args:
        chain: The LangGraph chain object
        name: Base name for file (default: "workflow")
    
    Returns:
        str: Filename of saved file
    """
    filename = f"{name}.png"
    
    try:
        png_data = chain.get_graph().draw_mermaid_png()
        with open(filename, "wb") as f:
            f.write(png_data)
        
        print(f"✅ Diagram saved: {filename}")
        return filename
        
    except Exception as e:
        print(f"❌ Failed to save diagram: {e}")
        return None
