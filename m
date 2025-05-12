Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF278C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv9Lt9V4D+tkL8Y+cAxvfLGALqrXiN3yS3HfAE2ZuL4=; b=iFGsEsax1CUSot
	oCGr6/f2qG0o5csqVrQzBsc2xaVdny8WiZPG3L6xJlMPWRM/k9DGfNPcUvN0rFZJVOgWba/SuX84X
	iybmKUFd97mhvYz7rMZmBwHndRr2DARioefEC4qQxNIOlPejSjTFIIMAwEz7HeMLzY0GGzY5pEP2K
	JfUXybVQgeHcsaT2fVk4NWJaVZiUThlbN7T3sx+0dmco5/PD2qpTuHb+yXz0s8yKP+Rgn5qZsP9RN
	zykiIQnoOyNXgIGlPihDh9/74ybYemQPGRRETcVNrp7GEDsmczwoB2RSik73Ey4xdgyWp+1i5TAjf
	eA8WmbC2EnjBj+HC02Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVl7-00000009zBj-1ivP;
	Mon, 12 May 2025 16:12:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVN4-00000009w4W-1vR0
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 15:47:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMh-0002iA-9Q; Mon, 12 May 2025 17:46:51 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMe-002OVJ-27;
	Mon, 12 May 2025 17:46:49 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMf-000IW0-01;
	Mon, 12 May 2025 17:46:49 +0200
Message-ID: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
  inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 12 May 2025 17:46:48 +0200
In-Reply-To: <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
	 <20250509112032.2980811-4-elder@riscstar.com>
	 <20250512135429-GYA517867@gentoo>
	 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084714_649984_0EBCCF90 
