Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AEC606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFIlwHKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1I0x3Uw5XZiTutSwsj+4OQNVWheT1NhfgE60nTSAdTY=; b=LFIlwHKOQ0AXhHmiCySYejQe1Y
	tBMU33ynN2AYQxTVb+mcOwmTFi5K3RX9+IRjPDhDv8AjW1ye1fEJD7EjT4kvv0Min8VfuK51tb0Md
	G4o12j3jC42YgK7eoAEAXIjHWrhzMp8J6jr+5KbkxNvvBl1LloNj3IwRL4PfHnU0RBspckfhpD74l
	A+9NBq9PNsM/esZaxsrpW1TcxSGB1q1H0vxKbisJ4GHEWe6+OE0+QYDAAbOi1w7P+fgCSE2UhmyR0
	yA2SkSQrepFQs1s+L2uOpCprgw8dDp9gDwNOnFbtZ6QT2OrjuMGXaW4JfWmkpRwOplRa/QNLBjz5G
	+ZLYFtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtdu-00000008HKw-1RPN;
	Thu, 05 Nov 2026 09:20:22 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtdq-00000008HKF-2eDK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 09:20:21 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d06763335aso435751137.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 01:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870417; x=1794475217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=Czj4vq5K9urS0nnL79hwFLyB6vyBCj09q/xpGp4FwTqb/dlfKpFse9QQADd0dEna/2
         01bbVZdWaUiKs0eVnLRcq3LWVEW8FLsmwh2hkk2PCDJxta4k8rbxjNdBUfVe+kyJtUsG
         3HHnDf0e0bROKcjfbu+PVIuSvAHD6HbXeGLbBR74lIPsfQ3wanJD8qC2mVC5kllA0eoD
         V6/hH8QHaKK4HuOK4dTsJRt+s56FbpuehHro5C1B4ELvXRJsCiv4lYHBK+rknbgvngkw
         Y+qSHnp/gAUvEwX8g5BCUlvz2gWZfn9rlgat7NVZ4ys+UERma3lLuZSq/P+t1N9Fa0qp
         GuXA==
X-Forwarded-Encrypted: i=1; AKwUvBwZPeT6HmhDUurkvjXImYGEb8XaiJrJR4yS4aRHHp4DPABaY2SLBLWVa2uiWmLoCJWYOux77knlcxgrLA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9iH5CyRVE+hFlOqES+N4hQNFbVRqoVgRVQxYObyY6bU7y0OoHv
	TsFALLUxHL2SKJgjSInzFjTQ2cNb9zPCn00ZkUswE//vzZKZd2VdD272goR+YQfJg3E=
X-Gm-Gg: AYBFou2SVORP868R3AjQeRXvgb6L2ziWVwFPE+INxJTFVHItsg4NdrunpjIpkLGcCMW
	28nkKJpzJ1pm/R+E3yGpIBs2NgsIE/oiQBOQLh6GLHRG2uva7G4diKd2Prgnm9+oh1m0VrxgA46
	jwG0yBXRh1ZuJ3U8/Ju2BTD4n2M53Jgac05ZOGxJaK5li50sJKMosHR0o/5z01t7aqe1sFhn84C
	XHlPNdy6bq21JkwmlEdkt4hdSr0muc8ZrrJA+47uS8XxWRqFccbk36Q1RywPlUnrpEs80HI8Blo
	4FakIoDDD4rfWI/RUrS6ya4IUJzi6uhs543Jclle/CTjVnF/p/x2GBSF9DOR+vOT9K28hK3WV1K
	HgxiygopOeCzhfqTOWdbq+M36J9r8F/dRWmJXqrYLnELClIiKiWlfs8iAThgDR19icEPAyw5OJN
	c4m2nUKNL1wUhDsFsylW0S0Pxb2YpAdPBBk6IgyPJYu2+0/Dg0cEmzIOa7Ie4F+kyzFo4wuEUib
	Va4qwNGAGuvpo/d9V0+HY7k1aOqG4Zbzezb6gAEYwtaZyqVZrBwdbwL/0cguZxPr43XWQg9fyPY
	k/GOWT8nxzruf0bWU6nQUzZNiDldM2BuXy3bFwS0rWFvVN07dQFGh1JnMyPIhu1ZPg==
X-Received: by 2002:a67:edc3:0:b0:7d2:8cb8:dbea with SMTP id ada2fe7eead31-7d28cb8e70fmr791640137.36.1793870417029;
        Thu, 05 Nov 2026 01:20:17 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fdb4c97sm3436870137.6.2026.11.05.01.20.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:20:15 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9908c849564so441160241.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 01:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBytDmVN/rc3GLJiqx6aB/SMVSaX2CHITqrJkY+51mpzUC/MQ0Soa0uAATDf/a8TbaM9nhUlAmLIkwF9uA==@lists.infradead.org
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012018_680110_2993ECDD 
X-CRM114-Status: GOOD (  21.31  )
X-Spam-Score: -1.6 (-)
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

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
