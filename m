Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D59C369B9
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 23:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED2cTD/7GNry1O5X7aE1CKDFrkP7DZOuHaCW9A/h6es=; b=33BrTOoe952qeM
	vjDHpAYR51sGpykG4iTPbeQUT+qp81ZRw9YGbUKN/dEDRYWqAD3sKmKnBrXcVdBKFE8Vx3TEkrwbG
	diM9k38O96Aqvb7wijgVLFmDDyquwvEwO6INyLL6VOimZH6EgTw+z3/tAUG+1J07i48355ES+DOcy
	s6cIVihiLVqdTfuWsDp0x7t0loHLqZgtzH7dfJuZw1xk7zQs0wfEJEO8wRDq9afP/Mol/lDTEglac
	/8EyvHxG4NXhc0bxaCsOK4Y1Va7uevn1n0UzeGIAvQ0rzG1LfEPAOBBIr7edWk+w2j9zCbkh+rRqL
	qR+2U2fRF0SUisrcHuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pMp-00000007QDm-1X7w;
	Tue, 15 Apr 2025 23:06:59 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pMm-00000007QCd-2Ddr
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 23:06:57 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B2696343026;
	Tue, 15 Apr 2025 23:06:53 +0000 (UTC)
Date: Tue, 15 Apr 2025 23:06:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250415230649-GYB30943@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
 <20250412223431-GYA25375@gentoo>
 <20250415193851.GA846160-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415193851.GA846160-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_160656_597475_3F651D03 
X-CRM114-Status: GOOD (  34.83  )
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

Hi Rob,

On 14:38 Tue 15 Apr     , Rob Herring wrote:
> On Sat, Apr 12, 2025 at 10:34:31PM +0000, Yixun Lan wrote:
> > Hi Rob,
> > 
> > On 13:27 Sat 12 Apr     , Rob Herring wrote:
> > > On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > > > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > > > the driver instead of relying on bootloader or default hardware
> > > > settings to enable it.
> > > > 
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > > ---
> > > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > > > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > @@ -2,6 +2,7 @@
> > > >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > > >  
> > > >  #include <linux/bits.h>
> > > > +#include <linux/clk.h>
> > > >  #include <linux/cleanup.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/of.h>
> > > > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct device *dev = &pdev->dev;
> > > >  	struct spacemit_pinctrl *pctrl;
> > > > +	struct clk *func_clk, *bus_clk;
> > > >  	const struct spacemit_pinctrl_data *pctrl_data;
> > > >  	int ret;
> > > >  
> > > > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > > >  	if (IS_ERR(pctrl->regs))
> > > >  		return PTR_ERR(pctrl->regs);
> > > >  
> > > > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > > > +	if (IS_ERR(func_clk))
> > > > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > > > +
> > > > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > > > +	if (IS_ERR(bus_clk))
> > > > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> > > 
> > > Do you really need these to be optional? Yes, it maintains 
> > >
> > Yes, the motivation here to make it optional is maintaining the 
> > compatibility, to not break the case of using old dtb with new kernel,
> > since the serial console device (uart0) is activated now [1]
> > 
> > IIUC, from the DT perspective, it's mandatory to keep this compatibility?
> 
> It's up to the platform. It's only mandatory to understand you are 
> breaking compatibility when you do.
> 
> > 
> > In dt-binding of patch [1/2], the clocks/clock-names has been described as 
> > required property, so it's sort of mandatory from DT's view.
> > 
> > One lesson I learned is that the pinctrl dt node shouldn't be activated
> > untill all prerequisite dependencies meet.. it's ok to push the driver,
> > but should postpone the DT part..
> > 
> > > compatibility, but if this platform isn't stable, then do you really 
> > > need that?
> > > 
> > I don't get what's your meaning of "isn't stable" here, the fact won't
> > change for K1 SoC: the pinctrl controller requires two clocks
> 
> You required 1 clock and now you require 2. That's not stable. 
previously pinctrl requires no clock (no clock property populated)

> Generally, early on with platforms, their DT is not complete enough to 
> maintain compatibility. There's also likely not many users or h/w 
> availability for compatibility to be an issue. So requiring the DT to be 
> in-sync with the kernel is not a problem.
> 
Ok, then in this case, I will simply drop this _optional_ API

thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
