Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA3C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGwQtbyFo8b9UaHQ4MTR7eSQxNTGDKUXPpuy+cOX5QQ=; b=GlN+GT5o2Wej3H
	1GKd6DmCbvD6YECJf8K0iEk2zjikRszA3XLQb+xtk4iy0yQvcSmFTmd3la/v2ZqmtOQtOBUZIF32B
	2Ard9M0SmanRPW3eNb57P5JhoyYeDL5gIpDmg6/UepFmocTy/aXH+mJ3M46p7SFzUmfQiYzA0dcV/
	P76AkKFAcXp5W+3jzGOgBpKgoO8bXxTuNNRqiM/1NJ4gJM98H+mTbeRCnGHj2GEbyX8qd0s6mWO5o
	5vuewKDowg5DT88t5jvxeqsrxdNACJKnwgDy+6GBMJPaQN+f2GHzZ/unpIWc7zLPT6dTjoKBTBIdZ
	gM7M4k2jRq7PotCCjH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhR6-00000005Oqu-3kp1;
	Wed, 24 Apr 2024 18:33:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhR3-00000005Onf-347f
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 18:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F93CCE16AE;
	Wed, 24 Apr 2024 18:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC06C113CD;
	Wed, 24 Apr 2024 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713983614;
	bh=Dw8j7UKEfEeuS79L8GjGzjL5AGQkzmeP8Nd1vojpPGc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aG/yl7TGtQI9wbVbRfELyMxQuph9Oqp+keaN4+hAGVfCnFPiIHcszwjrgMCLEoxQL
	 wgsZGU+M+PgUpWolCFxOo0sXAIOo/DH5CSaVlpmZ3WoPkUsGmHvgd5JgxqLNAQzqnD
	 DkuUMCJIxh4fAOQC0X9faEleSmBp+Lii9IHjBEPsXWFV7WIHwEMv+qMHMP2oJ4IM71
	 drTejasbH+oAN4OoriNtwxI7GNW0nbHQHnpmYMN52aVCsLdobi9Fuvqpg5+Cklp8tY
	 L6jeFlTCptxOy7frDi/w17CdezBgV3FeUil6RCKzSLZ2oN/CgwguH4Y+f14UPzqHvM
	 poQGczQkOZ2Ng==
Message-ID: <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240424-strangle-sharpener-34755c5e6e3e@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to the reset subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Date: Wed, 24 Apr 2024 11:33:32 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_113337_984308_E63174E2 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Quoting Conor Dooley (2024-04-24 01:42:08)
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 7f3fb2d472f4..710f9c1676f9 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -121,11 +135,15 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>  {
>         struct device *dev = &adev->dev;
>         struct reset_controller_dev *rcdev;
> +       struct mpfs_reset *rst;
>  
> -       rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
> -       if (!rcdev)
> +       rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +       if (!rst)
>                 return -ENOMEM;
>  
> +       rst->base = (void __iomem *)adev->dev.platform_data;

Can use dev_get_platdata() here?

	rst->base = (void __iomem *)dev_get_platdata(dev);

That's sad that a cast is necessary. Does it need __force as well? An
alternative would be to make a container struct for auxiliary_device and
put the pointer there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
