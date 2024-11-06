Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE59D29F9D
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 06:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqRz+nXmaf+N1SV+nI+U628+rd0yNDf+ZL4pe6wZ7jY=; b=bIMuMPT5kNZYc5
	CWTE+/uWAgzNOfMPxt3DA0eOPKh0Zxj80eHUdPSDUXC8mVXgNiq0+GC4to25vIF2b1NoUWn34xTeg
	gRTGzub7Flamrp0nQXm/JVnIO4zITCwquNNskQ82F88GfN2kG4q/bze/+AIUz/V5ghU0y5HepIxNI
	4WA5D8M31oTNAvaVWiaz1oYKwNKCY7ChZv9HzUgdcPDqGQ1o1RzgLQTzb1fEO76xoD6X7da4McwKK
	FtkIopblvVJx0z2fGe4OsIDkEi7PcJ8LaFKxwzLRSux6pHdys9hW6Y+MPnsEK7nH3p88V2O+GfA10
	IldwzSnX0uZ/6S3NQvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zki-000000021cn-0l0e;
	Wed, 06 Nov 2024 06:42:52 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zkf-000000021c8-3f7c
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 06:42:51 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5ee1e04776cso1277232eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 22:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730875369; x=1731480169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uqgfmWFtUO+Dj0gj/ZDZ55DmLFvVvhQMks2xq0jpGBY=;
        b=g2/cNfKofPqctM7z/Y36KYeVTNn69yklJVZJNZH4U0qhIJbbpvn8lvgWollTnLOzTW
         CdEKDeijWTKR7By6bPa//ewSzO/+oS+QY5fBRoBVOKEMGNLc49vnkfKrNsVadw7Vvt6Z
         2N48hpLXfPMXKfC/j7eWYVWodzAEJyepWpw/hDM2I+Xt6rsSs4id4TPjDKqwC5wPOmOc
         1M5VZGDOB/KtanZNH7RCjFWz5hvh8bSNCmRdGs6jdgP/gVLZzqvT27d2H/u/dQNlw+ax
         x//2jB6JcXw1XxcmeNXfwdoBv5RjTAkdekYdxNccmU+AkT2e0H+JChv5DWFceOtyPDQv
         nOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730875369; x=1731480169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqgfmWFtUO+Dj0gj/ZDZ55DmLFvVvhQMks2xq0jpGBY=;
        b=N4gJwOH7E69xCzSd0pId1GsEBsiS6lw4Ly8BydbV92LYSKLuC9TOzJZGqfOnRl/1SO
         17BughDkSWzxO+giZWnNHIgZLgAwykB0dRm1UbV9BCrqyUag7w9eYt4zL1AKK1aSc5w0
         B4TQTq1ngW4Ujdcyx+Rtb7rw0y0SdMSW7l8TUwl+eFqyoaiP9dGAOLw3o/KDj9zT2IEr
         VlaCnF66ZQpqd5e5X4Ll8tQdEDFwAUNVKJg5G8ej1ArqA9CeYGzaA2SG+rvemFE8soIU
         5g642j8Qw8tYMAw2qan4T2Qr4QXzEPeK71NPZ5wDZ7QjgGzoCopxyvTELDxgfJCmWVs4
         S8uA==
X-Forwarded-Encrypted: i=1; AJvYcCX1uzUBRu9rTM4ZAtRE7CKhHWHpaLQEpnhU7wqEzzqpyTLrPpUnPu40LdBi0oo4T72uTBlnpjyajbrnjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMMFfLbyjlYjGxVu2+Sn/ufHLzXwnGf7M8BFvEtUXDAnY+OuEX
	hmQDD23IsY9a6i8L9A5GEBsmjogqzh3uj1o2ZkgFWTPy1Tvdt0VjmuImcrwNfRZpb2wHFx0pv1O
	EhjcTFXppaEFCIkuvnVTKA1C78es=
X-Google-Smtp-Source: AGHT+IF+OP1m6N2NRlqRxXPcdnpiGaljyJNWNJD2jmlHRQgxL/lDCGN6jKQkAkmz62i3TD8F4sCz7tm/c47DwTPJhpg=
X-Received: by 2002:a05:6820:1689:b0:5eb:c72e:e29b with SMTP id
 006d021491bc7-5ec6dbd8ff8mr12733521eaf.7.1730875368731; Tue, 05 Nov 2024
 22:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-3-zhangchunyan@iscas.ac.cn> <c4fbc62f-e398-1229-c1b1-7bab30e4460e@huawei.com>
 <CAAfSe-vDtJKeSeUgpeJM0ZQe4XKdKz_Rgz2TQkPb4giPBLsOdw@mail.gmail.com> <d1a84096-9722-47f1-ad8e-671144a3d109@ghiti.fr>
