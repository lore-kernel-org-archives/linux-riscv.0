Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573F4C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr9NW9gMqKZh4SO5IQuG+g6CPUtouIDwVkC8L4123W8=; b=FJGRwetdi4t04N
	1wgT9yNGhpiVUniREHEunzd4apethdfBTkn25FkuogmL/ppJori+vZdDYJbGmMxvJGFwfs4tTClSv
	gWh2PIdPZUcfku8wUy4Mo8ZauO30YUwVdHrwe1Agf5sFFu1kbblwaGPRFdSKS+UKJhBvQ+EWEHROJ
	5c3PZh2OngpLv1ssHIkLxSAT9oFgwocw5PAp8Z8sRWpvg17n2407EWDo58WEYDynb/ZeaAZsDKOs2
	AjM064v4kdJ23d64BVXlJtTq02gM15NI2h9gRyrLBwRi8PeGwUet1BnLsCEcwSSqV+gXdkHqi2Uj5
	a3Hd9GJ7nQom/qcJ6Rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m7r-00000006uwC-2Sd3;
	Tue, 15 Apr 2025 19:39:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m7S-00000006upC-3ciE
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 19:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD67CA4A5E0;
	Tue, 15 Apr 2025 19:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996C0C4CEF1;
	Tue, 15 Apr 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744745933;
	bh=+X8PZp7ZJAtaPIiDYEIFalIVsT/0lgcDfgcWZzUFk0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwXmHwmr9n+SApeHzUas+OtoRZJMrhoeh0R81kyW0D+KMv7H0dYo6A0zVAIE14s6l
	 9OioSxFrNEzCZqkR/ZPwAP8Mt7QfkHTwZXdB9+TeUcGUXgwRDHGnHg0CyH6VskKTM8
	 bCDj7haedPkBA+8xnkLnjIfr0vcYnTTdaBRXNz6RbgCJFX2bVULWtPtwJmkIVdEGxn
	 BxaHnstuq1TeVO5g3PiMSCbHCzIfMgZmxH7n4wX3SZ6F9kBOA7Kh6yk5l23wyzruAy
	 6M/5t2SIRmRgrcIU7QC0aIODXbZZEbfY75ctd2n+299mrucX5kX9JVaJdIoGd+c1be
	 wHoAGPF3Wu57g==
Date: Tue, 15 Apr 2025 14:38:51 -0500
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250415193851.GA846160-robh@kernel.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
 <20250412223431-GYA25375@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250412223431-GYA25375@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_123855_034715_4983BF21 
X-CRM114-Status: GOOD (  30.48  )
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

On Sat, Apr 12, 2025 at 10:34:31PM +0000, Yixun Lan wrote:
> Hi Rob,
> 
> On 13:27 Sat 12 Apr     , Rob Herring wrote:
> > On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > > the driver instead of relying on bootloader or default hardware
> > > settings to enable it.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > >  
> > >  #include <linux/bits.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/cleanup.h>
> > >  #include <linux/io.h>
> > >  #include <linux/of.h>
> > > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > >  {
> > >  	struct device *dev = &pdev->dev;
> > >  	struct spacemit_pinctrl *pctrl;
> > > +	struct clk *func_clk, *bus_clk;
> > >  	const struct spacemit_pinctrl_data *pctrl_data;
> > >  	int ret;
> > >  
> > > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(pctrl->regs))
> > >  		return PTR_ERR(pctrl->regs);
> > >  
> > > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > > +	if (IS_ERR(func_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > > +
> > > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > > +	if (IS_ERR(bus_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> > 
> > Do you really need these to be optional? Yes, it maintains 
> >
> Yes, the motivation here to make it optional is maintaining the 
> compatibility, to not break the case of using old dtb with new kernel,
> since the serial console device (uart0) is activated now [1]
> 
> IIUC, from the DT perspective, it's mandatory to keep this compatibility?

It's up to the platform. It's only mandatory to understand you are 
breaking compatibility when you do.

> 
> In dt-binding of patch [1/2], the clocks/clock-names has been described as 
> required property, so it's sort of mandatory from DT's view.
> 
> One lesson I learned is that the pinctrl dt node shouldn't be activated
> untill all prerequisite dependencies meet.. it's ok to push the driver,
> but should postpone the DT part..
> 
> > compatibility, but if this platform isn't stable, then do you really 
> > need that?
> > 
> I don't get what's your meaning of "isn't stable" here, the fact won't
> change for K1 SoC: the pinctrl controller requires two clocks

You required 1 clock and now you require 2. That's not stable. 
Generally, early on with platforms, their DT is not complete enough to 
maintain compatibility. There's also likely not many users or h/w 
availability for compatibility to be an issue. So requiring the DT to be 
in-sync with the kernel is not a problem.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
