From: schwab@suse.de (Andreas Schwab)
Date: Tue, 20 Nov 2018 12:39:51 +0100
Subject: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
In-Reply-To: <20181119161204.GC2393@lunn.ch> (Andrew Lunn's message of "Mon,
 19 Nov 2018 17:12:04 +0100")
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch>
Message-ID: <mvmefbgm0zc.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:

> I still don't see why that would cause a hang.

[  996.370000] [<ffffffe0011d7324>] mutex_lock+0x22/0x2a
[  996.380000] [<ffffffe001039ba0>] mdiobus_read+0x36/0x60
[  996.380000] [<ffffffe00103b82c>] vsc85xx_config_init+0x4c/0x1e2

vsc85xx_config_init is calling mdiobus_read while holding the mdio_lock.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
