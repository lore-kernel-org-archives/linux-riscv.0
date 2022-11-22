Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45136C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RNUxpcSf5ghpIbVZxeqox6ySBf/LEsVzUcHo2QPVi0=; b=TEyUHa0Dh46UQl
	89Ka7Y4mejU3ckXds2LIjLreH5f+qQ52PGa9/KKtqXFWfCtMPEnaEldZ7EEE4NElii8mZnUv0LGZM
	eR3tYGHKum9AKGsEvV1jzfVBwlxHugFiFvTEV/CoPCWzcP4glvZwcDgzqKXapyJGK8dntKWg8Powq
	whRW8tHJihhKRMEle3fqZPvHpRSRvHpuSFoG8ChZnWZxnljTW5UGO+SO9k/dDnuREbAmQwcME7KY5
	pUdvw4tP9jdc2B5yBOPVZ17UpPxBDX68vRbgdOYSG0l+9QDv7kCHqPKRF9j+HOKqOWckWqyvocbPm
	4Xsn1JFM/BA8VXqxRVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP3a-006cWq-BA; Tue, 22 Nov 2022 08:55:06 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP3X-006cTe-5m
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:55:04 +0000
Received: by mail-vs1-xe34.google.com with SMTP id m4so13793559vsc.6
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RrMdEjR9PuoPL1f65E/LRwRLMAkjVdgbOUDXvYazWFU=;
        b=LJUev07An3NNdKCBOFHeCbJiP7pQToVmFdX9LB4Y1C6wc0FAcbAqzHDSAAMsF3URy9
         YhBB3AVtqS0aHcIZnnJBYjIXYONPd3RTYlFBlGuchc0G3nMARFPHTbkYbz8hj3x4xBv9
         nSCWtaLx7n4vqDZz6HM0Lk1iTzqPeogGvuAaH37I4QU61eGbszg2Ocesn17EBXVIDAPT
         DwXXlv/QBwj6dUGYxxT3nqWSRsxH6ThLTQrNPcjjftxCaplJTb3rIcdureubEebwAQDh
         JqlKPC8ZCTC9Q+2joEkLCUGGjNLHfdgnLqjzEdi458BRfpmpDP2e8C8AafnmCbpEvfYq
         G06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrMdEjR9PuoPL1f65E/LRwRLMAkjVdgbOUDXvYazWFU=;
        b=alYX/Dfj4YOixpoWOXllgn3SyfvE/KddbJ5Ch4AiZgZvYHgI80A/+fkKYGTd+dFdjr
         jZioVeaaAWDfMQ+hJbZWspKRfjMkriXGSFrVAqxfKIv1gmwVLgonR9aFPJBVKr39pcOt
         O1rjhuIBU6oIoxKWF9o9ZVsLDBCOmmGiCYtIoyA5asi/UVovPflWQhwKHFRz9418/8Bu
         7NRx2HIo2msGDthfbLWnVZaOo7MOR9z9RdgKO3abv5SwyrS7xkW4RnTyPGBNyDyK5HjD
         rKJ/fr6vHdo/EheeAqkO0imIKAvB83CjG1ppvRVrUheD20Mfova/UxyVsKWKGeirXrU2
         TaEA==
X-Gm-Message-State: ANoB5pkUmeybZKCWXY5l1gphjXaXhXA+HpCa5/LU9BHV64VywsiRZVmG
	JegzolstGP5mre9ATjLeOPHBtyrkiN6r6/u12CtleQ==
X-Google-Smtp-Source: AA0mqf6hG1QbTutyVtAH0K149RQVtMPeyYn++70pRRD8lY/OdujrS+TCmK2O6oLBwWyJZ5xkVEJn5RhRcYfK1KV5tdU=
X-Received: by 2002:a67:fc83:0:b0:3b0:5e50:44ff with SMTP id
 x3-20020a67fc83000000b003b05e5044ffmr1485975vsp.4.1669107299311; Tue, 22 Nov
 2022 00:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20221121133303.1782246-1-alexghiti@rivosinc.com> <Y3yMp6R1swSq06WR@wendy>
In-Reply-To: <Y3yMp6R1swSq06WR@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 22 Nov 2022 09:54:48 +0100
Message-ID: <CAHVXubgk2zTGNjtcJP_CvopT36T4cX36W1a8NqDT7=8Wh6L=NA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before switching
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-efi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_005503_437981_3D51361D 
X-CRM114-Status: GOOD (  22.09  )
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

Hi Conor,

On Tue, Nov 22, 2022 at 9:48 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Mon, Nov 21, 2022 at 02:33:03PM +0100, Alexandre Ghiti wrote:
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
> Hey Alex,
> What commit does this fix?

You're right, I should have added this and +cc Atish:

Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")

Thanks,

Alex

>
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
> > +#define arch_efi_call_virt_setup()      ({           \
> > +             sync_kernel_mappings(efi_mm.pgd);       \
> > +             efi_virtmap_load();                     \
> > +     })
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
> > +     memcpy(pgd + USER_PTRS_PER_PGD,
> > +            init_mm.pgd + USER_PTRS_PER_PGD,
> > +            (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> > +}
> > +
> >  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >  {
> >       pgd_t *pgd;
> > @@ -135,9 +142,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >       if (likely(pgd != NULL)) {
> >               memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
> >               /* Copy kernel mappings */
> > -             memcpy(pgd + USER_PTRS_PER_PGD,
> > -                     init_mm.pgd + USER_PTRS_PER_PGD,
> > -                     (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> > +             sync_kernel_mappings(pgd);
> >       }
> >       return pgd;
> >  }
> > --
> > 2.37.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
