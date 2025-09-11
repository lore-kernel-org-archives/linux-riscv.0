Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB3CA101F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1arLXrypRb7zpNytSsrM4lNn/JyQLo9qSM5nU/09GLA=; b=eDe9TpvMrKS/jO
	Q7WcVMibDnkaS+pLTwb4QW6fu6mA7hdfNY4cEpb2Hqm5MTtxqoGI0sRQcJfck9manhdK0BCQq4eOV
	ui3P+bnEoJQQXbeGZ8fvWtrF7bCefORwr45Cl2TPsQNPZZ9ObQQ5UpCdZho5aNCikUS6To+NlBAFD
	ySznwAWgJbTYj1yWCXYCpYHuqNqX47VjMI21WMWKGEhanZwLrROPBzjkbr5OICDRoXURt2s12z9gw
	W17aiCnsenzmiTwZqLoG8UxiaZfajn3jpL7oCIyRlgmPhodHEzA4DPThNzCmx6CTITMHi7zi+a44d
	8U/iGTCvZS4C2o3sSLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXQI-00000000TCv-1NGb;
	Thu, 11 Sep 2025 02:52:34 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXQF-00000000TBg-2YUT
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 02:52:32 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-328466c2aedso258026fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 19:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757559150; x=1758163950; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bpMjHp2LWdB4AWDkPscdVaO0VRTcuWiIT22FTu9B1MU=;
        b=Dd2e01AY5oLlsojlh550dUmh1NQexlQ8mdQCnEVXq3oPZMPOE+4JOsv5UWE7EDq7Sn
         LelzBs4BKqHtfDPJ9dPXZ6kNrIEdAX+LBFF4/4LQFAOEo9im4+Afz4ENqrzT3w+lUs21
         WCgjMvf/MXsmyA/lTXbxo63DbpoTVOn4OuT+KgatcYSjBr5wtdoWzw2bEmMw3Z1vDJYx
         vGPzFpfLDA77zOvJaQUeB3U8e3sXoSLSQy7IbGgCzT1FN9wUSQp6yvvLCFsu2IQV+RY+
         6LuPZW+0UvB4vOAGLX5cRCqLs/zKAVH9/Ur0wZO1wU5krMuuJi1ZNOCpJPnwc5BQ0lBi
         CZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757559150; x=1758163950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpMjHp2LWdB4AWDkPscdVaO0VRTcuWiIT22FTu9B1MU=;
        b=obWD7BFFUPzZDacS3GemxIaQVAlW4ocBBdNMDO0qnvbElZSy4Z3u+XplyHnUNxN6PQ
         g0tsDXgUh5YpknWbg7bF4FNfdS/9h5V+BlsV857eb+uZ7LFjm/BeQKe8WmtXmIRwvlMg
         Zgf0krQkpdoJhzogGZKenxq3wSEaXe/XxyT7Hb6ngMEOryMniC9+08N/fgq1C2rg8nan
         beH0lUqDRRKCcWGilgCPNQ5DdFbynB/jS2ukDmXsktuFeCExD8lDXV2D6BVAAXHxapSe
         k78NGDtJG/pEDfsJiH5szzIgqkuPJ5N9mAANT/K7+V77w+fVB1CU/HTWf3p+Ci+nGmZv
         aVHw==
X-Forwarded-Encrypted: i=1; AJvYcCWQwiRFqZhTEE1gzgX0QTSTPbOfsMfwT7K2adzXIvCoeDBxw4ljrk7TLEU3LH6y+v6MJXlsSTSusjurug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSYycIIk/VqOeLsD2+KJnQVKvamtBvhbybyiVBwNpjipoOMylR
	QmGhD8u1t2ifwrZ65LNORnG/wqeQ3LfipXU6bRces/XCHBNTJRCLxVYXPUvtAPgQjvQlNjhwU5A
	d2qTmrwLU3HOPGi7k2Ukxd3ae1XACCXk=
