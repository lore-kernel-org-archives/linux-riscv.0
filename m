From: schwab@suse.de (Andreas Schwab)
Date: Wed, 14 Nov 2018 17:32:51 +0100
Subject: MACB in 4.20-rc2
Message-ID: <mvmwopffwlo.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It looks like the MACB driver is broken in 4.20-rc2.  I can see these
two messages:

[   38.530000] macb: GEM doesn't support hardware ptp.
[   38.540000] libphy: MACB_mii_bus: probed

but appears to be stuck without ever reaching this message:

[   38.750000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL) 

The module never finishes initializing.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
