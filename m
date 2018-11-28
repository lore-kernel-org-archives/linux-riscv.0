From: schwab@suse.de (Andreas Schwab)
Date: Wed, 28 Nov 2018 11:10:50 +0100
Subject: macb: probe of 10090000.ethernet failed with error -110
Message-ID: <mvmefb5fr6d.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The PHY probing of the macb driver appears to be rather unreliable.
Most of the time it doesn't work the first time, I have to reload the
module several times to let it succeed.

[   40.530000] macb: GEM doesn't support hardware ptp.
[   40.530000] libphy: MACB_mii_bus: probed
[   41.450000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
[   41.510000] macb: probe of 10090000.ethernet failed with error -110
[ 1354.400000] macb: GEM doesn't support hardware ptp.
[ 1354.410000] libphy: MACB_mii_bus: probed
[ 1355.260000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
[ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
[ 1358.100000] macb: GEM doesn't support hardware ptp.
[ 1358.110000] libphy: MACB_mii_bus: probed
[ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
[ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 12 (70:b3:d5:92:f1:07)

This is 4.20-rc4 on a HiFive-U.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
