Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32772C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iKnkiI6EF0B4yehYQ19BjPTrUf8q3Yb0goq/U1uBbtM=; b=Y5xfvr56HBosqSvbzTdM48Wstj
	Cnof99gUJZJmfn9tAzigVPMJ1UiiK2mFw8DxV74d8w4a3ndefDnrJ0+LWbuVsYj4Iq+1CqK+abl3u
	MJBs/vCoAYBuEdhxEDOwchqKTo3T/FwI1zAr0/UQRJmS7V0Puu15DuqTauN2FWRD40ovtFaSvlW7r
	4BFx7f3W4x4pdcax0e0DWOUjixyRhNv9suUtCnbFMj+Dzmss8EsFULWLskFNmSsQ3b9e/WXWcsNdP
	YSj/Nm3R12xAixLT7y9Cv1a8tLDYOLmOIce/NcFJA7SCFJJkKm4SjEDC63rKDvWU/SVKGPZ3vIXXn
	toFiWamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBahI-00Ffbw-36;
	Fri, 08 Dec 2023 13:15:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBahF-00FfbB-2M
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 13:15:15 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C903941515
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702041311;
	bh=c5wUCZP5uxT+D5h6Lc7Bx9+IP9vdWehgZtwy5FF1vNU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MEGRrHTGyX8+TQuTwCa64aZiyk6dhrmm8BAlI5I06kCptYqAQEnC04mPvSyQOXGbc
	 zgXi33L6Tg31RDLqIjq5vmzG+0T2nKBGtFNtwdTlKHZ7E48UCV6NiorCR4N0Eg0TJe
	 zuhpgwiLeRiv/fEYqDqRZCOOyu/WuDqcsGpUXSIMyskNy7J2cIbkVUuz+Kp8oIdtRJ
	 jTY5p6S0ekLMbpyDyxY5sXbk1+tRi+hhCxpTeEWIfD5d5e+bdTURNpHgYLq51uAFmi
	 bXanFS15Om6NqcKoYkyPG3nPqqzjfcDFvStO0C3NSyu5dNka6dUp5fSr+9OMPQxQ/+
	 vQDbHPI3dQhtA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-423afeb1cbcso24764581cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 05:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041310; x=1702646110;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5wUCZP5uxT+D5h6Lc7Bx9+IP9vdWehgZtwy5FF1vNU=;
        b=YeD9CcLfc51wsMTky0Qtc0lETLwMzdCEYFgiGdhy4LW4ooL9C0LNowf4mEtC8+XQZK
         x1tJ9D1EswEdx2NN5hGeOTTY6P8sz0HVEOOczSICOptWyHRLjdCOMKGGYlkI0ZUSgQR5
         o/cCntu8OZKihaWXj4LHdIDXpKd+t3PlXfurXzMsgcO+EIs/8dYpku2plEQBUrlViD/S
         usOPlpI+0EQzaX3bcb9L1VpRtShlXQ4XCXSeba7sJcjX1t1uNH7Hxp4IkhWG3qxESVTm
         3BUyDx9s2FoVaCUn/4Gvrerrr8f/1DAbuw1gnPzmciDg9T6XJC9haXR4L4CY8Kpm3lhz
         HouQ==
X-Gm-Message-State: AOJu0Yyliv6d8xentzdOWZpfkCZBmLAVCzf77o2/QyKZ7/s/hGOSMEWu
	nLakuy8rPa7blByyqGvA32UuLTd4rxIQ7rmf6oVDAgwbGp1RmXCOz50bx73Mp1BYbH0EAFdFcg2
	vnNb5LElYGBXwpw5THezV7UWDoFsjaJ8lC41uVoCxXqIsd5U3g3U4wuS9PKBTnw==
X-Received: by 2002:ac8:59cd:0:b0:425:a282:71ae with SMTP id f13-20020ac859cd000000b00425a28271aemr83650qtf.65.1702041310495;
        Fri, 08 Dec 2023 05:15:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGznAXIIRyxMLb5pO2qeJrPUYYl2PAXtj36+PqtwjGvaAeZjPNal02cbh/Khten3+rQ2+aY7jlmCUrdPAAgJ9c=
