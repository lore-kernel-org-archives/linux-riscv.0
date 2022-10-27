Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D485FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyh5x/3goEpLHuB7X0KrSBDj2bFw0oopO5WjuwBTmGU=; b=e1oPk8OTCV627E
	ZpHdfjG4quCt6fLiuLtbfWoDuzPC0xqB++0ouwFcM2MbaysAMoRK8zXb2ovyfw+V3fiHPTUMGmUSW
	7El3V5XV025nKTet0/G5Hv53kuFTmbqNfvZAlozg8SQQgXZLTeTP2gTXFrfElsHle0qG351jOzjE3
	/zRrYFKqtBKT/h3TCUCdGgj9BUWDaZ3BCyyVoLLGfaEktaGpkdVB3kwjFSEmmhLKPT04VBQJHR701
	I1cm8rdM3fCV/Sv7CSStvNH3JD99d3G6K9jt4w0Kfsod8WWSuwo86O+gHtt/+p7/Y1VTkKX7Dmw+l
	VB6Rj9KigW0UtIXvHTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2zQ-00DXmR-FC; Thu, 27 Oct 2022 13:32:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2kd-00DPMM-6R
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:16:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo2kb-0000ac-JH; Thu, 27 Oct 2022 15:16:49 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Ensure Zicbom has a valid block size
Date: Thu, 27 Oct 2022 15:16:48 +0200
Message-ID: <3361717.44csPzL39Z@diego>
In-Reply-To: <20221024091309.406906-4-ajones@ventanamicro.com>
References: <20221024091309.406906-1-ajones@ventanamicro.com> <20221024091309.406906-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061651_288990_626E0FD2 
X-CRM114-Status: GOOD (  20.87  )
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

Hi,

Am Montag, 24. Oktober 2022, 11:13:09 CEST schrieb Andrew Jones:
> When a DT puts zicbom in the isa string, but does not provide a block
> size, ALT_CMO_OP() will attempt to do cache operations on address
> zero since the start address will be ANDed with zero. We can't simply
> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> size because the failure will happen before logging works, leaving
> users to scratch their heads as to why the boot hung. Instead, ensure
> Zicbom is disabled and output an error which will hopefully alert
> people that the DT needs to be fixed. While at it, add a check that
> the block size is a power-of-2 too.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 220be7222129..93e45560af30 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
> +#include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <asm/alternative.h>
> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
>  static bool riscv_isa_extension_check(int id)
>  {
> +	switch (id) {
> +	case RISCV_ISA_EXT_ZICBOM:
> +		if (!riscv_cbom_block_size) {
> +			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> +			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			return false;

I guess this could use a comment where that rule stems from.

I.e. the cmo-spec only says
  "the size of a cache block are [...] implementation-specific"

So while requiring this to be a power-of-2 is abviously sane,
this looks like an additional requirement from the kernel side?

Otherwise
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Heiko


> +		}
> +		return true;
> +	}
> +
>  	return true;
>  }
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
