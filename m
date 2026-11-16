Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E8606A338
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dldt1tJK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DDhFq6FH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gQceDlUz1hmvGqD8oN34w+qGr1pXYgTQIV+Bge0TxrE=; b=dldt1tJK3vIJzoacNgGoKgieeg
	a04NNxGRclT/MK2dykKBa3U/Kf1jkwNOxgmUPGTl/vI3VuQrVMDgiKKZTYI04PqfQPyauRdfk7elA
	GROp8mBbqRktasTGlKVOhRZix/E9HghuFYnm2ekN4ns+vxt0CPd/Yb1bsHvH3kTQvleB2E13f9/vS
	79q2ddDOqNB1P5cTbg6F0MIgHCPaG7+9OaqsVnDV/cOovRdIeLqKKvVwA5Bgswx+SxEC5hcG/NkF9
	Xqsj71TE4NYdVdU80oqZDBrVtOcNp2abhug/5IaqCGzohnFyvTSvlbl2WJljV+fo3cZEv1wqWzuAd
	OAAqcIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuLL-000000021gK-07Xv;
	Mon, 16 Nov 2026 10:53:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuLI-000000021g8-3d7i
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 10:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AF0B61230;
	Mon, 16 Nov 2026 10:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFE61F000C4;
	Mon, 16 Nov 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826423;
	bh=PZ5JaOv6D2yqeEsrwU2njyIsA8z3XW92qsnk/Jsc8eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DDhFq6FHGJz7/FaNMoRAq43rPdsP2zidPHb7HvLm8vTlp4tgfl+7VyR2IqWSHrLnV
	 15Eb8vnLs1OacTo448up6jZViOgw+3NmHdT251WtIuC0CbdWSxFxbtNHKIZM4WaOPR
	 ys0Z2kO2cZjjj7k4juFNDkAwEYAaN3EIaZHgtKszLMsv1KJtZedejJRqqq+AuK37OK
	 EBtyHaKPH3udJIqb+UUkzmxbJUXFhxlVJ58bD4lsvJHZp1t5VAkIdTFUrFASkA+ntu
	 jc4Q8todrLVjtzeJJ6MURf/e21uua64hfYMEI1M34I66PmuVuauEaAj57QpwI7wnwF
	 UxecWNNpNC9Lw==
Date: Mon, 16 Nov 2026 12:53:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: mm: check the valid bit in
 kernel_page_present()
Message-ID: <avrgsUPgxuTwmXFB@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
 <20261112-fixes-riscv-v1-2-1caac19897b5@kernel.org>
 <avmwinvQyS_X0G7o@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avmwinvQyS_X0G7o@xhacker>
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

On Sun, Nov 15, 2026 at 09:15:54PM +0800, Jisheng Zhang wrote:
> On Thu, Nov 12, 2026 at 03:42:19PM +0200, Mike Rapoport (Microsoft) wrote:
> > set_direct_map_invalid_noflush() clears _PAGE_PRESENT, but the kernel
> > mappings keep _PAGE_PROT_NONE set: it used to be _PAGE_READ and now it is
> > the same bit as _PAGE_GLOBAL. pte_present() and pmd_present() still
> > return true for the invalidated entry. kernel_page_present() then reports
> > that an unmapped page is mapped, and hibernation copies it without
> > remapping it first.
> > 
> > Test _PAGE_PRESENT directly for PMD and PTE leaves.
> > 
> > Fixes: 32a0de886eb3 ("arch, mm: make kernel_page_present() always available")
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/riscv/mm/pageattr.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > index b138113755359..62fbcf7cf36b6 100644
> > --- a/arch/riscv/mm/pageattr.c
> > +++ b/arch/riscv/mm/pageattr.c
> > @@ -453,8 +453,9 @@ bool kernel_page_present(struct page *page)
> >  	if (!pmd_present(pmdp_get(pmd)))
> >  		return false;
> >  	if (pmd_leaf(pmdp_get(pmd)))
> > -		return true;
> > +		return pmd_val(pmdp_get(pmd)) & _PAGE_PRESENT;
> 
> so we call pmdp_get() up to 3 times, could we save its result
> and reuse it?

Yep, will change in v2. 
  
> > +	/* pte_present() is true for PAGE_KERNEL with _PAGE_PRESENT cleared */
> >  	pte = pte_offset_kernel(pmd, addr);
> > -	return pte_present(ptep_get(pte));
> > +	return pte_val(ptep_get(pte)) & _PAGE_PRESENT;
> >  }
> > 
> > -- 
> > 2.53.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
