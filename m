Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D76AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTZxFo2r1U97x6x7mmOOMSQZHt+WDg1ke21I0hOwESs=; b=ZmLn6YeB7L3UqZ
	rDq2WA1aOXM7gLQT8ap7qlqVVLrzPzXkyUOU4WLfUWvhzcHI477N3ONbz6fYJo1PI2MFQxQk2j9bI
	NrbsFFFBh8PO8md2r1ALbgnnsquccSyfrAi2WbIcY4wn84uQIBNlJYHrAx/r9pp1B9xqbZS40e3yz
	/ohyh05aGi927Ez5nOa47yf6PW5zch3oj9gWNJk5hm/bE5sWUdI2nllSl6GIxqGZaUBOYESldXZSy
	7DE2/qMNBdN1K6JE0/O11qA5tfqSynAIcovYWkyv5FRRYuZ4zRez/Jr+jwbxnnfjUatNn9GxORhn3
	JCdLIDhqom5Mlgw08O/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxvBM-001uAa-GJ; Wed, 23 Nov 2022 19:13:16 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxvBJ-001tz0-1H
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 19:13:14 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-14286d5ebc3so18612271fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 11:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xYNUdKeKDvT8mT9/ZHcNVoishfiUIhq0BFNbiLz19yA=;
        b=GkcQ4aDShxTS/4JJ20x52W1asLWeep8pqcGzmv6Dc8t7/RytG/dgK1GAiBGHIoG7Jx
         tczb1a1x73VjicRSW1kWfAi31UZ5tUgBU0ZUXf248ak/5xaTu+LFg6f8dW57NDqJBuJh
         1wIhteLDo9cI+ZCcHbud0ARTw2Hdq39z3Dw1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYNUdKeKDvT8mT9/ZHcNVoishfiUIhq0BFNbiLz19yA=;
        b=peBrPmeWIGq2o9UVqGD89bbB+8xVtlrcjMQIXc+Losk+rS4tADYda7d4uIHMu73h9V
         FrUC3VHnzOm9FjB3A90glyPx8MnUoouQoIxDi1wFeVwG3JR5RHsf2E24/9GGODH2F/8i
         Uca6vfdFNK1tTvJ71eMRMXOgBBLy6cfdfoZdA45kLTVGqXN6evfX0HWQbJIoChK9miv9
         zqnPIZf0q8rEx4HYdyxXE8f24DZV8lmVLVzbmfGMkhUqiBzGhjiKS7GyVMBQ3e8ayBbl
         n2hSCmIa4PcLW/TGLhtjHsqhDy6VOPmlvMbJ/r8/d/4coNhJBiCtG8e703EoPI2+uL+9
         GVOg==
X-Gm-Message-State: ANoB5pn9U1kar4kMFfVHXM3Y8aqcUllTrGJ4r8dFQPAkn4uYDWvlaYU0
	p9J2F6l1HrpTfAefBbuVK+waNsPG2Cez9jQKzkBR
X-Google-Smtp-Source: AA0mqf6d8vQn5ev/ye6UXLq4CqtVLPskx6ulLg13YkrxhwLoJns2WzFhIK+fFbFPYH268AZACOKu9GGMmCXIwqcrxa4=
X-Received: by 2002:a05:6870:60a4:b0:132:79b1:f85 with SMTP id
 t36-20020a05687060a400b0013279b10f85mr8030534oae.274.1669230765966; Wed, 23
 Nov 2022 11:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20221121133303.1782246-1-alexghiti@rivosinc.com> <CAJM55Z8+QyYKEwnMia2wjg+uYYnB=J40oSU8yDxoKm8Se+TnVA@mail.gmail.com>
In-Reply-To: <CAJM55Z8+QyYKEwnMia2wjg+uYYnB=J40oSU8yDxoKm8Se+TnVA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 23 Nov 2022 11:12:35 -0800
Message-ID: <CAOnJCUKd+aUDc8a8xQO6sxViWwEp6-fDhJqAjt+ZfsipPFSJ0g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before switching
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, linux-efi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_111313_097144_8F9CDC37 
X-CRM114-Status: GOOD (  23.76  )
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

On Wed, Nov 23, 2022 at 9:19 AM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Hi Alexandre,
>
> On Mon, 21 Nov 2022 at 14:33, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > The EFI page table is initially created as a copy of the kernel page table.
> > With VMAP_STACK enabled, kernel stacks are allocated in the vmalloc area:
> > if the stack is allocated in a new PGD (one that was not present at the
> > moment of the efi page table creation or not synced in a previous vmalloc
> > fault), the kernel will take a trap when switching to the efi page table
> > when the vmalloc kernel stack is accessed, resulting in a kernel panic.
> >
> > Fix that by updating the efi kernel mappings before switching to the efi
> > page table.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks for the patch! With this applied on the Ubuntu 5.19 kernel I
> can enable CONFIG_VMAP_STACK and cat /sys/firmware/efi/efivars/* on
> the Unmatched without locking up. So
>
> Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> > ---
> >  arch/riscv/include/asm/efi.h     |  6 +++++-
> >  arch/riscv/include/asm/pgalloc.h | 11 ++++++++---
> >  2 files changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> > index f74879a8f1ea..e229d7be4b66 100644
> > --- a/arch/riscv/include/asm/efi.h
> > +++ b/arch/riscv/include/asm/efi.h
> > @@ -10,6 +10,7 @@
> >  #include <asm/mmu_context.h>
> >  #include <asm/ptrace.h>
> >  #include <asm/tlbflush.h>
> > +#include <asm/pgalloc.h>
> >
> >  #ifdef CONFIG_EFI
> >  extern void efi_init(void);
> > @@ -20,7 +21,10 @@ extern void efi_init(void);
> >  int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
> >  int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
> >
> > -#define arch_efi_call_virt_setup()      efi_virtmap_load()
> > +#define arch_efi_call_virt_setup()      ({             \
> > +               sync_kernel_mappings(efi_mm.pgd);       \
> > +               efi_virtmap_load();                     \
> > +       })
> >  #define arch_efi_call_virt_teardown()   efi_virtmap_unload()
> >
> >  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
> > diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> > index 947f23d7b6af..59dc12b5b7e8 100644
> > --- a/arch/riscv/include/asm/pgalloc.h
> > +++ b/arch/riscv/include/asm/pgalloc.h
> > @@ -127,6 +127,13 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
> >  #define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
> >  #endif /* __PAGETABLE_PMD_FOLDED */
> >
> > +static inline void sync_kernel_mappings(pgd_t *pgd)
> > +{
> > +       memcpy(pgd + USER_PTRS_PER_PGD,
> > +              init_mm.pgd + USER_PTRS_PER_PGD,
> > +              (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> > +}
> > +
> >  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >  {
> >         pgd_t *pgd;
> > @@ -135,9 +142,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >         if (likely(pgd != NULL)) {
> >                 memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
> >                 /* Copy kernel mappings */
> > -               memcpy(pgd + USER_PTRS_PER_PGD,
> > -                       init_mm.pgd + USER_PTRS_PER_PGD,
> > -                       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> > +               sync_kernel_mappings(pgd);
> >         }
> >         return pgd;
> >  }
> > --
> > 2.37.2
> >

Thanks for the fix. With the correct Fixes tag in commit description:A

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
