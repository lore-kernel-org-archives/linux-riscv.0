Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2349DD29F9D
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOaRwoUm9lUMM8sYT+Oi2tIsOnz/OiOdWHyUmMWLGbc=; b=aEoh/nrrwC/lLW
	5fHBcC4B8Ot/pydAE201sjsm07iXfLf3KxODeTwUq5aC34GbbKj/2wKw48zp8r01vbA8VbDxO65kr
	o9FagsdFUG7YxD67ufFuAA5LL66HAc9v6T4nzjp7HZD93US5bdvuSDTW0c04+Y/f5iiyJzmp9jeyg
	h6G3qfkABKoXTdsZXBGWDf77yB741j6etthba4/eFa6IOZYOWPSoq82eLmxhdceItJtElxtZWnXQq
	LqM+vyUigvwDFRPN4B/ZGmZNy+/FD9Q9bEHr15zhE0IneL9k/bdW2Usti56NP9TK3H1ISmwqhA/+v
	5lguqkTI00lP8p8R6THw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zjn-000000021Sp-3kG9;
	Wed, 06 Nov 2024 06:41:56 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zjl-000000021SG-0z2p
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 06:41:54 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5ee1e04776cso1276981eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 22:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730875312; x=1731480112; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwfjbaQj0C7OoPelXON1Odzj9eUCq/W/+YYPFoCA8v8=;
        b=BIb9UarAZWaXGL8u1EEILn3DqV2OO3J+6wwAIoDr63nuspwmKoUuNgA7ZDV/3fTnfx
         6zSz0eW96QggM6un1tfa5L9AUEFTgWAbLe0CIi/Qpa5v2K1Zd+0LrYn/53ge82lvnD6H
         E3FxGbPOr0wb1GPSq0o/HvYIqk0WSDKYwVMmVFaBVvj9EWnTDMK+ltxJXB4qrDZicwmf
         Tj6e85z5d2oCFAZTokruM5yFZg1hKwsgstwWBhQtL1lqaKD5N2PRrMwdkooPrrDPT6w+
         RzDpchNMw1Z5pWEFv2NfTbihO4zpmjbtC6BFJ8t2gy7RZ6sI42SJtz2wLVw8n+U+42kd
         QdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730875312; x=1731480112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwfjbaQj0C7OoPelXON1Odzj9eUCq/W/+YYPFoCA8v8=;
        b=DoKOViVMvnOE+atqE48q7lA/LpSD7tW41er1pXlRLf1ja9bC7ziMK1MMWNyeqgn39Z
         hFJw6DLuSYMI/sMsSV+HRVnt5HDkaWvXLgohtEn1HbZodz31/4h/Q4Wbe7NXKmn5xVPM
         Zf2V3hl397k3T/FDm3ukmw0XyrtFaQNDgjsBL5iUa1Tka6BFfgqVWfNSQIoc6aLpIfJ6
         y/juFds/c2GBMmGgSR4V9VXLT28738QCtaoWDeWOlDWoTRPQXFWcvbAmRVKt4QHAl9hQ
         1ErtyBj2xaOQn/bOrj3fPcIA6gNtjmCmXae+WtzILJm7rNhlL044rd1qKKzRwSMRHblc
         JAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUepeakxbwQN5Ow1fkjUC09/7shmQzvnnsSW6NgmHbyPFFKTK4aZ90eIixrAmMVx+BRdyxEj6ihMwr4ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgY2b25moYxzjpwdLNBFArtbpUAFOfPuEs/K1C7djV5JBzeL/a
	0pVoOMCWB8yByJCnCOPMEM7KEg4738VLwVGJ4qmKdGsEP7vVy8sKau1Fte0bKIk6BR3EoyYepl8
	Pia7hIwlyGzWEGzkSIZEPFX7DLBg=
X-Google-Smtp-Source: AGHT+IHpYlfDI//yEEbA3IrsO0gyODwzS+9567kfgG5iImiDVNudXOqoY50MdBNL9wmX6Ry7CEMu0dA/Hf8P/3G5txw=
X-Received: by 2002:a05:6820:1b94:b0:5ec:5eb6:1acc with SMTP id
 006d021491bc7-5ec6db9a003mr13142561eaf.5.1730875311818; Tue, 05 Nov 2024
 22:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-3-zhangchunyan@iscas.ac.cn> <97898777-8129-4ce9-8ae4-9d4bbc2a5a26@ghiti.fr>
