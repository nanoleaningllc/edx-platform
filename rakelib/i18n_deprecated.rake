# TODO: REMOVE THE TEST TASK FROM HERE WHEN PR 3945 is merged to master
# --- Internationalization tasks

I18N_REPORT_DIR = report_dir_path('i18n')
I18N_XUNIT_REPORT = File.join(I18N_REPORT_DIR, 'nosetests.xml')

directory I18N_REPORT_DIR

namespace :i18n do

  desc "Run tests for the internationalization library"
  task :test => [:install_python_prereqs, I18N_REPORT_DIR, :clean_reports_dir] do
    pythonpath_prefix = "PYTHONPATH=#{REPO_ROOT}/i18n:$PYTHONPATH"
    test_sh("i18n", "#{pythonpath_prefix} nosetests #{REPO_ROOT}/i18n/tests --with-xunit --xunit-file=#{I18N_XUNIT_REPORT}")
  end

end

# Add i18n tests to the main test command
task :test => :'i18n:test'

# Internationalization tasks deprecated to paver

require 'colorize'

def deprecated(deprecated, deprecated_by, *args)

    task deprecated do

        # Need to install paver dependencies for the commands to work!
        sh("pip install -r requirements/edx/paver.txt")

        new_cmd = deprecated_by

        puts("Task #{deprecated} has been deprecated. Use #{deprecated_by} instead.".red)
        sh(new_cmd)
        exit
    end
end

deprecated("i18n:extract", "paver i18n_extract")
deprecated("i18n:generate", "paver i18n_generate")
deprecated("i18n:generate_strict", "paver i18n_generate_strict")
deprecated("i18n:dummy", "paver i18n_dummy")
deprecated("i18n:validate:gettext", "paver i18n_validate_gettext")
deprecated("i18n:validate:transifex_config", "paver i18n_validate_transifex_config")
deprecated("i18n:transifex:push", "paver i18n_transifex_push")
deprecated("i18n:transifex:pull", "paver i18n_transifex_pull")
deprecated("i18n:robot:push", "paver i18n_robot_push")
deprecated("i18n:robot:pull", "paver i18n_robot_pull")
