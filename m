Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A94606A33A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=knmEEg0m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4rKjlRB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V5MatF5fjVJHBI3ukKdobceQgpJ9tZZHfTYPpQAkjAg=; b=knmEEg0mzS/Zve7xJAACybFm05
	4tERb0Pk+P7bWjPDdwuSXPuQ9/+0NbmXNl5T218gTbvyUwz9qT0eByB8/5VlDHQ+pfkMt/uOvSJfx
	855XB/3pf/gTK69Katm4NIV0kdoveWSviOsPD+mWdLZNh7eB3aoV7VaQ/OVCKTZbpf1ZP5dLDLG9S
	uxRXs0btE5HvPdUdHRYaeyfxg+ZMbMjOYQKt4lIIbLqZ7iBVm0nl1suT47iR/iS6DqA1VHWH5yvfG
	u1tyqbOd5nrOUfuiCOjvxWvzn8Imue32pp8sIbpgd2mTB7mRVKUERGNyY0fDczzzFXq5fPFyrUWwd
	auI8F3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOurB-00000008TnS-2wbE;
	Thu, 05 Nov 2026 10:38:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOur8-00000008TmQ-34lT;
	Thu, 05 Nov 2026 10:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793875087; x=1825411087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eqO4A+ClsqjEqfXPQ0TFlIOZ+1UsCC9oIYRbbnK4e7s=;
  b=A4rKjlRBVFVKIEQC4EavgCR17/xSyjTrOEB2Tb84HNkL6B9y4XJRT1QM
   iUwkaAxPJL3QUyzkBOA2luwvYVxfQEtYxAZEW+GgljOK2viemRDECySII
   WP7y3aEe+2a85svsfCglP2dbIrcCrEpO3+UJsHfe9yqiygMRa6YlwWPEW
   SH/E8Be2sTsitocPTdbj6RjtMQXjuD7nznitbEIfRXlPNJPABOF93RqS8
   OPhcFvq5cMM3UjilmzE5ltY/OlPLJqNBytdS6Dli+9Pk356d8cgqYZwW5
   whsC1IhkOREAn7phf37f1DlJwQbvCLs1O+8Yiwt+HbJIKiDSNPAN1i8lB
   g==;
X-CSE-ConnectionGUID: iXuTqYgBQ0GG0jAuBhZwtA==
X-CSE-MsgGUID: qIHA4s5yTq26mhxigq7vnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2560353"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2560353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:38:06 -0800
X-CSE-ConnectionGUID: xIegnpX+Sr+k5gjNuD4pbQ==
X-CSE-MsgGUID: Wcy7neyfQa2lUKLW6Cyinw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7281977"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:37:54 -0800
Date: Thu, 5 Nov 2026 12:37:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Mark Brown <broonie@kernel.org>,
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	Frank.Li@oss.nxp.com, vkoul@kernel.org
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <auxcf206A1yMnHkX@ashevche-desk.local>
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
 <2154003.0S5aU1g85B@diego>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2154003.0S5aU1g85B@diego>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_023806_788243_056EC901 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:52:38AM +0100, Heiko St=FCbner wrote:
> Am Montag, 2. November 2026, 18:39:58 Mitteleurop=E4ische Normalzeit schr=
ieb Frank.Li@oss.nxp.com:
> > =

> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across SPI bus drivers.
> > =

> > No functional change intended. Prepare make to struct
> > dma_async_tx_descriptor private to the DMA engine.

[...]

> > diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> > index 1a81fd94b4396..f8d6cea2f3dad 100644
> > --- a/drivers/spi/spi-rockchip.c
> > +++ b/drivers/spi/spi-rockchip.c
> > @@ -475,8 +475,7 @@ static int rockchip_spi_prepare_dma(struct rockchip=
_spi *rs,
> >  		if (!rxdesc)
> >  			return -EINVAL;
> >  =

> > -		rxdesc->callback =3D rockchip_spi_dma_rxcb;
> > -		rxdesc->callback_param =3D ctlr;
> > +		dmaengine_desc_set_callback(rxdesc, rockchip_spi_dma_rxcb, NULL, ctl=
r);
> >  	}
> >  =

> >  	txdesc =3D NULL;
> > @@ -500,8 +499,7 @@ static int rockchip_spi_prepare_dma(struct rockchip=
_spi *rs,
> >  			return -EINVAL;
> >  		}
> >  =

> > -		txdesc->callback =3D rockchip_spi_dma_txcb;
> > -		txdesc->callback_param =3D ctlr;
> > +		dmaengine_desc_set_callback(txdesc, rockchip_spi_dma_txcb, NULL, ctl=
r);
> >  	}
> >  =

> >  	/* rx must be started before tx due to spi instinct */
> =

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Please, use "# subpart(s)" syntax with this tag

   Reviewed-by: Heiko Stuebner <heiko@sntech.de> # rockchip

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
