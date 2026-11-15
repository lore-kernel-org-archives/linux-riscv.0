Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EEC606A329
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fq9Rgfe1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K0FuNXMK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qx4EnrlDp1t7TMxy47Urrp+qVD4opn9YV/q0rADxbcM=; b=fq9Rgfe1mh31sC/UZaiu93kn4V
	ycemziIDFRtaQ+2z61T1XCnDXuagwgNaLkSon4WzLqIody7x3PwIRv19qsqWQak3XdPnLfuvoNAlV
	tA3oNG3XxVtKSC+ROqacw050W8w2WhbU5Xx3aBHSwZ4YbWfT5rNtHNILbdtKBOsz1N/1sYI0zx/zm
	qvK5plXXoPF1wg6Li5Bhk2lOeeF/lT+rZ+frDo13fjzzCjzZjiMhmOj/tjGFVq22S/aXZyfZ1xhIj
	LZBSAfysSqH8Xl+//8P+MkKxT2MiwDk/9Otmu8Ec7aZre37ZgGx8KCfhGJgFUAnVl5KZ8JljAyTa5
	sT4CgErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb47-000000001qV-313d;
	Sun, 15 Nov 2026 14:18:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSb44-000000001ot-2cbN
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 14:18:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28108865e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752319; x=1795357119; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=K0FuNXMKeaFRBA1SufZ0UlDx3Rf/PTEIQmXUrSwxSjs0DCALIcUzb3tipNYzeAftOB
         DITXRQ+5lnGycA0JGhPZ97x+HbyHbqFfDROZoNXx0dIKeZWpx4gDE0fopedJ3a9toJV4
         L460vP7rl6uPPVoL+3FJwyUfr75niBHZ/4+vMoTUi1pGLZBkAFy3DiwjvNpcGu/zYD+W
         g18u6ctCLSjYRqN/qpDsasGuNbZc4wq+RHGrrTEotsuBJbl3MhX6ngMxDudXr/d8P8bl
         BKyuBRBM2AH66Ixl/sXrcMmAfbyn3Ui5lycRKv66dNqTNYJCar+f81C44iv11UDLx11Z
         1SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752319; x=1795357119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=1ULQ0oF7Bowbij2Oqt6fVtDjaFGaNKh3XX6dhdFQiufItaudBARV89JvNt9nl6+Gdv
         lf18KdvTQMhep95bJ09oYk95Dov/IMm/oh+2WgmoEk7gp+q5m59U67De2bbi4VDKOacu
         wBUXzohrZyY9RDkgWg7Zdex7+QvqqGjcIkNvmFwhW5pLzOCNsV1VQthzCQ66KkJxxdgG
         otCtxlOu9vPhZJP4ofnB0Cj/8d5NVYR+RsS/Ti1X+1iaPCTbQgIZhKVMZ3024lmIo6Tv
         jRSr1fGSdfP+rXk7x2avfM3/uhZYf9BCrGfBiD+/+TwfHDP7tH6FE8C/qhLlFxkN8mV6
         F54Q==
X-Forwarded-Encrypted: i=1; AL+hErEQZaCukcJEZU8SBTsEq8zEgrNcSN8HKF1ScyImV6P2z/z7Taiwf61bs6zXnUk6fpF/MojfuxaQJg+jyA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9anWwuLlTGeYlmHA2Gva96QlG59nMAToYor+wq9o07HJ058sTD
	n0ubC4nSIcG4f5FrSVu7jQjcg8yFjOev/keTMg6MBgWXD3UNNN2KwRWthVuNbqQ3s40=
