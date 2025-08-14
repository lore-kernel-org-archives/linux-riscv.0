Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C1CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 04:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/GInXFI3s/XGcV2ZFWvUUQU5jhrRuj1XVRTe1MfOrs=; b=Dq+uvnsWoyFvMM
	+prhJ5CeisYszWekbPTjhO6SIRSHzdi3ijkyyCD3PAXwbhS9vfY1HmAOgLNqbUt2uQ2mKfPZTJKZz
	lifeCuyHuChPFakT5fBumdj0LoOrZY/039AtE2RR0cpPOBigjauJZhYaZJyy/0rI+opyKjeTMpCy2
	at3ypvg6vhQkGrTnqQ1xYXHP1IEj8pRrjQxT3LJmNzztU/kLpya/IyL3zogO24ewtP/wy5OWWxFhs
	Dtj3+DhlJJ40LtgKgCNdoZUL3fAJ4z6dP8fok01pG6U5O+jqlMTfe8sveZXt54XjWGcAKt4chuzGS
	ue0Jb3CQ0yFWcedkRudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPiU-0000000FlKm-1Ewz;
	Thu, 14 Aug 2025 04:37:30 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPgr-0000000FlDG-2YcQ
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 04:35:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b471754c159so256200a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 21:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1755146148; x=1755750948; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W68wJmIpwZKYrhZj9rQMZlkUfiQu51PmIXBdt9PMw2k=;
        b=lsn49Jpw46zq2gdRIgWxfUddCxgXKIH6McKyTAsqgcIfooyDGfFhQx76CeMzlEhhGL
         l9mqiTfPXf5zpmX0eWizhMtF5s5kh/YT6vSdcoqxHA0Q9L0Y/3FzwwzWe5PjxMirCovL
         FwEAZEQJqU8410wE7rlziI18bK+6CXrEifJF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755146148; x=1755750948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W68wJmIpwZKYrhZj9rQMZlkUfiQu51PmIXBdt9PMw2k=;
        b=D97zgFsVBkIa5NdbyAuVwWkOVyc0wtfCnOZ/8l3oE6vThauYYm2taJa6A3iXWCg3Jq
         jZFsB7cJZyKM+pHdfmwkLxINoy9MAjSARmVW7VpnKiBBbr1RhSC/Z50ljRLAmgnP+fBc
         gecoebsemZfK65mGp8itYFwyL2dL29hrFOlasTtm4GoaAnoAAQR6xz0rzi7H3gEnRnnM
         BAw9IVVFKCICBTTl1NgZLolQjRFej/QV0/Ce8Kb6em3c1HZ9Uufn3nIE57Yvbac+xHnn
         Uco+gTyHRNW+gsgY8oRZWyqfZTgMsHM1lPhjB3az7zGteW4HbvFQNwYcn7eCmervlrZt
         bF+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwxiFgJgdN9/6vgj2VeS+vb4ayFLKHNw4wr1WTfsS+owizB+2Fw3GKnSmItPbcfiu/4dU8vA8rV1VJNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy48gQi4Fjg8BuhtBVzMSx4UURybPuJ3oiWc6VS9GpkAmal7qGN
	DpaOk/71gd//1TUBpGfW1NitpIw3m7PyGlU7zetdvJN7B25RTtmXGrYKi8EN+fleTCVOm0H4ylY
	EgQBgi10X6zhjb/Uu3c+eGvu7o3BsZz0gHlolwQEinQ==
X-Gm-Gg: ASbGncuOyVWXOFRrQW503iDhrEzScma6QUSkKtuWTe/T7ghpndZ3CtBQjLY6dxdVe/S
	qv3bq2kz0DXEunLa0hOo7gVIizVIspbO0Q3njNTQ9vguxEnIyB91bA876PklA+ansdtiaZ0yazQ
	TWQYKsuON4OBHT/QcyHh9Z2VVKCdckmdiMMOVRTOqOXIGmFhjlf5por2fr/GXXHRXmtdvYZA+iT
	sbNuP6g6eQ6
X-Google-Smtp-Source: AGHT+IFjwIWeQGe9GR6r4b2M90JJvm8sY4wwHgdbP9dAwNnEibxW+RtNYUEdWU1EXNpbiBYlhjSbLxcOxiikHu61EP4=
X-Received: by 2002:a17:90b:58e7:b0:31f:6682:bd28 with SMTP id
 98e67ed59e1d1-32327a52880mr2616043a91.16.1755146147789; Wed, 13 Aug 2025
 21:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-84-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-84-b3bf97b038dc@redhat.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 14 Aug 2025 13:35:36 +0900
X-Gm-Features: Ac12FXxr3rvVXpJVntmlzZatJLppeB52b6KjThcDVumW6l6FaIvxvyr3Ex-UBYM
Message-ID: <CAFr9PXn=jJPKzMcTa-TJSNuNQknauEttNZg=jV3sBwkTYqxLcw@mail.gmail.com>
Subject: Re: [PATCH 084/114] clk: mstar: msc313-cpupll: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_213549_984650_E590770D 
X-CRM114-Status: GOOD (  21.44  )
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

Hi Brian,

On Tue, 12 Aug 2025 at 00:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/mstar/clk-msc313-cpupll.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mstar/clk-msc313-cpupll.c b/drivers/clk/mstar/clk-msc313-cpupll.c
> index a93e2dba09d3523199263494efd2bf6987bb4156..3e643be02fe2a79c043c1b79a5e95c869b757ba1 100644
> --- a/drivers/clk/mstar/clk-msc313-cpupll.c
> +++ b/drivers/clk/mstar/clk-msc313-cpupll.c
> @@ -140,20 +140,22 @@ static unsigned long msc313_cpupll_recalc_rate(struct clk_hw *hw, unsigned long
>                                              parent_rate);
>  }
>
> -static long msc313_cpupll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                    unsigned long *parent_rate)
> +static int msc313_cpupll_determine_rate(struct clk_hw *hw,
> +                                       struct clk_rate_request *req)
>  {
> -       u32 reg = msc313_cpupll_regforfrequecy(rate, *parent_rate);
> -       long rounded = msc313_cpupll_frequencyforreg(reg, *parent_rate);
> +       u32 reg = msc313_cpupll_regforfrequecy(req->rate, req->best_parent_rate);
> +       long rounded = msc313_cpupll_frequencyforreg(reg, req->best_parent_rate);
>
>         /*
>          * This is my poor attempt at making sure the resulting
>          * rate doesn't overshoot the requested rate.
>          */
> -       for (; rounded >= rate && reg > 0; reg--)
> -               rounded = msc313_cpupll_frequencyforreg(reg, *parent_rate);
> +       for (; rounded >= req->rate && reg > 0; reg--)
> +               rounded = msc313_cpupll_frequencyforreg(reg, req->best_parent_rate);
>
> -       return rounded;
> +       req->rate = rounded;
> +
> +       return 0;
>  }
>
>  static int msc313_cpupll_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> @@ -168,7 +170,7 @@ static int msc313_cpupll_set_rate(struct clk_hw *hw, unsigned long rate, unsigne
>
>  static const struct clk_ops msc313_cpupll_ops = {
>         .recalc_rate    = msc313_cpupll_recalc_rate,
> -       .round_rate     = msc313_cpupll_round_rate,
> +       .determine_rate = msc313_cpupll_determine_rate,
>         .set_rate       = msc313_cpupll_set_rate,
>  };
>
>
> --
> 2.50.1
>
>

Only visually inspected but seems correct.

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Thanks,

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
