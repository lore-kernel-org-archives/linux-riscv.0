Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5D7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 03:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw1RIPkca7jH598KDMOWFHxMM2+7tr9scHDYu89yv9E=; b=EtjAepOv+aS8lX
	RS0gizDnMgyVZs6CkPg6iWLO13WBcpa5l41an7jo2a/a7ECQLQnff6dT54kDJ3WOZYR4KmgWKUf+2
	M4PKJg3gycSpYrUzSlUxZrGMMQ6Eo8Hn135ZYlBlam/xECn0HS9e+uYSygOMfMyweC/DRZC3MCeTL
	CNc/v8Jz3/PsA2yPDUjb7xIYc2kO+jzyu32tqe0DrxTSWDnuIv/0n3TFL7uQbqOoyKiuVuiZzUTI1
	mbU17jtUTQr5y1Xt4TI7Ke31rGRtnhf7I0a1khXedgXZ6T07cLTEh2DEtEo0hIO7eSXWYKNIsNpv3
	J8EOJrELjtOxW6Q4nPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMux-000kln-88; Tue, 23 Nov 2021 03:56:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMuu-000klF-KZ
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 03:56:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so1015100wmb.1
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 19:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbYyFnbPmkgrQrlw4urINtBSHt+A48GB7ljtOsMPFgM=;
 b=Bxy7/TU9pGrA6C4yzYaDzlDtZDzXpr6L3TXKDg6avhbUj5cv8DHux/+S2RVXuQFrCi
 blQ8Ekg4K4TDAA5maRbVp+U5+C5Nq5ywcxso2mcgeK+lUu3ZhZFJroDnBKYj/Pe+35nj
 ghyqJifqWLL6F1Bq37R+R6/r0xWsiOc4dEebjp5enMWSp5t4MQqQmRH9KGNmdkeqRDj7
 r8SiF8kS5GsCDR9sjjaTwlMglcrV0Q7P5Kc4A7js1VO/BDkgm8YNWoTwbhtflT2ohsVa
 2vjixfVQtrJvDKg8ax+LLouvcB9iOLIU+JNtskHuGU0bi+GiNww03/XVsloujTYw63wW
 aSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbYyFnbPmkgrQrlw4urINtBSHt+A48GB7ljtOsMPFgM=;
 b=m5PiIjddDxmHVoQGbMnfbYgDTJfO76rFzKtxvfGkYXkKCIMs/4K3bPIPOMTmV2/OfR
 3jmSveiJcirXV/jwwgAJwOlo0AAKWJ5o6XB97joi/uZdxaTFz8v4o6ibXVgtbM/Vlwwp
 avmlu7yIibJ6xzeQS36unPc5sEA3fexFOuTeWnIcmDJLLDsR88x6ksXZPdObAX7fJ/m+
 UYnY2oLd/+tmZzB3+AChARodhu8OasxbE8wQEx0CNV2CzT2HMdDdebjuPHVPuw5fjNw0
 MoZfvBmOa7Oh6T0OtWT3nyJTpiWX4yNuecpIQILgxsLO9sUVGK8nA1ARlHNp095wUo9A
 mEXA==
X-Gm-Message-State: AOAM5338fUt9KgsRfrK34UIiAAMh5gAMoju813WRVaLLI9KkJluJ3f7L
 MEpKqjg6CSuaKW1+hQETADIV5Ty5zLedj8hOuKssgg==
X-Google-Smtp-Source: ABdhPJxbmLSK0FMbEk6SIjAna1Y09Eya7/is9oohFf5JdZKW95Wp9FtEFCgUvS6DRHyvIQsUlU91u230P9etWrvFcZo=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr3073023wmb.137.1637639781581; 
 Mon, 22 Nov 2021 19:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-2-guoren@kernel.org>
In-Reply-To: <20211123015717.542631-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 09:26:10 +0530
Message-ID: <CAAhSdy0LWyhgXetiXikCosSX4xasgROyua6XMd92dV8TiWp62w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: Remove 2MB offset in the mm layout
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Anup Patel <anup.patel@wdc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_195624_710104_BAE7D904 
X-CRM114-Status: GOOD (  23.59  )
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

+Alex

On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The current RISC-V's mm layout is based on a 2MB offset and wasting
> memory. Remove 2MB offset and map PAGE_OFFSET at start_of_DRAM.
> Then we could reduce the memory reserved for opensbi in the next
> patch.

