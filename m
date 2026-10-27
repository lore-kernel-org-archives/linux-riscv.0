Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD110606A31F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+XdtsY9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Jyj7jOfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ehmmSSnJLidkxSkzPlzeHXgrofuYMmEL0Wm2+o1iws=; b=N+XdtsY9rmPWTrhGy4FfLodbNm
	z6Axr8E3cUQdpJsU+gOSg9byzaMqg9vyg1/MyYf+/NSY74s9BxbgGCpBv87HOgUObO87YRCGazwsb
	g/TaUH51BHbzgcn+oS2z94VtakmpjMrsQNsQkupRpbLnfvr8+JrGMar1M4CmEYims1jFpbhUFf/km
	bklbSevur7vWLddSnvFZWmU3rHhEqNTwdOaQvSXOxjllMHI/1L4EOXEojfrW7DJVgybheeTEjauwd
	7FnqPPT9O1wPXq4DuYKDTVta3zCL9fYJwSlTn9m1Hp4VXRViQrT+AdlbOK12ZTvUR/LbHJOf4U4TV
	n/dAWjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgaJ-00000004gqA-0gMi;
	Tue, 27 Oct 2026 12:47:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgaH-00000004gph-3XEL
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZAIpqRoqpXgz0RZ4h56d9mqozECvPzO+I5VTSFmMVtE=; b=Jyj7jOfkJ3zLI2c3I5M3M46Zcb
	WnQwrAXczn6dCAXUP2nPsq8E8i4il+VDWbyZfBRt8ElhZD9EVM6bXkMkelsrdJ6GzzFT4JrQ5k2fE
	HvVnSCOOT/hXlFM44HSRfoB2SmByDM8uZCyGDhQCZ+RrkIY7H6uL+6RPWVddoEEJjx5K1r3Iyl0nd
	vf+topQ1atCH+2NeREP/q708/GzItGv7B/7PC01xV58kaLhrw/a23RC3l/wqMvZJY6z4eOIVSBW1D
	Nyi69d6JupfANQy+NhPNHkUsyGxbDvh2Y367Cb8T+P55YFRuWNaiZfelZ5Y9LdXhYPpImn2EH/+UO
	I8j9sT5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgaD-0000000DbOb-1oue;
	Tue, 27 Oct 2026 12:47:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1B43300A9A; Tue, 27 Oct 2026 13:47:16 +0100 (CET)
Date: Tue, 27 Oct 2026 13:47:16 +0100
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
Message-ID: <20261027124716.GC2668804@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auCZFckDfBMrlfxV@thinkstation>
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

On Tue, Oct 27, 2026 at 12:31:09PM +0000, Kiryl Shutsemau wrote:
> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > > Writing this, I just realized that we have another option -- map the
> > > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > > it read, and the get never changes a zero refcount, so the race becomes
> > > harmless. The cost is the protection: the page is shared by every
> > > hugetlb folio of that order in the zone, so a stray write to any tail
> > > silently corrupts all of them instead of oopsing.
> > 
> > Right. Without HVO we would just corrupt pages in the single folio (which is
> > also not nice).
> > 
> > I'm also questioning whether we need this RO protection all the time active.
> 
> What do you have in mind? RO only under a debug option, or switching the
> tail page to RO some time after the remap?
> 
> If it is the delay, a grace period alone does not close the race. We
> would need rcu_read_lock() back around the get, and then it is the old
> scheme with the wait taken off the allocation path.

So it used to be; back when Nick introduced try_get_page, that it was
only allowed with IRQs disabled.

And looking at gup.c now, I see gup_fast_pgd_range() still has
local_irq_save/restore around it.

So what do you need that rcu crud for?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
