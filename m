Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1EF606A333
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JNa4oTRP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K05BMYAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U7zQYCafJciRgXvwpEyqmlou0gh16RfghAPo2AlC+Tw=; b=JNa4oTRPIVFQD2de+5ZIAuE4YZ
	Ic8Bp1ohWi0mLKwUmtimmkF/7/zDpYJat5qNYUih3F1Yk4z5uRYWsS6/Fj/9clmeEZ3ku42UVZnNH
	Askzvz2ma7UVPBjiTuk29lNeSXB5uQaVdnPnHIQD8kEEU4/t42RW9R5RmTAgPEDU/F/jqizydEVmb
	USe7a3Ia5EW4tLUc9ouKwZsu0jOXS11I9n8MHt4fvZzpzD91LeeEPjUgeOnelEO8r3xgbrbxhHzkL
	dkhY750SX5BVmcdXiQAV7hNsi21V+Tv3VueChyOYZNS595x5iZQgJ5Nf0dvJ89jsLiKMEvgcV4Dpw
	w1rPVgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtMB-00000008EUK-0c6x;
	Thu, 05 Nov 2026 09:02:03 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtM5-00000008ETT-46Fl;
	Thu, 05 Nov 2026 09:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869318; x=1825405318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsF2OB4+TAKcLaK6X2CbxWBe2H+bJw89o7MCcGnPEhE=;
  b=K05BMYAelbS+royW6O0fgHM0T4Hm1XspALWWC/JhSgga9wNnrcXpgKmv
   0kBZKhoQCe1S+5PZ5c67a6MuyFCi4LejhGvoflxiyObHsQjtDnQX7Gg5J
   D6PSwol4RmwE7SrTpycOuOMbSYNTgKUN9HXKogez8K2dLyizifdgvwHCR
   GOx1vHuKZUV3nJjM/GDO8f7u3MzepTe+7LXDGAB/twAjAhk6bHPYM3Lxx
   m1vFZgQBDkISJKcOdxqBlexCykvyJC0u4eNf4JjUCq1XkMST1MMmPhwvt
   EQCiZCUQMcErkmevIHADUFF6MUYZRvNpTOTS5V69rLiUxA6zQXT3MjvPS
   A==;
X-CSE-ConnectionGUID: PLPEKxIART2qn+ic+VpLdQ==
X-CSE-MsgGUID: uvvvsP24Q1ekhiHtb1GKrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2547913"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2547913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:01:56 -0800
X-CSE-ConnectionGUID: 73i/m+mbScKfalk02iBJcQ==
X-CSE-MsgGUID: 7N01rw1qQ3OIr7PEIb3JjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7121379"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:01:43 -0800
Date: Thu, 5 Nov 2026 11:01:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Konstantin Ryabitsev <mricon@kernel.org>
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
Message-ID: <auxF9RT5aljXkfh7@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
 <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_010158_088856_C821D020 
X-CRM114-Status: GOOD (  21.06  )
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

On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 21:44, Andy Shevchenko wrote:
> >> Andy,
> >> These three lines look correct.
> >>
> >> LGTM:
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > As
> > 
> >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > 
> > Note, it's in your power to ask the author to split out what you maintain
> > to a separate change. So, it's your choice what to do, Ack the full patch,
> > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > agreement when maintainer just applies that kind of a patch)
> 
> The "# note" after the tag solves the problem partially, if people were
> actually using it. Solves people looking at the Git commit and being
> mislead by partial review applying to entire commit. Does not solve
> credits, because Rb for three lines is not the same as for 100.
> 
> From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> use it even though reviewing only part. Only Wolfram, so 20% of partial
> reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> like it was for entire commit.
> 
> So I do repeat - if one does not want to use that syntax, then just Ack,
> instead of creating false impression of reviewing everything.

+Konstantin, then we need to teach `b4` not to break that or convert it to
something like

  [FirstName: reviewed only ...]
  Reviewed-by: FirstName LastName <...>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
