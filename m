From: f.fainelli@gmail.com (Florian Fainelli)
Date: Wed, 28 Nov 2018 13:33:47 -0800
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
References: <mvmefb5fr6d.fsf@suse.de>
 <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
Message-ID: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

+Andrew, Heiner,

On 11/28/18 10:15 AM, Atish Patra wrote:
> On 11/28/18 2:11 AM, Andreas Schwab wrote:
>> The PHY probing of the macb driver appears to be rather unreliable.
>> Most of the time it doesn't work the first time, I have to reload the
>> module several times to let it succeed.
>>
>> [?? 40.530000] macb: GEM doesn't support hardware ptp.
>> [?? 40.530000] libphy: MACB_mii_bus: probed
>> [?? 41.450000] macb 10090000.ethernet (unnamed net_device)
>> (uninitialized): Could not attach to PHY
>> [?? 41.510000] macb: probe of 10090000.ethernet failed with error -110
>> [ 1354.400000] macb: GEM doesn't support hardware ptp.
>> [ 1354.410000] libphy: MACB_mii_bus: probed
>> [ 1355.260000] macb 10090000.ethernet (unnamed net_device)
>> (uninitialized): Could not attach to PHY
>> [ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
>> [ 1358.100000] macb: GEM doesn't support hardware ptp.
>> [ 1358.110000] libphy: MACB_mii_bus: probed
>> [ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00:
>> attached PHY driver [Microsemi VSC8541 SyncE]
>> (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
>> [ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109
>> at 0x10090000 irq 12 (70:b3:d5:92:f1:07)
>>
>> This is 4.20-rc4 on a HiFive-U.
>>
>> Andreas.
>>
> 
> Here is my previous analysis on the issue.
> http://lists.infradead.org/pipermail/linux-riscv/2018-September/001503.html
> 
> Not sure if you have tried the hack already. But here it is anyways.
> https://github.com/atishp04/riscv-linux/commit/aa230e7dc2ab01db5b630f427e57297ffc25c884

Andrew and I were discussing about this and we would recommend that you
localize the workaround within the Vitesse PHY driver and within the
driver's probe function. In order to avoid a chicken and egg problem
though, you might have to change the PHY's compatible string in the
Device Tree to include its PHY OUI, e.g:

compatible = "ethernet-phy-1234.5678" which will force the OF layer
registering MDIO/PHY devices to probe to the specific driver that
matches that PHY. Let us know if this does not work, in which case we
might have to introduce another DT property that indicate a "double
reset" is required.
-- 
Florian
