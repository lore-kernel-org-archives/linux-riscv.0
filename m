Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424D3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPnDskJw3MidNYCkdOb8u9d+60ZdiDCg1IMMw4HkyGU=; b=pFtBCoY1BxPted
	2b0UnBOW2sLflQzNT4MBu4D660IUm81O9neFzF//isB7kUjg6CxT9eD7DpP5gsPe+hVYH83p52EF3
	PbR1n2IyqtMe38uWvjNj9HRHYb6xSbG+8gYM1TA4MUwTLobiwpXtZ9pvhHwh76kXZ+3gsAC+2p2Fc
	gemjAYbD7ds9SHKNH5vsCEuNDDfhwkGlJzkWUR9dcxcNShOzdF/TbjXYtKLMKXUL97yZ5Z/xtQ90I
	ogkp3qMZwO37UMJ4kwkfvY7ooE5PM0ly95bzBbB8ZDk7c6DonjKRZ/N1gsvqQQPAwrfH15zzZphMW
	Js3N8XedUlxzc3SFY9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGjF-004kdu-P3; Mon, 06 Dec 2021 16:20:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGjC-004kcS-Ll
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 16:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A254B81120;
 Mon,  6 Dec 2021 16:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0E6C341C1;
 Mon,  6 Dec 2021 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807631;
 bh=nHfd4LeuCF/C6Shj1iP5OtMCx+jUnbWosXyDdMp0EoY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YONjoOnBukCbNSrNFewClrSbRWEBiW9L4Z/H9vaEkO8VulH6oDfpm+nu+1hTvg64u
 PmHk9ino0T5DBmPYJTqkc8ddQkxW2rN9ertTH+jBvMSOrf9oO61pdFKpc6ppYz9njZ
 QrgXdXDBLP3MLYzM6VewX8kz8t59bRPBkgHmKQ8HuWgoUN9zfXgTQKJDQDVKPj+h4/
 rDERGUPrVFUIGy3zsd45I2BhpybrijnUPWXW2f2KgmGS8EtILNuPuRBevO/Rggby+C
 h9JXMt9gGlyLHCjuW/PTGoYedLQz/ecNmgacdkvxhTczu5TAVmEi/5piv0frgn7Srh
 zaVvOYKHFRtRw==
Date: Tue, 7 Dec 2021 00:12:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Make vmalloc/vmemmap end equal to the start of
 the next region
In-Reply-To: <20211118134539.137212-1-alexandre.ghiti@canonical.com>
References: <20211118134539.137212-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Message-Id: <20211206162029.AD0E6C341C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_082034_915948_1DD90202 
X-CRM114-Status: GOOD (  18.73  )
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

On Thu, 18 Nov 2021 14:45:39 +0100
Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:

> We used to define VMALLOC_END equal to the start of the next region
> *minus one* which is inconsistent with the use of this define in the
> core code (for example, see the definitions of VMALLOC_TOTAL and
> is_vmalloc_addr).
> 
> And then make the definition of VMEMMAP_END consistent with VMALLOC_END
> and all other regions actually.
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/include/asm/pgtable.h | 4 ++--
>  arch/riscv/mm/fault.c            | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d34f3a7a9701..5155048274c2 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -25,7 +25,7 @@
>  #endif
>  
>  #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> -#define VMALLOC_END      (PAGE_OFFSET - 1)
> +#define VMALLOC_END      PAGE_OFFSET
>  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>  
>  #define BPF_JIT_REGION_SIZE	(SZ_128M)
> @@ -53,7 +53,7 @@
>  #define VMEMMAP_SHIFT \
>  	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
>  #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
> -#define VMEMMAP_END	(VMALLOC_START - 1)
> +#define VMEMMAP_END	VMALLOC_START
>  #define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
>  
>  /*
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index aa08dd2f8fae..41ae0aa8f2b8 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -235,7 +235,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	 * only copy the information from the master page table,
>  	 * nothing more.
>  	 */
> -	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END))) {
> +	if (unlikely((addr >= VMALLOC_START) && (addr < VMALLOC_END))) {
>  		vmalloc_fault(regs, code, addr);
>  		return;
>  	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
