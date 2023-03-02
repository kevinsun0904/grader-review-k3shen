CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

if [[ $? != 0 ]]
then 
    echo "Could not clone repository"
    exit 1
else 
    echo "Finished cloning"
fi

cd student-submission
if [[ -f "ListExamples.java" ]]
then 
    echo "ListExamples.java found"
else 
    echo "ListExamples.java not found"
    exit 1
fi

cp ListExamples.java ../
cd ../

javac -cp $CPATH ListExamples.java *.java

if [[ $? != 0 ]]
then 
    echo "File not compiled"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt

if [[ $? != 0 ]]
then 
    grep "Tests run" result.txt
else
    echo "All tests passed!"
fi
