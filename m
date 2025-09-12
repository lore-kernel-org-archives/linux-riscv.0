Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F74CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuahPy+gm/rNCg25gQs+aj4MpjQ/I4dudIKqGb5LndA=; b=wSUrj2XhokALBr
	fpDiR7tf9nVqvhSq3ZowJs5ErnZCyvCK5o2DfXjPcPrL5gjR/xazsey0J2B2SA8WgxfTVUxaIfb39
	P/JfRWtPk9do77ufaPEtzhMJegkP4fI7pkffV2oZCHF4HW1PxiPE+SF4gL9IA63xEl8eJaOFCrZvM
	flLXUBmNYGaLIa38iFdnXzfHVmLM1uxe91Nq2t4LlNseqcIU3VzMQhk661Dx7afmOyYf2rHs4AJEI
	NyfS3XK35dgAWYNDQBED9NrjHokxCSWYcv/ZB2LaxNixp3AgdHHtj721Ub/79quZqqXAykF7a0fyx
	71wvI/qZAxEykdUEl1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz3e-00000007tob-2Zrb;
	Fri, 12 Sep 2025 08:23:02 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz3c-00000007tn3-0y66
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 08:23:01 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-746da717f35so825664a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757665379; x=1758270179; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5OA4HGL1bZCBXlCcQNNT1fh5jmZSp0K7o8ch/qdvnc=;
        b=BhRf9op4V4kwIQslONpYXAOtf4OyYaa8klNK/wswIiKOtrqqCm4MYRvB1Rd6jio1Bv
         rd044+1rWqi0PZDJrwTic8+5LN+dxMQ0Fqj195sixvoArvRzhtjnhcfxlQms3AKtCV2P
         7Zslpos3YKE3I5u8vt0IP14eY1clltP2gTHrFPpSTLJrgae083KZ697osVyzjvUJieUe
         HxCbIpebgcnsMsWY+1iX6APVhOYDbNvQ3uC3Jl2UWMr/F6CbIijpqzSbuoBDGCYl0rL6
         Z4FFV+KkRSRi783HJMcNI853FHW+PO9YyzLTIrzpSG55osPEnpJ+xZNSk6ruvBS/HVHk
         g9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665379; x=1758270179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5OA4HGL1bZCBXlCcQNNT1fh5jmZSp0K7o8ch/qdvnc=;
        b=iGur39hQ8f9rH1PldRSE9hBnE/HMLhYoSpGmLSnEePw8pnKVO/Tywt94NKP+2hTbRn
         t8NNclduGR811pB/4sh2FpxbmyF9IiDSlqYQwrYOoFGIPtdBkwnCwxvio1Ta4YvBZHSM
         ElUhPiDYNJT5i3fcE6+H6H6EqrK5wOdCuU6k9pZUK/PRnB+9Svd4qNVwNzEyEe5HflCy
         ROdgyeAGiEpTWePJMZQrtIh6tHmiN6T2Z69TVpYSDKovkdn9nc9TSSZAFxL9cMf4Gr5K
         j/rdRsZn4zES3tkKhVqweU3VJ2+25YOTRFsr0O54aX/ofSpEQ/Dk8Gz3vhtOUpe7DrVE
         czcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN1ql+As/R/gReflutuVJ1781N6WeD2Rb2rwe9w5eecGrJFKfXbyQbkbNlCohCT6RNpOtd5gm7hIc0fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9fChF/7w0jzv0OjgXR8qm7NYUNv+QRxwGigPFS7nh2vEo0Qv6
	RdjxEtaKYFS1qM7qzJqq4OH8khXH+foaUlf/4lGfRwLaHD/ETAU+DCedi0aOfZKHXv/BTW3gNvV
	ldtTqwKA2GISfAcbwPPW8CTxWuVcVhQg=
X-Gm-Gg: ASbGncssPq887HhxayDytwohdOvfIE5LWvTdHWo+skcbSSwsqwTovMs7nKX/wb3LDn6
	hz103vOkQs+32rpd+T4zzJQyeem9wC/A6EO4pr13HPQ3Sj/Ye8WpW3qFHjb9bTeN2Lp2PN2FRUO
	mFQFkC9bY+3rhuXwv872XTOmL1mLVc1L5ZkExRUC4EdzsVsY4JV8zvT7Og4I4MC0R7URiP1GYdm
	IamTqvs2Z9OleEeb4/qBTimdDY=
