Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DE5C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG9Wx3eddYgcYNCAZen2Ql9zp47ON3gHjsDtCSVFUw0=; b=GWWZfh74QuIU6y
	AZ7BOo0BSxqc8LjFltUN8HheLj5t/cPAd0fOo42jdqpMQYTlCsZf4ZoL5GKW1/M1xHyo9ppkCtIFx
	G9feNylImnVNcuoRj9lgSdCggs+tWnnLwgQetEqfbMvWP6g/onX0p1I9pibL8Hf/8tecgzYIEjIzj
	AQonfQreguS8ZFTB9I+6nLHLliMK09eGbiTeqKTGqP4GtAN5SwltifAVXHlzRwfDaShFE0u4fkbYo
	RdecZJdM4yEgp0cxyVRE6gkOzNCOelr27cRZr4XUEWQZXNpjmBfPkrKh/V4C3j4Rz+FR+EfI/f6OY
	Gp9BlYEbb0yfHwHfdyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9IF-0000000FWqF-2K1u;
	Tue, 07 Jul 2026 17:09:11 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9ID-0000000FWpV-1X5H
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 17:09:10 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-45133d2974fso254700fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 10:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783444147; cv=none;
        d=google.com; s=arc-20260327;
        b=QjoRqjS1BfoC0oFHY3ZgYuNY7Cgy1jdeAAj2B5tpEqxBl1eadfD4smalnQQ9dIQRHU
         WkAKMa9mqwz8vjUA5uB9/KJZeXSDjtwXF9Mx8Wm8KyOgQf4emt0oc14APwF9LC5k+jYs
         6zRguSJI/4uJ7aCk6x0lm6Hse0UQx1iai+ixNiLK3dHPnQKDYR8qn1b+Lk/ZwIHTg2JR
         7DAEzohyjnjKuh2+8XAYLslGPT0nm7P1UzhowVPKhAuuRiMdekaV4ow04qQQJo2F/T1o
         kTXiJVdmS8Q9JYgX7n++wUsn0dsL7QpeQnodr7TdGk0q2G4kH+OeHMMLAtDSPmkHGvFE
         Uv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O9lfVufk5V6ONvrwxd5qwRqQ5dHF658hNKhamzFjYII=;
        fh=sPmQr6GjD/AyiGgCk4aZfc+0TnzPtCRVbRtSMqnA51g=;
        b=oY2P74L9W53fL61pjXmcTxUmGbn8bHotKl+ZiNpO39KRrv08P3xEFbhN1y/YlSw4sX
         ecltP+hs0B5vESHDYx2ip5Scc0B7fco+GwMsdGW3tpCvyKEj99dBnesbakhm+JE5Sd7G
         D2No1zZTO58c5SrqQjgrjuBsk46Kc84vIfP/lf082qi1kJbg8O32xzByvENllMi8bGrw
         fiICLqRBLKhqLu43iJQLRU7G3npoVdCyofwkq42VuTT+l3M8NbYPWI7jcgkRK65ZmjsY
         pKQR3+Lcqxq16WLdOGw7RRb2dTSD+X1HiuUOE7zcAWvuMqMfOd8RnLoTmYKWOoxbXsdS
         3z/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783444147; x=1784048947; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9lfVufk5V6ONvrwxd5qwRqQ5dHF658hNKhamzFjYII=;
        b=h1WR0YeuaeiQTpWcFchWc0Fdyv8AJ0V73QkwESlvWIpbxY09mK7RkqrOA+rJbuFYIr
         iCycdkxAbnEb7XHYmDMXwlTIFA7vAGYFXWvyM06s15qus47v6NOJNnMNI/+OfNT5pU5a
         4wUn/HZbScCbVuvHQxwymoz5myrcprzdRhLGW+bcTiz8BtIcnIRW63toZREniUd2dAUG
         xz7sMhHLSh9CsZnS7Nowgy10ILQZWBmYFb85pGp3uSBLoP2gDwsPaIhwuMDuLZeOToFV
         hGBC6oVxID/+Hi6SO5RLwoZoK58g9bHvvMEdhGVde6Cu3+J/K7jb+WwgJ/EFAdcevjzS
         kptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783444147; x=1784048947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9lfVufk5V6ONvrwxd5qwRqQ5dHF658hNKhamzFjYII=;
        b=eqG1BBlB2U3nxlnobg5WvkbIMSUphk3/X7ZCBNE3xKgzoj9B6EcKUA+dsuJe3DvST3
         0w0xkE6nfHaUmPHqQnCDj9kCcKtvWHU0XvVfsaI6tmhpe5DYb3C0Phqw3enqUQMMXcRA
         xL+yPma/MJveuJNTDAV6Ae8IGoiKU2jF2dzCCB15vaWkrQpTXNpdyK2Hh0fzZ6jUUTLM
         6xPADhSvJedeEbO/DxpOWC2PWYkmIUff+PAhxtl7b7QmifIsfFMKosxtDyA1jH//UyHa
         5qQvOanezvNqVWDTTdxKpMu7kCO8YlE12N6+RJuzDpAlcbSpdyWMujBEq0JK6hihzBkQ
         Hjlg==
