resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

ui_page "html/index.html"

client_scripts {
    'config.lua',
	"client/*.lua",
}

server_scripts {
	"server/*.lua",
    'config.lua'
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
}