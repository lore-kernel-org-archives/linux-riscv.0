Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12C606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+t3O3nW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYfJuhMF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IL6+h5LgVryQqnbdX4GmfVp9WeAy09f/RTWvN8NJdw=; b=N+t3O3nWIs6Alb
	RmCVgulKsSzxX3o0ibTUAEoCs/u2AcgRxMWw70aJFwDsgIh2PLZhb8y2sFwT68yCN6qHIw39PM0xI
	5pM6C54Aq7b3K3Z4s0MQlBIg43cNFLa6mMIapVPp6N58ujssGwUxpp6FV00a5EWXxtQywGrzJCk2R
	WuYA0NteVb3J2pUvr+u6yOY/ow5QoRjnz5zOHWcQYmHiUMdaeLyGM98FAmX/WgNtSYDhSqE8nmaXY
	9FUNtEZR+3iTnV3knlqgEAEBhbHFSd7Z+fzJSs52g68FyPUjG1PkaLUKhXz7T0O0wfbKO/re5xyct
	yDfzqHynaKwEJI02SyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyzz-00000008eys-3rF4;
	Tue, 20 Oct 2026 01:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyzx-00000008eyG-33G9
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 01:50:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24FAA602A8;
	Tue, 20 Oct 2026 01:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7601F000C5;
	Tue, 20 Oct 2026 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792461040;
	bh=7E3MYOWZmAqd5n44b4wTDqjDi7qvsZEFmKsEM+R1X9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYfJuhMF7lVNH8K59PI8SOCo9JhPtzkfmugOIwk/OBLhEZHvcvQAaLetAKbXg+yJ7
	 KseQkgptJXdvJBZGupXNZ+EgKYiNZKWlnjIf8VxiU8xyCCHjTaEeArgkbZgXJuzJJT
	 rKJIidY2vQcPLic1qkRx7yRn0Oz3WeaKIg5jdXE0/3odb12gGsKi8GxM33B9XQQEc0
	 XVmhOgUmuTTf4TOrzg3OQX+4s8A7Tkw+RAt8cNuDxSwq8RaEvVcc2Iz1SVeJx9UbMs
	 7I2MhIodSKTkOvjs1Ctj+g7FxvDOrRhd8VGCgrjzhNDdxlPOr158DZci7RHdwoRLXO
	 E5Hqs+0/KGlLQ==
Date: Tue, 20 Oct 2026 09:30:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] riscv: mm: don't let GUP-fast follow entries without
 _PAGE_READ
Message-ID: <atbEOlTjwZ9nr7rG@xhacker>
References: <20261015-riscv-gup-read-fix-v1-1-8cf7f2504029@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015-riscv-gup-read-fix-v1-1-8cf7f2504029@nvidia.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 10:37:44PM -0400, Zi Yan wrote:
> riscv maps PROT_EXEC alone as PAGE_EXEC, which has
> _PAGE_EXEC but not _PAGE_READ, and a writable shadow stack entry is
> XWR = 010, which has _PAGE_WRITE but not _PAGE_READ. riscv uses the
> generic pte_access_permitted(), pmd_access_permitted() and
> pud_access_permitted(), which only check that the entry is present and,
> for a write, writable. So GUP-fast follows both kinds of entries:
> 
> - a read, e.g. from vmsplice() or an O_DIRECT write, can read an
>   execute-only page, which userspace cannot load from;
> - a write, e.g. from an O_DIRECT read, can modify a shadow stack page,
>   as pte_write() is true for it.
> 
> Slow GUP rejects both: check_vma_flags() fails a read from a VMA without
> VM_READ and a write to a VM_SHADOW_STACK VMA, unless FOLL_FORCE is set.
> 
> Fix it by requiring both _PAGE_PRESENT and _PAGE_READ in
> pte_access_permitted(), and using it for pmd_access_permitted() and
> pud_access_permitted() too.
> 
> Requiring _PAGE_PRESENT also stops GUP-fast from following a THP PMD
> invalidated by pmdp_invalidate(). x86, arm64, and powerpc do the same
> thing.
> 
> Fixes: 3f910b7a522e ("riscv: enable HAVE_FAST_GUP if MMU")
> Fixes: c68c2ef9d641 ("riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261015-anon_vma_uaf_fix-v1-0-7b977303b42b%40nvidia.com?part=2
> Assisted-by: LLM
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> Sashiko found that the riscv pmd_access_permitted() added by the
> lazyfree THP discard rework [1] lets GUP-fast bypass execute-only
> protection. The generic helpers riscv uses today have the same gap, at
> the PTE level too, and the generic pmd_access_permitted() also lets
> GUP-fast follow an invalidated PMD. This patch makes GUP-fast require
> both _PAGE_PRESENT and _PAGE_READ. Requiring _PAGE_PRESENT stops it from
> following a PMD invalidated by pmdp_invalidate(), as x86, arm64, and
> powerpc already do and as the rework relies on.
> 
> While reviewing this patch, an LLM also found that riscv's
> pte_wrprotect() sets _PAGE_READ unconditionally, which turns an
> execute-only entry into a readable one [2], e.g. every execute-only

This issue can be fixed by Nickolai's patch:
https://lore.kernel.org/linux-riscv/20261017162229.796020-1-nickolai@csail.mit.edu/

> hugetlb mapping via make_huge_pte(). That needs a separate fix.
> 
> Link: https://lore.kernel.org/all/20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com/ [1]
> Link: https://elixir.bootlin.com/linux/v7.3-rc7/source/arch/riscv/include/asm/pgtable.h#L409 [2]
> ---
>  arch/riscv/include/asm/pgtable.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea89..f46b742d6dd93 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -372,6 +372,21 @@ static inline int pte_write(pte_t pte)
>  	return pte_val(pte) & _PAGE_WRITE;
>  }
>  
> +/*
> + * GUP-fast only follows entries that are present and have _PAGE_READ,
> + * and leaves the rest to slow GUP, which checks the VMA: an execute-only
> + * entry and a writable shadow stack entry (XWR = 010) lack _PAGE_READ, a
> + * PROT_NONE or invalidated entry lacks _PAGE_PRESENT. Any other writable
> + * entry is readable too.
> + */
> +#define pte_access_permitted pte_access_permitted
> +static inline bool pte_access_permitted(pte_t pte, bool write)
> +{
> +	const unsigned long need = _PAGE_PRESENT | _PAGE_READ;
> +
> +	return (pte_val(pte) & need) == need && (!write || pte_write(pte));
> +}
> +
>  static inline int pte_exec(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_EXEC;
> @@ -820,12 +835,24 @@ static inline int pmd_write(pmd_t pmd)
>  	return pte_write(pmd_pte(pmd));
>  }
>  
> +#define pmd_access_permitted pmd_access_permitted
> +static inline bool pmd_access_permitted(pmd_t pmd, bool write)
> +{
> +	return pte_access_permitted(pmd_pte(pmd), write);
> +}
> +
>  #define pud_write pud_write
>  static inline int pud_write(pud_t pud)
>  {
>  	return pte_write(pud_pte(pud));
>  }
>  
> +#define pud_access_permitted pud_access_permitted
> +static inline bool pud_access_permitted(pud_t pud, bool write)
> +{
> +	return pte_access_permitted(pud_pte(pud), write);
> +}
> +
>  #define pmd_dirty pmd_dirty
>  static inline int pmd_dirty(pmd_t pmd)
>  {
> 
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261015-riscv-gup-read-fix-d657d67d350a
> 
> Best regards,
> --  
> Yan, Zi
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
