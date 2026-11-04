Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AE1606B2F8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WspGVqLG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GOfbVRuN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jmv+f5GOCGL2O/mBVAqF15u/nLbiami1yI1wxwBOrI4=; b=WspGVqLGYmdI3BxIJueyNGmX2f
	kNBijv8FXclV0XpckhvsvhlhUjNaZsnKeVd0ZRNqmqld3HLZW37+SE57zCRff9H/Aj+TgwHFUFFfp
	kYAfCxv4Fw472AcFfH/lENJOuP/ZSeCzGTtgQOYSbN68b/1tB8xN9rFiVeBCUF9xSrhqzXDlYWS/s
	VD/8mUnUhoQKCKDwa8BNxothZpKkITf7BtmW7Shkkn1e6F2lUqZcsq7o0ry3u762IXOVSEhHeHIvl
	ukxIA4pWCksC7YbU0BnVh7c/K+tu8hQ07nXWeom+tg8iYwKhtBlMggmn4stkdt2QGLgCY+SADaIDB
	LNVbEEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOho8-00000006vM9-1maC;
	Wed, 04 Nov 2026 20:42:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhnc-00000006vFT-0dM3;
	Wed, 04 Nov 2026 20:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824897; x=1825360897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qy06o8rSwtIgsUFLykqayukx7m8Y35VeFGwAllplMWQ=;
  b=GOfbVRuNbvFhJqnu4QVO0qp5PUuXriYWkWcvbcexI3JoqKv+KTjohMXI
   NX6SdGn/kgLm7FX/4qntpHlkNLWgPmpcV5tV151acOyBW6GYqvQN6M9fe
   cEe5wJif/Jb+sSqa715mefUmojt49RJs3m09d0rSOHUWXEHtjuVUUutfp
   DWTxpzkZyb3oifGcmMgZyzXZ4OqmlBrfeoTXIPmZ1b/8mBLZ+XQUEKYiJ
   bJfrfThZzhZbvuddA/fAPyzEk2cOtG8Lb8DYWm1O/pUzm1hPkzoqWACqY
   LCW0L/FeP4QZj5wMem+ojg6wRB6rhDQcgY5P5O+HjHPyssSUnSsAmsUYT
   g==;
X-CSE-ConnectionGUID: zSRitFVGRzi78DouuSj9Qw==
X-CSE-MsgGUID: XiHxIS6zToi+nduO+15EHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2634935"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2634935"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:41:36 -0800
X-CSE-ConnectionGUID: knzF51FkR/mGB1dYlMjHAg==
X-CSE-MsgGUID: PDZ5doidQvG2tEJnuVcvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7214061"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:41:23 -0800
Date: Wed, 4 Nov 2026 22:41:21 +0200
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
Message-ID: <auuYcS7-YqJKcUbE@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <autj6pr_bPaul3w0@ashevche-desk.local>
 <7f96599b-681d-4963-bdda-1274371ac84f@kernel.org>
 <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
 <autqC143h7Qf1R9H@ashevche-desk.local>
 <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_124136_344552_20E51546 
X-CRM114-Status: GOOD (  31.36  )
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

On Wed, Nov 04, 2026 at 06:27:40PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 18:23, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 06:08:39PM +0100, Krzysztof Kozlowski wrote:
> >> On 04/11/2026 18:02, Krzysztof Kozlowski wrote:
> >>> On 04/11/2026 17:57, Andy Shevchenko wrote:
> >>>> On Wed, Nov 04, 2026 at 10:22:45AM -0500, Frank.Li@oss.nxp.com wrote:
> >>>>>
> >>>>> Replace open-coded assignments to callback and callback_param fields
> >>>>> of struct dma_async_tx_descriptor with calls to the
> >>>>> dmaengine_desc_set_callback() helper across SPI bus drivers.
> >>>>>
> >>>>> No functional change intended. Prepare make to struct
> >>>>> dma_async_tx_descriptor private to the DMA engine.
> >>>>
> >>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # dw, pxa2xx, topcliff-pch
> >>>>
> >>>> (Note, you forgot to add the list of the drivers to the Rb trailers of other reviewers)
> >>>
> >>> These should be acks. RB creates false impression entire commit was
> >>> reviewed. Our docs also clearly state entire commit:
> >>>
> >>> "Reviewed-by:, instead, indicates that the patch has been reviewed and
> >>> found acceptable according to the Reviewer's Statemen"
> >>>
> >>> (not patch or part of patch)
> >>>
> >>> "By offering my Reviewed-by: tag, I state that
> >>> I have carried out a technical review of this patch to
> >>> "
> >>>
> >>> (not patch or part of patch)

Documentation doesn't cover partial reviews at all.

> >>> When you accept only part of this code, you basically Ack. I really
> >>> dislike these half-done reviews, which later appear in logs and tell you
> >>> nothing. You could have clear security bug here, but 10 review tags. How
> >>> useful tags...
> >>
> >> And let me even bring a better example. Imagine a patch, doing massive
> >> refactoring of core SPI stuff, 1000 lines of code, complex locking and
> >> also simultaneously updates drivers to new API changed in this core.
> >>
> >> Reviewing that 1000 lines of code in core SPI with complex locking takes
> >> someone 30 minutes. He gives Rb tag, gets credit.
> >>
> >> Now you come, look at SINGLE line in a driver and give Rb tag. For 10
> >> seconds job of looking at one changed call in one driver.
> >>
> >> You just Acked, you did not review "the patch" (quoting submitting patches).
> > 
> > Your example is doubtful because the patch is combined from independent pieces.
> > The Rb fits very well the listed drivers. The problem is that some of the
> > people combine changes into a bundle (and not proper per-driver series).
> 
> The example is actually real. There are many patches changing some core
> subsystem API stuff + many drivers, and they are done correct as one patch.
> 
> Looking at two lines out of 50, 100 or 1000 (here is 740!!!) is not
> reviewing "this patch". Is acking it.
> 
> All of the Rbs here are half baked, meaning they did not review "this
> patch" (quoting submitting patches document).
> 
> But sure, if we want to play such numbers game, I will be sending
> reviews for single lines.

I'm not playing anything. The problem is that the patch unites the files that
have distinct maintainers and unrelated to each other code. That's why in the
subsystems I maintain, I almost always require to split on per-driver basis.
Yes, exceptions are possible, but has to be quite rare.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
