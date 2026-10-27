Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FA606A32C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAYwc6we;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=j/gP54Cg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jAqr39LvwYKa76vbq8N7Dc/G+tpirHXI/UEMNlEcP1M=; b=KAYwc6weG14HRB/zjlp3QHCwo2
	kYxcTqHcxprX1ZE3ynROnJA3boSjpJFQEus54DCEetxi8StVSVYha2Q6X23u1Xd0oVIKtntZMP2F2
	IhjqD9JyGgHwxJUrLnRzYUBn0bysB4o8AOKAHnhOQQWvnPhdjZVE31mFb6h38fcJr7AJGkUHnvC5H
	iGmPp28HyRCb8HdxwwOdBf9DbHFbx7f3+fckh6bsubKetwLdkqwwoMowp/R+W0IiO0OrGlHKWaUfH
	gPLj1MEKcOAAhhxgflF8TY1n/DnEQj1ZCaRNTe5LxK3l2/Sx31uT7YIRmzWHRz/tre8VQxTbvruN8
	QPvXR1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeuw-00000004N9h-3mk8;
	Tue, 27 Oct 2026 11:00:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeuu-00000004N9L-3YR2
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 11:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PY8D/fV9b7AqgT0EI/4JhIhUH5cTst9C5yyqz6dyWcI=; b=j/gP54CgEygcRs8TL7TFvQfxWQ
	QB9ho1aAa6pbib22ag4zbg5BRriOpt2zZs83XAJwUPSgNaowMPL5MrMYLZE17R2FRrOuUU67wGvyn
	frXJXGOkpFQtpqntmkojch5r3MxT/xenCCROmA0AXajsGCHv+ALUG6EIcXGPrlesZEMPJIeqKnbfE
	rKvXYdKMNv+x5Z6BYaPELqdU7BzYZRkZ5deQd1qdsznL11vi4AygDS+oQFBwhi/A3ahPkOr9uwb+p
	9G6x0t3n2GNcA77LGfOfaYX6DwJAayTuO2uLN1Qgb3Y8jBl55D+3Hvmoe8AGLAqDoX/sDmwhAQv6E
	+Vb690fg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeuq-0000000D62N-2Dy5;
	Tue, 27 Oct 2026 11:00:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1CBB6300DB9; Tue, 27 Oct 2026 12:00:28 +0100 (CET)
Date: Tue, 27 Oct 2026 12:00:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
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
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 12:37:13AM +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 00:25, Kiryl Shutsemau wrote:
> > On Mon, Oct 26, 2026 at 06:45:48PM +0100, David Hildenbrand (Arm) wrote:
> >> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> >>> From: Kiryl Shutsemau <kas@kernel.org>
> >>>
> >>> With fake head pages eliminated in the previous commit, remove the
> >>> supporting infrastructure:
> >>>
> >>>   - page_fixed_fake_head(): no longer needed to detect fake heads;
> >>>   - page_is_fake_head(): no longer needed;
> >>>   - page_count_writable(): no longer needed for RCU protection;
> >>>   - RCU read_lock in page_ref_add_unless(): no longer needed;
> >>
> >> I have an AI report that removing RCU read-lock was wrong.
> > 
> > Ughh. Yes, it is a real bug.
> > 
> > My reasoning in the commit message was wrong. Nothing stops a
> > speculative get from writing to one after the remap. On x86 even a
> > failing cmpxchg faults there.
> > 
> > The fix I have in mind is to let the atomic fault.
> > 
> > If the update faults, the struct page is a read-only HVO tail with a
> > zero refcount, so the get just fails. An exception table entry on the
> > cmpxchg handles it. No RCU on either side, and the fast path stays the
> > same lock cmpxchg loop.
> > 
> > Only x86, riscv and loongarch have HVO. Below is x86 only, to show the
> > idea; riscv and loongarch need the same primitive in their LL/SC
> > fetch_add_unless().
> > 
> > Lightly tested on x86 by hitting a real HVO tail page.
> > 
> > Does it look sane?
> 
> I'm sure x86 folks will have an opinion :) . Let me CC them whether something
> like that would be acceptable.

This looks quite terrible, doubly so because I have no idea what its
trying to fix. Please try and justify this insanity.

