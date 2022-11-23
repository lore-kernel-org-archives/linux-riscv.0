Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CC5C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frFyt1ResVg+GvbUp2pTxVG3yUa/DsXYBuvYVdNzBhY=; b=c4RnwOURUeteuN
	fYNbQrw9Nu2BJNm3nnROVLPVCxUO8CSeet7AKHNDI0jJjbez2MIR2HCW4u8DaXhsmV4GlQQronNHP
	8XIlAyeyV4lmVE5MDt4cP0rAST4FQCqu6tp/KPMTVlO3uNTT4wNrPqdbQXDcDItNWcEgC17EVPxuH
	SWAZlKmwriN0Q7cYZCYLeEmtwiMFM+Fel3NNej5WvwqmBJW5spD7ngHPuSKEaV2Hm6qyUfOEWGLEi
	FnfWqXi985E2PM1lyR7kAMSaztx6ByQTyx4t/YXyYQ7+PboPbIwjZecA7Ri61U75G8ynDezYP6s97
	w8iwPMp82150HldT81Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtPg-0018B3-Ei; Wed, 23 Nov 2022 17:19:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtPd-00186v-8P
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:19:55 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 839B73F339
	for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669223987;
	bh=h7C2hHcimmZ7pO9zs58j39X1ZC+4+l5O+MNwfXCa5Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=m1Jzt3iV7i9ThJbTkTDRpkIMEaZhhvUB1fHh9Ne5v7jxhsHrY1bg8arSC6AenLxP/
	 HBrx16lf9WM5GyUwaT9ZiwLo4+GiDacrcZ3ux19ohqldKmw91/qVcWZCBu2W6bHG9I
	 bMT+cDcUyHJ4jRNqNbnd05J3+EGc4JC90+Dm5+zrYPaR3A8rHYjjLxuO3tYCDLZ/5C
	 rYC9mCY8goWHkH8oiI7LvK0cFFCEuRklt8r2Bwf6ibQUqPTMiKHaVi0rPRryouo6zu
	 y5UU+SU0FpxODp2+aHw6PoRBPMkBKkz+UY1ROd6CR4Sr/O/yFUt/VuQwQhbxPyYvzt
	 xEipl9dOrgwjw==
Received: by mail-yb1-f198.google.com with SMTP id a1-20020a056902056100b006e6f103d4c1so16906182ybt.23
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 09:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7C2hHcimmZ7pO9zs58j39X1ZC+4+l5O+MNwfXCa5Gs=;
        b=L9d4LmzeVVQTGjrJ4oMq1FUK15OhIee3+JhPaeehru5sHJs6GI6v17X8HUPWX6rWBX
         3ktbp6iV9SBnGJZ+gyVfHsuFXZIPNcWTZX+YhMuKAgRGddLxzTirrT9ZveF1fSq3T0Y0
         t1s2lWnmbUhLXQHdrfimUltsmN5UPzT/p3M6nH14mrLAIjzztPle3uKeaapC66Wci2tR
         iTL+L1RzBadXwae3Vhs5j3k53v2+HIvt+FO74a8DAEXPY+4iDlmFxzoSGJjjSKMnq0El
         v/pSp67wymKFM9QxpzSKAet1pcryoVfPAVh/l+1GhJjSKrJq+bdLRXAX8grXjrZCdVJY
         /1ug==
X-Gm-Message-State: ANoB5pnupMXcp6blj5jCZfCd7GUapv82y4Fvy2a6aSbA61PVj/7wP3E2
	JDGvEAGLeQRteKzhSDGJQe18ViFcUwJAvHLSxCEWJvGZLlqhkKIfx0KMtqEG0gnyKqf8topAnZN
	81DlhVcziqdpzPT7sDEShn5Pa7fJgpHWBd4Rj9tAwNRCgxFbfiV9WEfAzMlKM6Q==
X-Received: by 2002:a0d:e696:0:b0:3b1:23de:2025 with SMTP id p144-20020a0de696000000b003b123de2025mr2631661ywe.230.1669223986618;
        Wed, 23 Nov 2022 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6dPqwX2isjpBvx2vvZXYABsXo2bhnTP7AwHMF+2frJwg5uBRpnSXCpfEg3kl7RSJMGPnCo/egG8ZfIflVk1pw=
X-Received: by 2002:a0d:e696:0:b0:3b1:23de:2025 with SMTP id
 p144-20020a0de696000000b003b123de2025mr2631631ywe.230.1669223986399; Wed, 23
 Nov 2022 09:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20221121133303.1782246-1-alexghiti@rivosinc.com>
In-Reply-To: <20221121133303.1782246-1-alexghiti@rivosinc.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 23 Nov 2022 18:19:29 +0100
Message-ID: <CAJM55Z8+QyYKEwnMia2wjg+uYYnB=J40oSU8yDxoKm8Se+TnVA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before switching
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, linux-efi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_091953_470693_A9EBBEE9 
X-CRM114-Status: GOOD (  21.72  )
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

Hi Alexandre,

On Mon, 21 Nov 2022 at 14:33, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> The EFI page table is initially created as a copy of the kernel page table.
> With VMAP_STACK enabled, kernel stacks are allocated in the vmalloc area:
> if the stack is allocated in a new PGD (one that was not present at the
> moment of the efi page table creation or not synced in a previous vmalloc
> fault), the kernel will take a trap when switching to the efi page table
> when the vmalloc kernel stack is accessed, resulting in a kernel panic.
>
> Fix that by updating the efi kernel mappings before switching to the efi
> page table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for the patch! With this applied on the Ubuntu 5.19 kernel I
can enable CONFIG_VMAP_STACK and cat /sys/firmware/efi/efivars/* on
the Unmatched without locking up. So

Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/include/asm/efi.h     |  6 +++++-
>  arch/riscv/include/asm/pgalloc.h | 11 ++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> index f74879a8f1ea..e229d7be4b66 100644
> --- a/arch/riscv/include/asm/efi.h
> +++ b/arch/riscv/include/asm/efi.h
> @@ -10,6 +10,7 @@
>  #include <asm/mmu_context.h>
>  #include <asm/ptrace.h>
>  #include <asm/tlbflush.h>
> +#include <asm/pgalloc.h>
>
>  #ifdef CONFIG_EFI
>  extern void efi_init(void);
> @@ -20,7 +21,10 @@ extern void efi_init(void);
>  int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
>  int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
>
> -#define arch_efi_call_virt_setup()      efi_virtmap_load()
> +#define arch_efi_call_virt_setup()      ({             \
> +               sync_kernel_mappings(efi_mm.pgd);       \
> +               efi_virtmap_load();                     \
> +       })
>  #define arch_efi_call_virt_teardown()   efi_virtmap_unload()
>
>  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 947f23d7b6af..59dc12b5b7e8 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -127,6 +127,13 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
>  #define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
>  #endif /* __PAGETABLE_PMD_FOLDED */
>
> +static inline void sync_kernel_mappings(pgd_t *pgd)
> +{
> +       memcpy(pgd + USER_PTRS_PER_PGD,
> +              init_mm.pgd + USER_PTRS_PER_PGD,
> +              (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> +}
> +
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *pgd;
> @@ -135,9 +142,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>         if (likely(pgd != NULL)) {
>                 memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
>                 /* Copy kernel mappings */
> -               memcpy(pgd + USER_PTRS_PER_PGD,
> -                       init_mm.pgd + USER_PTRS_PER_PGD,
> -                       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> +               sync_kernel_mappings(pgd);
>         }
>         return pgd;
>  }
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
