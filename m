Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E8CCA9ED2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHZz701AJJJILW34lYDmk+ByEykNEpIryCHetFXKAgU=; b=H/1KTmfLK04Q3R
	L42E4HHIXRC9dL68oO9CV7AnxqJpYFTSNGcq4Moj1RM7jhZI+k6/3iBy083HONSzAhqC493ASKvqO
	zJv65DyDBFxaNqIfogGegc2k8g/iwOw3E5c0TTyDt5h8hDcL+BTvWkLcox6M+Sw0M3Ox0N9zbxqXt
	HeQhPULDXS9oCwoASQ7IFU1SlUWXYxSkzlL1emmTLV4Ff2i67Voua178HRL/pyOpASUIqpYExouo9
	mgX1rXDfBXyl0o1TCpuf8s6LpWIK32/FPZzbVF0pBCQpdeE6Kvyywvz8uh3Wv1aq2Xumn1TFJ2vez
	zQfqv958FaY4WzWJWILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAU-0000000AD0m-2Qzc;
	Mon, 12 Oct 2026 10:22:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAN-0000000ACrV-0GmQ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a17baef589so13146015e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800517; x=1792405317; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EsB47GQF39v+dS1MuWRJgJ5SLdXQgr/WLtFvls6GbAY=;
        b=Mi6hiXk2U3UNQwDcAi9h0yLZ8xBd/w2jA/tpUt3NN4VRzzvrz9SNijztFLrbwe8VhO
         mQjO0LLsukM++HbrtwZtUzFA19DArOjVvP01KRwk0lD1mkMhqUjgIKqQWu2/RMqMpsgQ
         N8V45VoOe/dei2xax26osVsz3WwbwRKlb1UldAD4kmOTg1uv3Z5hrETqnvBfQ6ylY2zk
         X5tUpCqC8JO9gx7uaNPhEfNDYKftisFU5xcYWAtPE55ygBKdZT65jW65nrc8cCfrIXH+
         2AGPtDEWwn9ETPdcPtZTYsdywytV4Zw60NoZ2kDT0uzNownw+VgVP794L97Dik5KVwH5
         utWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800517; x=1792405317;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsB47GQF39v+dS1MuWRJgJ5SLdXQgr/WLtFvls6GbAY=;
        b=u6lZBJugTvgi3g92EB7LivTOgXQ5jrmSvPYJ8G5daTZnCJA4aXwcrg3mlsLmoJ5Iq+
         TUw1oxm3bdYJUjIxfCVLSvc5qAAnxNSiRBDaZWsF9nC7HgI4dI29HOHFjjQBsaiGEmM/
         FvOds9DvBnKAeWIE9LYyN/R3NOUtPv6Nkzpqn1HeFJ6B3WGSWeHmJmnIlid3X2FMOJ/y
         I29QSGs5ZfB20oOORFR+Dwe9WEpSmG1gy2BtmwiqWX69lhqxOGBWEdUuAPvC58ekyYL8
         lg6Lqpor+XGHfom9xPRQ+8c8hssuFetmGXZ44qH3jGtRvJsrZsVTPvu6SgwDlw4BjrOT
         Qc/w==
X-Forwarded-Encrypted: i=1; AKwUvBwyllwM9XdHQzK2xp/mdR+kfc4r7owqR7TpE+oTzKFQ5mX2LfMFV9j+j59+zZbuciSuVRnoctQVxDqTvQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI8kzQjbB7qbzUO8gJ2Beh+vN9d936W7cKg5I2cQT8PXenDDVnj
	oYa6u4V6LuvBLr8VIjpG8+3yos/ZjscfZF/rAZAzqKL3GktPNeN/kn5UTSrlxEudPvc=
X-Gm-Gg: AYBFou0J//BmRKeHFDS+Dg8xkIZwQy58rlvFlJX6H/Q7nl8qd/6HZOGghwiUqpKK1bH
	FE43VMj3kyAblTiCM0UDOpb42IhwWYmaDoCEkq3EHpHeCcschVRzv4DSdof0rFUtxtIL1gxjqZE
	1GtCi6zmPYx56zPXitCqrz9Ej5hJ6YN00a2adUaXj9FOd1sQm4mJhbIxbvWR+NBfNyUHIgX5ezJ
	WR4mkGljCb9sEwd6gAdMPoFva8WQofWNn2ahu73xIq2LXBRFPEPVi8hB6I2uBgKtALis1EI6aTA
	4mKFzBKP9jNd4yqG8SPWpZ4bvTBIOwF3EIoL6LUjKcR/KfdI1FchdJllT3asOh5N6ImxtGvq/ov
	uMZJ/bT5jWMR1T/A/+97gCwvLR4tlWUva7kqQ0hDa7D4qZ7fBsgfbgdEdQUWNjwEW/O8n8/bjww
	GWSQL+sh6l3EMVeDm35up/X+k6FDqKzp/Y4rPOAiQeOxuXKDMAkmnr0caeQ3fXXbknEZnI7Z0Xt
	p7Sgox2tcWGANHKZA==
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr185966195e9.25.1791800517139;
        Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm327059615e9.1.2026.10.12.03.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 04/15] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-5-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-5-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.4316344599827794784.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3166; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Rd72MTm5cYisfbd6OpUeCW+uBuiW3AptGjcagTVGE5A=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuw/PPvjhFvJpxmc12UEnT3HkOm3ac1q7RC9rNvPL
 9euEJxZ1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJzHjM8N+1O9790ZfHXFtm
 PM8MERJnmNd8Kbxs/y+1exJKKxeUWjxh+Ke8eFFieFNTw3Sut57XEj+uy5V/J3xiiSp73Neydcc
 e6/ABAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032159_159314_362BDF10 
X-CRM114-Status: GOOD (  22.04  )
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

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table, external
> clock names and reset auxiliary device name. The reset auxiliary device
> is registered with jh71x0_reset_controller_register().
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 98 +++++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h | 12 +++
>  2 files changed, 107 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 2cc71f49ddee..c5ee82db3c92 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
> @@ -334,10 +336,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
>  	struct jh71x0_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
>  
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
>  
> @@ -391,3 +397,89 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  					jh71x0_reset_unregister_adev, adev);
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> +
> +int jh71x0_crg_probe(struct platform_device *pdev)
> +{
> +	const struct jh71x0_crg_domain_info *info;
> +	struct jh71x0_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	if (info->power_domain) {

At the moment the appears to be dead-code since none of your controller is setting it.
I'd prefer if you drop it for now and introduce it when it actually gets used.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
