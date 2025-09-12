Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBDFCAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXMF8wDw75Z9SUQQMcrYrTII5Enh37+FVpkQ1HHz0DY=; b=jeXjNncKJuhERg
	BcunAjSw3N9fJxcwudIZrIEpRsM2rfMCISb/HhAQ8X1cPXafZWSnob9ZUm0WOk1J1lKaLk/gdSB3O
	iUDEX+5oTmEA4M6rMxY1ihY2stCxfORGQ8QVjTUqisTSxnbHNalexmpCwL2hhxCfT4D3vWxWQtyUw
	7SmgXKJ3+++9yi+mzMMHO7Di7yPqEfka5jky53rZltAtAxzOuaKSuw3nNSrInQWK/shrkpNt34Cq4
	k3J2uIpCTaPDOqggnYId98XpLb4qA293R4mNn9qdMu4w5AsPdJ/BJHONOyeDd8jlN4Ze6mGU6IN+M
	DO1mEo1x2zCvwS1mx65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzya-00000008EYL-07Dq;
	Fri, 12 Sep 2025 09:21:52 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzyX-00000008EWD-2AQ9
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 09:21:51 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7459d088020so848092a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668908; x=1758273708; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUZ7obya3Sr5RFpCVfRbeOTL3de87o7Xbr0uUEJlIJc=;
        b=ZX5vdFc7CqJo2i2tgoxadl9n0cJDLoKu6+uO+4CpwFvom8qL3DNjCMKaS5qmCE/Ggy
         jFOJCMA/0zeGLkuELZeaauOfGsIY3JyrwjaZzJzWG8qyVSM/wXUZDOi5sZlFB/kFvbl4
         9ScLkoMGtpyuMdwX825R1eyCWKgH/44dPtrIsWc6FMfUHB84+cOLbrk/dr6UhFl7wW1O
         c+8hpNxV5mtlk+FJx4STmxTc4W2wjqatf9P3ze+WCdbt2b7kja6yOeTiokbvlEzPvgbJ
         1ax853S09HylpyvtWF3okmvtOcGhmowj/BHj4oW37Qq6x31dRIUc/P3G8s8YhV+FcqzC
         BiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668908; x=1758273708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUZ7obya3Sr5RFpCVfRbeOTL3de87o7Xbr0uUEJlIJc=;
        b=fdkRJkI1q2wasbbBIrkNgB8bEh0W0xCu35PHGoOeMxF5JyvYpCXJhGYeMyo4rWpai/
         hvNZtkHLLCimnkacyCx9fThrPo+L+/Hnm2OSaFV2o4sTohHu0G/UyOZuguqMno2DqvCV
         Ufw83Rs4OsUKqnvMLg5cCo6qQFpT2E/2viKpzquy0QwATWkVp2vT+50ETlXQ9PnH03gz
         M1cImpXYfr94Ba5krVDMVBBr79BlfoWbCSb9AVQX3WFZmit8MN7HhfBu526sL1IzvUTK
         lF41v4ydJjH27JiCSuEVR044QFz3/kXtiblYnAgYH2uVpJJPtf9cscDzcwnlzTmte/3F
         4J9A==
X-Forwarded-Encrypted: i=1; AJvYcCVaZ8feJ9INB/PRRmPbgVRXOwz2nM76B0vV0ew8kLNt+PKKqJ6b7WI7IYn0SiH1i3JI9iFFBSCit506jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyJoNlInGZchMHolyqcC/PVFOKlbiIOZfZqGFnbLRylKhCXDy0
	Jio0DKj/yquqCmqct0Came+PWzxbYzYLw1cDeZzHYQEzJ2eGrgvIxGFyQGb/ndrQ+T0jp57mtdN
	n+5lRj/K9SwTJC753EjDlpb9ufP31/bo=
X-Gm-Gg: ASbGncvsb7KFD9WSb/r3yYO7SUs8Wp7rdd7BTAYiDU1pXwwvTPnY2IrLo0aYsXTV09h
	4vkH0QOLCB1Ms6IGfBHIMPnNmwnuj61VmluQzcEemXVOu5Vw6aCxsARzH8w5CIQJR//qG5fusJ+
	4P0WGO5Rg1QzyRrqRoks1FjPu2Nvb//xfD50nrsyZq896Q1tKSzB7A0OlVV38Tyow4WlJ9c/dCl
	IBuWw==
X-Google-Smtp-Source: AGHT+IHKdOD0sav1pzLGsvexIHlR11xBcySbkJsNI1i4E1d/USdK7pecHfX7/WogNjy7HJPcnksQEcW2rH2s9qtPrgk=
X-Received: by 2002:a05:6871:204:b0:31d:8a1e:78ce with SMTP id
 586e51a60fabf-32e554a2f38mr945748fac.16.1757668908198; Fri, 12 Sep 2025
 02:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
 <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn> <9bcaf3ec-c0a1-4ca5-87aa-f84e297d1e42@redhat.com>
 <CAAfSe-sAru+FuhVWRa+i5_sj6m4318pLFrgP0Gsd0DVWzjE-hg@mail.gmail.com> <04d2d781-fd5e-4778-b042-d4dbeb8c5d49@redhat.com>
