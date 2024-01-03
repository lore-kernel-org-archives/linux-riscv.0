Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8986BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEvB2+bHvEv5CMfy4DgxuGb0u6FHEM2KDbkN4JHzawk=; b=SY5Dh8ecp2KmIc
	qCKoej7d602qfxFj70XTuI9zRg7/H+h/wFnsF/Klxp229VE2VhD7BEqMWGNKFYZTlleUcWar/i6tY
	nKBEL3GJNAt6sukd8m+G5xZLrBI/L4gxJ77ptyS1qQQavEe6TGL4CY3Vl1Ad382e0ll4wZ5YxYWGS
	zoLgmdeVH4sE/Y6MhPVO5zsv3swTSqOCb10iFAAbzFVs0U1O69q8QpVOfFR5mXsWOVGd4uvEd5ygJ
	wYiXWEiiPD2d+EGM4a1h7nwpi2kphP15NaNSFNIqmdwxgpepJcVb8YlkrJgVARlGb4tGIzE/+2WWy
	csTt07/ZFpW+ut4zBcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5cV-00Bcek-1W;
	Wed, 03 Jan 2024 18:05:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5cR-00Bcd8-19;
	Wed, 03 Jan 2024 18:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 384CFCE1776;
	Wed,  3 Jan 2024 18:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBDAC433C7;
	Wed,  3 Jan 2024 18:05:24 +0000 (UTC)
Date: Wed, 3 Jan 2024 18:05:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Nadav Amit <namit@vmware.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Yu Zhao <yuzhao@google.com>,
	x86@kernel.org
Subject: Re: [PATCH 1/2] mm/tlb: fix fullmm semantics
Message-ID: <ZZWh4c3ZUtadFqD1@arm.com>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228084642.1765-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_100531_576655_E0169AD3 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, Dec 28, 2023 at 04:46:41PM +0800, Jisheng Zhang wrote:
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index 846c563689a8..6164c5f3b78f 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -62,7 +62,10 @@ static inline void tlb_flush(struct mmu_gather *tlb)
>  	 * invalidating the walk-cache, since the ASID allocator won't
>  	 * reallocate our ASID without invalidating the entire TLB.
>  	 */
> -	if (tlb->fullmm) {
> +	if (tlb->fullmm)
> +		return;
> +
> +	if (tlb->need_flush_all) {
>  		if (!last_level)
>  			flush_tlb_mm(tlb->mm);
>  		return;

I don't think that's correct. IIRC, commit f270ab88fdf2 ("arm64: tlb:
Adjust stride and type of TLBI according to mmu_gather") explicitly
added the !last_level check to invalidate the walk cache (correspondence
between the VA and the page table page rather than the full VA->PA
translation).

> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 129a3a759976..f2d46357bcbb 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -452,7 +452,7 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
>  	 * these bits.
>  	 */
>  	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
> -	      tlb->cleared_puds || tlb->cleared_p4ds))
> +	      tlb->cleared_puds || tlb->cleared_p4ds || tlb->need_flush_all))
>  		return;
>  
>  	tlb_flush(tlb);
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index 4f559f4ddd21..79298bac3481 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -384,7 +384,7 @@ void tlb_finish_mmu(struct mmu_gather *tlb)
>  		 * On x86 non-fullmm doesn't yield significant difference
>  		 * against fullmm.
>  		 */
> -		tlb->fullmm = 1;
> +		tlb->need_flush_all = 1;
>  		__tlb_reset_range(tlb);
>  		tlb->freed_tables = 1;
>  	}

The optimisation here was added about a year later in commit
7a30df49f63a ("mm: mmu_gather: remove __tlb_reset_range() for force
flush"). Do we still need to keep freed_tables = 1 here? I'd say only
__tlb_reset_range().

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
