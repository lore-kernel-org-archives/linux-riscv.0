Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C953C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npTt6KmFJjgEllInlBAm+ly/rISFcFUi2PaSHBpLI+8=; b=Bvk7GhTzDadt5K
	2pPaLOx0h/v+Hdul658jC6FTfDDaMzR5JsaZnO7O+UayG71ayJiUjOkZNJoHVXTFJ9/mROAKrgCFM
	a48JGjKHyhUcGqfnpcqsYHoO3kBDR/WEicG4x0tuv9lq5jj6tNs4dejVH0WT4oIROPdp9CHMFPkvi
	eooRNyLfrU9GxMsGkeDVB3+xmndXhzlHsjWcj0eNUAv9eUeMXQLAcg2raQuClb+KfDA+yk85dbFiA
	TGMfJRwpp8flxjhcFKrD/1rvvzq+4D8FZM/ovzIpTEikqNMtJpBZZ7OcVZs7PK0higsjFicF/3FqV
	fdekBKyr74dDATH+5MSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRPz-0000000DLX5-2vY1;
	Fri, 07 Mar 2025 06:42:47 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRPW-0000000DLTD-0Xkg
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 06:42:19 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 36B94EC59F8;
	Thu, 06 Mar 2025 22:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329737; bh=nbKRa8rE0oqcLHSVyysr2VLKNWVvbQMS6EMeJYsmQrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9ZRzaOMCEbuc8R6ZwloksUuFydWNEtGh15LwVoTqKx5tVnAODqyTmLZvdCvrOtgn
	 PxHqMFMdv5beyGG/60UuYTcwI6gQvsWMqgiOq9uOY8GiXOuQ2TMQcFosDtJjzucORy
	 kqWutUOyhmDVwNfq+yT+p+TfKnQnOo/OjdfOwh4Kxel3lnuJeNXuUVNGOUk6BvIjlP
	 X0ej5DPgAl0hb7RdH4jrSKA0/Fnk/zXR2tqoam8f1FXIIJMe3pGcaxlWErZaFNsO8+
	 fnJGP8iCVRbzpboiI7Yb5Qj4SGRZzZguYwUwqS0Jzz8H9WOh9lFdpcDZBGG+tuW5nK
	 qqH0jvuT0NaLA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vtihhhkC7FQ; Thu,  6 Mar 2025 22:42:15 -0800 (PST)
Received: from ketchup (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 9340EEC59F2;
	Thu, 06 Mar 2025 22:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329735; bh=nbKRa8rE0oqcLHSVyysr2VLKNWVvbQMS6EMeJYsmQrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjqWsuB/gYig3SZZwnOSvRfEAlxrE6c+5OAeVJrL5TzYn0O8i0v+cZBfGjV8/eRTr
	 ycReyAiGZyy42W8ajkOUMyRr2fSvFT0E5VlIufVI2iozFMPnRmEWvofyFaa1Bj786P
	 pwOHWQ/2t5WqP7hB0DPIaTusuHravbH4d8+e1IRQnlJdWX8tzH5oM24AlJyfaXqTtv
	 UQD2SwiievEOW556J+xCsRSGXKzFj3sqxHWYoeFHMU8q8HLJBKsEb9N1IlZ/Vy2llk
	 2QYWu2Fr/yU7bCPYMBuS6x0TeSlR6pT1M0dLgQaBgRfxUzQB3L/fQ/9MOyTeq7Acyl
	 suu6g6yGqL+Jg==
Date: Fri, 7 Mar 2025 06:42:02 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z8qVOssDHaVDQmLY@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <20250307005149-GYA66361@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307005149-GYA66361@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_224218_199113_2E9FF02E 
X-CRM114-Status: GOOD (  24.08  )
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

On Fri, Mar 07, 2025 at 12:51:49AM +0000, Yixun Lan wrote:
> On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   20 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   47 +
> >  drivers/clk/spacemit/ccu_ddn.c    |   80 ++
> >  drivers/clk/spacemit/ccu_ddn.h    |   48 +
> >  drivers/clk/spacemit/ccu_mix.c    |  284 +++++
> >  drivers/clk/spacemit/ccu_mix.h    |  246 +++++
> >  drivers/clk/spacemit/ccu_pll.c    |  146 +++
> >  drivers/clk/spacemit/ccu_pll.h    |   76 ++
> >  12 files changed, 2668 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> ..
> > +static int k1_ccu_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *base_regmap, *lock_regmap = NULL;
> > +	struct device *dev = &pdev->dev;
> > +	int ret;
> > +
> > +	base_regmap = device_node_to_regmap(dev->of_node);
> > +	if (IS_ERR(base_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> > +				     "failed to get regmap\n");
> > +
> > +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> ..
> > +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> > +							    "spacemit,mpmu", 0);
> > +		if (!mpmu)
> > +			return dev_err_probe(dev, -ENODEV,
> > +					     "Cannot parse MPMU region\n");
> > +
> > +		lock_regmap = device_node_to_regmap(mpmu);
> > +		of_node_put(mpmu);
> > +
> you can simplify above with syscon_regmap_lookup_by_phandle(), which
> would save a few lines
> 
> or further, just call syscon_regmap_lookup_by_compatible()? then
> won't be necessary to introduce the "spacemit,mpmu" property..
> 

These syscon_* functions differ a little from device_node_to_regmap():
they get and enable the first item in "clocks" property when
instantiating a regmap, which isn't desired for a clock controller.

> > +		if (IS_ERR(lock_regmap))
> > +			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> > +					     "failed to get lock regmap\n");
> > +	}
> > +
> > +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> > +				    of_device_get_match_data(dev));
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id of_k1_ccu_match[] = {
> > +	{
> > +		.compatible	= "spacemit,k1-pll",
> > +		.data		= k1_ccu_apbs_clks,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-syscon-mpmu",
> > +		.data		= k1_ccu_mpmu_clks,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-syscon-apbc",
> > +		.data		= k1_ccu_apbc_clks,
> > +	},
> > +	{
> > +		.compatible	= "spacemit,k1-syscon-apmu",
> > +		.data		= k1_ccu_apmu_clks,
> > +	},
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> > +
> > +static struct platform_driver k1_ccu_driver = {
> > +	.driver = {
> > +		.name		= "spacemit,k1-ccu",
> > +		.of_match_table = of_k1_ccu_match,
> > +	},
> > +	.probe	= k1_ccu_probe,
> > +};
> > +module_platform_driver(k1_ccu_driver);
> > +
> > +MODULE_DESCRIPTION("Spacemit K1 CCU driver");
> > +MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
> > +MODULE_LICENSE("GPL");
> 

...

> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
