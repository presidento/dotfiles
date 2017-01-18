function web_here
	set -l ip_addresses (ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | grep -v 172.)
    set -l port (math (random)"+1024")

    set_color green
    echo -n "Serving directory "
    set_color magenta
    echo -n (string trim (pwd))"/"
    set_color green
    echo " on the following addresses:"
    echo

    set_color yellow
    for ip_address in $ip_addresses
        echo -e "\thttp://"$ip_address":"$port"/"
    end
    echo

    set_color brblack
    python3 -m http.server $port
    set_color normal
end
