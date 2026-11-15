Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B063606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3yCRhee;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=j/ixKd6R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4L7vzizQAaJLkcU12GThCZip94j1VON/3MWrlsI16uI=; b=h3yCRheeyoop/T2ZeLVVHMk1UG
	QWNGyH+49z/fXD1/P1ODywERMTYL9gNWJLAKNouQOd28hKVDPkjDjQBP+ih9kCoCXH7CI4RoYw4/H
	d3lH9jOYEd2LsSXt6q36FHAfC4hg+sbaBygKcbqCR4u+X8wWWsY0KRioqNMfM1wV07cgMt2rUb+Cn
	IxPgsSZrvSvNLRxSzoESjDLL6oYcwmpCFUUBWO77+T+Udd1KIzwSknw04Z+3uqZoCqei8G2uc8m2N
	Y2sMg5SZ+YfJsBgOj3PxZ9MJ39Gnkbn0y/ZvNtjGZGZe/+lCvbizYfDpKyhSYNEQm5xbK4yBkOjz6
	3K839DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb46-000000001q1-1g32;
	Sun, 15 Nov 2026 14:18:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb41-000000001oL-1hyB
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 14:18:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so1188095e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752315; x=1795357115; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQoftNx1+ky9AuggiK3VoWKz8ajkaLtdnex4l8Hd7yE=;
        b=j/ixKd6RkFzgZaMiiVJ6zjPfyWYu08HmwmbOZN6gkM0kZVOe398JRfq+n+uHZsUSTR
         HYge0fbCJmFS6+Hrle6IIwg0Obkd/8TCsGWHOTjIlGtCIc9Arbq/Wy1qSGmwBp4qHfiJ
         YFMk0Nzn2O9DteiSDzw1mTS/4SJWVErMwUZJhlMSymhqAE6dbIsvBi1N/cXRyv8eLY95
         HBC4KQNaniN+xnJVxLgDQJ236hC8dsdpSMsJY2Lfep8mKrw/DkNgMny7XgYGFyePDsrO
         Q1dZ1ENoOTFal31qA7og+tUx+Aw5ljlGheaaPt5/pzbtcVR0gTUc63zOw4pa4Z6XsszF
         /tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752315; x=1795357115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQoftNx1+ky9AuggiK3VoWKz8ajkaLtdnex4l8Hd7yE=;
        b=XlDvLOADQPye6ePWPmMweUbogjTLdzv7mkUB3vnS65RmFLgMLxTFTr0D0vpovPrZHG
         Mi2sXEumiGo8/hJRHqr1izdfjWJOMeVdU9BDPtiFSfonmcBAKS1FWL/zAVWq2nD6WfHL
         HT44h8bUnc30iDNi/csft14FUILfIQfkvGpYSHNjzQ6ItDKpYsp4Ca7J/62Pc0DMzg1V
         WTeBPKjfGuVd6DRIlqQa62t67OFsB5njEJW324zsX+lQqlxE/RaQNO4ey7uk99XoGhKW
         57TqNOX2xtWL7DHcBgVnP/VnjQQZ7uSgAB5GH8QdFUB07XAG8TPXChj4K+CLsWPNMd5d
         koYQ==
X-Forwarded-Encrypted: i=1; AL+hErH7RFfbwYFcCYaGObvXy0z8bz8g1pQA1qSwbhrAyNmFjNYhI1iEojLNinS+CDIR8C1+hngQFnZFBCG75Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/pTMy1QiTu43AjRLvcO9bNkkIrVQMKVjnjFZdPsYH+qQV1C+9k
	5wXXLqMLI6S8aZdqnMEty0PjKEk4FxZVkbJkp/XvNkFNdzBeKexIPsE7BDqxVxOsGlU=
X-Gm-Gg: AYBFou2Xu326uXpCLNWLXr6GaijXhWpwshQNF6Y31M7NYVHoTLY8Azxy6jsH6i7teKQ
	2UA8cv+scNKuEkjoA/MyNddbxTBf1SjNGjtHAaNUNWnGIONtsAb6c8k831RxT9tJ40DJfHEkezD
	KSOuk1mTTwOmBkmB/G6niX3OhezgdhlqlrwpvI2DSZyXBo6Oe8ASw/kIXFNtxKkWnRHczDZj78E
	OdDm8+op+HVFcHDRitFaz16bLldv/sdW4oK5eo/TJikpBueglYZc0ceJXXL6ybtT9biUbR8R6XI
	fxVA6ZfY/qNy7cL6+rCdxzyciTFLRTud9vf2gooOv4HLrfH+IKKYwq29zo1eLg23Av+AlrlR0mZ
	MyWI5cSAsEnyVGiB6EQFtwe1yGJmP9xKcN/EBiBUGPdYeC7Mv8kQNbzJPisdOkWGinCK6jTTyvU
	idDgSqKV5EE/lRWmFzna28cTyRNEI31eXjI9ONLReutvicYM30eW0Jed8vTAV8mwXapsM1bRO0q
	YbwyxAjjREz24rkBZug3GmsEXvAmnTShTY7h4oWUtVX9IjoYUOynGlDlCtCsc6vjqx5sSESPPD/
	lYNWy7nl7uxtcVtI4Xn/qCr3Uqwxd5uk69Or0gxzUsbgsdUb
