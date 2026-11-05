Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B89606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=imz+t4yy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=h5ZXuuFo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NKcNwfvi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LqpfR8ISfaq40NOnGo1fGs8Gpg0LENbV2EdFg6jSUzU=; b=imz+t4yye2ar4lq3hUnkzVeLG3
	W5EQU/4r0jWt1bg/R97EUUFh9OlZwFNmxdlCopmw6uZ6BHuq8Gd8coanyBfg23S2XEtY94omF5/Sd
	4m9kOJbG/omc79sEtG9iKurvgKxVW0OZbXetRN4VlBajsftNxbHF+qQ8gR84brZ2y46GdGxjthW8f
	evoFcfUV4B1Pj51s3Ph0GOViWLHD0ZIsD6yRydKipFMHt+rRmnJ0KJYiSnFCbYiC5Ci2+XtaZXFkh
	kTsI0QjD6j7VqFMlxqialCj6Iic1sbpXqerX2VXLOqoyz5oSjUwbhtulavFUF/FKDcjjudOLC7Ci1
	Bu8MWmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtOJ-00000008Evi-3XHe;
	Thu, 05 Nov 2026 09:04:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtOH-00000008Ev0-0kmx;
	Thu, 05 Nov 2026 09:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NTpZSYuqCJ8aVO/byr8U2ibpc76743xlphGgFkLrMEk=; b=h5ZXuuFoKzZyaqUgE52C6kIIrm
	8KBP7LqbvICaFFKPZY3blwdP3h5WR51KHw54sShhlxDJSqBW5/0iydJWFtfk9Nur4Wq3bIfxk0DAJ
	UzW592bFgjWnEXHMAhCQCY5P+3RJ+NEg6GMxPwcTyikj6AasOyiPwC//s3bOUmiriEkHHNPPMBAfw
	Bjsm9dduEa1rD24OpDi7UmYDhYqg4Ef1yRSgbKDDjqIWFPuEkzsy/bzxvc9fEgmS1yuARrei7XvvI
	jzfvXufgwX4iZyuG2vWNmB/qx4dvoUHnkDiaJQfeqq+2i2ry6JjI5Nlzv6dOjYxEGLzBuupefv/zX
	uL5mEIow==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtOE-00000002jDQ-0slS;
	Thu, 05 Nov 2026 09:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869450; x=1825405450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e5Tih3iECPzUwOzRgFBLbWPwtT2A2aI6VTXhUtB9sIw=;
  b=NKcNwfvipU3szRav3Oh2L8j3rieoPyO6Ib+eFg1w6io665d6fx/UVWlw
   BxRs8bUAbY+WVNl430c9HO4P5FbqbS5/vIlKWrew0c/GGsM4JXwjUcB1Y
   Eq0xeJlCwML5fs5JoppeiBDR/pwqHEq9TsQ+eK8Eu0wypRsnebrn8kyx+
   k1fqmGO1K7U9v2BDlzawMCtAsebYgEQ8/x1K2zAeJP9kXOsrH4pfHzQt0
   1D97riD3Xuw9CWYWJsPgHyGmXzx5azuwMiKaeVpIyXLYKpJ+FBV0iBvTx
   WpS9QQC9v+iGCyY14HeAxhmWRlgaTG8KdIZKQ9XiefHohK4r4GWt80fYj
   w==;
X-CSE-ConnectionGUID: xU3qR8qBRXu+DX+/YhK+7Q==
X-CSE-MsgGUID: H+ZVxHmWT4SQdyAa9NV2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2642997"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2642997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:04:04 -0800
X-CSE-ConnectionGUID: Yp/KC++fSmu4/jDprqD36g==
X-CSE-MsgGUID: M7NuvQevTYKghPgW2RQ7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7366179"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:03:51 -0800
Date: Thu, 5 Nov 2026 11:03:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	CL Wang <cl634@andestech.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <auxGdYgJvjq9EBu6@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
 <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org>
 <auxF9RT5aljXkfh7@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auxF9RT5aljXkfh7@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_090410_477037_DBF2BA6A 
X-CRM114-Status: GOOD (  26.16  )
X-Spam-Score: -2.3 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > >> Andy,
> > >> These three lines look correct.
> > >>
> > >> LGTM:
> > >>
> > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > 
> > > As
> > > 
> > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > 
> > > Note, it's in your power to ask the author to split out what you maintain
> > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > agreement when maintainer just applies that kind of a patch)
> > 
> > The "# note" after the tag solves the problem partially, if people were
> > actually using it. Solves people looking at the Git commit and being
> > mislead by partial review applying to entire commit. Does not solve
> > credits, because Rb for three lines is not the same as for 100.
> > 
> > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > like it was for entire commit.
> > 
> > So I do repeat - if one does not want to use that syntax, then just Ack,
> > instead of creating false impression of reviewing everything.
> 
> +Konstantin, then we need to teach `b4` not to break that or convert it to
> something like
> 
>   [FirstName: reviewed only ...]
>   Reviewed-by: FirstName LastName <...>

And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
even if it was partial one.

Also Jon Corbet might share his opinion from documentation point of view.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