X-Forwarded-Encrypted: i=1; AFNElJ9Gq6ugJXgS4Imwz8UEPAVcC5PoyVSIkif53YEoDQlpUHy9XOjG2muqwr+rNBWYjKjzKCc1NOdmtZhzhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE+t5A1d3+IVF9Z++v0QcvX77Ly19xT4oYe7Yn5DL5EB9CtKTM
	69JPBFB+CwRobAsPbmMzj9BfN35gt7P8XRs2LPYj1DGAtrJa6qHcitEYRYhoSCQlfxlnZ69RzPf
	IqCzP1uGJdK8Ve0cnohHLKu1joEU/+Hg=
X-Gm-Gg: AfdE7cnX7rcWEZ6sVS2lqhW8FfaSqXLZYZHPdKaCFIpYsXyzTosKeJySZV9sshdxJY6
	HfPRsfphLpkuevCw8s5HtQ/xB9/oCdTPtbYHqf/fZX2VB/Ur+ljXw2eZiMvTY+XJ/YENGas/0Fp
	1krKGMcnLVbABYIw14/s9F6W5rj5uQqJTNQfsWWSxfHS6SZFKCpuilTPjfgg1CQZ5mJnm/vvTUL
	pJ/jRQOh6qvFUM1Zko65vHcv4pOJLKyFzI6TPjZjZbecUmd3fs8Uk/8Ri5Rii/njTLqzlH5liZy
	yB0yCfY2g6CCmVWR5TN8dkaB65k=
X-Received: by 2002:a05:687c:1d0:10b0:451:25f2:da63 with SMTP id
 586e51a60fabf-45125f37d48mr1081836fac.6.1783444142894; Tue, 07 Jul 2026
 10:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260706203128.162335-1-devnexen@gmail.com> <ak0YI9KjSstnj9rJ@lucifer>
In-Reply-To: <ak0YI9KjSstnj9rJ@lucifer>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 7 Jul 2026 18:08:49 +0100
X-Gm-Features: AVVi8CeAguKb-2D6-6uZGOkqLgTNCfKzyhQ0b9NrJMamMVdmP0NqOcPU8DLT3gM
Message-ID: <CA+XhMqzvFtLq1OT-qh207aJhSf+okdE8o8Joe8e_KBvdCjcQfQ@mail.gmail.com>
Subject: Re: [PATCH v8] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dev Jain <dev.jain@arm.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_100909_476844_31E33C95 
X-CRM114-Status: GOOD (  55.48  )
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

Sure thing :)

