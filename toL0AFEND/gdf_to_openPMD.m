function gdf_to_openPMD(gdfFilePath, openPMDOutputPath)
    % Check for Python version setup in MATLAB
    currentPythonEnv = pyenv('Version','./gdf_to_pmd/bin/python' );
    if isempty(currentPythonEnv.Version)
        disp('Python environment is not set up in MATLAB.');
        disp('Please follow these instructions to set up a Python 3.10 virtual environment:');
        disp('1. Open a terminal or command prompt in this directory.');
        disp('2. Run "python3.10 -m venv gdf_to_pmd" to create a virtual environment named "gdf_to_pmd".');
        disp('3. Activate the virtual environment:');
        disp('   - On Windows, run "gdf_to_pmd\Scripts\activate"');
        disp('   - On macOS/Linux, run "source gdf_to_pmd/bin/activate"');
        disp('4. Install the required Python packages by running "pip install -r requirements.txt".');
        disp('5. Link the Python executable to MATLAB using "pyenv(''Version'', ''<path-to-gdf_to_pmd-python-executable>'')".');
        disp('For example, if you are on Windows and you have created the "gdf_to_pmd" environment in the current directory, run:');
        disp('pyenv(''Version'', ''.\gdf_to_pmd\Scripts\python.exe'')');
        disp('If you are on macOS or Linux, run:');
        disp('pyenv(''Version'', ''./gdf_to_pmd/bin/python'')');
        disp('After setting up the Python environment, rerun the function.');
        return;
    end
    
    % Set the path to the Python executable
    pythonExe = pyenv('Version','./gdf_to_pmd/bin/python' );
    
    % Path to the Python conversion script
    pythonScriptPath = 'gdf_to_openPMD.py'; % Update this to the actual path
    
    % Running the Python conversion script
    command = sprintf('"%s" "%s" -gdf "%s" -openPMD_output "%s"', pythonExe, pythonScriptPath, gdfFilePath, openPMDOutputPath);
    [status, result] = system(command);
    
    % Check if the command executed successfully
    if status == 0
        disp('Conversion completed!');
    else
        disp('Conversion failed with the following message:');
        disp(result);
    end
end