X-Received: by 2002:ac8:59cd:0:b0:425:a282:71ae with SMTP id
 f13-20020ac859cd000000b00425a28271aemr83624qtf.65.1702041310209; Fri, 08 Dec
 2023 05:15:10 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:15:09 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-3-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-3-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:15:09 -0500
Message-ID: <CAJM55Z9yLeMDifcGprgav_cJgwLUwKPcsPJSyjSxr2-nVw-YrQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] reset: starfive: Convert the word "jh71x0" to "starfive"
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_051513_926028_E1266ED3 
X-CRM114-Status: GOOD (  18.18  )
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

Sia Jee Heng wrote:
> Function names that consist of the 'jh71x0' naming convention are
> renamed to use the 'starfive' wording.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../clk/starfive/clk-starfive-jh7110-sys.c    |  4 +-
>  .../reset/starfive/reset-starfive-common.c    | 64 +++++++++----------
>  .../reset/starfive/reset-starfive-common.h    |  8 +--
>  .../reset/starfive/reset-starfive-jh7100.c    |  2 +-
>  .../reset/starfive/reset-starfive-jh7110.c    |  4 +-
>  include/soc/starfive/reset-starfive-common.h  |  6 +-
>  6 files changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 6e45c580c9ba..e63353c70209 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -345,7 +345,7 @@ static void jh7110_reset_unregister_adev(void *_adev)
>  static void jh7110_reset_adev_release(struct device *dev)
>  {
>  	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
> +	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
>
>  	kfree(rdev);
>  }
> @@ -354,7 +354,7 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  				     const char *adev_name,
>  				     u32 adev_id)
>  {
> -	struct jh71x0_reset_adev *rdev;
> +	struct starfive_reset_adev *rdev;
>  	struct auxiliary_device *adev;
>  	int ret;
>
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
> index dab454e46bbf..8d8dec9e5d7a 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -14,7 +14,7 @@
>
>  #include "reset-starfive-common.h"
>
> -struct jh71x0_reset {
> +struct starfive_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
>  	spinlock_t lock;
> @@ -23,16 +23,16 @@ struct jh71x0_reset {
>  	const u32 *asserted;
>  };
>
> -static inline struct jh71x0_reset *
> -jh71x0_reset_from(struct reset_controller_dev *rcdev)
> +static inline struct starfive_reset *
> +starfive_reset_from(struct reset_controller_dev *rcdev)
>  {
> -	return container_of(rcdev, struct jh71x0_reset, rcdev);
> +	return container_of(rcdev, struct starfive_reset, rcdev);
>  }
>
> -static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
> -			       unsigned long id, bool assert)
> +static int starfive_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
>  {
> -	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> +	struct starfive_reset *data = starfive_reset_from(rcdev);
>  	unsigned long offset = id / 32;
>  	u32 mask = BIT(id % 32);
>  	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> @@ -61,34 +61,34 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  	return ret;
>  }
>
> -static int jh71x0_reset_assert(struct reset_controller_dev *rcdev,
> -			       unsigned long id)
> +static int starfive_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
>  {
> -	return jh71x0_reset_update(rcdev, id, true);
> +	return starfive_reset_update(rcdev, id, true);
>  }
>
> -static int jh71x0_reset_deassert(struct reset_controller_dev *rcdev,
> -				 unsigned long id)
> +static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
>  {
> -	return jh71x0_reset_update(rcdev, id, false);
> +	return starfive_reset_update(rcdev, id, false);
>  }
>
> -static int jh71x0_reset_reset(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> +static int starfive_reset_reset(struct reset_controller_dev *rcdev,
> +				unsigned long id)
>  {
>  	int ret;
>
> -	ret = jh71x0_reset_assert(rcdev, id);
> +	ret = starfive_reset_assert(rcdev, id);
>  	if (ret)
>  		return ret;
>
> -	return jh71x0_reset_deassert(rcdev, id);
> +	return starfive_reset_deassert(rcdev, id);
>  }
>
> -static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
> -			       unsigned long id)
> +static int starfive_reset_status(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
>  {
> -	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> +	struct starfive_reset *data = starfive_reset_from(rcdev);
>  	unsigned long offset = id / 32;
>  	u32 mask = BIT(id % 32);
>  	void __iomem *reg_status = data->status + offset * sizeof(u32);
> @@ -97,25 +97,25 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  	return !((value ^ data->asserted[offset]) & mask);
>  }
>
> -static const struct reset_control_ops jh71x0_reset_ops = {
> -	.assert		= jh71x0_reset_assert,
> -	.deassert	= jh71x0_reset_deassert,
> -	.reset		= jh71x0_reset_reset,
> -	.status		= jh71x0_reset_status,
> +static const struct reset_control_ops starfive_reset_ops = {
> +	.assert		= starfive_reset_assert,
> +	.deassert	= starfive_reset_deassert,
> +	.reset		= starfive_reset_reset,
> +	.status		= starfive_reset_status,
>  };
>
> -int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
> -				   void __iomem *assert, void __iomem *status,
> -				   const u32 *asserted, unsigned int nr_resets,
> -				   struct module *owner)
> +int reset_starfive_register(struct device *dev, struct device_node *of_node,
> +			    void __iomem *assert, void __iomem *status,
> +			    const u32 *asserted, unsigned int nr_resets,
> +			    struct module *owner)
>  {
> -	struct jh71x0_reset *data;
> +	struct starfive_reset *data;
>
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>
> -	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.ops = &starfive_reset_ops;
>  	data->rcdev.owner = owner;
>  	data->rcdev.nr_resets = nr_resets;
>  	data->rcdev.dev = dev;
> @@ -128,4 +128,4 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
>
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
> -EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +EXPORT_SYMBOL_GPL(reset_starfive_register);
> diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
> index 266acc4b2caf..83461b22ee55 100644
> --- a/drivers/reset/starfive/reset-starfive-common.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -6,9 +6,9 @@
>  #ifndef __RESET_STARFIVE_COMMON_H
>  #define __RESET_STARFIVE_COMMON_H
>
> -int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
> -				   void __iomem *assert, void __iomem *status,
> -				   const u32 *asserted, unsigned int nr_resets,
> -				   struct module *owner);
> +int reset_starfive_register(struct device *dev, struct device_node *of_node,
> +			    void __iomem *assert, void __iomem *status,
> +			    const u32 *asserted, unsigned int nr_resets,
> +			    struct module *owner);
>
>  #endif /* __RESET_STARFIVE_COMMON_H */
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
> index 546dea2e5811..122ac6c3893b 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -51,7 +51,7 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>
> -	return reset_starfive_jh71x0_register(&pdev->dev, pdev->dev.of_node,
> +	return reset_starfive_register(&pdev->dev, pdev->dev.of_node,
>  					      base + JH7100_RESET_ASSERT0,
>  					      base + JH7100_RESET_STATUS0,
>  					      jh7100_reset_asserted,
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 87dba01491ae..c4dd21761e53 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -53,13 +53,13 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
>  			      const struct auxiliary_device_id *id)
>  {
>  	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
> -	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
> +	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
>  	void __iomem *base = rdev->base;
>
>  	if (!info || !base)
>  		return -ENODEV;
>
> -	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
> +	return reset_starfive_register(&adev->dev, adev->dev.parent->of_node,
>  					      base + info->assert_offset,
>  					      base + info->status_offset,
>  					      NULL,
> diff --git a/include/soc/starfive/reset-starfive-common.h b/include/soc/starfive/reset-starfive-common.h
> index 56d8f413cf18..16df46a074bc 100644
> --- a/include/soc/starfive/reset-starfive-common.h
> +++ b/include/soc/starfive/reset-starfive-common.h
> @@ -6,12 +6,12 @@
>  #include <linux/compiler_types.h>
>  #include <linux/container_of.h>
>
> -struct jh71x0_reset_adev {
> +struct starfive_reset_adev {
>  	void __iomem *base;
>  	struct auxiliary_device adev;
>  };
>
> -#define to_jh71x0_reset_adev(_adev) \
> -	container_of((_adev), struct jh71x0_reset_adev, adev)
> +#define to_starfive_reset_adev(_adev) \
> +	container_of((_adev), struct starfive_reset_adev, adev)
>
>  #endif
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