X-Google-Smtp-Source: AGHT+IHhOajMg45qoQKuHFqOphgW1v8C6Y3NGv24TZhjVOQCnYNmKayhLoX2A9i2pe11HP7tejVyO8ZyZRPs6TouXr8=
X-Received: by 2002:a05:6808:80ad:b0:437:d306:3067 with SMTP id
 5614622812f47-43b8d896834mr791446b6e.5.1757665378727; Fri, 12 Sep 2025
 01:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
 <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn> <9bcaf3ec-c0a1-4ca5-87aa-f84e297d1e42@redhat.com>
In-Reply-To: <9bcaf3ec-c0a1-4ca5-87aa-f84e297d1e42@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 12 Sep 2025 16:22:22 +0800
X-Gm-Features: Ac12FXy-cDQ5eFXWwommKSKcCFuy-deRstciVxjZJ-jBtke_I7rVvu7ZtFQQsPg
Message-ID: <CAAfSe-sAru+FuhVWRa+i5_sj6m4318pLFrgP0Gsd0DVWzjE-hg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250912_012300_303327_20F7EB37 
X-CRM114-Status: GOOD (  42.95  )
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

Hi David,

On Thu, 11 Sept 2025 at 21:09, David Hildenbrand <david@redhat.com> wrote:
>
> On 11.09.25 11:55, Chunyan Zhang wrote:
> > Some platforms can customize the PTE PMD entry soft-dirty bit making it
> > unavailable even if the architecture provides the resource.
> >
> > Add an API which architectures can define their specific implementations
> > to detect if soft-dirty bit is available on which device the kernel is
> > running.
>
> Thinking to myself: maybe pgtable_supports_soft_dirty() would read better
> Whatever you prefer.

I will use pgtable_supports_* in the next version.

> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   fs/proc/task_mmu.c      | 17 ++++++++++++++++-
> >   include/linux/pgtable.h | 12 ++++++++++++
> >   mm/debug_vm_pgtable.c   | 10 +++++-----
> >   mm/huge_memory.c        | 13 +++++++------
> >   mm/internal.h           |  2 +-
> >   mm/mremap.c             | 13 +++++++------
> >   mm/userfaultfd.c        | 10 ++++------
> >   7 files changed, 52 insertions(+), 25 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 29cca0e6d0ff..9e8083b6d4cd 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1058,7 +1058,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >        * -Werror=unterminated-string-initialization warning
> >        *  with GCC 15
> >        */
> > -     static const char mnemonics[BITS_PER_LONG][3] = {
> > +     static char mnemonics[BITS_PER_LONG][3] = {
> >               /*
> >                * In case if we meet a flag we don't know about.
> >                */
> > @@ -1129,6 +1129,16 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >               [ilog2(VM_SEALED)] = "sl",
> >   #endif
> >       };
> > +/*
> > + * We should remove the VM_SOFTDIRTY flag if the soft-dirty bit is
> > + * unavailable on which the kernel is running, even if the architecture
> > + * provides the resource and soft-dirty is compiled in.
> > + */
> > +#ifdef CONFIG_MEM_SOFT_DIRTY
> > +     if (!pgtable_soft_dirty_supported())
> > +             mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> > +#endif
>
> You can now drop the ifdef.

Ok, you mean define VM_SOFTDIRTY 0x08000000 no matter if
MEM_SOFT_DIRTY is compiled in, right?

Then I need memcpy() to set mnemonics[ilog2(VM_SOFTDIRTY)] here.

>
> But, I wonder if could we instead just stop setting the flag. Then we don't
> have to worry about any VM_SOFTDIRTY checks.
>
> Something like the following
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 892fe5dbf9de0..8b8bf63a32ef7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -783,6 +783,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>   static inline void vm_flags_init(struct vm_area_struct *vma,
>                                  vm_flags_t flags)
>   {
> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
>         ACCESS_PRIVATE(vma, __vm_flags) = flags;
>   }
>
> @@ -801,6 +802,7 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
>   static inline void vm_flags_reset_once(struct vm_area_struct *vma,
>                                        vm_flags_t flags)
>   {
> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
>         vma_assert_write_locked(vma);
>         WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
>   }
> @@ -808,6 +810,7 @@ static inline void vm_flags_reset_once(struct vm_area_struct *vma,
>   static inline void vm_flags_set(struct vm_area_struct *vma,
>                                 vm_flags_t flags)
>   {
> +       VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
>         vma_start_write(vma);
>         ACCESS_PRIVATE(vma, __vm_flags) |= flags;
>   }
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 5fd3b80fda1d5..40cb3fbf9a247 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1451,8 +1451,10 @@ static struct vm_area_struct *__install_special_mapping(
>                 return ERR_PTR(-ENOMEM);
>
>         vma_set_range(vma, addr, addr + len, 0);
> -       vm_flags_init(vma, (vm_flags | mm->def_flags |
> -                     VM_DONTEXPAND | VM_SOFTDIRTY) & ~VM_LOCKED_MASK);
> +       vm_flags |= mm->def_flags | VM_DONTEXPAND;

Why use '|=' rather than not directly setting vm_flags which is an
uninitialized variable?

> +       if (pgtable_soft_dirty_supported())
> +               vm_flags |= VM_SOFTDIRTY;
> +       vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
>         vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>
>         vma->vm_ops = ops;
> diff --git a/mm/vma.c b/mm/vma.c
> index abe0da33c8446..16a1ed2a6199c 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2551,7 +2551,8 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
>          * then new mapped in-place (which must be aimed as
>          * a completely new data area).
>          */
> -       vm_flags_set(vma, VM_SOFTDIRTY);
> +       if (pgtable_soft_dirty_supported())
> +               vm_flags_set(vma, VM_SOFTDIRTY);
>
>         vma_set_page_prot(vma);
>   }
> @@ -2819,7 +2820,8 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>         mm->data_vm += len >> PAGE_SHIFT;
>         if (vm_flags & VM_LOCKED)
>                 mm->locked_vm += (len >> PAGE_SHIFT);
> -       vm_flags_set(vma, VM_SOFTDIRTY);
> +       if (pgtable_soft_dirty_supported())
> +               vm_flags_set(vma, VM_SOFTDIRTY);
>         return 0;
>
>   mas_store_fail:
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 922ee51747a68..c06732a5a620a 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -107,6 +107,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>   int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
>                           unsigned long *top_mem_p)
>   {
> +       unsigned long flags  = VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP;
>         int err;
>         struct vm_area_struct *vma = vm_area_alloc(mm);
>
> @@ -137,7 +138,9 @@ int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
>         BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
>         vma->vm_end = STACK_TOP_MAX;
>         vma->vm_start = vma->vm_end - PAGE_SIZE;
> -       vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
> +       if (pgtable_soft_dirty_supported())
> +               flags |= VM_SOFTDIRTY;
> +       vm_flags_init(vma, flags);
>         vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>
>         err = insert_vm_struct(mm, vma);
>
>
> > +
> >       size_t i;
> >
> >       seq_puts(m, "VmFlags: ");
> > @@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
> >   static inline void clear_soft_dirty(struct vm_area_struct *vma,
> >               unsigned long addr, pte_t *pte)
> >   {
> > +     if (!pgtable_soft_dirty_supported())
> > +             return;
> >       /*
> >        * The soft-dirty tracker uses #PF-s to catch writes
> >        * to pages, so write-protect the pte as well. See the
> > @@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> >   {
> >       pmd_t old, pmd = *pmdp;
> >
> > +     if (!pgtable_soft_dirty_supported())
> > +             return;
> > +
> >       if (pmd_present(pmd)) {
> >               /* See comment in change_huge_pmd() */
> >               old = pmdp_invalidate(vma, addr, pmdp);
>
> That would all be handled with the above never-set-VM_SOFTDIRTY.

Sorry I'm not sure I understand here, you mean no longer need #ifdef
CONFIG_MEM_SOFT_DIRTY for these function definitions, right?

>
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 4c035637eeb7..2a3578a4ae4c 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1537,6 +1537,18 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> >   #define arch_start_context_switch(prev)     do {} while (0)
> >   #endif
> >
> > +/*
> > + * Some platforms can customize the PTE soft-dirty bit making it unavailable
> > + * even if the architecture provides the resource.
> > + * Adding this API allows architectures to add their own checks for the
> > + * devices on which the kernel is running.
> > + * Note: When overiding it, please make sure the CONFIG_MEM_SOFT_DIRTY
> > + * is part of this macro.
> > + */
> > +#ifndef pgtable_soft_dirty_supported
> > +#define pgtable_soft_dirty_supported()       IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
> > +#endif
> > +
> >   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >   #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >   static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> > diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> > index 830107b6dd08..b32ce2b0b998 100644
> > --- a/mm/debug_vm_pgtable.c
> > +++ b/mm/debug_vm_pgtable.c
> > @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
> >   {
> >       pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> >
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> > +     if (!pgtable_soft_dirty_supported())
> >               return;
> >
> >       pr_debug("Validating PTE soft dirty\n");
> > @@ -702,7 +702,7 @@ static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
> >   {
> >       pte_t pte;
> >
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> > +     if (!pgtable_soft_dirty_supported())
> >               return;
> >
> >       pr_debug("Validating PTE swap soft dirty\n");
> > @@ -718,7 +718,7 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args)
> >   {
> >       pmd_t pmd;
> >
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> > +     if (!pgtable_soft_dirty_supported())
> >               return;
> >
> >       if (!has_transparent_hugepage())
> > @@ -734,8 +734,8 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
> >   {
> >       pmd_t pmd;
> >
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
> > -             !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
> > +     if (!pgtable_soft_dirty_supported() ||
> > +         !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
> >               return;
> >
> >       if (!has_transparent_hugepage())
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 9c38a95e9f09..218d430a2ec6 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2271,12 +2271,13 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
> >
> >   static pmd_t move_soft_dirty_pmd(pmd_t pmd)
> >   {
> > -#ifdef CONFIG_MEM_SOFT_DIRTY
> > -     if (unlikely(is_pmd_migration_entry(pmd)))
> > -             pmd = pmd_swp_mksoft_dirty(pmd);
> > -     else if (pmd_present(pmd))
> > -             pmd = pmd_mksoft_dirty(pmd);
> > -#endif
> > +     if (pgtable_soft_dirty_supported()) {
> > +             if (unlikely(is_pmd_migration_entry(pmd)))
> > +                     pmd = pmd_swp_mksoft_dirty(pmd);
> > +             else if (pmd_present(pmd))
> > +                     pmd = pmd_mksoft_dirty(pmd);
> > +     }
> > +
>
> Wondering, should simply the arch take care of that and we can just clal
> pmd_swp_mksoft_dirty / pmd_mksoft_dirty?

Ok, I think I can do that in another patchset.

>
> >       return pmd;
> >   }
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 45b725c3dc03..c6ca62f8ecf3 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1538,7 +1538,7 @@ static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
> >        * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
> >        * will be constantly true.
> >        */
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> > +     if (!pgtable_soft_dirty_supported())
> >               return false;
> >
>
> That should be handled with the above never-set-VM_SOFTDIRTY.

We don't need to check if (!pgtable_soft_dirty_supported()) if I
understand correctly.

Thanks for the review,
Chunyan

>
> >       /*
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index e618a706aff5..7beb3114dbf5 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -162,12 +162,13 @@ static pte_t move_soft_dirty_pte(pte_t pte)
> >        * Set soft dirty bit so we can notice
> >        * in userspace the ptes were moved.
> >        */
> > -#ifdef CONFIG_MEM_SOFT_DIRTY
> > -     if (pte_present(pte))
> > -             pte = pte_mksoft_dirty(pte);
> > -     else if (is_swap_pte(pte))
> > -             pte = pte_swp_mksoft_dirty(pte);
> > -#endif
> > +     if (pgtable_soft_dirty_supported()) {
> > +             if (pte_present(pte))
> > +                     pte = pte_mksoft_dirty(pte);
> > +             else if (is_swap_pte(pte))
> > +                     pte = pte_swp_mksoft_dirty(pte);
> > +     }
> > +
> >       return pte;
> >   }
> >
> --
> Cheers
>
> David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
