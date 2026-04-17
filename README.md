# deploy_agent_Okelechi

## How to Run the Script

1. Ensure the following files are in the same directory as `setup_project.sh`:
   - `attendance_checker.py`
   - `assets.csv`
   - `config.json`
   - `reports.log`

2. Make the script executable:
   ```bash
   chmod +x setup_project.sh
   ```

3. Run the script:
   ```bash
   ./setup_project.sh
   ```

4. When prompted, enter a name for your project directory. You will also be asked whether you want to update the attendance thresholds (type `YES` or `NO`).

---

## How to Trigger the Archive Feature

Press **Ctrl+C** at any point during script execution. The script will:

1. Catch the interrupt signal
2. Archive the current project directory into a `.tar` file named `attendance_tracker_{directory}_archive`
3. Delete the incomplete project directory
