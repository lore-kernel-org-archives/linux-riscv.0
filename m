Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE340C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 05:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMvXCn/krB5Nik1kOpu6NJyJgAlx7LAgVuUBzCAtAmY=; b=CxftD/Jave13V8
	dbOakI7eBwVjH+Ts470dU2TJJLrMZ+v0CCaplQRWu3x2twCRx1A3Iwq58j6ie4TMZHbeQaZ1LavFx
	XQX0lvaPk/9njx8DXimH8voj9B54RZ6mawHqfHcgxJz//I9knwJ91L2I/jDcERwXBNplmTZmoHPV1
	2shkE6oGK9fWiQWq+D1oLj33q2iYtYFAG0bk2qwcP8Qqefnvpe1o47vtDUwnYgFaycRMqK0CvDrzC
	4T7meQfzoaLhbqntjqyzuPC7Eq2q+olc5UFJsdSEygTpJ8a5zRsrMgCKiRR2zBltx5PnFE/X8QV0c
	F7TOB5HNDhOx4q73KovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenwu-00000000kve-17io;
	Wed, 01 Jul 2026 05:57:28 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenwr-00000000kug-2DPq
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 05:57:26 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-43bf9548df4so108529fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 22:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782885444; cv=none;
        d=google.com; s=arc-20260327;
        b=Hq5XFmWrTqvJ+yHOcI2ldg6W0wn4b8C7js+oeTIja/zpkWOU+v+WqaHAfeBVGH7DWQ
         8Fcw3Ts2wTW9SBQTfQyFNdfQXs4MV92e6JLdRkQO0wBs7xjNtH4ukoPPyHyy5usfw6hZ
         ITrYTV1edo6+iPTpmiIYvp467eEGKbU34LqgHl1M2GJDTEwVRSW0YzmexyfejMvOSXUT
         eBz9riSez/sOZDA6NmFMMH9Y//e6Ugm06wLbpg8TQgtsLB/V+m0euTERs1ICeKJNRRjJ
         DCNp2ZB0+69uJimD0iTjBHXJ2iE2hJH88ShFlUSm7zUR/W97FGi7KDuAKShFHgix2MYd
         JAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/yqKyNfIbdPZZEIoT3pMj0snBSQheCwfRoFMX7jxNy4=;
        fh=/TSl4JaV1En7KW3rfyxd7D5P3fPCKWxJgH3EV7zawtQ=;
        b=Cn/n3aArA3o12vcZg5cPDXm2oOYd9b54kNkYbp3D8dzbXFzgUX34tlShi6Jwv7LOuU
         Y/awSvgbdu6blib8M70znc6KLCbloggIb5UuWcSPyuiXBrOvftUvQtEW2cuClM/4Ud0n
         qHAvqK8PiQsX8awJqOIgibNrJ74y2AcbkH2WWYqHGt7d+xm6UBS+og0KeWvN6W2b6t6m
         qBDzC/un+2ustAB8Awv51VITT9leJPUev+yFN5J4840e7jTO0xDA8M6KmGsK1tf4jFcW
         TEZ6qoSNCg0OHtdWdRuSrFHEKEQiyU6KFsdYZmGiRnQ9wQikVAD+RH0lTTnA73q9iGK9
         mr/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782885444; x=1783490244; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yqKyNfIbdPZZEIoT3pMj0snBSQheCwfRoFMX7jxNy4=;
        b=iTR329UiRoCI4KJq+5j2ZYSCgNwfZ6/SYSAV6S62St0MwzdCgKJ21MJMKhGlAyebwm
         8hzqwDpel7U9xlrTkCA/g7voQJhRRnQCTU38muVsc1IVTzCHutyX4r5Ou0DV1Pdnn3Jk
         w3W/bF0qJH816gbuxyk5a2TcxHX+BWZbA0aIaY2qYg56L5VSSnI09dLuRoBn/0kAAZZz
         78nq56dU4ntg/2rVD5qqMhlT9W20SUhZ9MGoQFGyweV2QMh5/1kpDeycfW+Rx3S2sxVO
         9VYOgDP2p32K2PCbgkdjyDyJTqUHmXiUtnDpKcv6jy8GdxOhwcE6q9V3vwGQMXgtPLZz
         b46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885444; x=1783490244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yqKyNfIbdPZZEIoT3pMj0snBSQheCwfRoFMX7jxNy4=;
        b=iEDdS6N6hjAmpoaK+VA3oqzKHZBb3AA7VKvidiq6dsAnl8uFALCqojE3GfRJY8bcys
         tYO6EOs8gTkOv/vU19+JhraawqFU4NfjXiRcR9p+2W3K7TAbwmcLbvwnXMg597AbgWaZ
         VbX3GFtfvhukbcAN/m4imVpFawBIMQBW42E7CYsYk90CYteJSuOR47KKCYjs3+MKgqzU
         vSOLu3lXbKFWPp0yDY14yPcBXkwTuh/83mGszdN9AVjMJMroqBrH2Af+FJVhJLThLmZZ
         YurupbM5IVVt6GFjBjL11HOWnAw8p4H8Ww8kQE+Bvt6OvOcp4gTiRJJDmRFoQPkc0E6P
         hWNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+6mZvqymkb5JcJ7/GRSbsNLb5yqxiCgV0Twnb6FGAv/2DxA2XaBw7uAURLobCUCCxtKoyhYrFX36pig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ibSeiouAoPOebZiYqUvKuvhV+bRqq2Qe6IGWcie07CcctGZN
	rZo/hx0eA1jA+svr8sYveYfSb9S3MsBJTKqdyxSyDjtOLVKYa0uV1VhobGO8Bj1Pgs+dj5kIdHL
	USOeA85UGTTwworyyN1E7ww6lv1mKHVg=