In-Reply-To: <97898777-8129-4ce9-8ae4-9d4bbc2a5a26@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Nov 2024 14:41:15 +0800
Message-ID: <CAAfSe-tN8OwPfq+7OJ-QZmPKnu6_YO3J+bR5R8HWENMA-n-J9A@mail.gmail.com>
Subject: Re: [RESEND PATCH V4 2/3] riscv: mm: Add soft-dirty page tracking support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_224153_324106_6E161714 
X-CRM114-Status: GOOD (  36.17  )
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

On Tue, 5 Nov 2024 at 21:13, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 30/08/2024 03:11, Chunyan Zhang wrote:
> > The PTE bit(9) is reserved for software, now used by DEVMAP,
> > this patch reuse bit(9) for soft-dirty which is enabled only
>
>
> s/reuse/reuses
>
>
> > if !CONFIG_ARCH_HAS_PTE_DEVMAP, in other words, soft-dirty
> > and devmap will be mutually exclusive on RISC-V.
> >
> > To add swap PTE soft-dirty tracking, we borrow bit (4) which is
> > available for swap PTEs on RISC-V systems.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   arch/riscv/Kconfig                    | 27 ++++++++++-
> >   arch/riscv/include/asm/pgtable-bits.h | 12 +++++
> >   arch/riscv/include/asm/pgtable.h      | 69 ++++++++++++++++++++++++++-
> >   3 files changed, 106 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 0f3cd7c3a436..f1460fc01cd4 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -39,7 +39,6 @@ config RISCV
> >       select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> >       select ARCH_HAS_PMEM_API
> >       select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> > -     select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
> >       select ARCH_HAS_PTE_SPECIAL
> >       select ARCH_HAS_SET_DIRECT_MAP if MMU
> >       select ARCH_HAS_SET_MEMORY if MMU
> > @@ -948,6 +947,32 @@ config RANDOMIZE_BASE
> >
> >             If unsure, say N.
> >
> > +choice
> > +     prompt "PET RSW Bit(9) used for"
>
>
> I would say: "PTE RSW bit(9) usage"
>
>
> > +     default RISCV_HAS_PTE_DEVMEP
>
>
> s/DEVMEP/DEVMAP
>
>
> > +     depends on MMU && 64BIT
> > +     help
> > +       RISC-V PTE bit(9) is reserved for software, and used by more than
> > +       one kernel features which cannot be supported at the same time.
>
>
> s/features/feature
>
>
> > +       So we have to select one for it.
> > +
> > +config RISCV_HAS_PTE_DEVMEP
> > +     bool "DEVMAP mark"
>
>
> I would say simply "devmap"

Ok, only "devmap" without the following "mark", right?

>
>
> > +     select ARCH_HAS_PTE_DEVMAP
> > +     help
> > +       The PTE bit(9) is used for DEVMAP mark. ZONE_DEVICE pages need DEVMAP
>
>
> "is used for devmap...pages need devmap"
>
>
> > +       PTEs support to function.
> > +
> > +       So if you want to use ZONE_DEVICE, select this.
> > +
> > +config RISCV_HAS_SOFT_DIRTY
> > +     bool "soft dirty"
>
>
> s/soft dirty/soft-dirty
>
>
> > +     select HAVE_ARCH_SOFT_DIRTY
> > +     help
> > +       The PTE bit(9) is used for soft-dirty tracking.
> > +
> > +endchoice
> > +
> >   endmenu # "Kernel features"
> >
> >   menu "Boot options"
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index 5bcc73430829..c6d51fe9fc6f 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -26,6 +26,18 @@
> >   #define _PAGE_DEVMAP        0
> >   #endif /* CONFIG_ARCH_HAS_PTE_DEVMAP */
> >
> > +#ifdef CONFIG_MEM_SOFT_DIRTY
>
>
> For consistency with CONFIG_ARCH_HAS_PTE_DEVMAP, I would use
> CONFIG_HAVE_ARCH_SOFT_DIRTY

