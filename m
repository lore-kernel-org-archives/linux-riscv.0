From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 24 Aug 2018 10:18:51 -0700
Subject: macb: probe of 10090000.ethernet failed with error -110
Message-ID: <6fc2e90f-cddb-3772-5b4e-f2e2c3466537@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,
I am not able to connect to the network on HiFiveUnleashed board (4/5 
times) because of the following error. I believe the error is due to 
device Microsemi VSC8541 which is enabled CONFIG_MICROSEMI_PHY.

----------------------------------------------------------------------
macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not 
attach to PHY
macb: probe of 10090000.ethernet failed with error -110
----------------------------------------------------------------------

I have all the sifive specific drivers built on top of 4.17. It works 
sometimes. My initial debugging points to following code path.

macb_probe->phy_connect_direct->phy_attach_direct->phy_init_hw()->
genphy_soft_reset()->phy_poll_reset

phy_poll_reset tries to do reset PHY by clearing the BMCR_RESET.

int phy_init_hw(struct phy_device *phydev)
{
         int ret = 0;

         /* Deassert the reset signal */
         phy_device_reset(phydev, 0);

         if (!phydev->drv || !phydev->drv->config_init)
                 return 0;

         if (phydev->drv->soft_reset)
                 ret = phydev->drv->soft_reset(phydev);
         else
                 ret = genphy_soft_reset(phydev);

    ...
}

static int phy_poll_reset(struct phy_device *phydev)
{
         /* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
         unsigned int retries = 12;
         int ret;

         dump_stack();
         do {
                 msleep(50);
                 ret = phy_read(phydev, MII_BMCR);
                 if (ret < 0)
                         return ret;
         } while (ret & BMCR_RESET && --retries);
         if (ret & BMCR_RESET)
                 return -ETIMEDOUT;

         /* Some chips (smsc911x) may still need up to another 1ms after the
          * BMCR_RESET bit is cleared before they are usable.
          */
         msleep(1);
         return 0;
}

It looks like genphy_soft_reset()->phy_poll_reset() timesout after 
trying out 0.6 seconds returning -ETIMEDOUT. I have tried to increase 
the timeout to 20 seconds. Still same timeout happens. I have verified 
the driver is getting registered.

[    5.960025] libphy: Microsemi VSC8541 SyncE: Registered new driver
[    6.455635] libphy: phy_init_hw: In phydev->drv name =[Microsemi 
VSC8541 SyncE]

Has anybody seen this error earlier or know what can be possible reason 
for the timeout?


Regards,
Atish