In-Reply-To: <d1a84096-9722-47f1-ad8e-671144a3d109@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Nov 2024 14:42:12 +0800
Message-ID: <CAAfSe-vidGeJVvqhdNrP7iv+ShYocseQ1PFkfaJ33ZFmjghgVQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V4 2/3] riscv: mm: Add soft-dirty page tracking support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_224249_963770_5CFC5B7B 
X-CRM114-Status: GOOD (  32.33  )
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

Hi Alex,

On Tue, 5 Nov 2024 at 21:14, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 30/08/2024 04:31, Chunyan Zhang wrote:
> > Hi Jinjie,
> >
> > On Fri, 30 Aug 2024 at 09:31, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >>
> >> On 2024/8/30 9:11, Chunyan Zhang wrote:
> >>> The PTE bit(9) is reserved for software, now used by DEVMAP,
> >>> this patch reuse bit(9) for soft-dirty which is enabled only
> >>> if !CONFIG_ARCH_HAS_PTE_DEVMAP, in other words, soft-dirty
> >>> and devmap will be mutually exclusive on RISC-V.
> >>>
> >>> To add swap PTE soft-dirty tracking, we borrow bit (4) which is
> >>> available for swap PTEs on RISC-V systems.
> >>>
> >>> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >>> ---
> >>>   arch/riscv/Kconfig                    | 27 ++++++++++-
> >>>   arch/riscv/include/asm/pgtable-bits.h | 12 +++++
> >>>   arch/riscv/include/asm/pgtable.h      | 69 ++++++++++++++++++++++++++-
> >>>   3 files changed, 106 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>> index 0f3cd7c3a436..f1460fc01cd4 100644
> >>> --- a/arch/riscv/Kconfig
> >>> +++ b/arch/riscv/Kconfig
> >>> @@ -39,7 +39,6 @@ config RISCV
> >>>        select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> >>>        select ARCH_HAS_PMEM_API
> >>>        select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> >>> -     select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
> >>>        select ARCH_HAS_PTE_SPECIAL
> >>>        select ARCH_HAS_SET_DIRECT_MAP if MMU
> >>>        select ARCH_HAS_SET_MEMORY if MMU
> >>> @@ -948,6 +947,32 @@ config RANDOMIZE_BASE
> >>>
> >>>             If unsure, say N.
> >>>
> >>> +choice
> >>> +     prompt "PET RSW Bit(9) used for"
> >>> +     default RISCV_HAS_PTE_DEVMEP
> >>> +     depends on MMU && 64BIT
> >>> +     help
> >>> +       RISC-V PTE bit(9) is reserved for software, and used by more than
> >>> +       one kernel features which cannot be supported at the same time.
> >>> +       So we have to select one for it.
> >>> +
> >>> +config RISCV_HAS_PTE_DEVMEP
> >>> +     bool "DEVMAP mark"
> >>> +     select ARCH_HAS_PTE_DEVMAP
> >>> +     help
> >>> +       The PTE bit(9) is used for DEVMAP mark. ZONE_DEVICE pages need DEVMAP
> >>> +       PTEs support to function.
> >>> +
> >>> +       So if you want to use ZONE_DEVICE, select this.
> >>> +
> >>> +config RISCV_HAS_SOFT_DIRTY
> >>> +     bool "soft dirty"
> >>> +     select HAVE_ARCH_SOFT_DIRTY
> >>> +     help
> >>> +       The PTE bit(9) is used for soft-dirty tracking.
> >>> +
> >>> +endchoice
> >>> +
> >> Hi, ARCH_HAS_PTE_DEVMAP will be removed in following patch, I guess
> >> riscv will too:
> >>
> >> https://lore.kernel.org/all/47c26640cd85f3db2e0a2796047199bb984d1b3f.1719386613.git-series.apopple@nvidia.com/
> > Thanks for sharing, I didn't notice this.
> > It looks like we should remove PTE_DEVMAP first and then add soft
> > dirty and uffd_wp.
>
>
> I have not seen any progress in the removal of PTE_DEVMAP so I'd say we
> should keep going with your patchset and we can still remove devmap later.

Okay, then I will update the patchset with addressing your comments.

Thanks for the review,
Chunyan