On Tue, 7 Jul 2026 at 16:19, Lorenzo Stoakes <ljs@kernel.org> wrote:
>
> Hi David C,
>
> This has been through a lot of revisions so I think for the sake of expediency
> the best solution here is for me to grab this and fiddle with it a bit then post
> it out myself.
>
> TO BE VERY CLEAR - I will keep your authorship and attribution :), and simply
> stick my name on a Co-developed-by tag.
>
> So this will remain your patch.
>
> Cheers, Lorenzo
>
> On Mon, Jul 06, 2026 at 09:31:27PM +0100, David Carlier wrote:
> > ptdump_walk_pgd() walks the kernel page tables under get_online_mems().
> > That does not stop vmalloc from freeing a kernel PTE page underneath the
> > walk.
> >
> > When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
> > existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
> > powerpc this runs without the init_mm mmap lock; only arm64 takes it, and
> > not on the block-split path. So ptdump can dereference a just-freed PTE
> > page, which is the use after free syzbot hit in ptdump_pte_entry().
> >
> > The race is not new. ptdump walks the whole kernel address space, including
> > ranges other code is actively mapping, so it reads page tables it does not
> > own. Commit 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page
> > tables") only widened the window; the Fixes tag points there for that
> > reason.
> >
> > Every other walker works on a range it owns and is the only one mutating
> > it: set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
> > openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
> > concurrently, so they cannot race and do not need RCU. ptdump is the only
> > walker that traverses ranges it does not own.
> >
> > Defer the free by an RCU grace period. pagetable_free_kernel() now frees
> > via call_rcu() in both the async and non-async configs. The async path
> > still flushes the TLB first, then queues the per-page RCU free. The page
> > stays valid until any walk that may have observed it drops its RCU read
> > lock.
> >
> > x86, arm64 and riscv reach pagetable_free_kernel() for the collapsed PTE
> > page (the ptdesc carries PT_kernel), so the deferral covers them. powerpc
> > uses its own fragment allocator: pte_free_kernel() there frees the page
> > synchronously via pte_fragment_free() and the ptdesc is not flagged kernel,
> > so defer the kernel case in pte_fragment_free() as well. arm64 also takes
> > init_mm.mmap_lock around the free under a static key; that is now redundant
> > with the RCU deferral but left in place.
> >
> > On the read side walk_page_range_debug() walks the init_mm range in bounded
> > chunks, taking rcu_read_lock() around each chunk and calling cond_resched()
> > between them. It uses the lockless walker as the mmap lock is no longer
> > held, and pgd_addr_end() to bound each chunk without overflowing at the top
> > of the address space. A walker either sees the cleared PMD and skips, or
> > keeps the page alive until it drops the lock. The owned-range walkers are
> > unchanged.
> >
> > Stop taking mmap_write_lock() in ptdump_walk_pgd() for init_mm. It never
> > guarded against this free -- most architectures free the collapsed PTE
> > table without it -- and RCU now provides the synchronisation. efi_mm and
> > current->mm page tables are not RCU-freed, so they keep the mmap write
> > lock.
> >
> > ptdump callbacks run under RCU within a chunk, so they must not sleep. The
> > arch note_page() and effective_prot() callbacks only format into the
> > preallocated seq_file buffer; the only GFP_KERNEL marker setup runs before
> > the walk, and cond_resched() happens between chunks, outside the read lock.
> >
> > Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> > Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> > v8: fix four issues raised by the Gemini review of v7 (relayed by Andrew).
> >     - the init_mm walk called walk_kernel_page_table_range(), which
> >       asserts init_mm.mmap_lock -- but that lock is now dropped; use the
> >       lockless walker instead.
> >     - only stop taking mmap_write_lock() for init_mm; efi_mm and
> >       current->mm are not RCU-freed and keep it.
> >     - bound each chunk with pgd_addr_end() so the last chunk does not
> >       overflow at the top of the address space.
> >     - powerpc frees kernel PTE pages synchronously via pte_fragment_free()
> >       and never sets PT_kernel, so it bypassed the RCU deferral; defer the
> >       kernel case there too.
> > v7: no code change; add version tag and per-revision changelog (Dev).
> > v6: chunk the init_mm walk in walk_page_range_debug() and take
> >     rcu_read_lock() per chunk (reverting v5's caller-side lock + assert)
> >     so the read section stays bounded on large kernel address spaces and
> >     can cond_resched() between chunks; drop the now-redundant
> >     mmap_write_lock() in ptdump_walk_pgd().
> > v5: reframe changelog around the pre-existing race and range ownership;
> >     correct the mmap-lock description (arm64 is the exception, not x86);
> >     move rcu_read_lock() into ptdump_walk_pgd() and assert it in
> >     walk_page_range_debug(); drop walk_kernel_page_table_range_rcu(); fix
> >     the pgtable-generic.c comment; document the no-sleep audit of the
> >     callbacks.
> > v4: defer the free in both the async and non-async configs, not just the
> >     async one; add a walk_kernel_page_table_range_rcu() helper.
> > v3: take rcu_read_lock() in the init_mm branch of walk_page_range_debug().
> > v2: use call_rcu() instead of synchronize_rcu().
> >  arch/powerpc/mm/pgtable-frag.c |  7 ++++++-
> >  include/linux/mm.h             |  7 -------
> >  mm/pagewalk.c                  | 36 +++++++++++++++++++++++++++++-----
> >  mm/pgtable-generic.c           | 22 ++++++++++++++++++++-
> >  mm/ptdump.c                    | 11 +++++++++--
> >  5 files changed, 67 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> > index ae742564a3d5..1e1e88f831f7 100644
> > --- a/arch/powerpc/mm/pgtable-frag.c
> > +++ b/arch/powerpc/mm/pgtable-frag.c
> > @@ -123,7 +123,12 @@ void pte_fragment_free(unsigned long *table, int kernel)
> >
> >       BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
> >       if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
> > -             if (kernel || !folio_test_clear_active(ptdesc_folio(ptdesc)))
> > +             /*
> > +              * Kernel page tables may be walked locklessly under RCU by
> > +              * ptdump, so defer their free by a grace period too, like the
> > +              * lockless-GUP case below for user tables.
> > +              */
> > +             if (!kernel && !folio_test_clear_active(ptdesc_folio(ptdesc)))
> >                       pte_free_now(&ptdesc->pt_rcu_head);
> >               else
> >                       call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 485df9c2dbdd..79408a17a1b0 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3695,14 +3695,7 @@ static inline void __pagetable_free(struct ptdesc *pt)
> >       __free_pages(page, compound_order(page));
> >  }
> >
> > -#ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
> >  void pagetable_free_kernel(struct ptdesc *pt);
> > -#else
> > -static inline void pagetable_free_kernel(struct ptdesc *pt)
> > -{
> > -     __pagetable_free(pt);
> > -}
> > -#endif
> >  /**
> >   * pagetable_free - Free pagetables
> >   * @pt:      The page table descriptor
> > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > index 3ae2586ff45b..fc2fe014ac8c 100644
> > --- a/mm/pagewalk.c
> > +++ b/mm/pagewalk.c
> > @@ -620,7 +620,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
> >   * Note: Be careful to walk the kernel pages tables, the caller may be need to
> >   * take other effective approaches (mmap lock may be insufficient) to prevent
> >   * the intermediate kernel page tables belonging to the specified address range
> > - * from being freed (e.g. memory hot-remove).
> > + * from being freed (e.g. memory hot-remove, vmap huge page promotion).
> >   */
> >  int walk_kernel_page_table_range(unsigned long start, unsigned long end,
> >               const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
> > @@ -643,7 +643,7 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
> >   * Use this function to walk the kernel page tables locklessly. It should be
> >   * guaranteed that the caller has exclusive access over the range they are
> >   * operating on - that there should be no concurrent access, for example,
> > - * changing permissions for vmalloc objects.
> > + * changing permissions for vmalloc objects, or vmap huge page promotion.
> >   */
> >  int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
> >               const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
> > @@ -692,9 +692,35 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
> >       };
> >
> >       /* For convenience, we allow traversal of kernel mappings. */
> > -     if (mm == &init_mm)
> > -             return walk_kernel_page_table_range(start, end, ops,
> > -                                                 pgd, private);
> > +     if (mm == &init_mm) {
> > +             unsigned long addr = start;
> > +
> > +             /*
> > +              * Walk in bounded chunks so the RCU read lock is never held
> > +              * across the whole kernel address space.  A kernel page table
> > +              * freed via pagetable_free_kernel() stays valid until the walk
> > +              * that may have observed it drops the lock; releasing the lock
> > +              * between chunks is safe as no page table pointer is held
> > +              * across the gap. The mmap lock is not held, so use the
> > +              * lockless walker; RCU, not the lock, keeps the table alive.
> > +              */
> > +             while (addr < end) {
> > +                     unsigned long next = pgd_addr_end(addr, end);
> > +                     int err;
> > +
> > +                     rcu_read_lock();
> > +                     err = walk_kernel_page_table_range_lockless(addr, next, ops,
> > +                                                                 pgd, private);
> > +                     rcu_read_unlock();
> > +                     if (err)
> > +                             return err;
> > +
> > +                     addr = next;
> > +                     cond_resched();
> > +             }
> > +             return 0;
> > +     }
> > +
> >       if (start >= end || !walk.mm)
> >               return -EINVAL;
> >       if (!check_ops_safe(ops))
> > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > index b91b1a98029c..7a32e4821957 100644
> > --- a/mm/pgtable-generic.c
> > +++ b/mm/pgtable-generic.c
> > @@ -410,6 +410,13 @@ pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
> >       goto again;
> >  }
> >
> > +static void kernel_pgtable_free_rcu(struct rcu_head *head)
> > +{
> > +     struct ptdesc *pt = container_of(head, struct ptdesc, pt_rcu_head);
> > +
> > +     __pagetable_free(pt);
> > +}
> > +
> >  #ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
> >  static void kernel_pgtable_work_func(struct work_struct *work);
> >
> > @@ -434,8 +441,15 @@ static void kernel_pgtable_work_func(struct work_struct *work)
> >       spin_unlock(&kernel_pgtable_work.lock);
> >
> >       iommu_sva_invalidate_kva_range(PAGE_OFFSET, TLB_FLUSH_ALL);
> > +
> > +     /*
> > +      * Debug walkers (ptdump) may walk ranges they do not own and race this
> > +      * free, so they walk under rcu_read_lock(). Free after a grace period:
> > +      * a walker either already saw the cleared PMD, or keeps the page alive
> > +      * until it drops the RCU lock.
> > +      */
> >       list_for_each_entry_safe(pt, next, &page_list, pt_list)
> > -             __pagetable_free(pt);
> > +             call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
> >  }
> >
> >  void pagetable_free_kernel(struct ptdesc *pt)
> > @@ -446,4 +460,10 @@ void pagetable_free_kernel(struct ptdesc *pt)
> >
> >       schedule_work(&kernel_pgtable_work.work);
> >  }
> > +#else
> > +void pagetable_free_kernel(struct ptdesc *pt)
> > +{
> > +     /* Defer the free by a grace period; see kernel_pgtable_work_func(). */
> > +     call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
> > +}
> >  #endif
> > diff --git a/mm/ptdump.c b/mm/ptdump.c
> > index 973020000096..537be9995e1a 100644
> > --- a/mm/ptdump.c
> > +++ b/mm/ptdump.c
> > @@ -177,13 +177,20 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> >       const struct ptdump_range *range = st->range;
> >
> >       get_online_mems();
> > -     mmap_write_lock(mm);
> > +     /*
> > +      * init_mm is walked locklessly under RCU by walk_page_range_debug().
> > +      * efi_mm / current->mm page tables are not RCU-freed, so hold the
> > +      * mmap write lock to keep them stable against concurrent teardown.
> > +      */
> > +     if (mm != &init_mm)
> > +             mmap_write_lock(mm);
> >       while (range->start != range->end) {
> >               walk_page_range_debug(mm, range->start, range->end,
> >                                     &ptdump_ops, pgd, st);
> >               range++;
> >       }
> > -     mmap_write_unlock(mm);
> > +     if (mm != &init_mm)
> > +             mmap_write_unlock(mm);
> >       put_online_mems();
> >
> >       /* Flush out the last page */
> > --
> > 2.53.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
