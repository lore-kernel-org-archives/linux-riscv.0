From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 14 Sep 2018 17:07:07 -0700
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <6fc2e90f-cddb-3772-5b4e-f2e2c3466537@wdc.com>
References: <6fc2e90f-cddb-3772-5b4e-f2e2c3466537@wdc.com>
Message-ID: <f88db43d-f343-1ad0-87b9-07afe6082173@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 8/24/18 10:18 AM, Atish Patra wrote:
> Hi,
> I am not able to connect to the network on HiFiveUnleashed board (4/5
> times) because of the following error. I believe the error is due to
> device Microsemi VSC8541 which is enabled CONFIG_MICROSEMI_PHY.
> 
> ----------------------------------------------------------------------
> macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not
> attach to PHY
> macb: probe of 10090000.ethernet failed with error -110
> ----------------------------------------------------------------------
> 
> I have all the sifive specific drivers built on top of 4.17. It works
> sometimes. My initial debugging points to following code path.
> 
> macb_probe->phy_connect_direct->phy_attach_direct->phy_init_hw()->
> genphy_soft_reset()->phy_poll_reset
> 
> phy_poll_reset tries to do reset PHY by clearing the BMCR_RESET.
> 
> int phy_init_hw(struct phy_device *phydev)
> {
>           int ret = 0;
> 
>           /* Deassert the reset signal */
>           phy_device_reset(phydev, 0);
> 
>           if (!phydev->drv || !phydev->drv->config_init)
>                   return 0;
> 
>           if (phydev->drv->soft_reset)
>                   ret = phydev->drv->soft_reset(phydev);
>           else
>                   ret = genphy_soft_reset(phydev);
> 
>      ...
> }
> 
> static int phy_poll_reset(struct phy_device *phydev)
> {
>           /* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
>           unsigned int retries = 12;
>           int ret;
> 
>           dump_stack();
>           do {
>                   msleep(50);
>                   ret = phy_read(phydev, MII_BMCR);
>                   if (ret < 0)
>                           return ret;
>           } while (ret & BMCR_RESET && --retries);
>           if (ret & BMCR_RESET)
>                   return -ETIMEDOUT;
> 
>           /* Some chips (smsc911x) may still need up to another 1ms after the
>            * BMCR_RESET bit is cleared before they are usable.
>            */
>           msleep(1);
>           return 0;
> }
> 
> It looks like genphy_soft_reset()->phy_poll_reset() timesout after
> trying out 0.6 seconds returning -ETIMEDOUT. I have tried to increase
> the timeout to 20 seconds. Still same timeout happens. I have verified
> the driver is getting registered.
> 
> [    5.960025] libphy: Microsemi VSC8541 SyncE: Registered new driver
> [    6.455635] libphy: phy_init_hw: In phydev->drv name =[Microsemi
> VSC8541 SyncE]
> 
> Has anybody seen this error earlier or know what can be possible reason
> for the timeout?
> 
> 
> Regards,
> Atish
> 

Here is probable cause for this issue and a temporary fix.
FYI: I am no networking expert. So the following analysis and fix might 
be completely stupid and outrageous.

The HighFive Unleashed board contains Microsemi 8541 PHY.
Here is the spec: 
https://www.mouser.com/ds/2/523/Microsemi_VSC8541-01_Datasheet_10496_V40-1148034.pdf

As per the spec, the PHY needs to be reset twice. However, 4.15 kernel 
did not have support for that. Thus, FSBL code in Unleashed is hacked to 
resolve it by resetting twice in their code (Thanks to Palmer for the 
hint).

It looks like that kernel driver now supports resetting the signal one 
additional time. As it had been  already reset twice in FSBL, PHY gets 
into incorrect state causing error mentioned in the below mail.

The following simple HACK brings up networking in 4.19rc2 without any 
issues.

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 98f4b1f7..02c31f83 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -64,9 +64,6 @@ static int mdiobus_register_gpiod(struct mdio_device 
*mdiodev)

         mdiodev->reset = gpiod;

-       /* Assert the reset signal again */
-       mdio_device_reset(mdiodev, 1);

         return 0;
  }

The following upstream commit introduced the correct resetting of PHY 
devices.

commit bafbdd52
Author: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date:   Mon Dec 4 13:35:05 2017 +0100

     phylib: Add device reset GPIO support


This fix proposed here is just a hack and should not merged into 
upstream code. Ideally, the fix should be done in FSBL code. Until, we 
have that from SiFive, this hack can be used as a temporary solution for 
anybody facing the same networking problem.


Regards,
Atish
