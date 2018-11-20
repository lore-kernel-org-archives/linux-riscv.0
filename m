From: quentin.schulz@bootlin.com (Quentin Schulz)
Date: Tue, 20 Nov 2018 14:20:58 +0100
Subject: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
In-Reply-To: <mvmefbgm0zc.fsf@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmefbgm0zc.fsf@suse.de>
Message-ID: <20181120132058.l3g37jpmac7ltclt@qschulz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Andreas,

On Tue, Nov 20, 2018 at 12:39:51PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > I still don't see why that would cause a hang.
> 
> [  996.370000] [<ffffffe0011d7324>] mutex_lock+0x22/0x2a
> [  996.380000] [<ffffffe001039ba0>] mdiobus_read+0x36/0x60
> [  996.380000] [<ffffffe00103b82c>] vsc85xx_config_init+0x4c/0x1e2
> 
> vsc85xx_config_init is calling mdiobus_read while holding the mdio_lock.
> 

Thanks for reporting the bug. However, it could be nice the next time
you report a bug to give as much info as you can, such as the device
you're using. Architecture of your platform (or the board itself if it's
a DT in the Linux kernel), the MAC and the PHY IPs (the Microsemi PHY
driver now supports 6 different PHYs that do not work the same way so I
can't guess the one you're using), they all matter and help to
understand your bug. Also, if you could give a full bootlog of the
kernel and how it's possible to reproduce your issue (.config of your
kernel, on which commit on which branch you built your kernel).
Otherwise, you might not have any answer or considerably slow down the
bug identifying and fixing processes, which is annoying to you,
the users, the developers and the maintainers: a lot of upset people :)

Could you try something please? I'm pretty sure I found an issue (I
don't know if it's fixing your issue or not, but it might be).

Please replace in vsc85xx_default_config() the phy_read and phy_write by
respectively __phy_read and __phy_write (note the __ in front).

Let me know if you need help with this.

Thanks,
Quentin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181120/305099c4/attachment.sig>
