Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EFCA0ECF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B1k2yLJ3L5dkqrxn330Gn0BRwiK9Px0wCYLND7HJ8BI=; b=nj5M6cQfCPhEdvmkAHLOPHQOEZ
	GXpFo8AvUMNrkp1f4/KkGzNLdN6HpLCWC77SQrhcrWpp9zSfH95xNmJHBWFK8B5X/PfFWwKj5O69z
	voE3PpVyBSHmuEMMO1h5O7Ar8XB+zaM+QlyPbMbZsrcXaqx/qf87Zw+5r2RXDNdsFjpU6WVTgM+Uh
	8jFynxBqoVoVSOxrvMYxN7K1pWOujc4b7cRx4kunfVD+mDrqYEKC7VflsGf7JdtnDZ+7OP3QpuaNp
	ZKMsjz53QSCxpr7o2CrDTzO9vEOyMwBbTy52qz/q0CgiLY5YXK/heggdz1uDDV+7AyU4D/Uxeub1k
	e5Q+sCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3JR-003PYE-2r;
	Tue, 12 Sep 2023 13:20:17 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3JN-003PXQ-2a
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 13:20:16 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CCCA43F643
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694524809;
	bh=Sf56SkwawGpbC/RXPSnmT5Ux3keGTDqMFdPqD5kK9Z4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=O0qtfvA/Dr9x7CWNrHDBntzk5TKybBarsUQKGf4ap/xA3xGF4OWpqxi5P7rV67YDt
	 B4belnNHzsoNrzuU/eogwYa5jcrVQVd9exFkbh/EKJ5ctE3VRQBiLD5uPPEEGXQ/Mo
	 cCe+5pcq2L9iveev0fk3WV+NISWCjA6J4Y8bUJOeqprLYi4aRa8GeODc7UPwhurP7Y
	 +CNYnJXIckHlD8ZaV8J1QntZfuNwrKyy+7h9y68ahDR8aIzN1PepIDxj7l9UlZkeEz
	 GWch2L1gRTi9anCKC1Jpg8W2obOqYS7FsfKRgzMutaq+fOJ3rzvMmdKMAmyfqhS/yx
	 9J3PJ2EcLpsBQ==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3aa0f368130so6995613b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 06:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524808; x=1695129608;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf56SkwawGpbC/RXPSnmT5Ux3keGTDqMFdPqD5kK9Z4=;
        b=Ivpg7+Q2GPfSsOSiOpLHKyIzjpxsM5UemUjjdPktNqPeiZTVURdM8RNyFAdl2iCJ8b
         3YAAIVv0HQO2dvdVVSQrceouvpdqJBN4EppC0XXeTN5AZsQuu5ELuWAdvIOc4sIdHbp5
         1VXD3sq/r59q2NoJhpmX8YOfJfWWzL8NlWm6d5umiVYKoW5B/988J2PgVXBwPztNL2HP
         4OnJ51Y6v9oehgbgV1w7PgnmYos9BPpL+cF/IGuL9QCxXWV6POPaj+QhfIpkCp8A0Sfa
         G+zlUBTJld1opdUFfCV0o/8gwfpN61qjPiBH91D+1Sm3k4V+VsTf0jn/jzFX0M2Xyix8
         Cmag==
X-Gm-Message-State: AOJu0YwC8uddjVXdMXlRsoFA2LoYh4I8ZtPHSBRHULxT5ExWishT3IUH
	OxsdWC3bNAB7THm1EvjY1E4jLnB9ccWe89MZWMmQZhRY7gToWbQFIptp5bbat6Xdf3OKGOVIpkd
	kLH6/6Ny/L0UBoKgjjMTyN8TSimJEOV9VLTD7K5w+zxBAaRVhQFNPdiBE9kT0fw==
X-Received: by 2002:a54:4101:0:b0:3a4:1f0f:d108 with SMTP id l1-20020a544101000000b003a41f0fd108mr14393055oic.46.1694524808656;
        Tue, 12 Sep 2023 06:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4tqK3LNB3nC4RtCAQYbX1Quh3QzmjM4JzXHKI7S/+TjQFf7rCkw4++4RrSzzbyNfkzEgQDnrmo7gpHJADav4=
