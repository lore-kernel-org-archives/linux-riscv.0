Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC69C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2qhH3a7N2X0tuWdBhDMNZEXebisnd5iRKRvP4dNAY0=; b=fKyE2+i1aEmCy9
	DSBtr95FmZMw7qICDRUk1RUyrULf3d9rSL/Zpl75estYSVDMSgZ8stYAC1P0arEhETtXM9dSN6v1T
	N4jgLibYo2MFeIxfeFWOBmr39n/wtyhSMsup7enSrycw69k1k1artcDaf4kzTF9B+vyKVte4CZ3qg
	XgVJ6JaOxnJM5BFEegUi2TbWqAgeKaIsxeYsW28k8ooD0+lqU9I5/XnG/3VMBMQWmATMqnReONwvC
	Yxh/gRzRQqDnTTJq9pfziZ9yIDo/HHcWOYcHKh9Lp6zN6wu5h55NqB8+rqh70wdXOo97AEIOyX/kT
	iDf8T12zFiLjF2sNPlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twgNE-00000002z6s-3xDL;
	Mon, 24 Mar 2025 11:53:44 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twgNC-00000002z5h-0Dl5
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 11:53:43 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 35195EC59EE;
	Mon, 24 Mar 2025 04:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742817220; bh=PslLqZRPAv6THOn+aClNegRKFMnOjNSyR7ChIic37Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnfWXEb5quXO8QebTk3oYdvqnRQFyYnIO3C9LAFwhDyuBvUBGqCPW71s2Bk9BMo1C
	 ODCv9TOWljXAYL+I2M0xm+4zY3DhJTye90S5Mq+rJR6yHm40BMdFaH3Gd3trwAO+xH
	 RKW5wOoC5rc2aCz7K5m0yOG+pP0PRvwpYGo7iQceokMSQelKfHR7m719ilrtV1n04M
	 d6UhKefzlY0FIJ4wgunttGWM77IzYtD3yvSgG8Hx2Iqhsvq7sQocB4TE53HBpcXftP
	 jhvJKKjpEWtfC8X5tQd7VeyR6PocIqKcsWBSgUpDDtZqffSlHVsoM8u8YSY8N13R/L
	 ES+RO6Kt0QlNg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amLNQ8lVeRXh; Mon, 24 Mar 2025 04:53:38 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 548E1EC59F1;
	Mon, 24 Mar 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742817218; bh=PslLqZRPAv6THOn+aClNegRKFMnOjNSyR7ChIic37Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQ6kxnKbFquVXp4L/B8k8qS93mpqZQn2LA68FSV0QKSKOpw7iU8DZIX7I0B2t60k4
	 37gOk4rrguvAPfViOmT5OAWlUfav5UkWdQ/34oQkVsaYc8cGwdrr9uAdRBCGn+aAG1
	 CRk+iLC8rCKR94Aed6870nYUso1dYB5td8yU9xeY58UR/4SJ0lujAo2j0HIH7M0gt8
	 v4sBNPH7KjkK1HEJa+L7vsYJCmOUuf0zAfOywB+j3PtKv5mfZ7URRgPLobu4lWRYRP
	 EGATZmOpseqDQPeDycny/Je1UL4CDnTx/eYsSqV4cms8Sn+jXlcDj//Cmwm5cKUqwS
	 Bw9VXC3LiLgaA==
Date: Mon, 24 Mar 2025 11:53:27 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
Message-ID: <Z-FHt3mDyEBKpa8O@ketchup>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_045342_278962_2030C283 
X-CRM114-Status: GOOD (  28.48  )
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

On Fri, Mar 21, 2025 at 10:18:25AM -0500, Alex Elder wrote:
> Define a new structure type to be used for describing the OF match data.
> Rather than using the array of spacemit_ccu_clk structures for match
> data, we use this structure instead.
> 
> Move the definition of the spacemit_ccu_clk structure closer to the top
> of the source file, and add the new structure definition below it.
> 
> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().

I've read your conversation about moving parts of the patch into the
clock series, I'm of course willing to :)

> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 58 ++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 44db48ae71313..f7367271396a0 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -129,6 +129,15 @@
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>  #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>  
> +struct spacemit_ccu_clk {
> +	int id;
> +	struct clk_hw *hw;
> +};
> +
> +struct k1_ccu_data {
> +	struct spacemit_ccu_clk *clk;		/* array with sentinel */
> +};

This is something like what I've dropped in v5 of the clock series so I
doubt whether it should be added back in clock series again, as at that
point there's no reason for an extra structure: Alex, is it okay for you
to keep the change in reset series?

...

> +static int k1_ccu_register(struct device *dev, struct regmap *regmap,
> +			   struct regmap *lock_regmap,
> +			   struct spacemit_ccu_clk *clks)
>  {
>  	const struct spacemit_ccu_clk *clk;
>  	int i, ret, max_id = 0;
> @@ -1648,15 +1668,24 @@ static int spacemit_ccu_register(struct device *dev,
>  
>  	clk_data->num = max_id + 1;
>  
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		dev_err(dev, "error %d adding clock hardware provider\n", ret);

This error message definitely should go in the clock series.

> +	return ret;
>  }

>  static int k1_ccu_probe(struct platform_device *pdev)
>  {
>  	struct regmap *base_regmap, *lock_regmap = NULL;
>  	struct device *dev = &pdev->dev;
> +	const struct k1_ccu_data *data;
>  	int ret;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;

Looking through the reset series, I don't see a reason that
of_device_get_match_data() could return NULL. This is also something
you've asked me to drop in v4 of the clock series, so I guess it isn't
necessary.

>  	base_regmap = device_node_to_regmap(dev->of_node);
>  	if (IS_ERR(base_regmap))
>  		return dev_err_probe(dev, PTR_ERR(base_regmap),
> @@ -1677,8 +1706,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
>  					     "failed to get lock regmap\n");
>  	}
>  
> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> -				    of_device_get_match_data(dev));
> +	ret = k1_ccu_register(dev, base_regmap, lock_regmap, data->clk);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to register clocks\n");

For using ARRAY_SIZE() to simplify runtime code, it's mostly okay since
binding IDs are continuous 0-based integers. But I split the handling of
TWSI8 into another patch, which creates a hole in the range and breaks
the assumption. Do you think the TWSI8 commit should be merged back in
the clock driver one?

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