X-Gm-Gg: AfdE7cmesr4JFvumTZEfXtnlU3mgX8eC5BCDArbm2koA26+2/d0Py0kjHdKI3+ruw76
	U3jMtHQRRxsLdEYZ2rtO+SxZJBNzGFEaHsvWw5KngmwmO3SU7upCv8ahlU0CH4wnBqWH2hd2G6q
	xxLkyZf+ZiVNpCemTYoU++TSriPV/qbbA7Ala/JIq/H9x2HUe3oUyR7V3rf5A/1XAgIYkxYdUMB
	KFJ6i2VrxQiAs7WN6TT2mm64vMkJNf+tCiU8HB02VvVK2kVSmZSFiyw6tHoPC1kZhBlyMR/Bpe+
	X6lYlqYngYP9syKefGEDcqPoyaw=
X-Received: by 2002:a05:6870:65a9:b0:441:39e1:246d with SMTP id
 586e51a60fabf-44cab591a28mr62771fac.11.1782885443809; Tue, 30 Jun 2026
 22:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260630041012.5975-1-devnexen@gmail.com> <c3ea35e4-833f-487f-8a8b-6f8f95b7ba95@arm.com>
In-Reply-To: <c3ea35e4-833f-487f-8a8b-6f8f95b7ba95@arm.com>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 1 Jul 2026 06:57:12 +0100
X-Gm-Features: AVVi8CdMasNhHqRsxHAh6nfzwOsbjW2pLFWQnLH3HrhJiEQliG3CECnY09AAYEg
Message-ID: <CA+XhMqzErBiN5w56fO2_2T3Yj=-L+dPUDjoMvNdK9PcF37nsbw@mail.gmail.com>
Subject: Re: [PATCH] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_225725_586682_5F610530 
X-CRM114-Status: GOOD (  47.23  )
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

Hi Dev,

Yes, the RCU deferral covers arm64 too, so the static key and the
mmap_lock in pud_free_pmd_page()/pmd_free_pte_page() are now
redundant. Keep the arch_vmap_*_supported() changes though.

Cheers.