In-Reply-To: <04d2d781-fd5e-4778-b042-d4dbeb8c5d49@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 12 Sep 2025 17:21:11 +0800
X-Gm-Features: Ac12FXyFflHnf_JBI4i9hH9jqdgSKY4ieN6Zsx6mGzkigco15IPWhOrDoEo2gdw
Message-ID: <CAAfSe-tQgmBm=RS2gCi7VaRW1XZhS_sJ9rHbvqJ0w=KwTf+m3g@mail.gmail.com>
Subject: Re: [PATCH v11 1/5] mm: softdirty: Add pgtable_soft_dirty_supported()
To: David Hildenbrand <david@redhat.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_022149_599937_6F47FF2D 
X-CRM114-Status: GOOD (  43.93  )
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

On Fri, 12 Sept 2025 at 16:41, David Hildenbrand <david@redhat.com> wrote:
>
> [...]
>
> >>> +/*
> >>> + * We should remove the VM_SOFTDIRTY flag if the soft-dirty bit is
> >>> + * unavailable on which the kernel is running, even if the architecture
> >>> + * provides the resource and soft-dirty is compiled in.
> >>> + */
> >>> +#ifdef CONFIG_MEM_SOFT_DIRTY
> >>> +     if (!pgtable_soft_dirty_supported())
> >>> +             mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> >>> +#endif
> >>
> >> You can now drop the ifdef.
> >
> > Ok, you mean define VM_SOFTDIRTY 0x08000000 no matter if
> > MEM_SOFT_DIRTY is compiled in, right?
> >
> > Then I need memcpy() to set mnemonics[ilog2(VM_SOFTDIRTY)] here.
>
> The whole hunk will not be required when we make sure VM_SOFTDIRTY never
> gets set, correct?

Oh no, this hunk code does not set vmflag.
The mnemonics[ilog2(VM_SOFTDIRTY)] is for show_smap_vma_flags(),
something like below:
# cat /proc/1/smaps
5555605c7000-555560680000 r-xp 00000000 fe:00 19
  /bin/busybox
...
VmFlags: rd ex mr mw me sd

'sd' is for soft-dirty

I think this is still needed, right?

