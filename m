Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE3C46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aChoCtDDWyu84KnaG4yM5Qk2uZVsU8dr4BBM3j82ASU=; b=PlHApM4lB2XWPb
	nk6LJEsNzXMX8OI7zgTtxxEcc4D2TDjOJ22Z7DeAKrJlOsYac6YQPMDWNQu8kaJoZC9f6llyUea6W
	zwpcFxOkM04ABVnqkiTMHuNx2QWUL/ryCpYmNJ4Ts0TzjCqIqkCRxOD+idnyEt0BzCd5twcItlQlS
	Z9bZYjfriId2WCCWY+y5IgLlfEdkQC3EcGC0HnAtLZxEEFNi0yYsKPszNMgUTN97ASXcLzlNH/jX5
	Zy+KECZhmDmmHyBb0HtdB/myg8iPegK3Ta7rzoXMHqeUQxTbjeEJUymflhha4tt9NhUzpk83DZg35
	eMRhHL/FyvTg8bktl64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTFe-004VCm-0P;
	Fri, 22 Dec 2023 00:18:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTFb-004VC9-1K
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 00:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE342B821E5;
	Fri, 22 Dec 2023 00:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A546C433C7;
	Fri, 22 Dec 2023 00:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703204329;
	bh=wXnWlAEHEZOPJbC4UL27KU2l/K7KB/ypFaTwuZco7IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oN9vSZi6WR0+cEsbFQvdq7Z2Y7QGUF10OIB3uBS9W9EPCSoYATvOsY6UStGvWgJ/J
	 sCgUM0EYjUntGMxVJYoQpz+meCT/6I4GyMNsk50dfTBxlCqLu4SbcRfGxxKzMyo+2n
	 PKQZqfDG63bZ65D42UvA1kxBRGtdo4qqqXSPxoAbL+2RuwvvH86NoGGKjRMkI4JDYl
	 6nzuUL5nBNvG09P+zRe83H/Ts6GQtthN9PtobSPlAY1l0oZihWYiIM1bSHmEIvU/eE
	 LI/lx0fLcNAOxiiLnffd6Yvb7bB/Iezn9GJggZKd0vWkIX+YhaDNiAV9DMYs3fRtoD
	 SceByWM7DlL9w==
Date: Thu, 21 Dec 2023 19:18:42 -0500
From: Guo Ren <guoren@kernel.org>
To: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, alexghiti@rivosinc.com, charlie@rivosinc.com,
	xiao.w.wang@intel.com, david@redhat.com, panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com, willy@infradead.org
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: mm: Fixup compat mode boot failure
Message-ID: <ZYTV4tGZr6ncIpAR@gmail.com>
References: <20231219111701.1886903-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231219111701.1886903-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_161851_594384_CE9920A7 
X-CRM114-Status: GOOD (  17.14  )
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

On Tue, Dec 19, 2023 at 06:17:01AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> In COMPAT mode, the STACK_TOP is 0x80000000, but the TASK_SIZE is
> 0x7fff000. When the user stack is upon 0x7fff000, it will cause a user
> segment fault. Sometimes, it would cause boot failure when the whole
> rootfs is rv32.
> 
> Freeing unused kernel image (initmem) memory: 2236K
> Run /sbin/init as init process
> Starting init: /sbin/init exists but couldn't execute it (error -14)
> Run /etc/init as init process
> ...
> 
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
Abandon this patch, and here is the v2:
https://lore.kernel.org/linux-riscv/20231221154702.2267684-1-guoren@kernel.org/


> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ab00235b018f..d2ec5e6fa331 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -881,7 +881,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>  
>  #ifdef CONFIG_COMPAT
> -#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
> +#define TASK_SIZE_32	(UL(1) << (MMAP_VA_BITS - 1))
>  #define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
>  			 TASK_SIZE_32 : TASK_SIZE_64)
>  #else
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