On Wed, 1 Jul 2026 at 06:42, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 30/06/26 9:40 am, David Carlier wrote:
> > ptdump_walk_pgd() walks the kernel page tables under get_online_mems() and
> > mmap_write_lock(&init_mm). Neither lock stops vmalloc from freeing a kernel
> > PTE page underneath the walk.
> >
> > When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
> > existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
> > powerpc this runs without the init_mm mmap lock; only arm64 takes it, and not
> > on the block-split path. So ptdump can dereference a just-freed PTE page,
> > which is the use after free syzbot hit in ptdump_pte_entry().
> >
> > The race is not new. ptdump walks the whole kernel address space, including
> > ranges other code is actively mapping, so it reads page tables it does not
> > own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> > only widened the window; the Fixes tag points there for that reason.
> >
> > Every other walker works on a range it owns and is the only one mutating it:
> > set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
> > openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
> > concurrently, so they cannot race and do not need RCU. ptdump is the only
> > walker that traverses ranges it does not own.
> >
> > Defer the free by an RCU grace period. pagetable_free_kernel() now frees via
> > call_rcu() in both the async and non-async configs. The async path still
> > flushes the TLB first, then queues the per-page RCU free. The page stays
> > valid until any walk that may have observed it drops its RCU read lock.
> >
> > On the read side ptdump_walk_pgd() takes the RCU read lock around the walk,
> > and walk_page_range_debug() asserts it with RCU_LOCKDEP_WARN() for the
> > init_mm case rather than taking it, matching pagewalk.c convention. A walker
> > either sees the cleared PMD and skips, or keeps the page alive until it drops
> > the lock. The owned-range walkers are unchanged.
> >
> > ptdump callbacks now run under RCU, so they must not sleep. The arch
> > note_page() and effective_prot() callbacks only format into the preallocated
> > seq_file buffer, and the walker does not call cond_resched(); the only
> > GFP_KERNEL marker setup runs before the walk.
> >
> > Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> > Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
>
> Thanks.
>
> Is my assessment correct that this patch deems commit fa93b45fd397
> ("arm64: Enable vmalloc-huge with ptdump") redundant? (in which
> case I can send a partial revert for that)
>
>
> > v5: reframe changelog around the pre-existing race and range ownership;
> >     correct the mmap-lock description (arm64 is the exception, not x86);
> >     move rcu_read_lock() into ptdump_walk_pgd() and assert it in
> >     walk_page_range_debug(); drop walk_kernel_page_table_range_rcu(); fix the
> >     pgtable-generic.c comment; document the no-sleep audit of the callbacks.
> > v4: defer the free in both the async and non async configs, not just
> >     the async one. Move the walk under a named
> >     walk_kernel_page_table_range_rcu() helper instead of open coding
> >     rcu_read_lock() in walk_page_range_debug().
> > v3: take rcu_read_lock() in the init_mm branch of
> >     walk_page_range_debug() rather than inside the lockless walker,
> >     which the arm64 split paths also use with GFP_PGTABLE_KERNEL and
> >     can sleep.
> > v2: use call_rcu() instead of synchronize_rcu().
> > ---
> >  include/linux/mm.h   |  7 -------
> >  mm/pagewalk.c        | 14 +++++++++-----
> >  mm/pgtable-generic.c | 22 +++++++++++++++++++++-
> >  mm/ptdump.c          |  2 ++
> >  4 files changed, 32 insertions(+), 13 deletions(-)
> >
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
> > index 3ae2586ff45b..c0be87580989 100644
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
> > @@ -692,9 +692,13 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
> >       };
> >
> >       /* For convenience, we allow traversal of kernel mappings. */
> > -     if (mm == &init_mm)
> > -             return walk_kernel_page_table_range(start, end, ops,
> > -                                                 pgd, private);
> > +     if (mm == &init_mm) {
> > +             RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> > +                              "RCU read lock must be held across kernel page table walk");
> > +             return walk_kernel_page_table_range(start, end, ops, pgd,
> > +                                                     private);
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
> > index 973020000096..50cd96a33dfd 100644
> > --- a/mm/ptdump.c
> > +++ b/mm/ptdump.c
> > @@ -178,11 +178,13 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> >
> >       get_online_mems();
> >       mmap_write_lock(mm);
>
> mmap write lock is not required anymore no?
>
>
> > +     rcu_read_lock();
>
> Is there a possibility of RCU stall here? For example a system with
> lots of physical memory will have a huge linear map.
>
> >       while (range->start != range->end) {
> >               walk_page_range_debug(mm, range->start, range->end,
> >                                     &ptdump_ops, pgd, st);
> >               range++;
> >       }
> > +     rcu_read_unlock();
> >       mmap_write_unlock(mm);
> >       put_online_mems();
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
