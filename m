Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DF606C474
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 20:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nszRW2cQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRcZ9DVE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XSgFM28WEbK83XajcNl0H4je97IY7upeK7w+b3Vbi0w=; b=nszRW2cQrFqd5hdkmwxGq9lGU8
	2vR+RIrP3u3NzUBDJWtyYeIe/T9Yg60Hv693c2yLBpoARkrZS2Kt3QYcjRiq4XTQorOjj8LWZCUk+
	kH2/gWhIhGY86Wgw94YKiP5DH56Mf8BD5/GqOjGyWAV3XnUXD3ro+KROdXAsxYwR3TCCrTiNOp2g7
	EiVhvpFhwSDLpdXzaOaeoOyNygza8QVqLWcEADssv4h4wMcZIwBZHiiuCqfd6Djt0eNPLcWJBYdjM
	lXujGELGB7rMRKHnLryPrKIvBqRB+O0L1E9kz0i/hns0Uql6woImjXc48bpV3Tzv42qZmfoS0qjJN
	ZhA08qPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhqS-00000006vwc-1tQH;
	Wed, 04 Nov 2026 20:44:32 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhqO-00000006vvk-1TCJ;
	Wed, 04 Nov 2026 20:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793825069; x=1825361069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sRT5I+m6KfQYFE3k27dO5MxaZynzJhyPdFPDxcOiE4=;
  b=NRcZ9DVEyB+z8PNUWWN1k1TwNJsHkHLB0RkIhXNi8OPPaumAbXwdBusb
   XJ0tRswIwk/HAI3U08NCdw8gSsd3fdHfsZGvIoakFFNjw3AMbhwBsxdvZ
   MF+IFI3N8G6s1cU9TZ6nu2D7Quh3Bd9w77S64rw1QFG76PE3tzcAH+cza
   JCV/7ImeaR645m5dp2GIWnI4RcctcQ0zYSIyQaI33Sl40LNLVHUHPcJ9D
   cTDOV5DlxtAWFgmxbMxz9PHoa3W0Xhp07+B1RPDbNL/WVi6i07ag3i3h7
   qw4i8gPp7H9DXoutExRukI4yyUua1UoY5hgyDVfZhouA34dOrNySljHLr
   A==;
X-CSE-ConnectionGUID: AI6L03IHQYa5AAR2AWTtuA==
X-CSE-MsgGUID: nphxaMpbSUuEiQ6lL+i8cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2635170"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2635170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:44:28 -0800
X-CSE-ConnectionGUID: EZ1+q8OlT/uYk59yq1HNAg==
X-CSE-MsgGUID: icBbDpEQTOuZLO4D8LrQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7215296"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:44:16 -0800
Date: Wed, 4 Nov 2026 22:44:13 +0200
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
Message-ID: <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_124428_421855_022CD74B 
X-CRM114-Status: GOOD (  15.02  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 06:25:32PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 16:22, Frank.Li@oss.nxp.com wrote:

...

> > diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> > index 762a3fb0fca81..de205e04a8600 100644
> > --- a/drivers/spi/atmel-quadspi.c
> > +++ b/drivers/spi/atmel-quadspi.c
> > @@ -790,8 +790,7 @@ static int atmel_qspi_dma_xfer(struct atmel_qspi *aq, struct dma_chan *chan,
> >  	}
> >  
> >  	reinit_completion(&aq->dma_completion);
> > -	tx->callback = atmel_qspi_dma_callback;
> > -	tx->callback_param = aq;
> > +	dmaengine_desc_set_callback(tx, atmel_qspi_dma_callback, NULL, aq);
> 
> Andy,
> These three lines look correct.
> 
> LGTM:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

As

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi

Note, it's in your power to ask the author to split out what you maintain
to a separate change. So, it's your choice what to do, Ack the full patch,
give a partial Rb, ask for a split, ignore reviewing (often means silent
agreement when maintainer just applies that kind of a patch)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