>
> >
> >>
> >> But, I wonder if could we instead just stop setting the flag. Then we don't
> >> have to worry about any VM_SOFTDIRTY checks.
> >>
> >> Something like the following
> >>
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index 892fe5dbf9de0..8b8bf63a32ef7 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -783,6 +783,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> >>    static inline void vm_flags_init(struct vm_area_struct *vma,
> >>                                   vm_flags_t flags)
> >>    {
> >> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
> >>          ACCESS_PRIVATE(vma, __vm_flags) = flags;
> >>    }
> >>
> >> @@ -801,6 +802,7 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
> >>    static inline void vm_flags_reset_once(struct vm_area_struct *vma,
> >>                                         vm_flags_t flags)
> >>    {
> >> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
> >>          vma_assert_write_locked(vma);
> >>          WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
> >>    }
> >> @@ -808,6 +810,7 @@ static inline void vm_flags_reset_once(struct vm_area_struct *vma,
> >>    static inline void vm_flags_set(struct vm_area_struct *vma,
> >>                                  vm_flags_t flags)
> >>    {
> >> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
> >>          vma_start_write(vma);
> >>          ACCESS_PRIVATE(vma, __vm_flags) |= flags;
> >>    }
> >> diff --git a/mm/mmap.c b/mm/mmap.c
> >> index 5fd3b80fda1d5..40cb3fbf9a247 100644
> >> --- a/mm/mmap.c
> >> +++ b/mm/mmap.c
> >> @@ -1451,8 +1451,10 @@ static struct vm_area_struct *__install_special_mapping(
> >>                  return ERR_PTR(-ENOMEM);
> >>
> >>          vma_set_range(vma, addr, addr + len, 0);
> >> -       vm_flags_init(vma, (vm_flags | mm->def_flags |
> >> -                     VM_DONTEXPAND | VM_SOFTDIRTY) & ~VM_LOCKED_MASK);
> >> +       vm_flags |= mm->def_flags | VM_DONTEXPAND;
> >
> > Why use '|=' rather than not directly setting vm_flags which is an
> > uninitialized variable?
>
> vm_flags is passed in by the caller?
>

Then the original code seems wrong.

> But just to clarify: this code was just a quick hack, adjust it as you need.

Got it.

>
> [...]
>
> >>>
> >>> +     if (!pgtable_soft_dirty_supported())
> >>> +             return;
> >>> +
> >>>        if (pmd_present(pmd)) {
> >>>                /* See comment in change_huge_pmd() */
> >>>                old = pmdp_invalidate(vma, addr, pmdp);
> >>
> >> That would all be handled with the above never-set-VM_SOFTDIRTY.
>
> I meant that there is no need to add the pgtable_soft_dirty_supported()
> check.

Ok I will take a look.

>
> >
> > Sorry I'm not sure I understand here, you mean no longer need #ifdef
> > CONFIG_MEM_SOFT_DIRTY for these function definitions, right?
>
> Likely we could drop them. VM_SOFTDIRTY will never be set so the code
> will not be invoked.

The relationship of VM_SOFTDIRTY and clear_soft_dirty_pmd() is not
very direct from the first sight, let me take a further look.

>
> And for architectures where VM_SOFTDIRTY is never even possible
> (!CONFIG_MEM_SOFT_DIRTY) we keep it as 0.

Ok.

>
> That way, the compiler can even optimize out all of that code because
>
> "vma->vm_flags & VM_SOFTDIRTY" -> "vma->vm_flags & 0"
>
> will never be true.
>
> >
> >>
> >>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>> index 4c035637eeb7..2a3578a4ae4c 100644
> >>> --- a/include/linux/pgtable.h
> >>> +++ b/include/linux/pgtable.h
> >>> @@ -1537,6 +1537,18 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> >>>    #define arch_start_context_switch(prev)     do {} while (0)
> >>>    #endif
> >>>
> >>> +/*
> >>> + * Some platforms can customize the PTE soft-dirty bit making it unavailable
> >>> + * even if the architecture provides the resource.
> >>> + * Adding this API allows architectures to add their own checks for the
> >>> + * devices on which the kernel is running.
> >>> + * Note: When overiding it, please make sure the CONFIG_MEM_SOFT_DIRTY
> >>> + * is part of this macro.
> >>> + */
> >>> +#ifndef pgtable_soft_dirty_supported
> >>> +#define pgtable_soft_dirty_supported()       IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
> >>> +#endif
> >>> +
> >>>    #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >>>    #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >>>    static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> >>> index 830107b6dd08..b32ce2b0b998 100644
> >>> --- a/mm/debug_vm_pgtable.c
> >>> +++ b/mm/debug_vm_pgtable.c
> >>> @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
> >>>    {
> >>>        pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> >>> +     if (!pgtable_soft_dirty_supported())
> >>>                return;
> >>>
> >>>        pr_debug("Validating PTE soft dirty\n");
> >>> @@ -702,7 +702,7 @@ static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
> >>>    {
> >>>        pte_t pte;
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> >>> +     if (!pgtable_soft_dirty_supported())
> >>>                return;
> >>>
> >>>        pr_debug("Validating PTE swap soft dirty\n");
> >>> @@ -718,7 +718,7 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args)
> >>>    {
> >>>        pmd_t pmd;
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> >>> +     if (!pgtable_soft_dirty_supported())
> >>>                return;
> >>>
> >>>        if (!has_transparent_hugepage())
> >>> @@ -734,8 +734,8 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
> >>>    {
> >>>        pmd_t pmd;
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
> >>> -             !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
> >>> +     if (!pgtable_soft_dirty_supported() ||
> >>> +         !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
> >>>                return;
> >>>
> >>>        if (!has_transparent_hugepage())
> >>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>> index 9c38a95e9f09..218d430a2ec6 100644
> >>> --- a/mm/huge_memory.c
> >>> +++ b/mm/huge_memory.c
> >>> @@ -2271,12 +2271,13 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
> >>>
> >>>    static pmd_t move_soft_dirty_pmd(pmd_t pmd)
> >>>    {
> >>> -#ifdef CONFIG_MEM_SOFT_DIRTY
> >>> -     if (unlikely(is_pmd_migration_entry(pmd)))
> >>> -             pmd = pmd_swp_mksoft_dirty(pmd);
> >>> -     else if (pmd_present(pmd))
> >>> -             pmd = pmd_mksoft_dirty(pmd);
> >>> -#endif
> >>> +     if (pgtable_soft_dirty_supported()) {
> >>> +             if (unlikely(is_pmd_migration_entry(pmd)))
> >>> +                     pmd = pmd_swp_mksoft_dirty(pmd);
> >>> +             else if (pmd_present(pmd))
> >>> +                     pmd = pmd_mksoft_dirty(pmd);
> >>> +     }
> >>> +
> >>
> >> Wondering, should simply the arch take care of that and we can just clal
> >> pmd_swp_mksoft_dirty / pmd_mksoft_dirty?
> >
>
> I think we have that already in include/linux/pgtable.h:
>
> We have stubs that just don't do anything.
>
> For riscv support you would handle runtime-enablement in these helpers.
>
> >
> >>
> >>>        return pmd;
> >>>    }
> >>>
> >>> diff --git a/mm/internal.h b/mm/internal.h
> >>> index 45b725c3dc03..c6ca62f8ecf3 100644
> >>> --- a/mm/internal.h
> >>> +++ b/mm/internal.h
> >>> @@ -1538,7 +1538,7 @@ static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
> >>>         * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
> >>>         * will be constantly true.
> >>>         */
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> >>> +     if (!pgtable_soft_dirty_supported())
> >>>                return false;
> >>>
> >>
> >> That should be handled with the above never-set-VM_SOFTDIRTY.
> >
> > We don't need to check if (!pgtable_soft_dirty_supported()) if I
> > understand correctly.
> Hm, let me think about that. No, I think this has to stay as the comment
> says, so this case here is special.

I will cook a new version and then we can discuss further based on the
new patch.

Thanks for your review,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
