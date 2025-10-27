# TinyLlama Setup Guide for Pumpkin AI

## Overview
TinyLlama-1.1B-Chat-v1.0.Q2_K.gguf is a fast, compact model (~700 MB) perfect for generating 100-word Halloween stories with minimal latency.

## Why TinyLlama?
- **Size**: ~700 MB (3x smaller than Llama-2-7B)
- **Speed**: 2-3x faster inference on CPU
- **Quality**: Excellent for short stories (100 words)
- **Memory**: Requires less RAM to run

## Download Instructions

### Option 1: Using Ollama (Recommended - Easiest)

1. **Install Ollama** (if not already installed):
   ```powershell
   # Download from https://ollama.ai (for Windows)
   ```

2. **Pull TinyLlama**:
   ```powershell
   ollama pull tinyllama
   ```

3. **That's it!** The application will automatically use Ollama with TinyLlama.

### Option 2: Direct GGUF Download (For llama.cpp)

1. **Download the GGUF file** from Hugging Face:
   
   Visit: https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF
   
   Or use direct download link:
   ```
   https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/blob/main/tinyllama-1.1b-chat-v1.0.Q2_K.gguf
   ```

2. **Save the file** to your `models/` directory:
   ```
   models/TinyLlama-1.1B-Chat-v1.0.Q2_K.gguf
   ```

3. **Start the server** - it will automatically detect and use TinyLlama.

## Model Comparison

| Model | Size | Speed | Quality | Best For |
|-------|------|-------|---------|----------|
| TinyLlama-1.1B Q2_K | 700 MB | ⚡⚡⚡ Very Fast | ⭐⭐⭐ Good | Short stories (<200 words) |
| Llama-2-7B Q2_K | 2.6 GB | ⚡⚡ Fast | ⭐⭐⭐⭐ Excellent | Longer stories |
| Mistral-7B Q4_K_M | 4.1 GB | ⚡ Medium | ⭐⭐⭐⭐⭐ Excellent | High quality stories |

## Testing TinyLlama

After downloading, restart your server:

```powershell
# Stop the current server (Ctrl+C)
python web_server.py
```

Look for this in the output:
```
Found model: models\TinyLlama-1.1B-Chat-v1.0.Q2_K.gguf
Loading LLM model from: models\TinyLlama-1.1B-Chat-v1.0.Q2_K.gguf
✓ LLM initialized successfully (llama.cpp)!
```

## Expected Performance

With TinyLlama, you should see:
- **Generation time**: 3-8 seconds for a 100-word story
- **Memory usage**: ~1.5 GB RAM
- **Story quality**: Creative and fun Halloween stories suitable for office parties

## Troubleshooting

### Model Not Found
If you see "No LLM backend available":
1. Check the file exists: `dir models\TinyLlama-1.1B-Chat-v1.0.Q2_K.gguf`
2. Ensure the file is complete (should be ~700 MB)
3. Restart the server
ollama pull tinyllama

### Using Ollama Instead
If you prefer Ollama:
1. Use Option 1 above to pull `tinyllama`
2. Remove or rename the GGUF file
3. The app will automatically use Ollama

### Generation Too Short
If stories are too short:
1. Adjust `max_tokens` in `prompt_config.json` (try 250-300)
2. Or use a larger model for better quality

## Recommended Settings for TinyLlama

Edit `prompt_config.json`:

```json
{
  "llm_parameters": {
    "max_tokens": 200,
    "temperature": 0.9,
    "top_p": 0.95,
    "stop": ["\n\n", "###"]
  }
}
```

Higher temperature (0.9) works well with TinyLlama for more creative output.

## Next Steps

1. Download TinyLlama using one of the options above
2. Restart your server
3. Test story generation in the web interface
4. Enjoy faster story generation! 🎃

Run Ollama pull tinyilama