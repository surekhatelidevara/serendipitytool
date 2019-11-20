using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImagesForSubMenu
/// </summary>
/// 
namespace EntityManager
{
    public class ImagesForSubMenu
    {
        public int SubMenuImageId { get; set; }
        public string Image { get; set; }
        public int MainMenuID { get; set; }
        public int SubMenuID { get; set; }
    }
}