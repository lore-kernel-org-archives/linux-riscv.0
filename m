Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F3CCF2C7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 00:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFA5Sc1RczJ2+pt5FzUVBKSoBMSK0uTaobgL6uUDGtc=; b=hstb14qtYDxdan
	pOs5Q63Q4LU4tUtNLmeWK1vPE3SDG0dwKKZHXTb8LPWcFVQotE0+ML2wO6+QVtr+kAaylpb3JaumK
	gri0XxOiDWzpA++FE96jJEyLB5Ro6EoHS5mTIFIt4JBYXrhliSyUhpyiP/SFQdtw7qv+3y/3uZsRU
	zHw6ixEop1QmE32xPPIZL+psdC1fCi8nQnyGh3z/GPHxVG7fXvIeJIU8xksWQUwsYMgYl8I1bg+Zj
	rWJMbi84af31CkeNIzB8n/IFL+4oF74MLaE2sNf+97ciI2l7QVpc0uWQhQXpRAIXlJMTiA4REx2Mr
	Ms0gpDrGuMTXnDCf63Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIEK1-00000005MJr-3B7z;
	Sun, 18 Oct 2026 00:00:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIEK0-00000005MJk-1PHt
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 00:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1A4E43B0C;
	Sun, 18 Oct 2026 00:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6FD1F000C4;
	Sun, 18 Oct 2026 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792281615;
	bh=N6M32mEa33bKutMk3aL53Y6aX/BFdZJWD6dchSjXyWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3WxzISbgYjZww2ONxRhoaWVqEzv+aCcwbJi5fDjJMCUNcfgGuk9pg3MN93YIoPuI
	 lSAOcB0U5usa1+Hy6kcm63qMvSCww6U2uiKtzSXrGZOqRWn0G1fz7XZfbG04E6COQ9
	 G7MEI/9nlITb2vgYeMztu4m2kt5wa7ktY7ddz/WAzhyQ7dKoo330QsbBdZKEtdC0Cb
	 kqrGP0R0VXUBLo7aJdBGVujjBCLAwej/PEYD2kyD8ftFpjpBN83SP7/EC5/LyheKns
	 +Y51IJh5CrqJ29Jjkc55Jj2lRsAG4LKd/PQ3w//5wAyeBZzl+3sSh7+6BtG8E2pqRv
	 O8hF/5Mz3/V/w==
Date: Sun, 18 Oct 2026 00:00:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
Message-ID: <20261018000013-GKA112262@kernel.org>
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
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

Hi Hung-Chun,

On 22:08 Sat 17 Oct     , Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
> 
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
> 
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
> 
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
> 
Also match vendor's code, see
https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/reset/reset-spacemit-k1x.c#L317

> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
> 
> Build-tested only (riscv defconfig, W=1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
> 
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> index 8f3b5329e..dbd783c13 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k1.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k1.c
> @@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
>  };
>  
>  static const struct ccu_reset_data k1_rcpu2_resets[] = {
> -	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
>  	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>  };
>  
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
