Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE703C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cy8ELjgX/FJhVoJCTGtFR0hmGR/6a6f2aRLqc2r5s+E=; b=km3yF2E0BIpsy3
	fAHIkGIy8SHrpo1yiZCWJYhx8UCG381ivk9/oklhpjQfYOlfYcR015tegABiPZztNiJOnaMq3QNLA
	gHMG87X/bS5CBDo+UONCEal68fQg2qaxRcCEuPbS7aAGqc2E0UaJBTxHhcsMfF+bhVTtQDMdcFkJS
	J4Li81QrlnA+LY74l+FIV9twHjJ+kFuWeECZGhLE759+l/WbmTOqs8Zt19LK4lZUEnCfisi+fYQzo
	dPDnPmDFbFu/OlWjQxxoOX7wUaVVtXl40f1V2ypyn30tEa98i8jy1p6vRMmKVDVFyQKmY5pRICj3c
	UozYWQucnZk1GlPiTXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAgK-003iku-BH; Tue, 11 Oct 2022 08:32:08 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAgG-003iiL-Lf
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 08:32:06 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7A19D3F555
	for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665477121;
	bh=suNkJ2gh7pPN1oyqI64kbmW+brydF4+SF1qphpgiy1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bSWOWz1Fdk+qzsi5svD/qsR7A93zUR99Qi1bQ/oRUCAEmtk8WcUqFGeT4KQDHrFn6
	 KW5LsLrf/njIn+wKC7GEcf4/ClhnXGct+qKzzOCmI2gkOQwWAooNfhTlD63tylgzFl
	 eWXe727bxnqVaVAS9w781FWYgK1Tz5U0iFrn2crZzJiJBA8xG9lpsImbB2bmggJgbU
	 rCF5BwpbLFiq+tx5BqiODa7RVk0SW0qc/2HpQNA/TAzzuIQiGEYmORyvJoIYAay33k
	 vR7J3c2xwTMQ/AB2pYgLTUJ8lRRTg6q2v84jV3d6hVB0j+MxqG+9sDCSJt4k9YOCya
	 hiOxsgPtKnFDg==
Received: by mail-qv1-f69.google.com with SMTP id t19-20020a056214119300b004b03f58b1abso7563964qvv.17
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 01:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suNkJ2gh7pPN1oyqI64kbmW+brydF4+SF1qphpgiy1g=;
        b=yjak1W8XqpU5sFC+Fmj8QUoIHugunOFVM3S5pEdC+Lknm6Iq9k09weQMmMEK0S8iUv
         JSipK78HoAauQem7l9Lpx9uTS5hk2P4YsexAxmH7JC2u/SAIEwjn0MD4utURYk4hXh5B
         /24WLrYBs9Rwqy3dvHf21i1OutQ35ljeWfgcshfWo3miKIk5+3N0LTNtk9j0Ay5Zaz+u
         mPjEZ32xggLIdz+3fX60/1Y1FTiBsNVPTixzLMTkb6JhJoHN+Rx/BRyzKm3F5+RLu5cc
         vJdxjSm4QQzCSOfrF57aRbwGbfglzC0y6uz1KIRSKeTcN847l7LTqqLQLsZxSeHzIG5h
         mk0A==
X-Gm-Message-State: ACrzQf2DTt59Hb1/PUQ+HO4rVA9dxhZpoBCNwlwYZko0EUOtV97RZAqC
	u3k0feoy+Ndlhf9dEPEGKePxJ0tnS2XRp8V5CE66h6bxx9OxkEJWvy/fUvL0RAk+XCYgLG8bCSJ
	BA10ETwfGNDJV5uvGqiBreG9aAaZm89ovcv2r8q3bpx/Bi8rkjnItHq0jXbo+Vg==
X-Received: by 2002:a05:620a:410f:b0:6cf:c34b:3c64 with SMTP id j15-20020a05620a410f00b006cfc34b3c64mr15570267qko.52.1665477109311;
        Tue, 11 Oct 2022 01:31:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DFTDHgNX/wrj8IAoSXEmta8ySJnv0knkcfflaxkZri8xCwukQw9Ji8irmUndHqkaXm0MlF8+pHua64xb11kk=
X-Received: by 2002:a05:620a:410f:b0:6cf:c34b:3c64 with SMTP id
 j15-20020a05620a410f00b006cfc34b3c64mr15570191qko.52.1665477109055; Tue, 11
 Oct 2022 01:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-26-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-26-andriy.shevchenko@linux.intel.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 11 Oct 2022 10:31:33 +0200
Message-ID: <CAJM55Z_ApPowttZrjn_0dUs81H4FfByDfv=fbhvmHquipULANg@mail.gmail.com>
Subject: Re: [PATCH v2 25/36] pinctrl: starfive: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_013204_867682_F21DE770 
X-CRM114-Status: GOOD (  18.04  )
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

On Mon, 10 Oct 2022 at 22:26, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.

The patch is fine, but I don't see any sorting other than just adding
the headers at the appropriate place.
In any case

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 5b544fb7f3d8..6a8a9cfe8965 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -15,8 +15,10 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> +#include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
>
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
