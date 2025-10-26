# Pumpkin AI - Halloween Face Overlay & Story Generator 🎃

A spooky AI-powered Halloween experience that combines face detection with AI-generated stories. Dress up in costumes, grab treats, and get a personalized Halloween story!

## Features

- 🎭 **Face Detection & Overlays**: Real-time face detection with customizable Halloween overlays
- 🤖 **AI-Generated Stories**: Personalized spooky stories using local LLM (Ollama or llama.cpp)
- 👻 **Multiple Costumes**: Choose from 16 different costume overlays
- 🍬 **Treat Selection**: Pick from 7 different treat overlays
- 📖 **Template Stories**: Works without AI - uses template-based stories as fallback
- 🎮 **Dev & Prod Modes**: Switch between development and production modes
- 🎨 **Configurable Prompts**: Customize AI story generation prompts

## Screenshots

[Add screenshots here if available]

---

## System Requirements

### Windows
- Windows 10 or later
- Python 3.8 or higher
- Webcam
- 4GB RAM minimum (8GB recommended for AI features)

### Ubuntu/Linux
- Ubuntu 20.04 or later (or equivalent Linux distribution)
- Python 3.8 or higher
- Webcam
- 4GB RAM minimum (8GB recommended for AI features)

---

## Installation

### Windows Setup

#### 1. Install Python

If you don't have Python installed:

