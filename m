Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD8BC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBEwqHupsVE7LGohIQH2rnxKzw686YpDUjh9gMDjDOA=; b=u1MF2D2NfXA2R/
	TK807Hr/JYQvFctT5WwSZWfoAz9SwnAWFgC07VZ7Cet90oexFv87JCzwwOPJI0GHU6QBNxRb/9ckp
	DIYb1AZYMS9gRYaxtCYssKfA94MFm28k08rAQfapuWGgxcMartIvMcuVKtBOMsvaKqEiaQgniiVdc
	f1DlfD0Dc8oa/R9E+ZO1MCIXhQpAP9CpeWHPoHglrfqQS7AuIqstlNbk9QMrbQ/Q57vZydsII1wqH
	mkVCjJdQjdNCwIvhgYs7mH4eDaKjvr4eG6ef6+MkiR+B2Fw+GE10UnvfgqPZjqEdKwdNIopPc/1/R
	UToq2Pej3w5L6lwIfNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPVM-002y7R-1n;
	Tue, 08 Aug 2023 16:24:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPVI-002y6d-2n
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:24:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0654626B2;
	Tue,  8 Aug 2023 16:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDE8C433C7;
	Tue,  8 Aug 2023 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691511855;
	bh=E5Y/HlpzHmIcdubESa/a/Dmm+Rjpvc/XYS+aTQw6OAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMiwfsJsApEtWj808nlctc2cCoW1Bg3jlfmp6RHGNjxuPL6WixxakoXT6JNIT7qkf
	 eX5fzJi3p6tscVGSVylutzC5xYQMnL2oymedPZaoabQ6YgtVDq8YTxh9fHOkzQVwbx
	 iRKprPP/DmjKNe6ikTJjBKAs0JCVHIKAgwRFy2Kwaso9MLXR075qjA1LohSmli9HCJ
	 +AFyS+uigsll1MNyTttCmCfmnGk4L4ldfCUSbY3vxFT8owG7KFaNIc89Tx7ky982bl
	 GGRvmNiQ8Z3gv+ItRThSRxRrJXZHRYZ+7/ReuB2XSK7+qIzs701bsEf96EnY3kik1N
	 CX2Y7fuF8nrrA==
Date: Tue, 8 Aug 2023 09:24:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: mm: fix 2 instances of
 -Wmissing-variable-declarations
Message-ID: <20230808162412.GA2172017@dev-arch.thelio-3990X>
References: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_092417_011727_0E83F18A 
X-CRM114-Status: GOOD (  20.82  )
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

On Tue, Aug 08, 2023 at 09:15:41AM -0700, Nick Desaulniers wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance in ARCH=riscv builds:
> 
>   arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
>   for non-static variable 'trampoline_pg_dir'
>   [-Wmissing-variable-declarations]
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       |       ^
>   arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       | ^
>   arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
>   for non-static variable 'early_pg_dir'
>   [-Wmissing-variable-declarations]
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       |       ^
>   arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       | ^
> 
> These symbols are referenced by more than one translation unit, so make
> sure they're both declared and include the correct header for their
> declarations. Finally, sort the list of includes to help keep them tidy.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  arch/riscv/mm/init.c             | 9 +++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 75970ee2bda2..4c8c0f83a974 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -188,6 +188,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
>  
>  extern pgd_t swapper_pg_dir[];
> +extern pgd_t trampoline_pg_dir[];

Missing early_pg_dir too? It looks like there is already a declaration
in arch/riscv/mm/kasan_init.c that could be hoisted here?

>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  static inline int pmd_present(pmd_t pmd)
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9ce504737d18..cc0e06b4f223 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -26,12 +26,13 @@
>  #include <linux/kfence.h>
>  
>  #include <asm/fixmap.h>
> -#include <asm/tlbflush.h>
> -#include <asm/sections.h>
> -#include <asm/soc.h>
>  #include <asm/io.h>
> -#include <asm/ptdump.h>
>  #include <asm/numa.h>
> +#include <asm/pgtable.h>
> +#include <asm/ptdump.h>
> +#include <asm/sections.h>
> +#include <asm/soc.h>
> +#include <asm/tlbflush.h>
>  
>  #include "../kernel/head.h"
>  
> 
> ---
> base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
> change-id: 20230808-riscv_static-348036edcae7
> 
> Best regards,
> -- 
> Nick Desaulniers <ndesaulniers@google.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
