Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F90606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z0D6T/wX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S67qv0qC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Id8pYmJNbVtSeKsk5qEAymLQ7c5TWX+TJKRJEg9cb5c=; b=z0D6T/wX/uB7uNtTp3tVpWQo8+
	Ec6oVrlrKix0sy25bowLlIVWxrZr4/tngSSrVTV3AMBv2EZvmEaIDnMgRIMZxivqWM+oE0gbhs4On
	H192fWWZ8ztHcZKurx1n/lruBMsF9X/uqSJ+rwD36Yaf7M8FoQE1Fs/qgLB5CFcBiy01fpl/Dlq4Y
	s5q4ffASwWPXEG56O9zAyumlyDseRS8N6bWvh9e+w3Z4Kmw/u5vTLqDppdIy1FLzgSq+4JRu9RSfo
	twmDrCBzGRmr/cdDEVqob3UDbWEkVIfUY3d/5ArReL5gXqflxg8XpQYZXJXUpbYimpmtxCJKC+6d3
	GrAUW+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtrj-00000008K5B-0JeQ;
	Thu, 05 Nov 2026 09:34:39 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtrb-00000008K3O-3LkL;
	Thu, 05 Nov 2026 09:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793871271; x=1825407271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LUR2vLgdtbMkV4yJV6wiaAwpAfjeOibn9D0PFxVDWA=;
  b=S67qv0qCoOYpuAGWZpZ6JmmRWB62dqMRCi4Hnzt3qq1262q5oUCYgVp0
   suztEVtV+t+wIaRZUCfPz/HJUWaowRl2H8jCOIAFz4QRDMyiuX3tUhU6T
   oqudcx1twOMcmFhCK7KhoHGVvilUUdxV1i/nJ7FOYqy8bNpHceNHEZVC7
   enJbAZN3KLw8bsgaCh3dM7V0NL6ySTu1aiZ72SSeMIm3NI5yk6IIV2ype
   KfC3yBvawEQs+GIz/dUfakt06hzGu2ktTfV5L28LvSLvEyDA2ICDdB9NL
   iIOddSD/LTw0azV9aQDzjKC+qCn5oLk7BMKdoaFOD3/Ju/Qm50XQgn/qN
   g==;
X-CSE-ConnectionGUID: 9rOcAc20QiWM2YrZwBJx/w==
X-CSE-MsgGUID: QVU84vWGQ5O1oTXk+ssdhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2558367"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2558367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:34:30 -0800
X-CSE-ConnectionGUID: nlTZtjm4QSWKV5TFLHXZjw==
X-CSE-MsgGUID: 6+CUyE26TrGO0R2loVaiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6795038"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:34:19 -0800
Date: Thu, 5 Nov 2026 11:34:16 +0200
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
Message-ID: <auxNmE8yZVP-wL2e@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <autj6pr_bPaul3w0@ashevche-desk.local>
 <7f96599b-681d-4963-bdda-1274371ac84f@kernel.org>
 <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
 <autqC143h7Qf1R9H@ashevche-desk.local>
 <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
 <auuYcS7-YqJKcUbE@ashevche-desk.local>
 <63c24437-4261-4a51-be7e-31ac0759a095@kernel.org>
 <auxGom0XR-Hax9b3@ashevche-desk.local>
 <00390a20-7630-4066-9779-06c8f915a176@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00390a20-7630-4066-9779-06c8f915a176@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_013432_520331_38AE0541 
X-CRM114-Status: GOOD (  25.87  )
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

On Thu, Nov 05, 2026 at 10:07:30AM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 10:04, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 11:54:56PM +0100, Krzysztof Kozlowski wrote:
> >> On 04/11/2026 21:41, Andy Shevchenko wrote:
> >>>>
> >>>> But sure, if we want to play such numbers game, I will be sending
> >>>> reviews for single lines.
> >>>
> >>> I'm not playing anything. The problem is that the patch unites the files that
> >>> have distinct maintainers and unrelated to each other code. That's why in the
> >>> subsystems I maintain, I almost always require to split on per-driver basis.
> >>> Yes, exceptions are possible, but has to be quite rare.
> >>
> >> That's independent problem. Patch could be split, but it was not. Since
> >> it was not, receiving end should act accordingly, e.g. when performing
> >> incomplete review of only part of the patch, do not call that entire
> >> patch was reviewed by giving the Rb tag, but give Ack tag.
> > 
> > No, (partial) Rb != Ack.
> 
> It is, because there is no partial Rb tag.
> 
> There is partial review, but not partial Rb tag, please see exactly
> submitting patches. It repeats the same in three separate places:
> 
> "Acked-by.... user may not have carried out a technical review of the
> patch,yet they may be satisfied ..."
> 
> "Reviewed-by:, instead, indicates that the patch has been reviewed and
> found acceptable according to the Reviewer's Statement:"
> 
> Above important: "THE PATCH"
> 
> It is not "the patch or its parts"
> 
> Further:
> 
> "I state that:
> (a) I have carried out a technical review of *this* patch to evaluate
> its appropriateness and readiness for inclusion into  the mainline kernel."
> 
> And further:
> 
> "A Reviewed-by tag is a statement of opinion that *the patch* is an"
> 
> In three places it is THIS or THE patch. Complete (exhaustive) list of
> options what can be reviewed to get the credit and give statement of
> oversight.
> 
> Statement of oversight DOES NOT include "part of the patch".

So, it means I MUST from now on REQUIRE a split before reviewing.
Right?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
