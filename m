Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D704AC388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 18:07:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6547F20781
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 18:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6t7YOx2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsCfawPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6547F20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kASXSdAsmqUTpoxYa6YDsqs5BfcACJPpX3VaUGfIH5o=; b=r6t7YOx2AH7UlXnMJTA2E9CpI
	nxhzVWVvtbAt+kUyEsV4G3O7NHt8/dn3uTOEwpXtTHcY++BuPb9Ltf4yb2yXqFj38WC6xbhpXVRTd
	OhDTqGfzqgNFvMBWgJ1vWmZrKa9Py99Lh+R4fL1CEJ0fRalsBgsT6ekpJvCSv2DD13ygrOzP5whuL
	xQRhpDro9bFiQt4PQkKkIttZzS5kF6yxwLz+9Uu8lCxsj1E2joJkCkYisliIedzdI6j2uZAoldp79
	1IyWcc5f9AiJXc3jT7oY8Au+d62qC8kRiioBDQEjcXfgTjnjUPnrOnjzXHmFW1x4aRJgX+A2ybQxn
	D+3n6ne0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcY2v-000879-8H; Tue, 10 Nov 2020 18:07:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcY2q-00084z-EC; Tue, 10 Nov 2020 18:07:05 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C35F820781;
 Tue, 10 Nov 2020 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605031623;
 bh=bAkJ6qFghBqAmYDEu7geL4WoAC5U+zvSUa3tfgn5GqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsCfawPZ7PZXYREKxvAae+uk/8IQqHbGnFjdff7AGzyGjc4x/SKxcILYVT/rLCce9
 nmpcocs0Se3KfPVLk80KrhXz6x5Oy3hYomKMAGm/YGBiEJSxYFnSu9uNQghCJwavMR
 lgeiRSDZJxGsficIgAw5m1qVpszWlc3MZZCq7S1w=
Date: Tue, 10 Nov 2020 20:06:48 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
Message-ID: <20201110180648.GB4758@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-3-rppt@kernel.org>
 <9e2fafd7-abb0-aa79-fa66-cd8662307446@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e2fafd7-abb0-aa79-fa66-cd8662307446@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_130704_728345_E9388918 
X-CRM114-Status: GOOD (  26.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 10, 2020 at 06:17:26PM +0100, David Hildenbrand wrote:
> On 10.11.20 16:14, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > It will be used by the upcoming secret memory implementation.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >   mm/internal.h | 3 +++
> >   mm/mmap.c     | 5 ++---
> >   2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/internal.h b/mm/internal.h
> > index c43ccdddb0f6..ae146a260b14 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -348,6 +348,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
> >   extern void mlock_vma_page(struct page *page);
> >   extern unsigned int munlock_vma_page(struct page *page);
> > +extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> > +			      unsigned long len);
> > +
> >   /*
> >    * Clear the page's PageMlocked().  This can be useful in a situation where
> >    * we want to unconditionally remove a page from the pagecache -- e.g.,
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 61f72b09d990..c481f088bd50 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1348,9 +1348,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
> >   	return hint;
> >   }
> > -static inline int mlock_future_check(struct mm_struct *mm,
> > -				     unsigned long flags,
> > -				     unsigned long len)
> > +int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> > +		       unsigned long len)
> >   {
> >   	unsigned long locked, lock_limit;
> > 
> 
> So, an interesting question is if you actually want to charge secretmem
> pages against mlock now, or if you want a dedicated secretmem cgroup
> controller instead?

Well, with the current implementation there are three limits an
administrator can use to control secretmem limits: mlock, memcg and
kernel parameter.

The kernel parameter puts a global upper limit for secretmem usage,
memcg accounts all secretmem allocations, including the unused memory in
large pages caching and mlock allows per task limit for secretmem
mappings, well, like mlock does.

I didn't consider a dedicated cgroup, as it seems we already have enough
existing knobs and a new one would be unnecessary.

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
