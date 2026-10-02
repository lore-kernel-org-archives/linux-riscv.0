Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD41CA5FE0
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CnX1IgW0Ub7BGkuia96bYf8Cg14gFvvYVCA1d6TLcY=; b=CQ9GQike7+g9TJ
	32oF4mtAOHVmdVKiiVr9sQMrVTTev9bj7AUZKAzu69h/WTEprLflPoxMQjJxLx5aM5EBq0epBxaps
	Po0fY6sw8H0ZSEGpDEz+M5JbUnF2Njf7MlbnDAZ80Y5MIdiz9IP+Azou76hN27iI4zh2xL34mPzao
	Ts6TjsMlW27/Pxja8JkdhY80sPEhlZiJBVz1P6XFfnjYd8WZ8rxtAw90wIqomHVOsoEjl5ZARVCtT
	EvkpTQaelG1NFOfkMj4UHztfhTvEJTRz1m4THJo3wxlG1W6JpliHub8pWKi2zGl/TVN4MzM06MaVl
	V4QVAoStd9LncTfq2ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMN-0000000CIvB-14ec;
	Fri, 02 Oct 2026 18:51:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMK-0000000CIuW-13Vn
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
	b=GcCnYpjvBDH7VEFk82WGi3KNuUhLpG4Pj3sPjP2oZ03adrcLfjx6n+xk9vk6Zd6ajMAzKP
	EP8Cn28v617l0ljQhZbn4lmsdIO9BNmokP7c/Xfit/Vy4M4jOHUCiyuj9wgIlV9As1/SDG
	YxGPy+lMVnw8p0W0Y7RAPBeQmONdwko=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-Qldbbi5zPXmF3en-S_HdiA-1; Fri, 02 Oct 2026 14:51:47 -0400
X-MC-Unique: Qldbbi5zPXmF3en-S_HdiA-1
X-Mimecast-MFC-AGG-ID: Qldbbi5zPXmF3en-S_HdiA_1790967107
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso365717685a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967107; x=1791571907;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
        b=OtrK0YnskurTLJUBvk6FSeF/TpvpIBlD2GeYu2Tr7gtOAPDd4NjzU9z3Fvmb3pVtIh
         WIB0xcwUV8cHasy8KdJlf+0JDL0P/LqLKcB5e6lE0nRzo6KocsJB3BqAW/+raFy1MHZS
         NJl7uesDgkXC3MHDoON+oi88s5PlhGsxoKhd2wGKS5avPeoMtP64RTBFiCx/T70EIH7s
         rP6wfx/Cmi5EiLUTQArTjDqd2h1vDkxMUi8EK3SQfH71b58UUP2Fg3+AVMVDoJKoolrn
         sj60khS0Suxj5BQJa144zC4sewgQAgc98CD7ImU7LmnK8+gVe63aZWIKtOkOXbXMeBcb
         otMA==
X-Forwarded-Encrypted: i=1; AKwUvByLi2WaizDNXuvk67L1rVOAUUESbf9Zu+pZHHFv+jGP11WWYCU2ZjDZEn09XlW8f4Nr2G7h+LmJJ0YZ2g==@lists.infradead.org
X-Gm-Message-State: AFuF++m/sbvCkhbAZUuDKtvugvyKXnFY2mQ6dPwrU88o6FLdEf7hKSRZ
	0MrSbXXjCWKRg8WXj0qBHWkzhg652dNE8JuCR3EkxRz1hpBHgIh7TQONmq2Sgdyt3oTUSZjxjDj
	U9kum4IEpawFKEjLxiAyIxjhiAOMZZqpITd7Rf5Y1kzQciHPVGTCLNrRmykCC/RSUMJdpF34V3i
	pkMw==
X-Gm-Gg: AYBFou1IpHPzew7x1tuOiC4qrtj+3ZW/cU9SUp/4iREgAg1o9yLX2y16JlPwCG1OW2V
	quiMIBH+cVuA1WZMRSKRmoqjnmDx+SWQNIUsOVPXe/EzzdzxSoAoHmFM3aKibtvMpXD7jrjhlMK
	JQzI/l8wQC8t2oqbz9tLfzc1VeUUQxdyD7M084VrbPrbs7BQeJeSaVxi+sgcDE5AmJ6aDog3qGy
	IoQLRlEuX2HlmGBdeo8Cn2JHOXhbkY3okiOxXx72Ljj1FRoEAUGiqY7fp2NXDK5OLEe/LJPmYKl
	1fFUUolABnFrxeoe3/oxl14GFlSepYYprqI2Ra3elBfHxrBm+D3BI/P9LSpK3M66Wq6O1+daeY9
	s/oayky33JNIYCg==
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639036085a.21.1790967106975;
        Fri, 02 Oct 2026 11:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639030785a.21.1790967106284;
        Fri, 02 Oct 2026 11:51:46 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:45 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 04/23] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260930124317.5648-5-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-5-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707363.821688.2728247121300145722.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4235; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QDX7lQ1hmHgJ9y3o5Z/Hm00xEaK1qYts6FM/BQ1Nm/Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/zV1zvtv7+SlXtHBUHFGbF2avMt2pk/9ujcLTCxi3
 ln8f/y5o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlkT2L477RhtiqP0LV1IWGM
 ZU1dt/UfT9fN8wuQLvAMmf5nqsZPDYb/SZGX7zI8PTwx9kJQFcftAndb56ryh2camk4sv/s3O1S
 VGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RmHaS2SLfcqKqIR03s2hh9FYSbx8efpKCRpDyXWZKc8_1790967107
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115152_529667_C65FC262 
X-CRM114-Status: GOOD (  25.28  )
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

Hi Changhuang,

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
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 2cc71f49ddee..bb7706ede1a6 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>

Add #include <linux/property.h> for device_get_match_data()

>  #include <linux/slab.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
> @@ -334,10 +335,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
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
> @@ -391,3 +396,87 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
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
> +		ret = devm_pm_runtime_enable(priv->dev);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to enable runtime PM\n");
> +	}
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
> +			if (pidx < info->num_clk) {
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			} else {
> +				if (pidx - info->num_clk >= info->num_ext_clk)
> +					return -EINVAL;

What do you think about adding a dev_err_probe() here as well to make it
easier to troubleshoot any failures here?

Brian

-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
