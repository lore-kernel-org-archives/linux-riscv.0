Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B42606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWylf6Bx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Snqw70sr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r/QP4gzp5A4q59LOLGIGMWEFmzgFEHW9mtFV75BpGQ4=; b=QWylf6BxEHAYzmxrUaBNAjdvHb
	tIMjZjP0g4dBpy8aOLo1ka2ndLvHUUUAjoxpWarHa/DnonVEgHo1DB1syu0CYF+/g++C977s79OEf
	++zf11yYt2/L1SzIvKmDak5x1soX0QN46+LQJqYcWxTOlO0G5S/W0v+ymkG1KP3e5+aUEWVk4P1An
	UNJ1bb0C/Wv16Lc4xO9V49bqAuAu8Z2NvaiYhbdymqozfiIiFVIteNiuQwZShRQVtPR0Hlq2xav8s
	etddBZAaj9+IDM1rnPpWMOiuH7S5IL7D6rAxI5944YZUzyAd/XtFhkFkratydamiiGUcZS/XWCbOp
	Nom+idMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaP2-0000000HaDC-1uex;
	Sun, 15 Nov 2026 13:36:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaP1-0000000HaCQ-0TcB
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 13:36:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01AA1618BF;
	Sun, 15 Nov 2026 13:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EF01F000C4;
	Sun, 15 Nov 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749773;
	bh=9e6OmEAnqWbjzLHCKKsv84JklwVJ8NC6NYkY8/hHdTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Snqw70srUBsDiPj0zDExRjLpznGGJOqGIBDMhIL+rlIy0RTHPt0RW0gen1S1uIXzD
	 QTnCD4JXzQJh1r1+PPrgca3KW4gKyRYXQ+UAwLtnECG3ghBmfQLGrIf7RKGSI935gp
	 EP4t0w7M8b/KEfLi5aITguxi416bR7NN4F84g+C3b89VMOI4IbHT/C2uhrE2r/W3H9
	 KwC7JnxPU8fdL/2ToRZlQsRkRHYQOj3vHa/D9sZu5311NqD1rRb5kPqFTWuTSRVfXW
	 I7pAycrtkBGTnD2Ez9QpD+ZHMtOt3ohpsiJBVdyRUV1RXDC8lXPTtb4u4NMEPqfHFl
	 W76a4v1WZmgrA==
Date: Sun, 15 Nov 2026 21:15:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
Message-ID: <avmwinvQyS_X0G7o@xhacker>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
 <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 03:42:19PM +0200, Mike Rapoport (Microsoft) wrote:
> set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
> mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
> the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
> return true for the invalidated entry. kernel_page_present() then reports
> that an unmapped page is mapped, and hibernation copies it without
> remapping it first.
> 
> Test _PAGE_PRESENT directly for PMD and PTE leaves.
> 
> Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/riscv/mm/pageattr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index b138113755359..62fbcf7cf36b6 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
>  	if (!pmd_present(pmdp_get(pmd)))
>  		return false;
>  	if (pmd_leaf(pmdp_get(pmd)))
> -		return true;
> +		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;

so we call pmdp_get() up to 3 times, could we save its result
and reuse it?

>  
> +	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
>  	pte = pte_offset_kernel(pmd, addr);
> -	return pte_present(ptep_get(pte));
> +	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
>  }
> 
> -- 
> 2.53.0
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
