/*
 * This file is part of arc-desktop
 * 
 * Copyright (C) 2015 Ikey Doherty <ikey@solus-project.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

const int icon_size = 32;

public class TasklistPlugin : Arc.Plugin, Peas.ExtensionBase
{
    public Arc.Applet get_panel_widget()
    {
        return new TasklistApplet();
    }
}

public class TasklistApplet : Arc.Applet
{

    Wnck.Tasklist? tlist;

    public TasklistApplet()
    {
        tlist = new Wnck.Tasklist();
        add(tlist);

        tlist.set_grouping(Wnck.TasklistGroupingType.AUTO_GROUP);
        margin_top = 2;
        margin_bottom = 2;

        show_all();
    }
}


[ModuleInit]
public void peas_register_types(TypeModule module)
{
    // boilerplate - all modules need this
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type(typeof(Arc.Plugin), typeof(TasklistPlugin));
}

/*
 * Editor modelines  -  https://www.wireshark.org/tools/modelines.html
 *
 * Local variables:
 * c-basic-offset: 4
 * tab-width: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vi: set shiftwidth=4 tabstop=4 expandtab:
 * :indentSize=4:tabSize=4:noTabs=true:
 */
