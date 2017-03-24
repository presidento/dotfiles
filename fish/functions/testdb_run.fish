function testdb_run --argument function_to_run
    if not string length -q $function_to_run
        echo "The function or folder must be specified"
        return 1
    end

    set -l original_pwd (pwd)
    cd /home/matefarkas/work/pe7-syslog-ng-project/syslog-ng-pe-testdb/
    ./zts.sh run -d 7 -p $function_to_run -a 'local localhost' --variant product=ose -D /home/matefarkas/work/syslog-ng/install --variant platform=ubuntu-xenial_amd64 --install-version=@3.8
    set -l status_code $status
    cd $original_pwd

    return $status_code
end