> > 
> > I can prepare a proper patchset if looks reasonable.
> > 
> > diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
> > index 75743f1dfd4e..5252b1382ed0 100644
> > --- a/arch/x86/include/asm/atomic.h
> > +++ b/arch/x86/include/asm/atomic.h
> > @@ -108,6 +108,25 @@ static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int n
> >  }
> >  #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
> >  
> > +/*
> > + * arch_atomic_fetch_add_unless_nofault() is arch_atomic_fetch_add_unless(),
> > + * except that a fault on the access jumps to @label instead of oopsing.  It
> > + * works in any context, including with IRQs disabled.
> > + */
> > +#define arch_atomic_fetch_add_unless_nofault(_v, _a, _u, label)	\
> > +({									\
> > +	atomic_t *__v = (_v);						\
> > +	int __a = (_a), __u = (_u);					\
> > +	int __c = arch_atomic_read(__v);				\
> > +									\
> > +	do {								\
> > +		if (unlikely(__c == __u))				\
> > +			break;						\
> > +	} while (!__try_cmpxchg_nofault(&__v->counter, &__c,		\
> > +					__c + __a, label));		\
> > +	__c;								\
> > +})
> > +
> >  static __always_inline int arch_atomic_xchg(atomic_t *v, int new)
> >  {
> >  	return arch_xchg(&v->counter, new);
> > diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
> > index a88b06f1c35e..685aab3edd3f 100644
> > --- a/arch/x86/include/asm/cmpxchg.h
> > +++ b/arch/x86/include/asm/cmpxchg.h
> > @@ -232,6 +232,63 @@ extern void __add_wrong_size(void)
> >  #define arch_try_cmpxchg_local(ptr, pold, new)				\
> >  	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
> >  
> > +/*
> > + * __try_cmpxchg_nofault() is arch_try_cmpxchg() on a 4-byte kernel variable,
> > + * except that a fault on the access jumps to @label instead of oopsing.
> > + */
> > +#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
> > +#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
> > +({									\
> > +	bool success;							\
> > +	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
> > +	__typeof__(*(_ptr)) __old = *_old;				\
> > +	__typeof__(*(_ptr)) __new = (_new);				\
> > +									\
> > +	if (sizeof(*(_ptr)) != 4)					\
> > +		__cmpxchg_wrong_size();					\
> > +	asm_goto_output("\n"						\
> > +			"1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
> > +			_ASM_EXTABLE(1b, %l[label])			\
> > +			: "=@ccz" (success),				\
> > +			  [ptr] "+m" (*(_ptr)),				\
> > +			  [old] "+a" (__old)				\
> > +			: [new] "r" (__new)				\
> > +			: "memory"					\
> > +			: label);					\
> > +	if (unlikely(!success))						\
> > +		*_old = __old;						\
> > +	likely(success);						\
> > +})
> > +#else
> > +#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
> > +({									\
> > +	int __err = 0;							\
> > +	bool success;							\
> > +	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
> > +	__typeof__(*(_ptr)) __old = *_old;				\
> > +	__typeof__(*(_ptr)) __new = (_new);				\
> > +									\
> > +	if (sizeof(*(_ptr)) != 4)					\
> > +		__cmpxchg_wrong_size();					\
> > +	asm volatile("\n"						\
> > +		     "1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
> > +		     "2:\n"						\
> > +		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
> > +					   %[errout])			\
> > +		     : "=@ccz" (success),				\
> > +		       [errout] "+r" (__err),				\
> > +		       [ptr] "+m" (*(_ptr)),				\
> > +		       [old] "+a" (__old)				\
> > +		     : [new] "r" (__new)				\
> > +		     : "memory");					\
> > +	if (unlikely(__err))						\
> > +		goto label;						\
> > +	if (unlikely(!success))						\
> > +		*_old = __old;						\
> > +	likely(success);						\
> > +})
> > +#endif
> > +
> >  /*
> >   * xadd() adds "inc" to "*ptr" and atomically returns the previous
> >   * value of "*ptr".
> > diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
> > index 9f5c75d06f76..82a2fc445ce6 100644
> > --- a/include/linux/page_ref.h
> > +++ b/include/linux/page_ref.h
> > @@ -246,9 +246,31 @@ static inline int folio_ref_dec_return(struct folio *folio)
> >  	return page_ref_dec_return(&folio->page);
> >  }
> >  
> > +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> > +/*
> > + * HVO maps the tail struct pages of a hugetlb folio read-only.  A speculative
> > + * caller can read a non-zero refcount, then the page gets freed, becomes a
> > + * tail page of a hugetlb folio and is remapped before the update.  The
> > + * atomic then faults.  A read-only struct page is a hugetlb tail page with a
> > + * zero refcount, so the fault means no reference can be taken.
> > + */
> > +static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
> > +{
> > +	instrument_atomic_read_write(v, sizeof(*v));
> > +	return arch_atomic_fetch_add_unless_nofault(v, nr, 0, fault) != 0;
> > +fault:
> > +	return false;
> > +}
> > +#else
> > +static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
> > +{
> > +	return atomic_add_unless(v, nr, 0);
> > +}
> > +#endif
> > +
> >  static inline bool page_ref_add_unless_zero(struct page *page, int nr)
> >  {
> > -	bool ret = atomic_add_unless(&page->_refcount, nr, 0);
> > +	bool ret = __page_ref_add_unless_zero(&page->_refcount, nr);
> >  
> >  	if (page_ref_tracepoint_active(page_ref_mod_unless))
> >  		__page_ref_mod_unless(page, nr, ret);
> 
> 
> -- 
> Cheers,
> 
> David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
