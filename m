Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F0EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNyqUcrpuob3SG6ndo7/VRmhet06nPLZzyBNJCYlFXk=; b=eIZmKT6SBFgHys
	LHLZxoePs6F00F+6Y0+F8tiv6TXDz987i2mBnmOTme2n7dgBg3PcUog4vWF82k2iK159Q2AJX3yvx
	zZCMOK+jK8UHPsiG3uLHpfqSNHkN+UT5OgE4JpkAiZLLoGklrumodLi1TN/l7Oj4Vi+qz2MZkmtP7
	oYtZXmtHdbLXg6xomy/PZDeYneaq9rYRTrfYWyc9CW5GRfO8uy0L5o+gT0RlaZVjhWwqZQDdTfBlJ
	rvjtPsGvZU4Fbiht7RgXBAlcRkC1NeLSDTLCZg2isRkklixabYbTGhzn955tM0ahtIZ/XEHWQynwi
	k0vFZ9EpylgGGfpeG+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4sJ-00D3Oh-2V;
	Sun, 16 Jul 2023 16:45:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4sD-00D3K9-2q
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:45:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9923833737eso454669566b.3
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689525927; x=1692117927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKIpXva7ywFQzvsW5jQNH5m3B3QzrfOqCNOqVk8oz50=;
        b=kodCJleFEUOHRuJPtP26v+P84+kVvYPBCDu/itY+DlTNmCqAlCV8FZV/1YW2xkMj5q
         L9cTYZx9TavnKL5BFtFhHp0vEM94U1Lf+XVk1GseG/euUu0gUs7NsujKxjiKsiKJWfSR
         0nFHtdMPVhzVe2nneZStFqCUn4zA4mBifxZ5rODOyea9X1w5/G2p2i/XDEi9i/oP+hiP
         ybZSjI4aREC0wcEaoFOk29M3mNLLP1FU7ii/t1rbMvI5gVfZeukt7Kg9++oXHtjHMp4U
         83tjVNx0VweeKPE4XBtgrpbgQu8aY6V7tjPFNSFKPmGdseyldThIlYWNGbUAO/JCiXiO
         3keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689525927; x=1692117927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKIpXva7ywFQzvsW5jQNH5m3B3QzrfOqCNOqVk8oz50=;
        b=WaopLTt/qy/5cyDOPIcDFM9QH9pT6xUWsh/6yyL221mkdWpzx1d+WGd4XkJQqWgRRQ
         GbkvZQ9a9QUhuM5b/DFef62W/s+aP5mRbBmZH6z3uBtTBI92TDYkjUnJXbTe/4CLtRgG
         1lxQtnbowzTfH06jGrtrTpJD0dzatGhSwsr1XuyH43w7YWoStGbVb2Qxw0iIO07zoNmv
         ba8r6JFrbYcMT2GRcT1ph4axK0yUZZBGhCLdShY33I4EU3uQWh3Xzpd37GhZ1jyK7aBB
         IfKUZ+jvOjtT7TEvlAt55HZ+VDYax6RI2sPbGwPD75uicMyVSYb+M5dHq7NCrqJM9+gG
         hQcg==
X-Gm-Message-State: ABy/qLY+h2FD2Ws7F4eoiGGS2wNVNMCT3/us/qKNuLrUmlDmLbBLBkw9
	+eXnZ5B3ecVPT95tdOq+VbE=
X-Google-Smtp-Source: APBJJlH7dHV0aPBa0/hAZAevvgrCk4G69iZisJ5PGh3fHh08Fe+InkC8mXmUPnRa0o/WjvFIlH3qag==
X-Received: by 2002:a17:906:208d:b0:994:34a2:8727 with SMTP id 13-20020a170906208d00b0099434a28727mr11072273ejq.41.1689525926889;
        Sun, 16 Jul 2023 09:45:26 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906261a00b00992f8110a2bsm8161891ejc.150.2023.07.16.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 09:45:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Jookia <contact@jookia.org>
Cc: John Watts <contact@jookia.org>, devicetree@vger.kernel.org,
 linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
 Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/4] can: sun4i_can: Correctly set acceptance registers on the D1
Date: Sun, 16 Jul 2023 18:45:25 +0200
Message-ID: <4844353.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230715112523.2533742-5-contact@jookia.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-5-contact@jookia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_094530_600744_039364A4 
X-CRM114-Status: GOOD (  20.27  )
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

