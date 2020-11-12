Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E24C2D0E4
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 19:08:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C075520B80
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 19:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJqpl5/W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJ2VewNY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C075520B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wkULhrTPi0Zqt+3+t1KNav2wPspgVTp9WR3aN9y7eMc=; b=IJqpl5/WJ/dIptIzWF3S7ZBjL
	7e7BeMRUmng9JFy2r013wyLR1I/KyuneWQAz2QrCrR30wGZW3p5tvpr6ajBfCDWeOf/HX8EqV4c+3
	Q3YmDIjqx+dvMxdXgtzOqCAn8/LvwpisrD4Hz8oHrpbjdUi5K3tVJ6+edUjrDWsYQ7UuqGZTDKz2F
	a6rD9jXz+adMNf8H5pM519bAvamzXzSLC83G/lAW0VDFQZGcOsVCPeavF2oCjX4Ip6GWpCXE1dR4Z
	OmrCK7MqOxmxv/BalXZW3UU74BWTiBsEYjvoiuhytmyczd3uo3nc5tEsD1HRntSjoJvy1Db00xEHD
	3RRVXlimw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdHxj-0007Ac-3u; Thu, 12 Nov 2020 19:08:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHxc-00077p-F6; Thu, 12 Nov 2020 19:08:45 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8D5220B80;
 Thu, 12 Nov 2020 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605208123;
 bh=xV//yxXQnSWrF+/xUfBz0sg6IFqo/YMvvh+jTSmycog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJ2VewNYER4w3booQ/KucmJAPZK4Nm1reG5FJeJdC37e1oDo0gYmUR751y+nFk/Fk
 KTZnkXVxvIaPUC+PE+K9dv1EbVW82mMGVB67vT5tdx3BmBSmhgCrAaqtZp5v8kMCfS
 p3TcAbQ8jXyADENOO6QdpyUsgBOodjaN9MdE79nU=
Date: Thu, 12 Nov 2020 21:08:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
Message-ID: <20201112190827.GP4758@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-3-rppt@kernel.org>
 <9e2fafd7-abb0-aa79-fa66-cd8662307446@redhat.com>
 <20201110180648.GB4758@kernel.org>
 <3194b507-a85f-965a-e0eb-512a79ede6a9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3194b507-a85f-965a-e0eb-512a79ede6a9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_140844_776284_C3621092 
X-CRM114-Status: GOOD (  34.82  )
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

On Thu, Nov 12, 2020 at 05:22:00PM +0100, David Hildenbrand wrote:
> On 10.11.20 19:06, Mike Rapoport wrote:
> > On Tue, Nov 10, 2020 at 06:17:26PM +0100, David Hildenbrand wrote:
> > > On 10.11.20 16:14, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > It will be used by the upcoming secret memory implementation.
> > > > 
> > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > > ---
> > > >    mm/internal.h | 3 +++
> > > >    mm/mmap.c     | 5 ++---
> > > >    2 files changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/mm/internal.h b/mm/internal.h
> > > > index c43ccdddb0f6..ae146a260b14 100644
> > > > --- a/mm/internal.h
> > > > +++ b/mm/internal.h
> > > > @@ -348,6 +348,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
> > > >    extern void mlock_vma_page(struct page *page);
> > > >    extern unsigned int munlock_vma_page(struct page *page);
> > > > +extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> > > > +			      unsigned long len);
> > > > +
> > > >    /*
> > > >     * Clear the page's PageMlocked().  This can be useful in a situation where
> > > >     * we want to unconditionally remove a page from the pagecache -- e.g.,
> > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > index 61f72b09d990..c481f088bd50 100644
> > > > --- a/mm/mmap.c
> > > > +++ b/mm/mmap.c
> > > > @@ -1348,9 +1348,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
> > > >    	return hint;
> > > >    }
> > > > -static inline int mlock_future_check(struct mm_struct *mm,
> > > > -				     unsigned long flags,
> > > > -				     unsigned long len)
> > > > +int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> > > > +		       unsigned long len)
> > > >    {
> > > >    	unsigned long locked, lock_limit;
> > > > 
> > > 
> > > So, an interesting question is if you actually want to charge secretmem
> > > pages against mlock now, or if you want a dedicated secretmem cgroup
> > > controller instead?
> > 
> > Well, with the current implementation there are three limits an
> > administrator can use to control secretmem limits: mlock, memcg and
> > kernel parameter.
> > 
> > The kernel parameter puts a global upper limit for secretmem usage,
> > memcg accounts all secretmem allocations, including the unused memory in
> > large pages caching and mlock allows per task limit for secretmem
> > mappings, well, like mlock does.
> > 
> > I didn't consider a dedicated cgroup, as it seems we already have enough
> > existing knobs and a new one would be unnecessary.
> 
> To me it feels like the mlock() limit is a wrong fit for secretmem. But
> maybe there are other cases of using the mlock() limit without actually
> doing mlock() that I am not aware of (most probably :) )?

Secretmem does not explicitly calls to mlock() but it does what mlock()
does and a bit more. Citing mlock(2):

  mlock(),  mlock2(),  and  mlockall()  lock  part  or all of the calling
  process's virtual address space into RAM, preventing that  memory  from
  being paged to the swap area.

So, based on that secretmem pages are not swappable, I think that
RLIMIT_MEMLOCK is appropriate here.

> I mean, my concern is not earth shattering, this can be reworked later. As I
> said, it just feels wrong.
> 
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
