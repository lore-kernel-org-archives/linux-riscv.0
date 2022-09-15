Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88DEC32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVEPD0l24DSJ9jYPLhfHjff4SQgiFyz1u8P9MAZAUGc=; b=aUYbwUcugMdqxT
	EocqOQN3dXJEWmbBLfUKlLEBfuOlNF8txfC95i3R41VyOS3XY/oSHxyQ27KCXhsRgBjU4WhkBd4GU
	F4bZe2NBDC8mim0CDyiPwqaKiWtOwF1cebz0b5EbmxoxPUga+jEXiKruO+S+7G8mADVOjFIvD2I1X
	wgpDg7npbGND4xnufQZaXkQESOKBJSZsWssl9vZD6PtUh8tQsbl14aYXeJtlflG42kG9W7ETf31nB
	diB1UvdjYh/lHwh0plqpr9+MGD0fPry/6631zILej9bH5+POTglbbwiQQnRnj8gWq8H8TvdWjKT0y
	cJ9SG4Ijgkj8EKGakg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwCg-00HUw8-Ag; Thu, 15 Sep 2022 21:15:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwCd-00HUpu-W3
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 21:15:21 +0000
Received: from [167.98.135.4] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYwCY-0007Hx-Il; Thu, 15 Sep 2022 23:15:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org, kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
Date: Thu, 15 Sep 2022 23:15:13 +0200
Message-ID: <2123713.Mh6RI2rZIc@phil>
In-Reply-To: <20220915170900.22685-1-palmer@rivosinc.com>
References: <20220915170900.22685-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_141520_097260_3FAE2D46 
X-CRM114-Status: GOOD (  16.34  )
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

Am Donnerstag, 15. September 2022, 19:09:00 CEST schrieb Palmer Dabbelt:
> We could make the T-Head CMOs depend on a new-enough assembler to have
> Zicbom, but it's not strictly necessary because the T-Head CMOs
> circumvent the assembler.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/include/asm/cacheflush.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a89c005b4bbf..273ece6b622f 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  
>  #endif /* CONFIG_SMP */
>  
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> +/*
> + * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> + * don't depend on Zicbom.
> + */
>  extern unsigned int riscv_cbom_block_size;
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void);
>  #else
>  static inline void riscv_init_cbom_blocksize(void) { }
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
