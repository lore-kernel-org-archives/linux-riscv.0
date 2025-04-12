Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D77C369AB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 22:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mcVZeQsmS4Iw9O1B5ealAnfeeuNmQUjUUiO71j78Lw=; b=oG880FLkT11gvr
	St80t7gcknPaWxO0+dhKdFL5E3f/W9h25jUv044U3RPVXP2MgkcSr86otHdJ7qhAzhuhCZzPy0z+i
	SibTyWpjpfvufj30sVU+AlqitxTG/9l2Nqz4nb8Ixav1IArRsazyomZZFn0853Jh5KUMfNUSkPlvi
	vcbsGZnQyW/+MS0PZ4+fWD/BBlZtTquWrqj8VOO3Cq6DjUWT0z7hM6dmuu1XPRWn38FuzVMHCq4bh
	jKYCA/boHevgSanNDnQkDjwanr6MDl64mIm+M3E6LklBsz3vU2uXVNmylyb/wLlWNL6tcsN4bIxLf
	aDq6j5nJNZ5qEZtZPgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3jR3-0000000GWIJ-0N1c;
	Sat, 12 Apr 2025 22:34:49 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3jQz-0000000GWHq-3MUa
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 22:34:47 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 44B4A343096;
	Sat, 12 Apr 2025 22:34:41 +0000 (UTC)
Date: Sat, 12 Apr 2025 22:34:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250412223431-GYA25375@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250412182737.GA1425287-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_153445_877140_376EF584 
X-CRM114-Status: GOOD (  23.68  )
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

On 13:27 Sat 12 Apr     , Rob Herring wrote:
> On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > the driver instead of relying on bootloader or default hardware
> > settings to enable it.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> >  
> >  #include <linux/bits.h>
> > +#include <linux/clk.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct spacemit_pinctrl *pctrl;
> > +	struct clk *func_clk, *bus_clk;
> >  	const struct spacemit_pinctrl_data *pctrl_data;
> >  	int ret;
> >  
> > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pctrl->regs))
> >  		return PTR_ERR(pctrl->regs);
> >  
> > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > +	if (IS_ERR(func_clk))
> > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > +
> > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > +	if (IS_ERR(bus_clk))
> > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> 
> Do you really need these to be optional? Yes, it maintains 
>
Yes, the motivation here to make it optional is maintaining the 
compatibility, to not break the case of using old dtb with new kernel,
since the serial console device (uart0) is activated now [1]

IIUC, from the DT perspective, it's mandatory to keep this compatibility?

In dt-binding of patch [1/2], the clocks/clock-names has been described as 
required property, so it's sort of mandatory from DT's view.

One lesson I learned is that the pinctrl dt node shouldn't be activated
untill all prerequisite dependencies meet.. it's ok to push the driver,
but should postpone the DT part..

> compatibility, but if this platform isn't stable, then do you really 
> need that?
> 
I don't get what's your meaning of "isn't stable" here, the fact won't
change for K1 SoC: the pinctrl controller requires two clocks

[1] https://github.com/torvalds/linux/blob/master/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts#L22

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