The real problem is that the generic kernel marks memory before
__pa(PAGE_OFFSET) as reserved which is evident from the boot
print "OF: fdt: Ignoring memory range 0x80000000 - 0x80200000".

One simple way to re-claim the first 2MB of memory is by:
1) Not placing OpenSBI firmware at start of RAM and rather
place it towards end/middle or RAM away from kernel and initrd
2) Load kernel at start of the RAM

The point#1 is already supported by OpenSBI firmwares using
position independent compilation. In fact, U-Boot SPL does
not load OpenSBI firmware at the start of RAM.

I would suggest Allwinner D1 to follow U-Boot SPL and have
the booting stage before OpenSBI to load OpenSBI firmware
somewhere else.

Regards,
Anup

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/page.h   |  8 ++++++++
>  arch/riscv/kernel/head.S        | 10 +++-------
>  arch/riscv/kernel/vmlinux.lds.S |  5 ++---
>  arch/riscv/mm/init.c            | 11 ++++++++---
>  4 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index b3e5ff0125fe..299147c78b4a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -16,6 +16,14 @@
>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE - 1))
>
> +#if __riscv_xlen == 64
> +/* Image load offset(2MB) from start of RAM */
> +#define LOAD_OFFSET    0x200000
> +#else
> +/* Image load offset(4MB) from start of RAM */
> +#define LOAD_OFFSET    0x400000
> +#endif
> +
>  #ifdef CONFIG_64BIT
>  #define HUGE_MAX_HSTATE                2
>  #else
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f52f01ecbeea..a6ac892d2ccf 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -61,13 +61,7 @@ ENTRY(_start)
>         /* Image load offset (0MB) from start of RAM for M-mode */
>         .dword 0
>  #else
> -#if __riscv_xlen == 64
> -       /* Image load offset(2MB) from start of RAM */
> -       .dword 0x200000
> -#else
> -       /* Image load offset(4MB) from start of RAM */
> -       .dword 0x400000
> -#endif
> +       .dword LOAD_OFFSET
>  #endif
>         /* Effective size of kernel image */
>         .dword _end - _start
> @@ -94,6 +88,8 @@ relocate:
>         la a1, kernel_map
>         XIP_FIXUP_OFFSET a1
>         REG_L a1, KERNEL_MAP_VIRT_ADDR(a1)
> +       li a2, LOAD_OFFSET
> +       add a1, a1, a2
>         la a2, _start
>         sub a1, a1, a2
>         add ra, ra, a1
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 5104f3a871e3..75b7c72cd4bd 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -11,10 +11,9 @@
>  #else
>
>  #include <asm/pgtable.h>
> -#define LOAD_OFFSET KERNEL_LINK_ADDR
>
> -#include <asm/vmlinux.lds.h>
>  #include <asm/page.h>
> +#include <asm/vmlinux.lds.h>
>  #include <asm/cache.h>
>  #include <asm/thread_info.h>
>  #include <asm/set_memory.h>
> @@ -32,7 +31,7 @@ PECOFF_FILE_ALIGNMENT = 0x200;
>  SECTIONS
>  {
>         /* Beginning of code and text segment */
> -       . = LOAD_OFFSET;
> +       . = LOAD_OFFSET + KERNEL_LINK_ADDR;
>         _start = .;
>         HEAD_TEXT_SECTION
>         . = ALIGN(PAGE_SIZE);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 24b2b8044602..920e78f8c3e4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -221,6 +221,11 @@ static void __init setup_bootmem(void)
>         if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
>                 memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>
> +       /*
> +        * Reserve OpenSBI region and depends on PMP to deny accesses.
> +        */
> +       memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
> +
>         early_init_fdt_scan_reserved_mem();
>         dma_contiguous_reserve(dma32_phys_limit);
>         if (IS_ENABLED(CONFIG_64BIT))
> @@ -604,7 +609,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>
>         kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
>  #else
> -       kernel_map.phys_addr = (uintptr_t)(&_start);
> +       kernel_map.phys_addr = (uintptr_t)(&_start) - LOAD_OFFSET;
>         kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
>  #endif
>         kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
> @@ -645,8 +650,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
>                            kernel_map.xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
>  #else
> -       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
> -                          kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);
> +       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr + LOAD_OFFSET,
> +                          kernel_map.phys_addr + LOAD_OFFSET, PMD_SIZE, PAGE_KERNEL_EXEC);
>  #endif
>  #else
>         /* Setup trampoline PGD */
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