>
> Thanks,
>
> Alex
>
>
> >
> > Thanks,
> > Chunyan
> >
> >>>   endmenu # "Kernel features"
> >>>
> >>>   menu "Boot options"
> >>> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> >>> index 5bcc73430829..c6d51fe9fc6f 100644
> >>> --- a/arch/riscv/include/asm/pgtable-bits.h
> >>> +++ b/arch/riscv/include/asm/pgtable-bits.h
> >>> @@ -26,6 +26,18 @@
> >>>   #define _PAGE_DEVMAP 0
> >>>   #endif /* CONFIG_ARCH_HAS_PTE_DEVMAP */
> >>>
> >>> +#ifdef CONFIG_MEM_SOFT_DIRTY
> >>> +#define _PAGE_SOFT_DIRTY     (1 << 9)    /* RSW: 0x2 for software dirty tracking */
> >>> +/*
> >>> + * BIT 4 is not involved into swap entry computation, so we
> >>> + * can borrow it for swap page soft-dirty tracking.
> >>> + */
> >>> +#define _PAGE_SWP_SOFT_DIRTY _PAGE_USER
> >>> +#else
> >>> +#define _PAGE_SOFT_DIRTY     0
> >>> +#define _PAGE_SWP_SOFT_DIRTY 0
> >>> +#endif /* CONFIG_MEM_SOFT_DIRTY */
> >>> +
> >>>   #define _PAGE_TABLE     _PAGE_PRESENT
> >>>
> >>>   /*
> >>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> >>> index 089f3c9f56a3..d41507919ef2 100644
> >>> --- a/arch/riscv/include/asm/pgtable.h
> >>> +++ b/arch/riscv/include/asm/pgtable.h
> >>> @@ -428,7 +428,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
> >>>
> >>>   static inline pte_t pte_mkdirty(pte_t pte)
> >>>   {
> >>> -     return __pte(pte_val(pte) | _PAGE_DIRTY);
> >>> +     return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> >>>   }
> >>>
> >>>   static inline pte_t pte_mkclean(pte_t pte)
> >>> @@ -461,6 +461,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> >>>        return pte;
> >>>   }
> >>>
> >>> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >>> +static inline int pte_soft_dirty(pte_t pte)
> >>> +{
> >>> +     return pte_val(pte) & _PAGE_SOFT_DIRTY;
> >>> +}
> >>> +
> >>> +static inline pte_t pte_mksoft_dirty(pte_t pte)
> >>> +{
> >>> +     return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> >>> +}
> >>> +
> >>> +static inline pte_t pte_clear_soft_dirty(pte_t pte)
> >>> +{
> >>> +     return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> >>> +}
> >>> +
> >>> +static inline int pte_swp_soft_dirty(pte_t pte)
> >>> +{
> >>> +     return pte_val(pte) & _PAGE_SWP_SOFT_DIRTY;
> >>> +}
> >>> +
> >>> +static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> >>> +{
> >>> +     return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> >>> +}
> >>> +
> >>> +static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> >>> +{
> >>> +     return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> >>> +}
> >>> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >>> +
> >>>   #ifdef CONFIG_RISCV_ISA_SVNAPOT
> >>>   #define pte_leaf_size(pte)   (pte_napot(pte) ?                               \
> >>>                                        napot_cont_size(napot_cont_order(pte)) :\
> >>> @@ -751,6 +783,40 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
> >>>        return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
> >>>   }
> >>>
> >>> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >>> +static inline int pmd_soft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_soft_dirty(pmd_pte(pmd));
> >>> +}
> >>> +
> >>> +static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> >>> +}
> >>> +
> >>> +static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> >>> +}
> >>> +
> >>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >>> +static inline int pmd_swp_soft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_swp_soft_dirty(pmd_pte(pmd));
> >>> +}
> >>> +
> >>> +static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> >>> +}
> >>> +
> >>> +static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >>> +{
> >>> +     return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> >>> +}
> >>> +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> >>> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >>> +
> >>>   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> >>>                                pmd_t *pmdp, pmd_t pmd)
> >>>   {
> >>> @@ -841,6 +907,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> >>>    * Format of swap PTE:
> >>>    *   bit            0:       _PAGE_PRESENT (zero)
> >>>    *   bit       1 to 3:       _PAGE_LEAF (zero)
> >>> + *   bit            4:       _PAGE_SWP_SOFT_DIRTY
> >>>    *   bit            5:       _PAGE_PROT_NONE (zero)
> >>>    *   bit            6:       exclusive marker
> >>>    *   bits      7 to 11:      swap type
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
