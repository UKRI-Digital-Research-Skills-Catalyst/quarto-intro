# --- WORKSHOP SETUP SCRIPT (FIXED) ---

# 1. Identify necessary CRAN packages
packages_needed <- c("tidyverse", "gapminder", "knitr", "rmarkdown")

# 2. Check which are missing and install them
new_packages <- packages_needed[!(packages_needed %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  message("📦 Installing R packages...")
  install.packages(new_packages)
}

# 3. Smart TinyTeX Installer (Prevents "Y/n" loops)
# First, check if R can "see" Quarto
if (Sys.which("quarto") == "") {
  warning("❌ Error: R cannot find the 'quarto' command. Please ensure you have a recent version of RStudio.")
} else {
  
  message("------------------------------------------------")
  message("🔍 Checking TinyTeX status...")
  
  # Ask Quarto what tools it has listed using the updated command
  # We use 'tryCatch' in case the command fails entirely
  tools_info <- tryCatch(
    system("quarto tools", intern = TRUE), 
    error = function(e) character(0)
  )
  
  # Logic: Is tinytex in that list AND marked as "Up to date" or "Installed"?
  # We use regex .* to bridge the gap between the tool name and its status
  is_installed <- any(grepl("tinytex.*(Up to date|Installed)", tools_info, ignore.case = TRUE))
  
  if (is_installed) {
    message("✅ TinyTeX is already installed. Skipping download.")
  } else {
    message("⏳ TinyTeX not found. Installing now...")
    # This installs it only if it's missing
    exit_status <- system("quarto install tinytex")
    
    if (exit_status == 0) {
      message("✅ TinyTeX installed successfully.")
    } else {
      warning("⚠️ TinyTeX installation had issues. Please email research-digital-skills@york.ac.uk so we can assist. But don't worry, it just means you can't make PDFs")
    }
  }
}

# 4. Final Verification
message("------------------------------------------------")
message("Verifying installation...")

tryCatch({
  library(tidyverse)
  library(gapminder)
  
  message("✅ Tidyverse loaded")
  message("✅ Gapminder data loaded")
  
  # Final check of the tools list using the updated command
  final_check <- system("quarto tools", intern = TRUE)
  
  if (any(grepl("tinytex.*(Up to date|Installed)", final_check, ignore.case = TRUE))) {
    message("✅ TinyTeX is registered") 
    message("\n🎉 READY FOR WORKSHOP! You are good to go.")
  } else {
    message("\n⚠️ Note: TinyTeX is not showing up yet.") 
  }
  
}, error = function(e) {
  message("\n❌ SOMETHING WENT WRONG. Please email research-digital-skills@york.ac.uk so we can assist." )
  message("Error: ", e$message)
})