X-Gm-Gg: ASbGncuB7amVjpF4KkjurXEJ5IqZCDcZV1NnO3XveEC0cu83Hr8THmNImh4g6U4reqP
	ddSd2zP4sgvgzmOER9a5UE0TGQJZMaQWjUmUHbmOSWdaQvkLUuhg/8KnmO1FO6uLnCdcS4k3XXI
	6BkdxVos6ThPRxS1eXiUjNFwRBIQKQmkP6dW2X+UyCYShxvHzljQ+KugmNa3vhKI/m8tN6RVd1G
	2VaXlKj6+4o6swYkHy2HPjPrIjteFfa8AjcHZU=
X-Google-Smtp-Source: AGHT+IFv2XibXXypOlqv0RILHKkLaMk/1jc9mR92t82jtZp+Vm0vVDQ6eAhrLbih1UZ+0wzcwt9/oVQRFlYGSifHFZw=
X-Received: by 2002:a05:6870:524d:b0:321:2680:2f84 with SMTP id
 586e51a60fabf-3226284cc7bmr8304474fac.3.1757559150312; Wed, 10 Sep 2025
 19:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250909095611.803898-1-zhangchunyan@iscas.ac.cn>
 <20250909095611.803898-2-zhangchunyan@iscas.ac.cn> <6b2f12aa-8ed9-476d-a69d-f05ea526f16a@redhat.com>
 <CAAfSe-vbvGQy9JozQY3vsqrrPrTaWYMcNw+NaDf3nReWz8ynZg@mail.gmail.com> <8f9a4a13-2881-4baf-ab62-3d0d79e0cd3c@redhat.com>
In-Reply-To: <8f9a4a13-2881-4baf-ab62-3d0d79e0cd3c@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 11 Sep 2025 10:51:54 +0800
X-Gm-Features: Ac12FXw931KhRWiAwZHuKU_RVXZ29toqGSbWPbkJSujEUI17HyVR0UbdKmmlFK4
Message-ID: <CAAfSe-snV-XZ3xGmK6gXNXw-D3ECWbyQgG+WG3c5gAsREz4ccQ@mail.gmail.com>
Subject: Re: [PATCH V10 1/5] mm: softdirty: Add pte_soft_dirty_available()
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
X-CRM114-CacheID: sfid-20250910_195231_667889_80C88766 
X-CRM114-Status: GOOD (  30.88  )
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