X-Received: by 2002:a54:4101:0:b0:3a4:1f0f:d108 with SMTP id
 l1-20020a544101000000b003a41f0fd108mr14393037oic.46.1694524808389; Tue, 12
 Sep 2023 06:20:08 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Sep 2023 06:20:07 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230912081402.51477-6-william.qiu@starfivetech.com>
References: <20230912081402.51477-1-william.qiu@starfivetech.com> <20230912081402.51477-6-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 12 Sep 2023 06:20:07 -0700
Message-ID: <CAJM55Z9riu4vwfgri1a4UsAtCmTeatVhKCGA3LAtTXsHsddtXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: starfive: Change tuning implementation
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_062014_181441_FF897BC5 
X-CRM114-Status: GOOD (  29.72  )
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

William Qiu wrote:
> Before, we used syscon to achieve tuning, but the actual measurement
> showed little effect, so the tuning implementation was modified here,
> and it was realized by reading and writing the UHS_REG_EXT register.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  drivers/mmc/host/dw_mmc-starfive.c | 137 +++++++++--------------------
>  1 file changed, 40 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-starfive.c b/drivers/mmc/host/dw_mmc-starfive.c
> index fd05a648a8bb..ad8f39c62fed 100644
> --- a/drivers/mmc/host/dw_mmc-starfive.c
> +++ b/drivers/mmc/host/dw_mmc-starfive.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2022 StarFive Technology Co., Ltd.
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
> @@ -20,13 +21,7 @@
>  #define ALL_INT_CLR		0x1ffff
>  #define MAX_DELAY_CHAIN		32
>
> -struct starfive_priv {
> -	struct device *dev;
> -	struct regmap *reg_syscon;
> -	u32 syscon_offset;
> -	u32 syscon_shift;
> -	u32 syscon_mask;
> -};
> +#define STARFIVE_SMPL_PHASE     GENMASK(20, 16)
>
>  static void dw_mci_starfive_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>  {
> @@ -44,117 +39,65 @@ static void dw_mci_starfive_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>  	}
>  }
>
> +static void dw_mci_starfive_set_sample_phase(struct dw_mci *host, u32 smpl_phase)
> +{
> +	/* change driver phase and sample phase */
> +	u32 reg_value = mci_readl(host, UHS_REG_EXT);
> +
> +	/* In UHS_REG_EXT, only 5 bits valid in DRV_PHASE and SMPL_PHASE */
> +	reg_value &= ~STARFIVE_SMPL_PHASE;
> +	reg_value |= FIELD_PREP(STARFIVE_SMPL_PHASE, smpl_phase);
> +	mci_writel(host, UHS_REG_EXT, reg_value);
> +
> +	/* We should delay 1ms wait for timing setting finished. */
> +	mdelay(1);
> +}
> +
>  static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>  					     u32 opcode)
>  {
>  	static const int grade  = MAX_DELAY_CHAIN;
>  	struct dw_mci *host = slot->host;
> -	struct starfive_priv *priv = host->priv;
> -	int rise_point = -1, fall_point = -1;
> -	int err, prev_err = 0;
> -	int i;
> -	bool found = 0;
> -	u32 regval;
> -
> -	/*
> -	 * Use grade as the max delay chain, and use the rise_point and
> -	 * fall_point to ensure the best sampling point of a data input
> -	 * signals.
> -	 */
> -	for (i = 0; i < grade; i++) {
> -		regval = i << priv->syscon_shift;
> -		err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
> -						priv->syscon_mask, regval);
> -		if (err)
> -			return err;
> +	int smpl_phase, smpl_raise = -1, smpl_fall = -1;
> +	int ret;
> +
> +	for (smpl_phase = 0; smpl_phase < grade; smpl_phase++) {
> +		dw_mci_starfive_set_sample_phase(host, smpl_phase);
>  		mci_writel(host, RINTSTS, ALL_INT_CLR);
>
> -		err = mmc_send_tuning(slot->mmc, opcode, NULL);
> -		if (!err)
> -			found = 1;
> +		ret = mmc_send_tuning(slot->mmc, opcode, NULL);
>
> -		if (i > 0) {
> -			if (err && !prev_err)
> -				fall_point = i - 1;
> -			if (!err && prev_err)
> -				rise_point = i;
> +		if (!ret && smpl_raise < 0) {
> +			smpl_raise = smpl_phase;
> +		} else if (ret && smpl_raise >= 0) {
> +			smpl_fall = smpl_phase - 1;
> +			break;
>  		}
> -
> -		if (rise_point != -1 && fall_point != -1)
> -			goto tuning_out;
> -
> -		prev_err = err;
> -		err = 0;
>  	}
>
> -tuning_out:
> -	if (found) {
> -		if (rise_point == -1)
> -			rise_point = 0;
> -		if (fall_point == -1)
> -			fall_point = grade - 1;
> -		if (fall_point < rise_point) {
> -			if ((rise_point + fall_point) >
> -			    (grade - 1))
> -				i = fall_point / 2;
> -			else
> -				i = (rise_point + grade - 1) / 2;
> -		} else {
> -			i = (rise_point + fall_point) / 2;
> -		}
> -
> -		regval = i << priv->syscon_shift;
> -		err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
> -						priv->syscon_mask, regval);
> -		if (err)
> -			return err;
> -		mci_writel(host, RINTSTS, ALL_INT_CLR);
> +	if (smpl_phase >= grade && smpl_raise >= 0)
> +		smpl_fall = grade - 1;

If you switch the order of the two if's above and below you won't need the
smpl_raise >= 0 clause here. With that cleaned up:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> -		dev_info(host->dev, "Found valid delay chain! use it [delay=%d]\n", i);
> -	} else {
> +	if (smpl_raise < 0) {
> +		smpl_phase = 0;
>  		dev_err(host->dev, "No valid delay chain! use default\n");
> -		err = -EINVAL;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>
> -	mci_writel(host, RINTSTS, ALL_INT_CLR);
> -	return err;
> -}
> -
> -static int dw_mci_starfive_parse_dt(struct dw_mci *host)
> -{
> -	struct of_phandle_args args;
> -	struct starfive_priv *priv;
> -	int ret;
> -
> -	priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> +	smpl_phase = (smpl_raise + smpl_fall) / 2;
> +	dev_dbg(host->dev, "Found valid delay chain! use it [delay=%d]\n", smpl_phase);
> +	ret = 0;
>
> -	ret = of_parse_phandle_with_fixed_args(host->dev->of_node,
> -						"starfive,sysreg", 3, 0, &args);
> -	if (ret) {
> -		dev_err(host->dev, "Failed to parse starfive,sysreg\n");
> -		return -EINVAL;
> -	}
> -
> -	priv->reg_syscon = syscon_node_to_regmap(args.np);
> -	of_node_put(args.np);
> -	if (IS_ERR(priv->reg_syscon))
> -		return PTR_ERR(priv->reg_syscon);
> -
> -	priv->syscon_offset = args.args[0];
> -	priv->syscon_shift  = args.args[1];
> -	priv->syscon_mask   = args.args[2];
> -
> -	host->priv = priv;
> -
> -	return 0;
> +out:
> +	dw_mci_starfive_set_sample_phase(host, smpl_phase);
> +	mci_writel(host, RINTSTS, ALL_INT_CLR);
> +	return ret;
>  }
>
>  static const struct dw_mci_drv_data starfive_data = {
>  	.common_caps		= MMC_CAP_CMD23,
>  	.set_ios		= dw_mci_starfive_set_ios,
> -	.parse_dt		= dw_mci_starfive_parse_dt,
>  	.execute_tuning		= dw_mci_starfive_execute_tuning,
>  };
>
> --
> 2.34.1
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
