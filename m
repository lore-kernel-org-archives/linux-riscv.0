Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD3606A8A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MiscQKqO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KJquWBYd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5raC0Ij70oVr4vjiGtZ0G8h8WFt3Zq3PPPr5e70TbBE=; b=MiscQKqOxnDzXXU16NEu8E+DJb
	Qkgx1Pa/GnmmnKbQ++BQVkxyjWWkKb2sojTOyXPjqOmTUBlJPgtpNCdM/vZEdGYZ1NeHv7nOmCPM2
	XIX8mjg0hy5+bxaDAK527aYiWh5Xgml0uQI5rLLQ47CrAtIHGzB16gn/r14dWP7W0rDIiCwHnmVtE
	LkbgC1IjsBz5L5vAHf4YiKb6qFspoACRocjkkpCiOUGHEsUAUq0MxqNBxkTtwJ8UFlXFFmVpRSsEo
	kfPmXtaBYBCBF3t52HjZueImCdpNr6utMW7g5+9DzJaNOXkHvxVFUig4M8EIRnG/GV4GJMRhgUmRq
	8zmTZahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSrq-00000009fWS-2Us2;
	Thu, 12 Nov 2026 11:21:22 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSre-00000009fQX-3bdR
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 11:21:19 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0529D202C92;
	Thu, 12 Nov 2026 12:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794482469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAI4OUL2TrWY37F5xvd0X+8qNL/eL8wyTrg+ONCjoEs=;
	b=KJquWBYdNO1p925AQ2jlEP1Br5a9Mv2C66vC3uv2eUhDSMbM9gunU33rBNI0DT90fdgjQ3
	xrSx7CTPKVmyBq47XMOpD1/V02W673G1jKnu6OFLCxi4ts9Xpy7laauDW/QR2yPQaYNtaH
	a79bqRMYx0qC2AkMzITaUxMytkLC2j5GeerenUqYjlwNSFT+OMwPtkB/TVnznRN9leoHQy
	snA3fHwYVC+aqQvLlrfx5qlRFezAV+dIFr7vUN3AYVcad3S2L/F8ZtkuzzMbzrm2m8GXej
	hbItJV4XXuUdcF/2jMI/EPKkXqEQOw7CEakVrrlUqVv2JbVqieghKr2N3lcaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794482469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAI4OUL2TrWY37F5xvd0X+8qNL/eL8wyTrg+ONCjoEs=;
	b=PES9tuqo9Rc2Gnym6fcwG8dfYWu1DGmo17wmPa9qqTQHjTS8hP1WW4PtkxX/r6LYy9gBJN
	8BjLO3tCeaspT9vRtBWGmvXnCUOZIJ5qkHZHVH+jJJixfA2BQnm/XP0XCN/1QLylEiJYXU
	qql9Icoea27xCOmdNq5cMMNEKsmhJsZOpIWXoi1Y0MMj6kLVX8h4F4lZEzY1HAFR30KY/j
	OesXXmzpix65Q3jzfj1n3JYRVVHe5/7uEi3iQ9dDSTfbeAEGZ6eginhNJqqOL8W2K9pDqM
	3rLyN8RORqpJoKlf2ALWPtOkz7St8mngyFDx99Jb1E4ReWoUfbvR1iwdw8osyA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794482469; a=rsa-sha256;
	cv=none;
	b=RbCN62QjvVPGiuIyH0q18mcoTd+ZabtKUJhZO45YrUSkyoQ6yXvhc1+ZXSREh4PTcVW+xs
	wd+E6hGHT/NVYmp2Qpd1gpM+oIhO7xlNSFe4qaJFvqbZe4nw2XPPryzAgYeK+sm0A6SqO9
	Rbso7sB5rtOBbsPaGLShEzL4rp6jPnVFeINhHKK7maTw/xLtEthnCQI++w0uiiwgPi/cFz
	lEYIxx0iuudGCyVAkhqN5NbJKuY1C65yxKZvtsehYVdxTwq5RZkrpZikDCJJ1wbrV1tyub
	hFqGdrca+Pb8ByyB5dJwMjaxTV9rVPeDPcpkW2sc14Rezd0u5i057oJIBsj1Sw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <45683ba0cf239f394b621d84cbd5535f7eae410f.camel@pengutronix.de>
Subject: Re: [PATCH v6 14/15] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Thu, 12 Nov 2026 12:21:08 +0100
In-Reply-To: <20261008123338.11081-15-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
	 <20261008123338.11081-15-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032112_958038_75C61E15 
X-CRM114-Status: GOOD (  23.03  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-10-08 at 05:33 -0700, Changhuang Liang wrote:
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
[...]
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

Why is this lookup done in the ops?
It should be done once in fwnode_xlate instead.

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
> 
[...]
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

You can add a custom fwnode_xlate that does the
jh71x0_reset_id_to_hw_id() translation if info->map is set.

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
> +	unsigned long hw_id;
> +};
> +
> +struct jh71x0_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;

This seems superfluous, (map != NULL) means discontiguous already.

> +	const struct jh71x0_reset_map *map;
> +};
> +

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