X-CRM114-Status: GOOD (  42.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mo, 2025-05-12 at 10:34 -0500, Alex Elder wrote:
> On 5/12/25 8:54 AM, Yixun Lan wrote:
> > On 06:20 Fri 09 May     , Alex Elder wrote:
> > > Add a new reset_name field to the spacemit_ccu_data structure.  If it is
> > > non-null, the CCU implements a reset controller, and the name will be
> > > used in the name for the auxiliary device that implements it.
> > > 
> > > Define a new type to hold an auxiliary device as well as the regmap
> > > pointer that will be needed by CCU reset controllers.  Set up code to
> > > initialize and add an auxiliary device for any CCU that implements reset
> > > functionality.
> > > 
> > > Make it optional for a CCU to implement a clock controller.  This
> > > doesn't apply to any of the existing CCUs but will for some new ones
> > > that will be added soon.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > > v8: Allocate the auxiliary device using kzalloc(), not devm_kzalloc()
> > > 
> > >   drivers/clk/spacemit/Kconfig     |  1 +
> > >   drivers/clk/spacemit/ccu-k1.c    | 90 ++++++++++++++++++++++++++++----
> > >   include/soc/spacemit/k1-syscon.h | 12 +++++
> > >   3 files changed, 93 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > index 4c4df845b3cb2..3854f6ae6d0ea 100644
> > > --- a/drivers/clk/spacemit/Kconfig
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -3,6 +3,7 @@
> > >   config SPACEMIT_CCU
> > >   	tristate "Clock support for SpacemiT SoCs"
> > >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	select AUXILIARY_BUS
> > >   	select MFD_SYSCON
> > >   	help
> > >   	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> > > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > > index 801150f4ff0f5..551df9d076859 100644
> > > --- a/drivers/clk/spacemit/ccu-k1.c
> > > +++ b/drivers/clk/spacemit/ccu-k1.c
> > > @@ -5,12 +5,14 @@
> > >    */
> > >   
> > >   #include <linux/array_size.h>
> > > +#include <linux/auxiliary_bus.h>
> > >   #include <linux/clk-provider.h>
> > >   #include <linux/delay.h>
> > >   #include <linux/mfd/syscon.h>
> > >   #include <linux/minmax.h>
> > >   #include <linux/module.h>
> > >   #include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > >   #include <soc/spacemit/k1-syscon.h>
> > >   
> > >   #include "ccu_common.h"
> > > @@ -21,6 +23,7 @@
> > >   #include <dt-bindings/clock/spacemit,k1-syscon.h>
> > >   
> > >   struct spacemit_ccu_data {
> > > +	const char *reset_name;
> > see my comment below..
> > 
> > >   	struct clk_hw **hws;
> > >   	size_t num;
> > >   };
> > > @@ -710,8 +713,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
> > >   };
> > >   
> > >   static const struct spacemit_ccu_data k1_ccu_pll_data = {
> > > -	.hws	= k1_ccu_pll_hws,
> > > -	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
> > > +	/* The PLL CCU implements no resets */
> > > +	.hws		= k1_ccu_pll_hws,
> > > +	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
> > >   };
> > >   
> > >   static struct clk_hw *k1_ccu_mpmu_hws[] = {
> > > @@ -751,8 +755,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
> > >   };
> > >   
> > >   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> > > -	.hws	= k1_ccu_mpmu_hws,
> > > -	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
> > > +	.reset_name	= "mpmu-reset",
> > > +	.hws		= k1_ccu_mpmu_hws,
> > > +	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
> > >   };
> > >   
> > >   static struct clk_hw *k1_ccu_apbc_hws[] = {
> > > @@ -859,8 +864,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
> > >   };
> > >   
> > >   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> > > -	.hws	= k1_ccu_apbc_hws,
> > > -	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
> > > +	.reset_name	= "apbc-reset",
> > > +	.hws		= k1_ccu_apbc_hws,
> > > +	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
> > >   };
> > >   
> > >   static struct clk_hw *k1_ccu_apmu_hws[] = {
> > > @@ -929,8 +935,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
> > >   };
> > >   
> > >   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> > > -	.hws	= k1_ccu_apmu_hws,
> > > -	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
> > > +	.reset_name	= "apmu-reset",
> > > +	.hws		= k1_ccu_apmu_hws,
> > > +	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
> > >   };
> > >   
> > >   static int spacemit_ccu_register(struct device *dev,
> > > @@ -941,6 +948,10 @@ static int spacemit_ccu_register(struct device *dev,
> > >   	struct clk_hw_onecell_data *clk_data;
> > >   	int i, ret;
> > >   
> > > +	/* Nothing to do if the CCU does not implement any clocks */
> > > +	if (!data->hws)
> > > +		return 0;
> > > +
> > >   	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> > >   				GFP_KERNEL);
> > >   	if (!clk_data)
> > > @@ -981,9 +992,63 @@ static int spacemit_ccu_register(struct device *dev,
> > >   	return ret;
> > >   }
> > >   
> > > +static void spacemit_cadev_release(struct device *dev)
> > why this function define as _cadev_ prefix, while below as _adev_
> > is it a typo? or c short for ccu, I just feel it isn't consistent..
> 
> It is not a typo.  Yes, it was intended to represent CCU
> Auxiliary device, while "adev" represents just Auxiliary
> Device.  It is releasing (freeing) a spacemit_ccu_adev
> structure.
> 
> > > +{
> > > +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > > +
> > > +	kfree(to_spacemit_ccu_adev(adev));
> > > +}
> > > +
> 
> This function is operating on an auxiliary_device structure,
> so "adev" is used in its name.
> 
> > > +static void spacemit_adev_unregister(void *data)
> > > +{
> > > +	struct auxiliary_device *adev = data;
> > > +
> > > +	auxiliary_device_delete(adev);
> > > +	auxiliary_device_uninit(adev);
> > > +}
> > > +
> > > +static int spacemit_ccu_reset_register(struct device *dev,
> > > +				       struct regmap *regmap,
> > > +				       const char *reset_name)
> > > +{
> > > +	struct spacemit_ccu_adev *cadev;
> > > +	struct auxiliary_device *adev;
> > > +	static u32 next_id;
> > > +	int ret;
> > > +
> > > +	/* Nothing to do if the CCU does not implement a reset controller */
> > > +	if (!reset_name)
> > > +		return 0;
> > > +
> > > +	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> > > +	if (!cadev)
> > > +		return -ENOMEM;
> > add one blank line here?
> 
> If I do a new version that's easy but this was intentional.
> 
> > > +	cadev->regmap = regmap;
> > > +
> > > +	adev = &cadev->adev;
> > > +	adev->name = reset_name;
> > > +	adev->dev.parent = dev;
> > > +	adev->dev.release = spacemit_cadev_release;
> > > +	adev->dev.of_node = dev->of_node;
> > [..]
> > > +	adev->id = next_id++;
> > so I'd assume the underlying device doesn't really care the id?
> > but with different order of registration, it will result random id for the device
> 
> These things are identified in DTS files by their index values
> defined in "spacemit,k1-syscon.h".  If there is a need for the
> assigned device ID to be consistent, I'm not aware of it.  Can
> you think of one?  I think all that matters is that they're
> unique, and this ensures that (for up to 2^32 PMICs).

If there are multiple reset controllers and the driver can be unbound,
it's trivial to provoke a collision by keeping one device bound and
unbinding/binding the second one until next_id wraps.
This could be fixed by using ida_alloc/free to manage the id.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
