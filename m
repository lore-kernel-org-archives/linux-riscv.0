Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EFDC71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tA/nj0AJqUnxZUjAEY56sGGWi3aSvcwFLZxdDerBOF8=; b=YXVj0zE3Prs7Dli6D+vHHVV1/K
	z+B7YPMlDIqWH/eDg3oOx0FOLxj4EJ99SEyYGLUYwGKBT848GB86nS4pD5TytTrjrJZi4xmG2hpCf
	fNjGeTeu926F4qrIysOmCFihNj+T9uONTtVRhHzy2lkfsbN4tncGCqH5ABirJnZD0bzVBSkNYDHSy
	Sm7D/dz7iznCrIrVaizRH+zcHKnZvXOgj9eUGQ9KVvvVyt2QlUMM9gPXjOITDt339OiBOvrgQ603h
	iwLQTE+W6IyYlbb5lJRJQFhkVxWSxKlfEzXQZ5i54SXPExlrCUDvKXmM83tgY6KhtIZs1UXLIQcew
	oQJApKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNp0-0000000AW6v-1WT3;
	Wed, 11 Jun 2025 15:57:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKtl-00000009sZ7-23Zi
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:49:46 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E2E11446FC
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646182;
	bh=4X+42VVoffs25/5iRChCYikoLBRm7IkfNICMQoRWKIk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FKplQWeb9SOYbE7hBm80DiCSkAI0RQyQQtQHd4//gTt1i/4hpjHnUR94bNo1R6D+C
	 kav4AOODdxIwyozv321q4EvJa+Hxs/hqUAlJQpPxygw382TnA92fGbKqqilRq7p5Mp
	 MGHi7HRUDeHwATB65EuBh6v9eXxVcqnbbEXUphPG5Q3G6phaaqsGwXf5GMZMtbHI1o
	 am7fcJg1Kr4DZxNG7k6hIID1/llBLqOvp6LH/Yb5G1GoWJpsPEIJYqsNduRB4BQorA
	 LIgnhaT+efbY9CBrmbo+5TsQie4IhIFl2e+UM2YuWxTW1Dj+4RthIqax8GobLaWnZP
	 7Qb0IC+NSizIQ==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60f49d834d1so1159466eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646181; x=1750250981;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X+42VVoffs25/5iRChCYikoLBRm7IkfNICMQoRWKIk=;
        b=ahYkIBUHQTx80g2a83MKbtEM+XFZCTQH7poWIQCMQ4Xpjqk6wfJlxicuJhdfNsXIkw
         Y2y6z0vJM25YnPviu3CwNPgCReO221y0CUfWGlj4jtYuTIwt1PbJZ0ICDex+M/LFwkLq
         9b5ZSr6VvzUIUJruYHztVp0NaxP5lyOVMPb+7SeQvxleq+dUTqmkdyBHNoyzUowk/0mJ
         yYV/O0PhxHEqVj1IWBFlxqHrbh7lGg161zMjvbrPPo0+zucsPw5DmpPjbpMcUrejMQSF
         FnIIPYvAv1p2YlTWb2AKn3I41ia0PhqMWq+3jjAetwOEwfEqUC1YsNPlddDGlR9TgBnJ
         S5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH5/kJzRAf+DYsHfXSDxcFpgmgCed3JCj0ghrY3lRvYcZ8RFyeE5vmdeKyx2Q17G7Gi4rdvMM4A7rNZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWvD0aVGT0H9JD0/k7lepK5bco9l/mKIqamlsXwI2C66tsS6x3
	41iO/ViKA7VV/q/NOlAKVL2fSYm0UbmFnBB18RbyMrfYT+v/NULuTy79Osl83GLT1Jfdu3JhDQR
	WSG8grcHFlKuygjFl/fUky6XT+gd6P4851suikQvHQJzet2Hm9jFQs+TNxWny/5t9fBTddn+qkA
	fikxeibFl8uOWN3GIwT9qvbtE9taUT+A5y49rJ/EwxI3I2w1ZlfpnJhhNoFvQX
X-Gm-Gg: ASbGnctCXK3v1SprGP8jpMM0AR61R1sBq3k/FUUSH0GLrvrx0WYss35X3VVc6IK2APJ
	9/afWKU2xSfVoVyNHrqFtgvf5T1pB6Hk8f++oYBZo0ZcQFiO5cOisTbI57mX9Li6rG2PknA2ID5
	TxTA==
X-Received: by 2002:a4a:edcb:0:b0:610:dff3:425a with SMTP id 006d021491bc7-610efbc7f51mr1462799eaf.4.1749646180965;
        Wed, 11 Jun 2025 05:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETnV/Jqo8g+X7qbKfoR1SGR2sJ6iPrYi1YRyXoWv3BlLfy+Wd2OtnAbWemjFYU/sz+rJKQnkUu2+FD/3Rbv7Y=
X-Received: by 2002:a4a:edcb:0:b0:610:dff3:425a with SMTP id
 006d021491bc7-610efbc7f51mr1462774eaf.4.1749646180562; Wed, 11 Jun 2025
 05:49:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 05:49:39 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 05:49:39 -0700