X-Gm-Gg: AYBFou16W1uxJY7JHrFMUAKFfUMEgrdTnYt+GA9wYolGe2Yhbrpu89oqSIANxlR3DB7
	68WP2wbOkw6hi7o2maQ9rayyP/tPh56SbrI2MEsnvnyoV65G9Q02nhjW0x/5R9qo5jDYUE+RRg3
	MEazTm8Vc2RbMkh+f1firW3k5Q9Wzbn5qMU9ClhWBVaSMVx2JNSzB5dsagmTpU0A1MxQLYXjpGj
	PaWKxJcTs7QP3hwOmlUZKEHLK92KAzMZ5SJzOoXbJjYmO5+uoDUsanPhHnb4NLK1EVhg44UI7ys
	Cwmdd8qqJvoHU28TRqXb7J58qH31smjrzObJIOJTzo+Qk7FJXzOqdm89267IDml7oWYZ9Lo23eY
	UiFFIg3Gn1YqRmAr9T5l7keDV002yHChPJB5LdYm3el47XczNUoFYHeYdVkrHL+kL1WwLjiIwAm
	wfajgbUTh/+w1PVtUHRoVtbOIXwvBD/Jq2c16OV72xIZR4bZ6JCFyMWriRfoqZ+21fKKIxG1xCz
	DG85g8liEclu8kufoTDNXJ5+mIom8KtqrjPWNdmzCP8+oaimgsZJqq8rClU0nYbKEF5EDhukeY3
	u1u1jJozgpIFyPLL8mBt9SBwJgZlNx595Une7kjtvdeb0lG9emk2LPc6TO59FAX+z5Z6ww==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr181804715e9.28.1794752318812;
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm30018475e9.13.2026.11.15.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
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
In-Reply-To: <20261013102707.9207-6-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-6-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.11095887430765466229.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4YSHPxWGTuc3EuidS03239lOVJ2/QKGIZgU/mBp8vys=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95szbVDuXvm6sc7DoW66jeWS1j17l/HIL1h27lLXm
 U9Hlycf6ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEnk9k+GfuPzvb4vsF2aOr
 3hle709gauBg5IqbHv9x9kcrHoXnW84y/M8y7fu6sUw8ITh8/sKcFzcV26emdsqFrVv41fDoL2/
 GCG4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_061840_737261_B3F81E14 
X-CRM114-Status: GOOD (  27.31  )
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

> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
> 
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for discontiguous controllers, a
> table mapping reset IDs to hardware bits. Add
> reset_starfive_jh71x0_register_with_info() to register such a
> controller, and translate the reset ID in the update and status
> callbacks when a map is provided.
> 
> Existing users of reset_starfive_jh71x0_register() are unaffected.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
>  .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
>  2 files changed, 107 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> index 29ce3486752f..fd1c755a0017 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> @@ -14,6 +14,8 @@
>  
>  #include "reset-starfive-jh71x0.h"
>  
> +#define JH71X0_RESET_ID_INVALID	ULONG_MAX
> +
>  struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
> @@ -21,6 +23,11 @@ struct jh71x0_reset {
>  	void __iomem *assert;
>  	void __iomem *status;
>  	const u32 *asserted;
> +
> +	/* Only exists in reset controllers that use the
> +	 * reset_starfive_jh71x0_register_with_info helper.
> +	 */
> +	const struct jh71x0_reset_info *info;
>  };
>  
>  static inline struct jh71x0_reset *
> @@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
>  	return container_of(rcdev, struct jh71x0_reset, rcdev);
>  }
>  
> +static unsigned long
> +jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned int nr_resets,
> +			 unsigned long reset_id)
> +{
> +	for (u32 i = 0; i < nr_resets; i++) {
> +		if (map[i].reset_id == reset_id)
> +			return map[i].hw_id;
> +	}
> +
> +	return JH71X0_RESET_ID_INVALID;
> +}
> +
>  static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
> -	u32 value;
> -	unsigned long flags;
> +	unsigned long offset, flags;
> +	void __iomem *reg_assert;
> +	void __iomem *reg_status;
> +	u32 mask, done, value;
>  	int ret;
>  
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_assert = data->assert + offset * sizeof(u32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	done = data->asserted ? data->asserted[offset] & mask : 0;
> +
>  	if (!assert)
>  		done ^= mask;
>  
> @@ -89,10 +117,20 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 value = readl(reg_status);
> +	void __iomem *reg_status;
> +	unsigned long offset;
> +	u32 mask, value;
> +
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	value = readl(reg_status);
>  
>  	if (!data->asserted)
>  		return !(value & mask);
> @@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +
> +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> +					     void __iomem *assert, void __iomem *status,
> +					     const u32 *asserted,
> +					     const struct jh71x0_reset_info *info,
> +					     struct module *owner)
> +{
> +	struct jh71x0_reset *data;
> +	int ret;
> +
> +	if (info->discontiguous && (!info->map || !info->nr_resets))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "discontiguous controller without a valid ID map\n");
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.owner = owner;
> +	data->rcdev.nr_resets = info->nr_resets;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = of_node;
> +
> +	spin_lock_init(&data->lock);
> +	data->assert = assert;
> +	data->status = status;
> +	data->asserted = asserted;
> +	data->info = info;
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..36f198139602 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,9 +6,28 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>  
> +struct jh71x0_reset_map {
> +	unsigned long reset_id;

you don't really need the reset_id, it could just be the entry index in your table ...

> +	unsigned long hw_id;
> +};
> +
> +struct jh71x0_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;


... and this would not be necessary, as Philipp already noted on the previous version.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
