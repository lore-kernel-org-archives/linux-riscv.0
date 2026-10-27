Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9E606A33C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hh6IDPmV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T/hTRzGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MukgE6rzGVyKSKs4kAUR0gGXpME8apO2tqvWQxb7a2E=; b=Hh6IDPmVM4zb5VkSw8Qz9rT02I
	YteGX3ib+gTH1T5mSgcWVMir65bueELJ9auK0AxrzGAuBaCUTaGQZD5+xLzorylP0dWQUhdrqwTYy
	lieusA5AagczYSdotyPpPekVwtxk4wDlPUSYZK+jQK0+s3PD2XEUdmU4JT43DW9z8Dm9V96/+GnGx
	cANrTEUNQvxb4viBA/pEduW5enNYDXUE29+MNDyfVwJAzvzbhM7HwLIz5+x8xOxNl0rTQxMu5wG8N
	imopGahge5XmsZ0OU6d2el64GWpFSluOU0LFtb0qPzrwBu5dUpmpQauVJ+Qx6IXlkbjj8NvDEfK9H
	oHFugR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcF-00000004h6J-40yA;
	Tue, 27 Oct 2026 12:49:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcE-00000004h64-3Qrt
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HfrXUsdFLQaA5FckFCHh54cFFOWKpmXuI7Yv4I221sM=; b=T/hTRzGAYoLrX/cxLl9a0ZtIHX
	KKT8aT75ShKu+I4Xl9h/suO7DJBk6ZDvX7y8gpHvZKBWFcAaRJUoOoQ6byNN8AYceqohUlmEKQL2Q
	hF6V2vtojiWISCS0NgQrAc6cHJ6PW0/H6fvBQJQI0r+Fv9nRKRi2CNAwsALVWiukr77b1bWPwwsRN
	nq/J4MlbBa/Wmfk/kg3e5yC+7zuFml9XGs+eaBF2D7MyccDwycJEL3pjInXFuJ7MhJgxQvojgnODz
	8xmSHxzRrxE7n7izu6v0pXqscvEgRAafGRks0Pz4L4+vp3cAbHDEgasf3uWaK3tTLXNFyCFtdVIij
	rMnFZbdQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcA-0000000ExlX-2MLY;
	Tue, 27 Oct 2026 12:49:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17B62300A9A; Tue, 27 Oct 2026 13:49:17 +0100 (CET)
Date: Tue, 27 Oct 2026 13:49:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
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
Message-ID: <20261027124917.GA2669272@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <20261027124716.GC2668804@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027124716.GC2668804@noisy.programming.kicks-ass.net>
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
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 01:47:17PM +0100, Peter Zijlstra wrote:
> On Tue, Oct 27, 2026 at 12:31:09PM +0000, Kiryl Shutsemau wrote:
> > On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > > > Writing this, I just realized that we have another option -- map the
> > > > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > > > it read, and the get never changes a zero refcount, so the race becomes
> > > > harmless. The cost is the protection: the page is shared by every
> > > > hugetlb folio of that order in the zone, so a stray write to any tail
> > > > silently corrupts all of them instead of oopsing.
> > > 
> > > Right. Without HVO we would just corrupt pages in the single folio (which is
> > > also not nice).
> > > 
> > > I'm also questioning whether we need this RO protection all the time active.
> > 
> > What do you have in mind? RO only under a debug option, or switching the
> > tail page to RO some time after the remap?
> > 
> > If it is the delay, a grace period alone does not close the race. We
> > would need rcu_read_lock() back around the get, and then it is the old
> > scheme with the wait taken off the allocation path.
> 
> So it used to be; back when Nick introduced try_get_page, that it was
> only allowed with IRQs disabled.
> 
> And looking at gup.c now, I see gup_fast_pgd_range() still has
> local_irq_save/restore around it.
> 
> So what do you need that rcu crud for?

Also; as long as the synchronize_rcu() only lives when a debug option is
on, that sounds like a win. Debug stuff has costs, news at 11 and all
that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
