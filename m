Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FC606A336
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aHTzi74i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h1O/1r2s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SS4BHgrXLQKvqKyI24v4/BxkrVMgOU1vb1u0LU9jbR8=; b=aHTzi74iR+AyYu/WV4oURDC0b+
	nrTZ20+KRZ6F9PQfEkSQ4cI8uD90NX8CdcsZPGg0VseY32R6HGrQkolQZ6Z6Lmi4SzvvPE/kwMr4T
	Toy65ZPBKJgl43tXxi9rf9j8dZltwBaOVPJD3PFU+O0dHlD5H/wFvKvVp4rPEE7rTbv2CEh9bgump
	2vxN1BO4od231a4Wv/O2y0gVmxDTBz7LlA7ggEIuxQjC9Kbo1bvceH8dRSMPRVfj8tgc7ABXrMD71
	0xy4glMaRgkmBDp5cE2fE5IKKZxCY/60IJbcVFkuw4wtxE8yu0pA4L/4AMdTcUtHPoV3xr1czsXoq
	mBeERnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtP2-00000008FAW-2Wym;
	Thu, 05 Nov 2026 09:05:00 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtOs-00000008F7Q-0uHM;
	Thu, 05 Nov 2026 09:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869490; x=1825405490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LECBwyHoq/Gb/ca6fZikFPfxANCrjI25ogdvAt/TfI0=;
  b=h1O/1r2sN3gY9P/pMrrzAiNgeD9e83BGDfUBPWAhhEa6T9XJei35lKKO
   2OP/gXoIttBNTiUBSpFWQ1njFQoOm/7ASX9q8v5Piw0HP//5b+/YMHgdT
   qoh3BGLysUBWuL9CdS5LZU8+AUnm9VgP3vWtIurqN0v3vFa8WVXLU6SVI
   8HG1yti14JfGUizUNUZ/MtwYojNpEjM41jzvKzqZ6DRjN3X0s+IqmJeQn
   lh7nL/a/7FC4K6zOsr6zOfrRFmTLCpjoNlLll3BFujXewOb8YOMy+nz5I
   q0zUah24uXrBukFBlta/XCiHBuukRP6vwz9qfAx6bHqRvkt97pQCXfU4m
   w==;
X-CSE-ConnectionGUID: DsAhoNtWTeujjtGnGYtGIw==
X-CSE-MsgGUID: ueQYjjFESKW4o/KL5oTPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2523322"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2523322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:04:49 -0800
X-CSE-ConnectionGUID: iP5CMRdrQXSK1/i0FAHKxQ==
X-CSE-MsgGUID: x5ccBZCwRCiV8KzewVnjww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6789320"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:04:36 -0800
Date: Thu, 5 Nov 2026 11:04:34 +0200
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
Message-ID: <auxGom0XR-Hax9b3@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <autj6pr_bPaul3w0@ashevche-desk.local>
 <7f96599b-681d-4963-bdda-1274371ac84f@kernel.org>
 <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
 <autqC143h7Qf1R9H@ashevche-desk.local>
 <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
 <auuYcS7-YqJKcUbE@ashevche-desk.local>
 <63c24437-4261-4a51-be7e-31ac0759a095@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63c24437-4261-4a51-be7e-31ac0759a095@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_010450_552799_573E9D10 
X-CRM114-Status: GOOD (  18.30  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 11:54:56PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 21:41, Andy Shevchenko wrote:
> >>
> >> But sure, if we want to play such numbers game, I will be sending
> >> reviews for single lines.
> > 
> > I'm not playing anything. The problem is that the patch unites the files that
> > have distinct maintainers and unrelated to each other code. That's why in the
> > subsystems I maintain, I almost always require to split on per-driver basis.
> > Yes, exceptions are possible, but has to be quite rare.
> 
> That's independent problem. Patch could be split, but it was not. Since
> it was not, receiving end should act accordingly, e.g. when performing
> incomplete review of only part of the patch, do not call that entire
> patch was reviewed by giving the Rb tag, but give Ack tag.

No, (partial) Rb != Ack.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
