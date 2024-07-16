Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E3FC3DA4B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6i2nE++W8CqRCnP4r3Qyb0TqFIQ/n+UbzXUxkHGf2g=; b=FkJy3OOlgb7PPl
	f65OsliixaVYzhviMSdlA/45N7JKTXf8CxGlAT7TTNKGX+bUFpY6zRlYER49RsDDzLpd/Im34edbT
	6v4cUAg8H2GuH4p5aCZ+ZJXmw1Zd5FAALsc+z5lZbsaUoRuiUSjNx9dMuFSpcPpO38I3PrD1ysozD
	235gkbQHocCAAUdLPAdp5b3gTBF/13l0BWoMlyrTAnSnhM+ANvI7rlJVok1JXyIGVkZISVe7+xNTy
	hVAMgXkCNASi2lPB5spVtmy+lBh5lgD3sQJOIsY2NlT3HUuWW2PmegVyfgrLcfwEGWijDzC5ctOZH
	rFakndyZXmxBwuuPm9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTXl6-000000092fl-41RR;
	Tue, 16 Jul 2024 02:17:40 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTXl4-000000092f2-0Kne
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 02:17:39 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7035b717880so2977025a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 19:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721096256; x=1721701056; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3qG2e5OOr0a9SDC7lHn4BFqHyo95FcZxWbDfNRVBACI=;
        b=RHS3Lsb/0mNfexJB3Opvg9ln9YVxjake0cuSxbAK3thFheEfqMvszLA7V8C2gRs/gu
         DuPgPKbaKOvLqjJaPfW1EqCDhfROMiR8WZixdjBpislEOU4pAAhxaYY7JvV26n8QPKWP
         prEqZATuhN5TBIVwBCMsxA9UQ6jiIVQPJvn193ocfrWo/t5xZBo1UXNJNSSC6kkZbMub
         6uK1iDOymaYiagS3gOCLPQ9ds9l1qy0+2B77qHRC23NII7Xqv3DlVELAmoZm4vohw+MW
         +W1jOpscwQs7Vf/Cakh/cWTFXEx+bnadFkBFydNimjas4VcyNniGUXS3PpYCgaHSSdIZ
         7L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721096256; x=1721701056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qG2e5OOr0a9SDC7lHn4BFqHyo95FcZxWbDfNRVBACI=;
        b=sDaAlrxVWV4iP1qulnz5VdKUhEQd0mHxYy53oWPn9JG+5ZQ3KKsBlGVbrsv2ElEhsG
         E/QTWH9UxHig3qI6myQpH2/ZHaZxtYeSZDFSUbco4wJOrvh6EAWcoQn79MXOeAkZ+ZkD
         3nXD9lwhTjOp7IWKXabgWzbpez3qaEpzrRFv/skAPfuEs+dIRprWBmWy06SlBdmkizHq
         jb3HWYO79FGfPAC9UBy+SBQgitDJikln8wwqFsvUQiyWhNVuD/xEbJ6+nTJbkoimdoRk
         40ty8jP+6TwPNd9RGYEESseGASAD0ey8Wqrfwcjdzqxg0LAQQzvKEgbqSm4kSX0CQlMF
         P66w==
X-Forwarded-Encrypted: i=1; AJvYcCU+TklmbLpAOkUICbtitN7t07CYS9aYksLCOITfD/DxB+m+HBElYy76HD51LvDe4OoeBpwnQfdlh/TPTxOQ8Hadr0t7TODNJvkzDZqVb4q7
X-Gm-Message-State: AOJu0Ywi+lxdVukpgMqF3juvSSrV83QMzYD43/oIOb8Gnm9NQtnTbxl6
	NZuAYMoZ96Fec1uyAYqv8lUKWnjhvGuYAL24rZcYXoe8FnyGZRUCoQt7v3TP29l9/L3eEVqcZGM
	Jfzk1SDafqf2e/gmBqduUlTrwBRE=
X-Google-Smtp-Source: AGHT+IF2iQvXMWZ+A/wS21lKkIcp4ScrIAImMKmhcq0FvVKMA7n1XTY7UZQNopwH2fOnvWt5n+kBM1ZVCbdtyBlI7Y8=
X-Received: by 2002:a05:6870:9e4d:b0:25e:b74e:e1b8 with SMTP id
 586e51a60fabf-260bf388476mr234928fac.9.1721096256110; Mon, 15 Jul 2024
 19:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240710033004.3923527-1-zhangchunyan@iscas.ac.cn> <9bf70f7c-5deb-4fce-b7c1-ec70d78cb5db@ghiti.fr>
