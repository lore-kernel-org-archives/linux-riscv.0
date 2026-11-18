Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C4606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t7yWdpUn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WDrD1H3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RShW+1fiJ2fmoyMCGg6+vY42itN2akFjI9rZjpRXMkc=; b=t7yWdpUn//all9QGkuMtgla/i1
	PjDjSHDsSMP/YsENmvT14hL2w8qW90w3aEkJxpzeQBo6wk9uTB75E8YZycAueK2wBvBr76FC6RHTs
	hlHdrwdolcZ1LberzxUj+Rx5ZsZnXcWBuAnVMrqebYOyDIL+mJWzxa0JJfQeK/+JgLJtExlH4+k7r
	9dF6o4oL9PBGqRB7BmwuwxLCjgFGHtW7MJ+gCW2r8X/VtN+Ky0n1lziVswSrqBPRaVG8Rj8kNDZ4J
	w0LiOgDhZeyXXb3l3WACKnunFXtwpStVsyY81e93O0BuZO/33ApXGPAq/I5z4IfUToIhxojyT1bYM
	GYnqvdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd58-00000008ad6-3nr8;
	Wed, 18 Nov 2026 10:40:02 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd55-00000008abk-1Mhh
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:40:01 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 63A3E205ABD;
	Wed, 18 Nov 2026 11:39:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qgV51lQfbPmoVLDYc4lh1LBLyAhLf4rlNQEJBmbUtM=;
	b=WDrD1H3OQdqxpzt2K+Os+PL/Xg13a6fAB2KM2rI78HVBmCvDV7X59bvb7klMVupGc8jlV2
	hyJ3wsS+RxnwsLqx0QN5gkxGpk3SRtbnikPS26RB3gGqo8IFHSuqhqV5XR3ZdwG3HccZ0V
	6X1fUhxJqmlpYF+6dK3zXTSUHQi7BEWsEX9RC409L9E0MVpcyypJBImfCEpQpONHu0EoXH
	NdxeyYR4sW37DBnWEcy2UnNdBoIF/rnNR6L55OOWLT+798ownl1EioLqUw8uBJWiCDeX7h
	Au1RmXa9n6bnfz99uxX8KNqeUAt2djvF/JITe9YWN/3CUZqUUDJRhiO4BaDHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qgV51lQfbPmoVLDYc4lh1LBLyAhLf4rlNQEJBmbUtM=;
	b=MqwAROTZEUWmG2eZXfFDHQYyRGUWRV4aVqlZUcU3juXhvzRoXkNzzqnOeQmoyg3SmVaIbk
	LdwPSamlQeDgGnW02aKASGo0bKFA8UDQ1W3xAlo6Af5uu1y3s9KAun/fAbZCkXDGmVtsW1
	2ylQiimICGuT6FVoBPFfUl34+zSolGMlVaoXz3zyR+TcUM1pKlxW9OrDfMRbRpY6G/zgKW
	T426xiwZaHlvyiBvAhMA2LGexbrQ+XgK0nWSgzw4cxUaiLAmTUhl/LEK0/d+vT8bGtNyHV
	HZKRsGiyaehpwgmfpJqtkXG3xSYUrjdR7vV3iffwkYpVXhFEOs8Ac02HRZiMlw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794998396; a=rsa-sha256;
	cv=none;
	b=RkDivegUVpLxKrgosKaPcaah43MmswUWXEqOJR+xRBejwd8C3ildc0Y9w6soFb1bX27feU
	tqeKSp/NFyIxGTb49GUy38y0AxLoMOFq5uCbATnmgs79k+U9CLLCJhkbMMGkVo1BwZHj0A
	9p+9JrFAfhAY98ClavIrK1fKnoBtGbUVfEEtuOJ71jwcV0xCFsXMAD9CaBKr/jOS/Z8fo/
	8Wv7cAwYIqKwPzezGVsfOGrWgIPu4xWB9uaBPy6l1nmZ2cPV2faeInCox1Ov13NFLTxPTW
	NaLG7Z16HLoSfeMmLrWA6YoPHZvIUZBFpEzxRlasDvJ3dB+z926Fc1oiPcUhGA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Wed, 18 Nov 2026 11:39:56 +0100
In-Reply-To: <20261118100523.11395-6-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024000_017239_26F47AF5 
X-CRM114-Status: GOOD (  18.16  )
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

On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
> 
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for such controllers, a table of
> hardware reset lines indexed by reset ID. Add
> reset_starfive_jh71x0_register_with_info() to register a controller
> described this way.
> 
> If a map is provided, install a custom fwnode_xlate callback that
> translates the reset ID of the reset specifier to the hardware reset
> line. The translation is thus done once when a reset control is
> requested, and the reset operations are left untouched since they only
> ever see hardware reset lines.
> 
> Existing users of reset_starfive_jh71x0_register() are unaffected.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> index d410a5a0ded4..5c64d47fb530 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
[...]
> @@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
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
> +	data = devm_kzalloc_obj(dev, *data);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.owner = owner;
> +	data->rcdev.nr_resets = info->nr_resets;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = of_node;
> +
> +	if (info->map) {
> +		data->map = info->map;
> +		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
> +		data->rcdev.fwnode_reset_n_cells = 1;
> +	}
> +
> +	spin_lock_init(&data->lock);
> +	data->assert = assert;
> +	data->status = status;
> +	data->asserted = asserted;
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);

Does this really need to be this verbose? Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
