From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 28 Nov 2018 10:15:28 -0800
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <mvmefb5fr6d.fsf@suse.de>
References: <mvmefb5fr6d.fsf@suse.de>
Message-ID: <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/28/18 2:11 AM, Andreas Schwab wrote:
> The PHY probing of the macb driver appears to be rather unreliable.
> Most of the time it doesn't work the first time, I have to reload the
> module several times to let it succeed.
> 
> [   40.530000] macb: GEM doesn't support hardware ptp.
> [   40.530000] libphy: MACB_mii_bus: probed
> [   41.450000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
> [   41.510000] macb: probe of 10090000.ethernet failed with error -110
> [ 1354.400000] macb: GEM doesn't support hardware ptp.
> [ 1354.410000] libphy: MACB_mii_bus: probed
> [ 1355.260000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
> [ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
> [ 1358.100000] macb: GEM doesn't support hardware ptp.
> [ 1358.110000] libphy: MACB_mii_bus: probed
> [ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
> [ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 12 (70:b3:d5:92:f1:07)
> 
> This is 4.20-rc4 on a HiFive-U.
> 
> Andreas.
> 

Here is my previous analysis on the issue.
http://lists.infradead.org/pipermail/linux-riscv/2018-September/001503.html

Not sure if you have tried the hack already. But here it is anyways.
https://github.com/atishp04/riscv-linux/commit/aa230e7dc2ab01db5b630f427e57297ffc25c884


Regards,
Atish
