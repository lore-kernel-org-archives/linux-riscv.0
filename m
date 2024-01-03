Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0yNp3qe1Qao+X+Nc7klRpP/P0dcd46iQ/4JEPGsW1U=; b=WnSMfuP2vjk6g8
	u42s6JAZVDN9md221/ACiW1OcJpTBVnCTDUo2l7c/FCIG5bBnrpWRo22E32syiJdC+j54+osyBUZ8
	MKTFSEzD7N3qaOsgIzXpuwx9g2xMwO8/GeVuz9aB++hw3GPZA8ZVjgKzUWXKflj6ZR1q2Qu2SXyhh
	QAlYYnWKrsXmff/XOyxuiyaBThrlTuoF+fvY6gHAC93PU/oehP655wwDryvLD2Mb0hAcmV0DEATEZ
	hcdD4HwZCEAjD/ZdkKwViBZkSDhBjlSPwUfx5iwEnyRLpHdX+D7EWkkmZbiAVD0OD6nBGArm86OEU
	qsi9f12GOZVR448c2vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5V7-00Bbs0-0c;
	Wed, 03 Jan 2024 17:57:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5V3-00BbqY-2u;
	Wed, 03 Jan 2024 17:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1F10CE1791;
	Wed,  3 Jan 2024 17:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25872C433CB;
	Wed,  3 Jan 2024 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704304671;
	bh=EQmqIwt5epCeJn4AJ4OZUCyNlDG/sWGPlg++mDoiWxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQ61WSOkYHvDu+NAujBX1iKQQZ8LBc7cOd7ZSkJdNDefaZuBx9ynYYZVtX4jJdGb+
	 7XOT6chUxOsHLsEnmmvvdLULKAFhQAYEnDaeLySVJ4sicSBeTl1tnAmJxJOG36YvXX
	 Ms9+4/7u7PMcapNSeVrTinr/tC5NoN2SrdI6TT4Y1/nJCvPFNr90TPRnY4X++JGbln
	 dp6/3BqX3NvceDJ1L6d9p4FcLzK+bE6jV5LWDAamgcqerXB0coCHYs6xCp4t1vOTc5
	 GJ700QXwCSqBl067oofTfdRi3BHCUE+ZrADAp/W+bEhUxVqMQidoVCPQFTYFgr5ua0
	 q6BvF2SdkCRUw==
Date: Wed, 3 Jan 2024 17:57:43 +0000
From: Will Deacon <will@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <20240103175743.GG5954@willie-the-truck>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
 <20240103175001.GF5954@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103175001.GF5954@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_095754_277599_C65810AB 
X-CRM114-Status: GOOD (  26.85  )
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

On Wed, Jan 03, 2024 at 05:50:01PM +0000, Will Deacon wrote:
> On Thu, Dec 28, 2023 at 04:46:41PM +0800, Jisheng Zhang wrote:
> > From: Nadav Amit <namit@vmware.com>
> > 
> > fullmm in mmu_gather is supposed to indicate that the mm is torn-down
> > (e.g., on process exit) and can therefore allow certain optimizations.
> > However, tlb_finish_mmu() sets fullmm, when in fact it want to say that
> > the TLB should be fully flushed.
> > 
> > Change tlb_finish_mmu() to set need_flush_all and check this flag in
> > tlb_flush_mmu_tlbonly() when deciding whether a flush is needed.
> > 
> > At the same time, bring the arm64 fullmm on process exit optimization back.
> > 
> > Signed-off-by: Nadav Amit <namit@vmware.com>
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Cc: Andrea Arcangeli <aarcange@redhat.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Andy Lutomirski <luto@kernel.org>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Yu Zhao <yuzhao@google.com>
> > Cc: Nick Piggin <npiggin@gmail.com>
> > Cc: x86@kernel.org
> > ---
> >  arch/arm64/include/asm/tlb.h | 5 ++++-
> >  include/asm-generic/tlb.h    | 2 +-
> >  mm/mmu_gather.c              | 2 +-
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> > index 846c563689a8..6164c5f3b78f 100644
> > --- a/arch/arm64/include/asm/tlb.h
> > +++ b/arch/arm64/include/asm/tlb.h
> > @@ -62,7 +62,10 @@ static inline void tlb_flush(struct mmu_gather *tlb)
> >  	 * invalidating the walk-cache, since the ASID allocator won't
> >  	 * reallocate our ASID without invalidating the entire TLB.
> >  	 */
> > -	if (tlb->fullmm) {
> > +	if (tlb->fullmm)
> > +		return;
> > +
> > +	if (tlb->need_flush_all) {
> >  		if (!last_level)
> >  			flush_tlb_mm(tlb->mm);
> >  		return;
> 
> Why isn't the 'last_level' check sufficient here? In other words, when do
> we perform a !last_level invalidation with 'fullmm' set outside of teardown?

Sorry, logic inversion typo there. I should've said:

  When do we perform a last_level invalidation with 'fullmm' set outside
  of teardown?

I remember this used to be the case for OOM ages ago, but 687cb0884a71
("mm, oom_reaper: gather each vma to prevent leaking TLB entry") sorted
that out.

I'm not against making this clearer and/or more robust, I'm just trying
to understand whether this is fixing a bug (as implied by the subject)
or not.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
