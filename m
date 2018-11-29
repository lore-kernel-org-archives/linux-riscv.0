From: andrew@lunn.ch (Andrew Lunn)
Date: Thu, 29 Nov 2018 06:55:10 +0100
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
References: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
 <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
Message-ID: <20181129055510.GB17675@lunn.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>    diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
>    index 7cae17517744..8e0a71ee6bab 100644
>    --- a/drivers/net/phy/mscc.c
>    +++ b/drivers/net/phy/mscc.c
>    @@ -1822,6 +1822,24 @@ static int vsc85xx_probe(struct phy_device *phydev)
>     	return vsc85xx_dt_led_modes_get(phydev, default_mode);
>     }
>    +static int vsc8541_reset(struct phy_device *phydev, int value)
>    +{
>    +	WARN_ON(value != 0 || value != 1);
>    +	mdio_device_reset(&phydev->mdio, value);
>    +	if (value == 1) {
>    +		/* The VSC8541 has an unexpected feature where a single reset
>    +		 * rising edge can only be used to enter managed mode.  For
>    +		 * unmanaged mode a pair of reset rising edges is necessary.
>    +		 * */
>    +		mdio_device_reset(&phydev_mdio, 0);
>    +		mdio_device_reset(&phydev_mdio, 1);
>    +
>    +		/* After this pair of reset rising edges we must wait at least
>    +		 * 15ms before writing any phy registers. */
>    +		msleep(15);
>    +	}
>    +}
>    +
>     /* Microsemi VSC85xx PHYs */
>     static struct phy_driver vsc85xx_driver[] = {
>     {
>    @@ -1927,6 +1945,7 @@ static struct phy_driver vsc85xx_driver[] = {
>     	.get_sset_count = &vsc85xx_get_sset_count,
>     	.get_strings    = &vsc85xx_get_strings,
>     	.get_stats      = &vsc85xx_get_stats,
>    +	.reset          = &vsc8541_reset,

So if we assume you can identify the PHY using its ID registers, you
can put this reset code into the soft_reset call. That gets called
first before anything else. There is no need to add a new function to
phy_driver.

	Andrew
