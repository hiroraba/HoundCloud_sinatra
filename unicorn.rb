@dir = File.expand_path("./")

worker_processes 2
working_directory @dir

timeout 300
listen 9292

pid "#{@dir}/tmp/pids/unicorn.pid"

stderr_path "#{@dir}/log/unicorn.strerr.log"
stdout_path "#{@dir}/log/unicorn.strout.log"