CONFIG_MEM_SOFT_DIRTY is not equal to the CONFIG_HAVE_ARCH_SOFT_DIRTY,
 the latter is one of its dependencies.

If CONFIG_HAVE_ARCH_SOFT_DIRTY  is selected, but CONFIG_MEM_SOFT_DIRTY
is not, the bit(9) should not be set/cleared by pte soft_dirty APIs?

Also considering x86 is using CONFIG_MEM_SOFT_DIRTY here, should we
keep the same?

>
>
> > +#define _PAGE_SOFT_DIRTY     (1 << 9)    /* RSW: 0x2 for software dirty tracking */
> > +/*
> > + * BIT 4 is not involved into swap entry computation, so we
> > + * can borrow it for swap page soft-dirty tracking.
> > + */
> > +#define _PAGE_SWP_SOFT_DIRTY _PAGE_USER
> > +#else
> > +#define _PAGE_SOFT_DIRTY     0
> > +#define _PAGE_SWP_SOFT_DIRTY 0
> > +#endif /* CONFIG_MEM_SOFT_DIRTY */
>
>
> Same here.
>
>
> > +
> >   #define _PAGE_TABLE     _PAGE_PRESENT
> >
> >   /*
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 089f3c9f56a3..d41507919ef2 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -428,7 +428,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
> >
> >   static inline pte_t pte_mkdirty(pte_t pte)
> >   {
> > -     return __pte(pte_val(pte) | _PAGE_DIRTY);
> > +     return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> >   }
> >
> >   static inline pte_t pte_mkclean(pte_t pte)
> > @@ -461,6 +461,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> >       return pte;
> >   }
> >
> > +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> > +static inline int pte_soft_dirty(pte_t pte)
> > +{
> > +     return pte_val(pte) & _PAGE_SOFT_DIRTY;
> > +}
> > +
> > +static inline pte_t pte_mksoft_dirty(pte_t pte)
> > +{
> > +     return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> > +}
> > +
> > +static inline pte_t pte_clear_soft_dirty(pte_t pte)
> > +{
> > +     return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> > +}
> > +
> > +static inline int pte_swp_soft_dirty(pte_t pte)
> > +{
> > +     return pte_val(pte) & _PAGE_SWP_SOFT_DIRTY;
> > +}
> > +
> > +static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> > +{
> > +     return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> > +}
> > +
> > +static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> > +{
> > +     return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> > +}
> > +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> > +
> >   #ifdef CONFIG_RISCV_ISA_SVNAPOT
> >   #define pte_leaf_size(pte)  (pte_napot(pte) ?                               \
> >                                       napot_cont_size(napot_cont_order(pte)) :\
> > @@ -751,6 +783,40 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
> >       return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
> >   }
> >
> > +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> > +static inline int pmd_soft_dirty(pmd_t pmd)
> > +{
> > +     return pte_soft_dirty(pmd_pte(pmd));
> > +}
> > +
> > +static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> > +{
> > +     return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> > +}
> > +
> > +static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> > +{
> > +     return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> > +}
> > +
> > +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> > +static inline int pmd_swp_soft_dirty(pmd_t pmd)
> > +{
> > +     return pte_swp_soft_dirty(pmd_pte(pmd));
> > +}
> > +
> > +static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> > +{
> > +     return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> > +}
> > +
> > +static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> > +{
> > +     return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> > +}
> > +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> > +
> >   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> >                               pmd_t *pmdp, pmd_t pmd)
> >   {
> > @@ -841,6 +907,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> >    * Format of swap PTE:
> >    *  bit            0:       _PAGE_PRESENT (zero)
> >    *  bit       1 to 3:       _PAGE_LEAF (zero)
> > + *   bit            4:       _PAGE_SWP_SOFT_DIRTY
> >    *  bit            5:       _PAGE_PROT_NONE (zero)
> >    *  bit            6:       exclusive marker
> >    *  bits      7 to 11:      swap type
>
>
> Apart from the minor things above, the rest looks good so you can add:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for the review,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
