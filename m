Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7CFCA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUMA51CnBW63AwWMqEnaoexBjP0uNN3Imx1vOZHbYAQ=; b=qNRAgfv9VV7+54
	jV5k4RHphyMxOcT/btb4us5ckhZeqG4wAAURVAlj8GSxolieFRjFLqNlPAtvLieEfvOMSs6AW/8Uk
	+6vUIPWARXcxs/taW1YuB9Gg+P/JibHbnpFK30jAPTu6h7b3Qr77Otmy5BdCvLNk2fdi+b3mswkSy
	nNO3PpYRx8mS0dvRXaik4EZvVtJIPib6EXZ3BO5kcBCD/Cj6oKQ5I4k/xojt33bkb84oFFfurP1qT
	V4leoTDncrQ14eIhaS9ImLQYkLOYOq+CgFnHikLRBx1jxHXytJrLKI0AsPqqdM6h5cqjuQFBRk8Tc
	6mpYYEh5aasNXTqGjLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07M-00000007akk-3Y8v;
	Mon, 18 Aug 2025 13:41:44 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwj6-000000077Q0-3CsQ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 10:04:30 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 9FA0C12FB458;
	Mon, 18 Aug 2025 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755511467; bh=UWt7N+4RQyhLxa/8B24DwDg6beeMRBqY7R8dGE6WUXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUTJerPioqaY8k+zBGOi2XjjY4kTawdPV5Bv/XgJa+nWn6mffS5FoqUW61pE+PsOo
	 f5ns+ddo9qlJORHSWUgEywbDF4OlpcNj616oGObQP3bCtUM5YXnbWzR8gLwLxVucS1
	 Ccn38RVVYpV4BAJ014Fs973eFm/xMx/M/GlRCMtHDgY4nQIB+cKsT0fWEwAzQZ0oVh
	 xxdqkswi+RO4Yz4w9/07BWO05Bs/2cCPnCyNZ4rZA1wuJqZbezZ/iuexuFPBBs+pG8
	 4TXoCC0KNM9sosZqgB9lfLh31cGkIoY6z5EPG92TAst1dzlUlhXnePadW3j7SO3Z6V
	 2DikY37PAMIHg==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJRSaq7kXkgL; Mon, 18 Aug 2025 03:04:24 -0700 (PDT)
Received: from ketchup (unknown [117.171.67.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 6A54512FB42D;
	Mon, 18 Aug 2025 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1755511464; bh=UWt7N+4RQyhLxa/8B24DwDg6beeMRBqY7R8dGE6WUXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wr2h2IeoUDA798Uf9bZU+Gg3cx2Bm4QG0bT76RLbm4eOlL65g48kcYKssKY99S+NJ
	 /DwILeS4fCJXt5CbbH1hUrHKGrE+LI/TJ4FtBWZNaZpQB60+VB6wopQge7CuLK+Wqj
	 h8FKi/csxSXf0cLoBceC56t6Muo0QzUJaQ76jB3WRa7gprf30GfB73q2+qlceYdy9N
	 ZMnBqGqidE5dHnaqGv7bY5oL4Nv6aGZh4xapAqk1v30/PXd7qxXArFrBfKLge2SRCh
	 ylCd5ZgTTCA7zCYFrv1L641Qg4VaTea/0YokiTG2NG69y9HXwogsSxDFJi5AIufGyk
	 6Defpki1+nmjw==
Date: Mon, 18 Aug 2025 10:04:18 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: fix i2s clock
Message-ID: <aKL6ormE1N72fwVG@ketchup>
References: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
 <20250818-k1-clk-i2s-generation-v3-3-8139b22ae709@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818-k1-clk-i2s-generation-v3-3-8139b22ae709@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_030428_975244_D3C57C14 
X-CRM114-Status: GOOD (  25.94  )
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

On Mon, Aug 18, 2025 at 05:28:22PM +0800, Troy Mitchell wrote:
> Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> for real I2S use cases.
> 
> Moreover, the current I2S clock configuration does not work as expected
> due to missing parent clocks.
> 
> This patch adds the missing parent clocks, defines i2s_sysclk as
> a DDN clock, and i2s_bclk as a DIV clock.
> 
> A special note for i2s_bclk:
> 
> From the definition of register, The i2s_bclk is a non-linear,
> discrete divider clock.

No, it IS linear. It just comes with a 1/2 factor according to your code
(I'm assuming there's a typo in the table below).

> In calculus and related areas, a linear function is a function whose
> graph is a straight line, that is, a polynomial function of degree
> zero or one. (From Wikipedia)

> The following table shows the correspondence between index
> and frequency division coefficients:
> 
> | index |  div  |
> |-------|-------|
> |   0   |   2   |
> |   1   |   4   |
> |   2   |   6   |
> |   2   |   8   |

Index = 2 appears twice in the table. Is this a typo?

> From a software perspective, introducing i2s_bclk_factor as the
> parent of i2s_bclk is sufficient to address the issue.
> 
> The I2S-related clock registers can be found here [1].
> 
> Link:
> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
> [1]
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
> Suggested-by: Haylen Chu <heylenay@4d2.org>
> Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c    | 29 +++++++++++++++++++++++++++--
>  drivers/clk/spacemit/ccu_mix.h   |  2 +-
>  include/soc/spacemit/k1-syscon.h |  1 +
>  3 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 7155824673fb450971439873b6b6163faf48c7e5..b2c426b629a37a9901bbced26fc55c5f1b34eba5 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c

...

> + * i2s_bclk is a non-linear discrete divider clock.
> + * Using i2s_bclk_factor as its parent simplifies software handling
> + * and avoids dealing with the non-linear division directly.
> + */

And thus this comment is wrong and misleading. Suggest something like,

	Divider of i2s_bclk always implies a 1/2 factor, which is
	described by i2s_bclk_factor.

> +CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_bclk_factor), MPMU_ISCCR, 27, 2, BIT(29), 0);

>  static const struct clk_parent_data apb_parents[] = {
>  	CCU_PARENT_HW(pll1_d96_25p6),
> @@ -756,6 +777,10 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>  	[CLK_I2S_BCLK]		= &i2s_bclk.common.hw,
>  	[CLK_APB]		= &apb_clk.common.hw,
>  	[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
> +	[CLK_I2S_153P6]		= &i2s_153p6.common.hw,
> +	[CLK_I2S_153P6_BASE]	= &i2s_153p6_base.common.hw,
> +	[CLK_I2S_SYSCLK_SRC]	= &i2s_sysclk_src.common.hw,
> +	[CLK_I2S_BCLK_FACTOR]	= &i2s_bclk_factor.common.hw,
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