Dne sobota, 15. julij 2023 ob 13:25:22 CEST je Jookia napisal(a):
> From: John Watts <contact@jookia.org>
> 
> The Allwinner D1's CAN controllers have the ACPC and ACPM registers
> moved down. Compensate for this by adding an offset quirk for the
> acceptance registers.
> 
> Signed-off-by: John Watts <contact@jookia.org>

This patch should precede patch 3, so in next patch you add full D1 support.

Best regards,
Jernej

> ---
>  drivers/net/can/sun4i_can.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
> index 06f2cf05aaf5..c508a328e38d 100644
> --- a/drivers/net/can/sun4i_can.c
> +++ b/drivers/net/can/sun4i_can.c
> @@ -91,6 +91,8 @@
>  #define SUN4I_REG_BUF12_ADDR	0x0070	/* CAN Tx/Rx Buffer 12 */
>  #define SUN4I_REG_ACPC_ADDR	0x0040	/* CAN Acceptance Code 0 */
>  #define SUN4I_REG_ACPM_ADDR	0x0044	/* CAN Acceptance Mask 0 */
> +#define SUN4I_REG_ACPC_ADDR_D1	0x0028	/* CAN Acceptance Code 0 on the D1 
*/
> +#define SUN4I_REG_ACPM_ADDR_D1	0x002C	/* CAN Acceptance Mask 0 
on the D1
> */ #define SUN4I_REG_RBUF_RBACK_START_ADDR	0x0180	/* CAN transmit buffer
> start */ #define SUN4I_REG_RBUF_RBACK_END_ADDR	0x01b0	/* CAN 
transmit
> buffer end */
> 
> @@ -205,9 +207,11 @@
>   * struct sun4ican_quirks - Differences between SoC variants.
>   *
>   * @has_reset: SoC needs reset deasserted.
> + * @acp_offset: Offset of ACPC and ACPM registers
>   */
>  struct sun4ican_quirks {
>  	bool has_reset;
> +	int acp_offset;
>  };
> 
>  struct sun4ican_priv {
> @@ -216,6 +220,7 @@ struct sun4ican_priv {
>  	struct clk *clk;
>  	struct reset_control *reset;
>  	spinlock_t cmdreg_lock;	/* lock for concurrent cmd register 
writes */
> +	int acp_offset;
>  };
> 
>  static const struct can_bittiming_const sun4ican_bittiming_const = {
> @@ -338,8 +343,8 @@ static int sun4i_can_start(struct net_device *dev)
>  	}
> 
>  	/* set filters - we accept all */
> -	writel(0x00000000, priv->base + SUN4I_REG_ACPC_ADDR);
> -	writel(0xFFFFFFFF, priv->base + SUN4I_REG_ACPM_ADDR);
> +	writel(0x00000000, priv->base + SUN4I_REG_ACPC_ADDR + priv-
>acp_offset);
> +	writel(0xFFFFFFFF, priv->base + SUN4I_REG_ACPM_ADDR + priv-
>acp_offset);
> 
>  	/* clear error counters and error code capture */
>  	writel(0, priv->base + SUN4I_REG_ERRC_ADDR);
> @@ -768,14 +773,17 @@ static const struct ethtool_ops sun4ican_ethtool_ops =
> {
> 
>  static const struct sun4ican_quirks sun4ican_quirks_a10 = {
>  	.has_reset = false,
> +	.acp_offset = 0,
>  };
> 
>  static const struct sun4ican_quirks sun4ican_quirks_r40 = {
>  	.has_reset = true,
> +	.acp_offset = 0,
>  };
> 
>  static const struct sun4ican_quirks sun4ican_quirks_d1 = {
>  	.has_reset = true,
> +	.acp_offset = (SUN4I_REG_ACPC_ADDR_D1 - SUN4I_REG_ACPC_ADDR),
>  };
> 
>  static const struct of_device_id sun4ican_of_match[] = {
> @@ -877,6 +885,7 @@ static int sun4ican_probe(struct platform_device *pdev)
>  	priv->base = addr;
>  	priv->clk = clk;
>  	priv->reset = reset;
> +	priv->acp_offset = quirks->acp_offset;
>  	spin_lock_init(&priv->cmdreg_lock);
> 
>  	platform_set_drvdata(pdev, dev);





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