On Wed, 10 Sept 2025 at 16:51, David Hildenbrand <david@redhat.com> wrote:
>
> On 10.09.25 10:25, Chunyan Zhang wrote:
> > Hi David,
> >
> > On Tue, 9 Sept 2025 at 19:42, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 09.09.25 11:56, Chunyan Zhang wrote:
> >>> Some platforms can customize the PTE soft dirty bit and make it unavailable
> >>> even if the architecture allows providing the PTE resource.
> >>>
> >>> Add an API which architectures can define their specific implementations
> >>> to detect if the PTE soft-dirty bit is available, on which the kernel
> >>> is running.
> >>>
> >>> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >>> ---
> >>>    fs/proc/task_mmu.c      | 17 ++++++++++++++++-
> >>>    include/linux/pgtable.h | 10 ++++++++++
> >>>    mm/debug_vm_pgtable.c   |  9 +++++----
> >>>    mm/huge_memory.c        | 10 ++++++----
> >>>    mm/internal.h           |  2 +-
> >>>    mm/mremap.c             | 10 ++++++----
> >>>    mm/userfaultfd.c        |  6 ++++--
> >>>    7 files changed, 48 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> >>> index 29cca0e6d0ff..20a609ec1ba6 100644
> >>> --- a/fs/proc/task_mmu.c
> >>> +++ b/fs/proc/task_mmu.c
> >>> @@ -1058,7 +1058,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >>>         * -Werror=unterminated-string-initialization warning
> >>>         *  with GCC 15
> >>>         */
> >>> -     static const char mnemonics[BITS_PER_LONG][3] = {
> >>> +     static char mnemonics[BITS_PER_LONG][3] = {
> >>>                /*
> >>>                 * In case if we meet a flag we don't know about.
> >>>                 */
> >>> @@ -1129,6 +1129,16 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >>>                [ilog2(VM_SEALED)] = "sl",
> >>>    #endif
> >>>        };
> >>> +/*
> >>> + * We should remove the VM_SOFTDIRTY flag if the PTE soft-dirty bit is
> >>> + * unavailable on which the kernel is running, even if the architecture
> >>> + * allows providing the PTE resource and soft-dirty is compiled in.
> >>> + */
> >>> +#ifdef CONFIG_MEM_SOFT_DIRTY
> >>> +     if (!pte_soft_dirty_available())
> >>> +             mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> >>> +#endif
> >>> +
> >>>        size_t i;
> >>>
> >>>        seq_puts(m, "VmFlags: ");
> >>> @@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
> >>>    static inline void clear_soft_dirty(struct vm_area_struct *vma,
> >>>                unsigned long addr, pte_t *pte)
> >>>    {
> >>> +     if (!pte_soft_dirty_available())
> >>> +             return;
> >>>        /*
> >>>         * The soft-dirty tracker uses #PF-s to catch writes
> >>>         * to pages, so write-protect the pte as well. See the
> >>> @@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> >>>    {
> >>>        pmd_t old, pmd = *pmdp;
> >>>
> >>> +     if (!pte_soft_dirty_available())
> >>> +             return;
> >>> +
> >>>        if (pmd_present(pmd)) {
> >>>                /* See comment in change_huge_pmd() */
> >>>                old = pmdp_invalidate(vma, addr, pmdp);
> >>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>> index 4c035637eeb7..c0e2a6dc69f4 100644
> >>> --- a/include/linux/pgtable.h
> >>> +++ b/include/linux/pgtable.h
> >>> @@ -1538,6 +1538,15 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> >>>    #endif
> >>>
> >>>    #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >>> +
> >>> +/*
> >>> + * Some platforms can customize the PTE soft dirty bit and make it unavailable
> >>> + * even if the architecture allows providing the PTE resource.
> >>> + */
> >>> +#ifndef pte_soft_dirty_available
> >>> +#define pte_soft_dirty_available()   (true)
> >>> +#endif
> >>> +
> >>>    #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >>>    static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >>>    {
> >>> @@ -1555,6 +1564,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >>>    }
> >>>    #endif
> >>>    #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >>> +#define pte_soft_dirty_available()   (false)
> >>>    static inline int pte_soft_dirty(pte_t pte)
> >>>    {
> >>>        return 0;
> >>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> >>> index 830107b6dd08..98ed7e22ccec 100644
> >>> --- a/mm/debug_vm_pgtable.c
> >>> +++ b/mm/debug_vm_pgtable.c
> >>> @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
> >>>    {
> >>>        pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> >>>
> >>> -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> >>> +     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) || !pte_soft_dirty_available())
> >>
> >> I suggest that you instead make pte_soft_dirty_available() be false without CONFIG_MEM_SOFT_DIRTY.
> >>
> >> e.g., for the default implementation
> >>
> >> define pte_soft_dirty_available()       IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
> >>
> >> That way you can avoid some ifefs and cleanup these checks.
> >
> > Do you mean something like this:
> >
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1538,6 +1538,16 @@ static inline pgprot_t pgprot_modify(pgprot_t
> > oldprot, pgprot_t newprot)
> >   #endif
> >
> >   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> > +#ifndef arch_soft_dirty_available
> > +#define arch_soft_dirty_available()     (true)
> > +#endif
> > +#define pgtable_soft_dirty_supported()
> > (IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) && arch_soft_dirty_available())
> > +
> >   #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >   static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >   {
> > @@ -1555,6 +1565,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >   }
> >   #endif
> >   #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
> > +#define pgtable_soft_dirty_supported() (false)
>
> Maybe we can simplify to
>
> #ifndef pgtable_soft_dirty_supported
> #define pgtable_soft_dirty_supported()  IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
> #endif
>
> And then just let the arch that overrides this function just make it
> respect IS_ENABLED(CONFIG_MEM_SOFT_DIRTY).

Ok, got you, I will address it.

Thanks for your review,
Chunyan


>
> --
> Cheers
>
> David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