X-Received: by 2002:a05:600c:4e43:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb559f24ffmr166728745e9.1.1794752315503;
        Sun, 15 Nov 2026 06:18:35 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm137451805e9.4.2026.11.15.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/6] clk: starfive: jh71x0: Add generic CRG probe
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
In-Reply-To: <20261013102707.9207-4-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-4-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.10035326269756392801.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6706; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VtBrKLm2TGieOwhTBnDIxjnhWjQzoOwdJZi+yiLRkd8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95vPYUsyZ/7yQy20T9Joyetv7rvPOPozxi4JOp3Q4
 7L08PygjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyk+DDD//CnhTkpiXPL93+f
 ueJR2HcFJf5vL036zX4qGTRPDXS/5MDIcMDvy+VbPzd6fk0rdHtUvzTgu8N1zS28M/+xvN9ps8t
 1BQsA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061839_167084_33308DA1 
X-CRM114-Status: GOOD (  34.35  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
> Parents that refer to an external clock are tagged with
> JH71X0_EXT_CLK_FLAG in the parent index, so the external clock indexes
> of a driver do not depend on how many clocks the CRG provides and do
> not shift when a clock is added to the binding.
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 96 +++++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h | 21 +++++
>  2 files changed, 114 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 37bab563c5e0..52c5ae737dbd 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/property.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
>  #include "clk-starfive-jh71x0.h"
> @@ -333,10 +334,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
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
> @@ -361,3 +366,88 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  	return 0;
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
> +	for (idx = 0; idx < info->num_clk; idx++) {
> +		u32 max = info->clk_data[idx].max;
> +		struct clk_parent_data parents[4] = {};
> +		struct clk_init_data init = {
> +			.name = info->clk_data[idx].name,
> +			.ops = starfive_jh71x0_clk_ops(max),
> +			.parent_data = parents,
> +			.num_parents =
> +				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +			.flags = info->clk_data[idx].flags,
> +		};
> +		struct jh71x0_clk *clk = &priv->reg[idx];
> +		unsigned int i;
> +
> +		if (!init.name)
> +			continue;
> +
> +		if (init.num_parents > ARRAY_SIZE(parents))
> +			return dev_err_probe(priv->dev, -EINVAL,
> +					     "clock %s: too many parents (%u > %zu)\n",
> +					     init.name, init.num_parents, ARRAY_SIZE(parents));
> +
> +		for (i = 0; i < init.num_parents; i++) {
> +			unsigned int pidx = info->clk_data[idx].parents[i];
> +
> +			if (pidx & JH71X0_EXT_CLK_FLAG) {
> +				pidx &= ~JH71X0_EXT_CLK_FLAG;
> +				if (pidx >= info->num_ext_clk)
> +					return dev_err_probe(priv->dev, -EINVAL,
> +							     "clock %s: invalid external parent %u\n",
> +							     init.name, pidx);
> +
> +				parents[i].fw_name = info->ext_clk[pidx];
> +			} else {
> +				if (pidx >= info->num_clk)
> +					return dev_err_probe(priv->dev, -EINVAL,
> +							     "clock %s: invalid parent index %u\n",
> +							     init.name, pidx);
> +
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			}
> +		}
> +
> +		clk->hw.init = &init;
> +		clk->idx = idx;
> +		clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret, "Failed to register clock %s\n",
> +					     init.name);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
> +	if (ret)
> +		return ret;
> +
> +	return jh71x0_reset_controller_register(priv, info->rst_name);
> +}
> +EXPORT_SYMBOL_GPL(jh71x0_crg_probe);
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index 322a05157faf..666d44e6a752 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -5,6 +5,7 @@
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>  
>  /* register fields */
> @@ -29,6 +30,16 @@ struct jh71x0_clk_data {
>  	u8 parents[4];
>  };
>  
> +/*
> + * Parent indexes with this bit set refer to an external clock, i.e. an entry
> + * of jh71x0_crg_domain_info::ext_clk, instead of a clock provided by the CRG
> + * itself. This keeps the external clock indexes independent of the number of
> + * clocks the CRG provides, which in turn must stay below the flag; drivers
> + * check this with a static_assert() on their clock table.
> + */
> +#define JH71X0_EXT_CLK_FLAG	BIT(7)

I'm really not a fan of this hack.
In addition to being hackish it will limit your controllers to 127 internal clocks
which I'm pretty sure is a limit you'll hit eventually.

I'd prefer if a parent was defined by a struct of yours, something like

struct jh71x0_parent_data {
	const char *fw_name; // <= external if not NULL
	unsigned int internal_id; // <= id in your table if the above is NULL
}

With this, the bit, the macro that goes with and the table of external clock
can all go away.

I suppose it means some change in your existing drivers too

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
