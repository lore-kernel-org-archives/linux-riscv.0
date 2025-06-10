Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00463C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mepi2UzjMvrBPESRc7yFHVuSGMy4NKD7UK3tNDItk5w=; b=C7rgHjeA43ADW+
	UNyY4VKhGNxb1eo2TsqUMbtlerI/J1YbcvZ5z7F1NCxmKr0UZGNRu5wlyBeSiFsCgCb4XJx9bOFDu
	AYdN5eX5XteWRCoTpLkeNWjnDVVOYxkDyPHGtGE7ZLSLljN0Ouf2moi7pMRgwnPD+e17q6Ofc655B
	V6FYbNsW3/aR3O2uSlLYxZU8L+Tcli3vHfgapkAx1sPsLEx/LbVLIx3y/cpYOu/rXJW2eNc3roeFA
	zSurlwkjZvxenYBSta/P7Atnxxz9AWSoj6BVzliqF8snJWoEEt+YeI6uQgw3xC1OGqhIzTEjVr0RN
	Rk0P5lxL1G5bADOnggyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOofo-00000005dTi-44BK;
	Tue, 10 Jun 2025 02:25:12 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOofl-00000005dTD-3Jhk
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 02:25:11 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 20F6712FB433;
	Mon, 09 Jun 2025 19:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749522307; bh=IMmtBik7W10xX4m9PnqOtXcNyM+mtowpc5+2eIWNlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEAqROr9VweQBKcxEhpxmEHnT+4pFORbcR3Ot5zp/XR+EvhEZlo1o7gJ3EnFtwa0V
	 t1NbZ2Xn9zeaqUu/i+P5oCGqElASp7V8dRgM5BTnOiNj+hwq8WapPeFqVSVa1a5Up1
	 T3Ud4pJu8bAzkHiHbY6y6BUioJ+bOl7gnGNXDwBk6uTweGFtnm+3SL5NSOt4/FN7lD
	 iKEd254k86K3+QLxRkU9cLngbuxXNH/1H5jRWaqSqjn63BhBpPsnRbCusVxmkqhxap
	 aLzCNnOtYNKEwzhVk/SrbG8OOOmga8iql766DFsC53TB94TgvLBU9D9NPB8EWD9lJm
	 7OsvVimrfI9qg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9cSwMwTxp-i; Mon,  9 Jun 2025 19:25:05 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7C6DA12FB401;
	Mon, 09 Jun 2025 19:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749522304; bh=IMmtBik7W10xX4m9PnqOtXcNyM+mtowpc5+2eIWNlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9h7iXFXydWGsUipKqKnrQ3i4Ns+MWx0DvfJhmKPRaEVBu0GlKiV5XOe6wrf9Fs22
	 kuZRj4cj53NsBZ0+M+gsSDaoD8/cSZwTdXjJxRKI6yxJp46162CL1JTOWphEAszrF/
	 qndRGSzI+RpT/uk+WZRbKRoRip/C63yocEz4CRXSDRfcm2kiG1uqj+i5keGORlwF4K
	 J9sU/L+WQBfnIOTsMCfck/0ztHDLg35wGYE7uuAIiawixKyQr32oUftBxHHvN8ejAL
	 bjE4lndqsbhjd7RnSnskF1/J3EX1L1A4Xycwf/PKZ773FltMgRQ5ptMApFk3cLSr2/
	 DTA7h5zMCEQnA==
Date: Tue, 10 Jun 2025 02:24:58 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org, inochiama@outlook.com, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <aEeXepzJ2Qkv45qm@ketchup>
References: <20250609200822.468482-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_192510_283563_C6CCA95B 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Jun 09, 2025 at 03:08:21PM -0500, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Reworded the description to provide better detail
> 
>  drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>  drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>  CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>  CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>  CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>  	}									\
>  }
>  
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +struct ccu_mix _name = {							\

This should be defined as static as well. I think this is the cause of
CI warnings in v1.

With this fixed,

Reviewed-by: Haylen Chu <heylenay@4d2.org>

> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>  #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>  			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>  
>  #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>  			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