1. Download Python from [python.org](https://www.python.org/downloads/)
2. During installation, check "Add Python to PATH"
3. Verify installation:
   ```powershell
   python --version
   ```

#### 2. Install Dependencies

Open PowerShell or Command Prompt and navigate to the project directory:

```powershell
# Install Python dependencies
pip install -r requirements.txt
```

#### 3. Start the Application

```powershell
python web_server.py
```

The application will be available at: **http://localhost:5000**

---

### Ubuntu Setup

#### 1. Install Python and pip

```bash
# Update package list
sudo apt update

# Install Python 3 and pip
sudo apt install python3 python3-pip python3-venv -y

# Verify installation
python3 --version
```

#### 2. Install System Dependencies

```bash
# Install OpenCV dependencies
sudo apt install libopencv-dev python3-opencv -y

# Install video capture libraries
sudo apt install v4l-utils libv4l-dev -y

# Install other dependencies
sudo apt install build-essential pkg-config -y
```

#### 3. Create Virtual Environment (Recommended)

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip
```

#### 4. Install Python Dependencies

```bash
# Install dependencies
pip install -r requirements.txt
```

#### 5. Fix Camera Permissions (If needed)

If you have camera issues:

```bash
# Add your user to video group
sudo usermod -a -G video $USER

# Log out and log back in for changes to take effect
```

#### 6. Start the Application

```bash
# Make sure virtual environment is activated
source venv/bin/activate

# Start the server
python3 web_server.py
```

The application will be available at: **http://localhost:5000**

---

## Optional: AI Story Generation Setup

The app works great with template-based stories, but you can enable AI-generated stories using Ollama.

### Quick Setup for Windows

See detailed instructions in [OLLAMA_SETUP.md](OLLAMA_SETUP.md)

1. Install Ollama from [ollama.ai](https://ollama.ai/download)
2. Start Ollama server: `ollama serve`
3. Download a model: `ollama pull llama2`

### Quick Setup for Ubuntu

```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Start Ollama service
ollama serve

# In a new terminal, download a model
ollama pull llama2
```

---

## Usage

### Basic Usage

1. **Start the server**: Run `python web_server.py` (or `python3 web_server.py` on Linux)
2. **Open browser**: Go to http://localhost:5000
3. **Enter your name**: Type your name in the input field
4. **Select costume**: Choose a Halloween costume from the dropdown
5. **Select treat**: Choose a treat from the dropdown
6. **Generate story**: Click "Update Story" to generate your personalized Halloween story
7. **View overlays**: Your selected costume and treat will appear as overlays on your face in the video feed

### Production Mode

Click "Switch to Prod" to enter production mode:

- Click **Snapshot** to freeze the current frame with overlays
- Click **Reset** to return to live video feed
- The frozen snapshot is saved to the `snapshots/` directory

### Development Mode (Dev)

Click "Switch to Dev" to access developer features:

- **Overlay Controls**: Manually add/remove overlay buttons
- **Nudge Mode**: Fine-tune overlay positioning with offset controls
- **Prompt Configuration**: Customize AI story generation prompts
- **Debug Mode**: Configure debugging and logging options

---

## Project Structure

```
pcct_pumpkin-main/
├── web_server.py          # Main Flask server application
├── templates/
│   └── index.html         # Web interface
├── overlays/              # Halloween overlay images
│   ├── config.json        # Overlay configuration
│   └── *.png              # Overlay images (costumes & treats)
├── models/                # Local LLM models (optional)
├── snapshots/             # Saved snapshots
├── requirements.txt       # Python dependencies
├── prompt_config.json     # AI prompt configuration
└── README.md              # This file
```

---

## Configuration

### Overlay Configuration

Edit `overlays/config.json` to customize overlay positioning and scaling.

### Prompt Configuration

Edit `prompt_config.json` to customize AI story generation:

- `system_prompt`: System message for the AI
- `main_prompt_template`: Template for story generation
- `sample_templates`: Example templates for the AI
- `llm_parameters`: Temperature, max_tokens, etc.

---

## Troubleshooting

### Camera Not Working

**Windows:**
- Make sure no other application is using the camera
- Check camera permissions in Windows Settings

**Ubuntu:**
- Run: `v4l2-ctl --list-devices` to list available cameras
- Add user to video group: `sudo usermod -a -G video $USER`
- Log out and log back in

### Port Already in Use

If port 5000 is already in use:

```python
# Edit web_server.py and change:
app.run(host='0.0.0.0', port=5000)  # Change 5000 to another port
```

### Import Errors

**Windows:**
```powershell
pip install --upgrade pip
pip install -r requirements.txt --force-reinstall
```

**Ubuntu:**
```bash
# Make sure virtual environment is activated
source venv/bin/activate

# Reinstall dependencies
pip install --upgrade pip
pip install -r requirements.txt --force-reinstall
```

### OpenCV Installation Issues

**Ubuntu:**
```bash
sudo apt update
sudo apt install libopencv-dev python3-opencv -y
pip install opencv-python-headless
```

---

## Features in Detail

### Overlays Available

**Costumes (16 options):**
- Fangs, Horns
- Yellow Devil (1-5)
- Yellow Pumpkin (1-5)
- Yellow Witch (1-5)

**Treats (7 options):**
- Spooky Candy A
- Chocolate Treats (1-3)
- Candy (1-3)

### AI Story Generation

The app supports two AI backends:

1. **Ollama** (Recommended - easier setup)
2. **llama.cpp** (Alternative - uses local .gguf model files)

Both are optional - the app works with template-based stories by default.

### Modes

- **Production Mode**: Simplified interface for end users, snapshot functionality
- **Development Mode**: Full control with overlay management, nudge mode, and configuration panels

---

## Performance Tips

### For Better Performance

1. **Close other applications** using the camera
2. **Use good lighting** for better face detection
3. **Use SSD** instead of HDD for faster model loading
4. **Disable AI** if not needed (uses template stories)

### System Requirements for AI Features

- **Minimum**: 4GB RAM, 2GB free disk space
- **Recommended**: 8GB+ RAM, 5GB free disk space
- **AI Models**: 2-4GB per model

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## License

[Specify your license here]

---

## Acknowledgments

- OpenCV for face detection
- Flask for web framework
- Ollama for AI inference
- llama.cpp for alternative AI backend

---

## Support

For issues and questions:
- Check the troubleshooting section above
- See [OLLAMA_SETUP.md](OLLAMA_SETUP.md) for AI setup help
- Review the code comments in `web_server.py`

---

**Happy Halloween! 🎃👻🦇**