X-Gm-Features: AX0GCFt_vM7TwvXsEQ0TdALhpQjaiAX-QFHIHk6qjQ5EwAyWOMAoe6jaIhzlNQA
Message-ID: <CAJM55Z9t5n9MCCFfwzSWqhYojZk0Hg4wEQw5Pm9T1Oyy=EaO8g@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_054945_656240_9021C612 
X-CRM114-Status: GOOD (  13.89  )
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

Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>  11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78e6677570a1add60 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>  	return 0;
>  }
>
> -static struct pinctrl_desc berlin_pctrl_desc = {
> +static const struct pinctrl_desc berlin_pctrl_desc = {
>  	.name		= "berlin-pinctrl",
>  	.pctlops	= &berlin_pinctrl_ops,
>  	.pmxops		= &berlin_pinmux_ops,
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e1333802943a4b04bc 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops = {
>  	.pin_config_group_set	= cs42l43_pin_config_group_set,
>  };
>
> -static struct pinctrl_desc cs42l43_pin_desc = {
> +static const struct pinctrl_desc cs42l43_pin_desc = {
>  	.name		= "cs42l43-pinctrl",
>  	.owner		= THIS_MODULE,
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223329f39119bc7078 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops = {
>  	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>
> -static struct pinctrl_desc airoha_pinctrl_desc = {
> +static const struct pinctrl_desc airoha_pinctrl_desc = {
>  	.name = KBUILD_MODNAME,
>  	.owner = THIS_MODULE,
>  	.pctlops = &airoha_pctlops,
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fece9c71518c89081 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops = {
>  	.pin_config_group_set	= artpec6_pconf_group_set,
>  };
>
> -static struct pinctrl_desc artpec6_desc = {
> +static const struct pinctrl_desc artpec6_desc = {
>  	.name	 = "artpec6-pinctrl",
>  	.owner	 = THIS_MODULE,
>  	.pins	 = artpec6_pins,
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
> index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0d90a28b1d363050 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops = {
>  	.set_mux = bm1880_pinmux_set_mux,
>  };
>
> -static struct pinctrl_desc bm1880_desc = {
> +static const struct pinctrl_desc bm1880_desc = {
>  	.name = "bm1880_pinctrl",
>  	.pins = bm1880_pins,
>  	.npins = ARRAY_SIZE(bm1880_pins),
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8705f1d10c74ace5 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops = {
>  	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>
> -static struct pinctrl_desc k210_pinctrl_desc = {
> +static const struct pinctrl_desc k210_pinctrl_desc = {
>  	.name = "k210-pinctrl",
>  	.pins = k210_pins,
>  	.npins = K210_NPINS,
> diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
> index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27e878a81925c18a6 100644
> --- a/drivers/pinctrl/pinctrl-lpc18xx.c
> +++ b/drivers/pinctrl/pinctrl-lpc18xx.c
> @@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops = {
>  	.dt_free_map		= pinctrl_utils_free_map,
>  };
>
> -static struct pinctrl_desc lpc18xx_scu_desc = {
> +static const struct pinctrl_desc lpc18xx_scu_desc = {
>  	.name = "lpc18xx/43xx-scu",
>  	.pins = lpc18xx_pins,
>  	.npins = ARRAY_SIZE(lpc18xx_pins),
> diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
> index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109ba31b171fd15448 100644
> --- a/drivers/pinctrl/pinctrl-mlxbf3.c
> +++ b/drivers/pinctrl/pinctrl-mlxbf3.c
> @@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops = {
>  	.gpio_request_enable = mlxbf3_gpio_request_enable,
>  };
>
> -static struct pinctrl_desc mlxbf3_pin_desc = {
> +static const struct pinctrl_desc mlxbf3_pin_desc = {
>  	.name = "pinctrl-mlxbf3",
>  	.pins = mlxbf3_pins,
>  	.npins = ARRAY_SIZE(mlxbf3_pins),
> diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
> index 4edb20e619510b2f52c7cde41c2540328ec4e95d..129fa51d13b1e265b8145c87f19fba0e8f14f1aa 100644
> --- a/drivers/pinctrl/pinctrl-tb10x.c
> +++ b/drivers/pinctrl/pinctrl-tb10x.c
> @@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops = {
>  	.set_mux = tb10x_pctl_set_mux,
>  };
>
> -static struct pinctrl_desc tb10x_pindesc = {
> +static const struct pinctrl_desc tb10x_pindesc = {
>  	.name = "TB10x",
>  	.pins = tb10x_pins,
>  	.npins = ARRAY_SIZE(tb10x_pins),
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
> index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb841ea7f63e74989 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops = {
>  	.pin_config_group_set = zynq_pinconf_group_set,
>  };
>
> -static struct pinctrl_desc zynq_desc = {
> +static const struct pinctrl_desc zynq_desc = {
>  	.name = "zynq_pinctrl",
>  	.pins = zynq_pins,
>  	.npins = ARRAY_SIZE(zynq_pins),
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
>  	.is_generic = true,
>  };
>
> -static struct pinctrl_desc starfive_desc = {
> +static const struct pinctrl_desc starfive_desc = {
>  	.name = DRIVER_NAME,
>  	.pins = starfive_pins,
>  	.npins = ARRAY_SIZE(starfive_pins),
>
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
