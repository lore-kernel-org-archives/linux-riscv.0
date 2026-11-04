Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE165606A32C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uIFTcKGK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sb9lqQTE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6yQgo8nerLmnPiqNxvee5pHOHDR4dKIl4TAAxAX42NY=; b=uIFTcKGKDOoAMNJhZylMtxJhUD
	HHUdHzdiKV7UAX3IC2zbWdSbTev2OXkva9ZdI/AHejLi1qXvNNb41qXIaOm4G+wDSIKaZg1NqZgRz
	dghcQUogtEC8kUylBOYp5/morpA19eXjHpZB0818qlregqx/xdYQlXAfKZS6Dm7mMhiAzHYD1lxmo
	V9efDnr7748nZD9LqHpp28rDof3m7i8YqNf02ImIJWGerUBGaR0YxZSdd+4gbzWj19qfw7GQ4jDGL
	fxqD20dqZDfJjEEQjUzisAezNzrrZFUT4ZZXy9Z9H1auCkhqMNtFGqKOkwt3r0feMFtWlZZgnNeQh
	89vQtlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOei9-00000006BE8-0e9W;
	Wed, 04 Nov 2026 17:23:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOei5-00000006BCl-07pY;
	Wed, 04 Nov 2026 17:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793813021; x=1825349021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gbqiUDxqr5yVr2qcIwH7+q0Qj3ZwEXSUQhnZ+MqKmos=;
  b=Sb9lqQTED2Lm/gsNPSLZRPZFiAqddNrcgLxM+sMpBzymyOP/mBCsNSAV
   koCfvuGJ5Dnp2+/MGD6NOGyMzaVsl9QXUw4nKnZuNB5ltRUkNNcdeELWj
   g4+BhKfEkaHQT50QlCm91XFoa494dSeKB8NquQ6PpW1eG7aNvXFKldh/h
   OyWRi+D35LeNt9Y/Di2tCns6Y3QGkCtqX+ofxPVUXv1sRTTx3Fdq1VyMM
   YxV4sHy0ZuF35hVUUM80AWAmeHUhW4GbG+AUsSAu8NDdjWDgD/LzkbvjY
   WVK0iBMHjb2hEmScxuNhXW7ZQoKnmuxrywiG2QlYEIbNwbizzbn6eIOX5
   w==;
X-CSE-ConnectionGUID: rfzP+exXQ8acTzLpj9My1Q==
X-CSE-MsgGUID: krPLbzf8RJWWh7jlCbkpFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2584725"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2584725"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:23:37 -0800
X-CSE-ConnectionGUID: ZJ4okITuTL+k/7bbeLtfXg==
X-CSE-MsgGUID: Yy2sU1htRK+8Eg46G0DWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6642051"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:23:25 -0800
Date: Wed, 4 Nov 2026 19:23:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <autqC143h7Qf1R9H@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <autj6pr_bPaul3w0@ashevche-desk.local>
 <7f96599b-681d-4963-bdda-1274371ac84f@kernel.org>
 <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_092341_108052_E9C4F662 
X-CRM114-Status: GOOD (  26.75  )
X-Spam-Score: -4.2 (----)
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

On Wed, Nov 04, 2026 at 06:08:39PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 18:02, Krzysztof Kozlowski wrote:
> > On 04/11/2026 17:57, Andy Shevchenko wrote:
> >> On Wed, Nov 04, 2026 at 10:22:45AM -0500, Frank.Li@oss.nxp.com wrote:
> >>>
> >>> Replace open-coded assignments to callback and callback_param fields
> >>> of struct dma_async_tx_descriptor with calls to the
> >>> dmaengine_desc_set_callback() helper across SPI bus drivers.
> >>>
> >>> No functional change intended. Prepare make to struct
> >>> dma_async_tx_descriptor private to the DMA engine.
> >>
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # dw, pxa2xx, topcliff-pch
> >>
> >> (Note, you forgot to add the list of the drivers to the Rb trailers of other reviewers)
> > 
> > These should be acks. RB creates false impression entire commit was
> > reviewed. Our docs also clearly state entire commit:
> > 
> > "Reviewed-by:, instead, indicates that the patch has been reviewed and
> > found acceptable according to the Reviewer's Statemen"
> > 
> > (not patch or part of patch)
> > 
> > "By offering my Reviewed-by: tag, I state that
> > I have carried out a technical review of this patch to
> > "
> > 
> > (not patch or part of patch)
> > 
> > When you accept only part of this code, you basically Ack. I really
> > dislike these half-done reviews, which later appear in logs and tell you
> > nothing. You could have clear security bug here, but 10 review tags. How
> > useful tags...
> 
> And let me even bring a better example. Imagine a patch, doing massive
> refactoring of core SPI stuff, 1000 lines of code, complex locking and
> also simultaneously updates drivers to new API changed in this core.
> 
> Reviewing that 1000 lines of code in core SPI with complex locking takes
> someone 30 minutes. He gives Rb tag, gets credit.
> 
> Now you come, look at SINGLE line in a driver and give Rb tag. For 10
> seconds job of looking at one changed call in one driver.
> 
> You just Acked, you did not review "the patch" (quoting submitting patches).

Your example is doubtful because the patch is combined from independent pieces.
The Rb fits very well the listed drivers. The problem is that some of the
people combine changes into a bundle (and not proper per-driver series).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
