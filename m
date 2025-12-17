Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EFCD637DF
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 00:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqwZtwI8ztmWyivgIQejTIGgcjh/dJ/IbTmVLoFovIg=; b=V06npvOx3IdDUv
	+Vq/dLkYIpIsacURanakWEo+/4e8EQ0HgWgwnIbbKgOlUfYfL/mRFv7Ww8O4q522dNdYo3kH3ONKO
	mG7Ul7QwF/Zm2xv0kI/Oku+sHF7qzv7Vv6WxDFRWuWc2MtjdzeFtpTBYsD1Tq/p/jIJBEZ0XS3zg1
	0WXT18YIuqaCVAQ3TdwXi6NbYbW4DqSo685eqi3BTLh5l4N6pGXJluQ3Y5nHLSVaNsjG3BFgylP1f
	3CqIyOB7dCQWFjAITmjtnC6XGl/RuZkfr5/W/lO7hEeeYWxf9xSzkWlaS9MhrY9vpFGBbHLQSLqXw
	IoZd3oiXx1+JH4AhhA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfFi-00000005yzQ-3EdX;
	Wed, 17 Dec 2025 00:18:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfFf-00000005yz1-2FtU
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 00:18:49 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F0A70340C98;
	Wed, 17 Dec 2025 00:18:43 +0000 (UTC)
Date: Wed, 17 Dec 2025 08:18:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] clk: spacemit: Fix module build for spacemit common
 ccu driver
Message-ID: <20251217001833-GYE1903981@gentoo.org>
References: <20251216233514.646263-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216233514.646263-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_161847_622312_E10EF4C2 
X-CRM114-Status: GOOD (  18.89  )
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

just noticed, you failed to CC to the mailing list
please increase patch version and send a v3 next time..

also please see my comments below

On 07:35 Wed 17 Dec     , Inochi Amaoto wrote:
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
> Change from v1:
> 1. Use EXPORT_SYMBOL_NS_GPL to export clock ops
> ---
>  drivers/clk/spacemit/ccu-k1.c  | 1 +
>  drivers/clk/spacemit/ccu_ddn.c | 1 +
>  drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
>  drivers/clk/spacemit/ccu_pll.c | 5 +++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 4761bc1e3b6e..1f42b8045bf3 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
>  };
>  module_platform_driver(k1_ccu_driver);
> 
> +MODULE_IMPORT_NS("SPACEMIT_CCU");
the name should be ok as long as no collision and unique, but..
I personally would prefer "CLK_SPACEMIT" which follow "subsytem + vendor"

>  MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
>  MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c

[snip]...

> index d92f0dae65a4..893af23c6b25 100644
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
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "SPACEMIT_CCU");
> +
..
> +MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
how about name it more generic? you don't know whether any other clock type
will be added in the future, so
  "SpacemiT CCU common clock driver"

> +MODULE_LICENSE("GPL");
I've got a comment [1] from Ziyao in the review of K3 clock driver
that suggest to distill the common probe function, which make sense.
So, I plan to have separated ccu_common.c file, with this change,
it would be more proper to put MODULE_DESCRIPTION/MODULE_LICENSE
into that file

It might takes some time to get there, as I now got a weird panic/hang
issue with that change..

Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
