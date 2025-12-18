Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8ADD68BDD
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsnTnozAbcmwz116gNtJgiz7uv0yFD8ExSNeaIJnP0k=; b=d9W5Mnl1SUMpNa
	0NmVnsdybTtGrR1BhAbaRVa2O8eL++tMmUghbbrSwtJ5zUp7gIG9XxipxCiRA285gLRQgQFFItcns
	BKri+0XoyHvO9XSht3HK+CdF2EBCXVUWeGsXccP8j2W2sjuT0cZXblj8XFSu1UlQvEzWalK7HrKeo
	AqPAgkXNGxWqmrEWUb187FqGI3g26clT20hIdI6Slu9sECG4jl4kGlYG9W4Saj2IvexBADAoDEeny
	OTDsmTXvtLzr0VgnNHI0zBL72Lc2Wi4ifbRoaluZkYzX5HNJrrGmFWD9On6uJyDQyWB9VDGBwxOb9
	wbC8pBc1aB5BMgYZnKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8ap-00000007y8y-1tHa;
	Thu, 18 Dec 2025 07:38:35 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8am-00000007y8Y-3tki
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 07:38:34 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84644340D96;
	Thu, 18 Dec 2025 07:38:29 +0000 (UTC)
Date: Thu, 18 Dec 2025 15:38:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251218073818-GYA1939847@gentoo.org>
References: <20251218004227.221861-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218004227.221861-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_233833_015955_3C51C2E5 
X-CRM114-Status: GOOD (  16.20  )
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

Hi Inochi,

On 08:42 Thu 18 Dec     , Inochi Amaoto wrote:
> For build spacemit common clock driver as a module, the build
> process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> build will fail.
> 
> Add these missing hints, so the driver can be built as a module.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c  | 1 +
>  drivers/clk/spacemit/ccu_ddn.c | 1 +
>  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
>  drivers/clk/spacemit/ccu_pll.c | 5 +++++
>  4 files changed, 16 insertions(+)
> 
[snip]..
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index d92f0dae65a4..7389202c4831 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/math.h>
>  #include <linux/regmap.h>
> +#include <linux/module.h>
>  
>  #include "ccu_common.h"
>  #include "ccu_pll.h"
> @@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
>  	.determine_rate = ccu_pll_determine_rate,
>  	.is_enabled	= ccu_pll_is_enabled,
>  };
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
> +
..
> +MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
> +MODULE_LICENSE("GPL");
can you creat a separate file ccu_commom.c, and put above change there?

the reason I request this is that I'm trying to refactor the driver and
will extract common code into file ccu_common.c, with this coming change,
it's more proper to do this adjustment, which will avoid future code movement, 
refer the link [1] of the review of K3 clock for why I'm requesting this

to Stephen, if you have no objection, I'd hope this patch can be taken via v6.19-rc2-fixes,
and then I will do other follow-up clock patches on top of it, I can send a PR for this fix..

if with above change, please add my R-b
Reviewed-by: Yixun Lan <dlan@gentoo.org>


Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
-- 

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
