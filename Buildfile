require "rubygems"
require "buildr"
require "install.rb"


# Keep this structure to allow the build system to update version numbers.
VERSION_NUMBER = "6.3.01-SNAPSHOT"

desc "Workflow Processes"
define "tempo-processes" do

  project.version = VERSION_NUMBER
  project.group = "org.intalio.tempo"

  compile.options.source = "1.5"
  compile.options.target = "1.5"

  define "xpath-extensions" do
    package :jar
  end

  define "AbsenceRequest" do
    package :jar
  end

  define "TaskManager" do
    package :jar
  end
end

define "tempo-forms" do
  project.version = VERSION_NUMBER
  project.group = "org.intalio.tempo"
  define "AbsenceRequest" do
    package(:zip).path("AbsenceRequest.pipa").include(_("src/main/pipa/*"))
    package(:zip).path("AbsenceRequest.xform").include(_("src/main/xform/*"))
  end
end