In-Reply-To: <9bf70f7c-5deb-4fce-b7c1-ec70d78cb5db@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 16 Jul 2024 10:16:59 +0800
Message-ID: <CAAfSe-vhhVvP5Sa9bGGSw4ZQvexqUrjdTFjJL-4gLn0jsuk0ew@mail.gmail.com>
Subject: Re: [PATCH] riscv/mm: Add soft-dirty page tracking support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_191738_146192_2E0477BC 
X-CRM114-Status: GOOD (  36.20  )
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

On Mon, 15 Jul 2024 at 19:21, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 10/07/2024 05:30, Chunyan Zhang wrote:
> > The PTE bit (9) is reserved for software, so we can use it for
> > soft-dirty tracking. This patch adds its standard handlers for
> > PTE, PMD, and swap entry.
>
>
> Unfortunately, ZONE_DEVICE has just used this last bit and should be
> merged in 6.11.

Yes, I read the patch just now.

> I'm currently discussing internally how we can get 2 other PTE bits from
> RVI in order to have the same number of available bits as x86 and arm64.

Yes I noticed that PTE bits reserved for software are too limited on RISC-V.

Besides softdirty, we probably can support uffd write-protect on
RISC-V if we will have two PTE bits for use.

> I guess that for now, if we really have a usecase for softdirty (and I
> think we do with CRIU), we'll have to make ZONE_DEVICE and soft-dirty
> mutually exclusive.

Yes, I also learned that CRIU uses soft-dirty.

> >
> > To add swap PTE soft-dirty tracking, we borrow bit (4) which is
> > available for swap PTEs on RISC-V systems.
> >
> > This patch has been tested with the kselftest mm suite in which
> > soft-dirty and madv_populate run and pass, and no regressions
> > are observed in any of the other tests.
>
>
> Did you give CRIU a try?

I haven't tried CRIU, actually I found soft-dirty was missing on
RISC-V by the way of running mm selftest cases.

I can cook a new patch to implement soft-dirty and ZONE_DEVICE share
the PTE bit(9), and make both features mutually exclusive if this
solution is accepted.

Or not to add soft-dirty until we have more other PTE bits that can be
used for software.

I'm open to listen to suggestions.

Thanks,
Chunyan

>
> Thanks,
>
> Alex
>
>
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   arch/riscv/Kconfig                    |  1 +
> >   arch/riscv/include/asm/pgtable-bits.h | 13 ++++++
> >   arch/riscv/include/asm/pgtable.h      | 65 ++++++++++++++++++++++++++-
> >   3 files changed, 78 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index b94176e25be1..2e3ad2925a6b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -118,6 +118,7 @@ config RISCV
> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> >       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> >       select HAVE_ARCH_SECCOMP_FILTER
> > +     select HAVE_ARCH_SOFT_DIRTY
> >       select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> >       select HAVE_ARCH_TRACEHOOK
> >       select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index 179bd4afece4..bab48f5fd1e2 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -19,6 +19,19 @@
> >   #define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
> >
> >   #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> > +
> > +#ifdef CONFIG_MEM_SOFT_DIRTY
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
> > +
> >   #define _PAGE_TABLE     _PAGE_PRESENT
> >
> >   /*
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index aad8b8ca51f1..46f512f52580 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -408,7 +408,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
> >
> >   static inline pte_t pte_mkdirty(pte_t pte)
> >   {
> > -     return __pte(pte_val(pte) | _PAGE_DIRTY);
> > +     return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> >   }
> >
> >   static inline pte_t pte_mkclean(pte_t pte)
> > @@ -436,6 +436,36 @@ static inline pte_t pte_mkhuge(pte_t pte)
> >       return pte;
> >   }
> >
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
> > +
> >   #ifdef CONFIG_RISCV_ISA_SVNAPOT
> >   #define pte_leaf_size(pte)  (pte_napot(pte) ?                               \
> >                                       napot_cont_size(napot_cont_order(pte)) :\
> > @@ -721,6 +751,38 @@ static inline pmd_t pmd_mkdirty(pmd_t pmd)
> >       return pte_pmd(pte_mkdirty(pmd_pte(pmd)));
> >   }
> >
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
> > +
> >   static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> >                               pmd_t *pmdp, pmd_t pmd)
> >   {
> > @@ -811,6 +873,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> >    * Format of swap PTE:
> >    *  bit            0:       _PAGE_PRESENT (zero)
> >    *  bit       1 to 3:       _PAGE_LEAF (zero)
> > + *   bit            4:       _PAGE_SWP_SOFT_DIRTY
> >    *  bit            5:       _PAGE_PROT_NONE (zero)
> >    *  bit            6:       exclusive marker
> >    *  bits      7 to 11:      swap type

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
