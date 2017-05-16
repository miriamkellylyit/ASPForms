using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MainLibrary.Startup))]
namespace MainLibrary
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
