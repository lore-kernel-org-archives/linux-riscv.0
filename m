Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF7C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k/uRMBjrFOfxA5YH900CR4guyPfVeTvU4XiMSjGaG08=; b=xo/CozsCd0BQpeZg2jxo7QJLP2
	4mU/1CfEbLrYQ3Y/HhsIX2nXYRJRGM9WxNW1lDXW80yf+a6/qS8RIKAcbDeYb0ojsF5DM8h2sOhwd
	t1VX7HPjd8o5sCuHj2RDj846IeM0psuhFtCb69XezxJCujyxannQWHyR7RxOMhYEfzKupPw0m1gJF
	Ee9YemdEVOasVm9yTWILtXa/r3d6YhSCwevnfHawvQnmlp9WBrM20Fwf86lxGmU7oprB3pTDVe3ZO
	YSQQ6ovnfArZB0APBqGX7ReLRweAKO7rHWWO6Ylz20eegmVeZKRuKq/i42CamWy7QdVbVAm3hBg52
	bPhPuRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2A3e-00000009gUj-2Ou8;
	Wed, 01 May 2024 13:31:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2A3b-00000009gR7-0K8l
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 13:31:36 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 39F913FE61
	for <linux-riscv@lists.infradead.org>; Wed,  1 May 2024 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714570286;
	bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kLpEhbsQKAmOM+/lYM/nwywFP/vMXIwxqs0SFQAbHFU7voZX/HFHGmjAjtCetat+y
	 2fYQVui7XZZXnLqX6SwmPlD1PyChoxtAzGFwCMRS7Zto7wScUeU3jL97+ui1l+ALFS
	 +vOp4qJwbW0uYF+PNgu5kuh6VPP6bKyaynCbu+Scg/t5QDTl1vF/IcOwg+Dn3zjjMf
	 +pBCb6Tfstv5DwwKW9Eeegu8ZfVdQJ10Q3dBSDr0mSUPPoNqdCv0923lmaE/ZOfx+j
	 kyQDRVS26AvYK8E4SR5/kKjzhWpH9RPwqmnZvDTpA2TtA8JGJvGFC6+j5x6WJMKd+Z
	 q4juy9FhFo5wQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5907df2d8dso68788366b.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 06:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570279; x=1715175079;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
        b=v29w2WKptRJfOHya0U1sjizml7YXvZ+L6qAeOKedoqcbZVZ7oW8T7Q0Hn75O5EhBgx
         XzMPWmT7bIoYP8JptsJ7Q1mE9rcEeV9NHD7pX9KVwhxTVWQHR+P9OvWMpa2YfgaQMifT
         J6NVjeUsUsufGJbH7Nj4piHBLVjmoisEnrj8qH+j8AM6nJUvd3haAoPs8L94DsfANl5T
         DZt+N5BnDx0qIt039G56rVq8d+h1b5SJqMulkBK9FWAvROdpZx7ZBqeW6GwBm5R3wC34
         oAh/b6FC8FJwWwW0YDGQ0WYff0iOnP6GDjmft+ZHmhql0GAbT4Ku95TvJYbjHCjpp1HF
         g8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGmcoYTC6umC4y6juZQT+Ym7LpDU9WFdchLaaFvTcQt07JE0OO8z7ECFLAkNmkEA79K7Cs2rvvk7HlOXqT3v4FTTrP6cVV0TMLPFH86ws8
X-Gm-Message-State: AOJu0YztshCwakez6MEjoZoPti3NPb0PGcsujIhu7Q+9xTQOR4rzO40x
	zGmEf7htb4wAZVZNZEKLaf7QizFCWi1sZhqM2lomWkTJo9ZZI5HdN3wVdeniVEPcZM0SeSSEPrq
	D24waxcjn8bohgtUX+SBMz9/uXco7AJuQPA5Da+ZB7zRLU7Agu84ObVxg2wfyXuF+xruZczDweT
	JDUgpypduBQ9B55euQETdAjPkd4HVXQMGqE88TV5kn0V7pL3xVpgooPWs9
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id x14-20020a2ea7ce000000b002df8ce696cbmr955458ljp.8.1714570258120;
        Wed, 01 May 2024 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYT+qTSOE1Kr9KmhXevsjrdrGfobx9Pel64hRtY96pMsR8tg00NtEJfiVi5E4mSMS1jyTIKo1grrZjSHhuefw=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955417ljp.8.1714570257684; Wed, 01 May
 2024 06:30:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 08:30:56 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com> <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
Mime-Version: 1.0
Date: Wed, 1 May 2024 08:30:56 -0500
Message-ID: <CAJM55Z9RuobAMR4EaevhTPRsJe3vuruV7-_DTQYpH_w8_azkcA@mail.gmail.com>
Subject: Re: [PATCH 05/21] pinctrl: starfive: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_063135_422919_C6E78A26 
X-CRM114-Status: GOOD (  18.86  )
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

Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 6df7a310c7ed..27f99183d994 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
>  	struct device *dev = sfp->gc.parent;
> -	struct device_node *child;
>  	struct pinctrl_map *map;
>  	const char **pgnames;
>  	const char *grpname;
> @@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  	nmaps = 0;
>  	ngroups = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npinmux = of_property_count_u32_elems(child, "pinmux");
>  		int npins   = of_property_count_u32_elems(child, "pins");
>
>  		if (npinmux > 0 && npins > 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  		if (npinmux == 0 && npins == 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>
> @@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins;
>  		int i;
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  			if (ret)
> -				goto put_child;
> +				goto free_map;
>
>  			for (i = 0; i < npins; i++) {
>  				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
> @@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = NULL;
> @@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  				ret = of_property_read_u32_index(child, "pins", i, &v);
>  				if (ret)
> -					goto put_child;
> +					goto free_map;
>  				pins[i] = v;
>  			}
>  		} else {
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9609eb1ecc3d..4ce080caa233 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins = of_property_count_u32_elems(child, "pinmux");
>  		int *pins;
>  		u32 *pinmux;
> @@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
>  				np, child);
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  		if (ret)
> -			goto put_child;
> +			goto free_map;
>
>  		for (i = 0; i < npins; i++)
>  			pins[i] = jh7110_pinmux_pin(pinmux[i]);
> @@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  						pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
>
> --
> 2.37.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
