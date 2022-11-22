Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCDBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4YFd9cbUrMrwn4XSEYr4htKhdXuMlBDARn6DDYR1Uo=; b=PixLvDQDOdOYHn
	12Ydx24Bw1hoKs2rXDZzsoGvbFYKRf8gnqZQD+SA+w6BJu+lJSiKvu/a0EnFstfK5JpjEoNMoBJ3a
	2xN19Hi1dXsw1AIaNb97oevNglcXJUkJcANLtzlNYAhfIAQBodCZlBoiqlQDbDFjzH+T35uE+B6+C
	0pfSS4NLCeECqLh1ktzw8d38aGFukodv7UC1sRDO6vzeptcuNlKbQv+rFwug54McmIXpjf72ZuonS
	dntCN3bKhsDGWYnlYXQ6lOgjUDa2Pd8IC+Xw3KFkR0GadQZC9bqG6pAeYt5oAKDQ+f8GLC7xeRrtq
	Ed0MB9IxiHk4RMN6ysVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOwx-006VNp-If; Tue, 22 Nov 2022 08:48:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOwr-006VE2-FR
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669106889; x=1700642889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6WN6vBmnV9wxc3pONX37n6CbLHY7E8185tWSh1ZT4o=;
  b=FYHZggNlXWj2+VgtkHguqEDNnGxr3D51n6MebmqJlyZLzzVbIqnqiACv
   n6fndZt3WmFf51m1oABrD0+amSmrRGNYA3c/x01kR+SOu601aQgMGm7G3
   IdzxbDvfECFwSItk9xHHs793ktW3EGEuB8bZDfdPOim9RW5u+65/aQgLJ
   8Hu5s5D75xEXurqc02uS0PvsB7mpXAnGdkWHHTrH/XylQBQKE9V+N9t+E
   1HhItpTVb6LmnPmVm1jVgdE54+V+k8ioe+u6/Rgav65uB3c7dsDVjfsM5
   oYfWQFeMfhTY1td/7T/FvEjPHpi1FU45YElM909h3VRbgAL88PUUVUF/u
   w==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="188107432"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 01:47:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 01:47:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 01:47:52 -0700
Date: Tue, 22 Nov 2022 08:47:35 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-efi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before
 switching
Message-ID: <Y3yMp6R1swSq06WR@wendy>
References: <20221121133303.1782246-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121133303.1782246-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004809_600252_D9540822 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Nov 21, 2022 at 02:33:03PM +0100, Alexandre Ghiti wrote:
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

Hey Alex,
What commit does this fix?

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
> +#define arch_efi_call_virt_setup()      ({		\
> +		sync_kernel_mappings(efi_mm.pgd);	\
> +		efi_virtmap_load();			\
> +	})
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
> +	memcpy(pgd + USER_PTRS_PER_PGD,
> +	       init_mm.pgd + USER_PTRS_PER_PGD,
> +	       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> +}
> +
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>  	pgd_t *pgd;
> @@ -135,9 +142,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  	if (likely(pgd != NULL)) {
>  		memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
>  		/* Copy kernel mappings */
> -		memcpy(pgd + USER_PTRS_PER_PGD,
> -			init_mm.pgd + USER_PTRS_PER_PGD,
> -			(PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> +		sync_kernel_mappings(pgd);
>  	}
>  	return pgd;
>  }
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
