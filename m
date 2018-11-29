From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 28 Nov 2018 18:08:06 -0800 (PST)
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
Message-ID: <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 28 Nov 2018 13:33:47 PST (-0800), f.fainelli at gmail.com wrote:
> +Andrew, Heiner,
>
> On 11/28/18 10:15 AM, Atish Patra wrote:
>> On 11/28/18 2:11 AM, Andreas Schwab wrote:
>>> The PHY probing of the macb driver appears to be rather unreliable.
>>> Most of the time it doesn't work the first time, I have to reload the
>>> module several times to let it succeed.
>>>
>>> [?? 40.530000] macb: GEM doesn't support hardware ptp.
>>> [?? 40.530000] libphy: MACB_mii_bus: probed
>>> [?? 41.450000] macb 10090000.ethernet (unnamed net_device)
>>> (uninitialized): Could not attach to PHY
>>> [?? 41.510000] macb: probe of 10090000.ethernet failed with error -110
>>> [ 1354.400000] macb: GEM doesn't support hardware ptp.
>>> [ 1354.410000] libphy: MACB_mii_bus: probed
>>> [ 1355.260000] macb 10090000.ethernet (unnamed net_device)
>>> (uninitialized): Could not attach to PHY
>>> [ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
>>> [ 1358.100000] macb: GEM doesn't support hardware ptp.
>>> [ 1358.110000] libphy: MACB_mii_bus: probed
>>> [ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00:
>>> attached PHY driver [Microsemi VSC8541 SyncE]
>>> (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
>>> [ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109
>>> at 0x10090000 irq 12 (70:b3:d5:92:f1:07)
>>>
>>> This is 4.20-rc4 on a HiFive-U.
>>>
>>> Andreas.
>>>
>>
>> Here is my previous analysis on the issue.
>> http://lists.infradead.org/pipermail/linux-riscv/2018-September/001503.html
>>
>> Not sure if you have tried the hack already. But here it is anyways.
>> https://github.com/atishp04/riscv-linux/commit/aa230e7dc2ab01db5b630f427e57297ffc25c884
>
> Andrew and I were discussing about this and we would recommend that you
> localize the workaround within the Vitesse PHY driver and within the
> driver's probe function. In order to avoid a chicken and egg problem
> though, you might have to change the PHY's compatible string in the
> Device Tree to include its PHY OUI, e.g:
>
> compatible = "ethernet-phy-1234.5678" which will force the OF layer
> registering MDIO/PHY devices to probe to the specific driver that
> matches that PHY. Let us know if this does not work, in which case we
> might have to introduce another DT property that indicate a "double
> reset" is required.

If I understand what's going on correctly here, any instance of the VSC8541 phy 
has the unexpected feature where unmanaged mode is entered by following this 
particular reset sequence.  The specific wording from the datasheet is

    https://www.mouser.com/ds/2/523/Microsemi_VSC8541-01_Datasheet_10496_V40-1148034.pdf
    3.18.2 Unmanaged Applications
    To configure the device using unmanaged mode, perform the following steps:
    1. Apply power.
    2. Apply RefClk.
    3. Release reset, drive high. Power and clock must be high before releasing reset.
    Note: For unmanaged mode operation, the NRESET pin must have two rising 
          edges (logical 0-1-0-1 transition sequence) applied at this step.
    4. Wait 15 ms minimum.
    5. (Optional) For applications that gain register access to the device 
	using the management interface, steps 6?10 can then be performed in 
	order to modify default settings.

which is where the double reset sequence comes from.

For the HiFive Unleashed (a board with this phy) we perform this reset sequence 
in an early stage of the bootloader knows as the FSBL

    // VSC8541 PHY reset sequence; leave pull-down active for 2ms
    nsleep(2000000);
    // Set GPIO 12 (PHY NRESET) to OE=1 and OVAL=1
    atomic_fetch_or(&GPIO_REG(GPIO_OUTPUT_VAL), PHY_NRESET);
    atomic_fetch_or(&GPIO_REG(GPIO_OUTPUT_EN),  PHY_NRESET);
    nsleep(100);
    // Reset PHY again to enter unmanaged mode
    atomic_fetch_and(&GPIO_REG(GPIO_OUTPUT_VAL), ~PHY_NRESET);
    nsleep(100);
    atomic_fetch_or(&GPIO_REG(GPIO_OUTPUT_VAL), PHY_NRESET);
    nsleep(15000000);

which you can see here

    https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/main.c#L273

This is all fine as long as Linux doesn't go and reset the phy again. Until 
bafbdd527d56 ("phylib: Add device reset GPIO support") was the case.  After 
that commit I believe phylib is resetting the phy while attempting to enter 
unmanaged mode, which is now allowed in this particular chip.

Since it appears the phy is not usually described by the device tree but is 
instead discovered by probing a MII-based ID register, it seems the best place 
to put this is within the phy driver itself.  I find it's usually best to 
describe things with code, so I hacked up something like

    diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
    index 7cae17517744..8e0a71ee6bab 100644
    --- a/drivers/net/phy/mscc.c
    +++ b/drivers/net/phy/mscc.c
    @@ -1822,6 +1822,24 @@ static int vsc85xx_probe(struct phy_device *phydev)
     	return vsc85xx_dt_led_modes_get(phydev, default_mode);
     }
    
    +static int vsc8541_reset(struct phy_device *phydev, int value)
    +{
    +	WARN_ON(value != 0 || value != 1);
    +	mdio_device_reset(&phydev->mdio, value);
    +	if (value == 1) {
    +		/* The VSC8541 has an unexpected feature where a single reset
    +		 * rising edge can only be used to enter managed mode.  For
    +		 * unmanaged mode a pair of reset rising edges is necessary.
    +		 * */
    +		mdio_device_reset(&phydev_mdio, 0);
    +		mdio_device_reset(&phydev_mdio, 1);
    +
    +		/* After this pair of reset rising edges we must wait at least
    +		 * 15ms before writing any phy registers. */
    +		msleep(15);
    +	}
    +}
    +
     /* Microsemi VSC85xx PHYs */
     static struct phy_driver vsc85xx_driver[] = {
     {
    @@ -1927,6 +1945,7 @@ static struct phy_driver vsc85xx_driver[] = {
     	.get_sset_count = &vsc85xx_get_sset_count,
     	.get_strings    = &vsc85xx_get_strings,
     	.get_stats      = &vsc85xx_get_stats,
    +	.reset          = &vsc8541_reset,
     },
     {
     	.phy_id		= PHY_ID_VSC8574,
    diff --git a/include/linux/phy.h b/include/linux/phy.h
    index 3ea87f774a76..b8962ff409e8 100644
    --- a/include/linux/phy.h
    +++ b/include/linux/phy.h
    @@ -667,6 +667,10 @@ struct phy_driver {
     			    struct ethtool_tunable *tuna,
     			    const void *data);
     	int (*set_loopback)(struct phy_device *dev, bool enable);
    +
    +	/* An optional device-specific reset sequence */
    +	int (*reset)(struct phy_device *dev,
    +		     int value);
     };
     #define to_phy_driver(d) container_of(to_mdio_common_driver(d),		\
     				      struct phy_driver, mdiodrv)
    @@ -970,7 +974,10 @@ int phy_reset_after_clk_enable(struct phy_device *phydev);
    
     static inline void phy_device_reset(struct phy_device *phydev, int value)
     {
    -	mdio_device_reset(&phydev->mdio, value);
    +	if (phydev->reset)
    +		phydev->reset(phydev, value);
    +	else
    +		mdio_device_reset(&phydev->mdio, value);
     }
    
     #define phydev_err(_phydev, format, args...)	\

Note that I haven't even compiled this, and that msleep() is almost certainly 
garbage.

Am I missing something?
