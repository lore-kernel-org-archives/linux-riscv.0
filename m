Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65424C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:51:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA6A02222A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA6A02222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sB8gu0ag06wFNk/GeAS7U0lKR14I9mUe1KsSmgwC6Vc=; b=VrkIibb2wdZJL8HPosnXsahQd
	dfYpjU2T+brmM9Kh2VqyGdyAV7PkLbyiZqkyfy6ZtwXBvfdNwNjNdOIQ2FKRCPnt714lDlGitWwxr
	cCuY8yZBQeFg1DIFO9nxfpLg+Iv6Z1T2oZ8McRjwHdaAxsDHuy/S5jHfXOnNAC46/N364sjntYk9y
	9YTp6JqfiUF6X3UuXiSc8fzYXYj85YufVkZflpmuWB7qaiI4yNpx7yQiNrWnp8qlfWSyKo+DdKwHl
	CqZhDPIlWFEo42qTCZ+ofqFdCTXkMXwQPBpzq8VnwcgO+aFyeEuR9pYnLqIMc9PDe6NZbYGrjNjHB
	/0Yh25hcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkrZ-0008Mi-TA; Tue, 05 Jan 2021 11:50:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkrX-0008M9-6a
 for linux-riscv@lists.infradead.org; Tue, 05 Jan 2021 11:50:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id s26so71831082lfc.8
 for <linux-riscv@lists.infradead.org>; Tue, 05 Jan 2021 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMWcCJQk+Rc106f6w1tIJLqayhhWxkXCtH/PhYMDIiI=;
 b=L3N8vC83TqKzTctV7E2OtqvdyhBreaCwsrCVeTMeMHIp3o8wHSirwAyY+z1QMf5Kot
 jyoi43+zd2SYr2QQp8ASbJnV933WljNMOdRmltzU+Ndf5utJaqn2sBcmbSS1F+ahZ857
 7SQLwE4R77jOBz1HxEWTHuFOY0BlEidUklbFQUpcP7V38t/q/w45Wu7WXos820LA5GWt
 E96qrzRO8yB6mwe8AK+6agZs8HOGr8d4LMjRKdeDtrRRshDGUxvJL00HnRrIH/uvpNZP
 lguIh/lvVc4wOn4ulFhPuVfb/tfqAHddtb4VPjoGwyvVjI00EbhQ2yInvspX1/QUf1dY
 h2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMWcCJQk+Rc106f6w1tIJLqayhhWxkXCtH/PhYMDIiI=;
 b=dieMIfK1yRwlU+T6VyU7GzhDlzTfqRgF67mem5Cv8Z4KhtTEAiM9q7vfRDqaGIb+8C
 k1yX2+oMFEn4edcGQO6ib5RugcKrtH9zauES6T6Ms8hCVaIa8fxWDu1ZeZOcGNC83oYK
 4IVmEPUQcZ5MBL2kp+S9wrD00yFrjt30w0jntKZ9CsxpOVi8ITVlb26pFlDPtOaTAhwc
 rUPVaNoWvbyVgO1Jr4/tZEvQ5C9BFZeGx6FRNVSUtMjIFrVZWfnPrKKkNLSYDUQOftyr
 NtlBfPLf30/NM6yp946OqFH0b2t3tIJRCGko9fT+pNpeXGymD17u2fBBZWS/unjyK7rm
 l/qw==
X-Gm-Message-State: AOAM533/QBNT+6RbPNtVZAOgJV1GSMGDtKSkLhwCymsuzJ8xlb6MTZSl
 /F0QoJYqhi8S7NK2RImUm9DEEltDjh/d7JFHqkR5jw==
X-Google-Smtp-Source: ABdhPJwIJ4Eri51uGtG/aVqVtz2LvPh0hXyL/E8bZpYX6Ob5yGscIPGvWXzqG3VUE1KwxJiPW4lZiwft1o2i16OsuXw=
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr35256172ljk.83.1609847453386; 
 Tue, 05 Jan 2021 03:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20210104195840.1593-1-alex@ghiti.fr>
 <20210104195840.1593-3-alex@ghiti.fr>
In-Reply-To: <20210104195840.1593-3-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Jan 2021 17:20:42 +0530
Message-ID: <CAAhSdy0WpPg-=+NMGFORfrd+Rgq0kwKu7Z3ioMAEfxj+J+KPjw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] riscv: Protect the kernel linear mapping
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_065055_256700_2D4BA6CF 
X-CRM114-Status: GOOD (  27.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 5, 2021 at 1:31 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> The kernel is now mapped at the end of the address space and it should
> be accessed through this mapping only: so map the whole kernel in the
> linear mapping as read only.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h |  9 ++++++++-
>  arch/riscv/mm/init.c          | 29 +++++++++++++++++++++--------
>  2 files changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 98188e315e8d..a93e35aaa717 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -102,8 +102,15 @@ extern unsigned long pfn_base;
>  extern unsigned long max_low_pfn;
>  extern unsigned long min_low_pfn;
>  extern unsigned long kernel_virt_addr;
> +extern uintptr_t load_pa, load_sz;
> +
> +#define linear_mapping_pa_to_va(x)     ((void *)((unsigned long)(x) + va_pa_offset))
> +#define kernel_mapping_pa_to_va(x)     \
> +       ((void *)((unsigned long) (x) + va_kernel_pa_offset))
> +#define __pa_to_va_nodebug(x)                          \
> +       ((x >= load_pa && x < load_pa + load_sz) ?      \
> +               kernel_mapping_pa_to_va(x): linear_mapping_pa_to_va(x))

This change should be part of PATCH1

>
> -#define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
>  #define linear_mapping_va_to_pa(x)     ((unsigned long)(x) - va_pa_offset)
>  #define kernel_mapping_va_to_pa(x)     \
>         ((unsigned long)(x) - va_kernel_pa_offset)
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9d06ff0e015a..7b87c14f1d24 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -159,8 +159,6 @@ void __init setup_bootmem(void)
>  {
>         phys_addr_t mem_start = 0;
>         phys_addr_t start, end = 0;
> -       phys_addr_t vmlinux_end = __pa_symbol(&_end);
> -       phys_addr_t vmlinux_start = __pa_symbol(&_start);

This as well.

>         u64 i;
>
>         /* Find the memory region containing the kernel */
> @@ -168,7 +166,7 @@ void __init setup_bootmem(void)
>                 phys_addr_t size = end - start;
>                 if (!mem_start)
>                         mem_start = start;
> -               if (start <= vmlinux_start && vmlinux_end <= end)
> +               if (start <= load_pa && (load_pa + load_sz) <= end)
>                         BUG_ON(size == 0);
>         }
>
> @@ -179,8 +177,13 @@ void __init setup_bootmem(void)
>          */
>         memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
>
> -       /* Reserve from the start of the kernel to the end of the kernel */
> -       memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> +       /*
> +        * Reserve from the start of the kernel to the end of the kernel
> +        * and make sure we align the reservation on PMD_SIZE since we will
> +        * map the kernel in the linear mapping as read-only: we do not want
> +        * any allocation to happen between _end and the next pmd aligned page.
> +        */
> +       memblock_reserve(load_pa, (load_sz + PMD_SIZE - 1) & ~(PMD_SIZE - 1));
>
>         max_pfn = PFN_DOWN(memblock_end_of_DRAM());
>         max_low_pfn = max_pfn;
> @@ -438,7 +441,9 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
>  #endif
>
> -static uintptr_t load_pa, load_sz;
> +uintptr_t load_pa, load_sz;
> +EXPORT_SYMBOL(load_pa);
> +EXPORT_SYMBOL(load_sz);

I think all changes till here should be in PATCH1.

Only the changes here onwards seems to be as-per PATCH description.

>
>  static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>  {
> @@ -596,9 +601,17 @@ static void __init setup_vm_final(void)
>
>                 map_size = best_map_size(start, end - start);
>                 for (pa = start; pa < end; pa += map_size) {
> -                       va = (uintptr_t)__va(pa);
> +                       pgprot_t prot = PAGE_KERNEL;
> +
> +                       /* Protect the kernel mapping that lies in the linear mapping */
> +                       if (pa >= __pa(_start) && pa < __pa(_end))
> +                               prot = PAGE_KERNEL_READ;
> +
> +                       /* Make sure we get virtual addresses in the linear mapping */
> +                       va = (uintptr_t)linear_mapping_pa_to_va(pa);
> +
>                         create_pgd_mapping(swapper_pg_dir, va, pa,
> -                                          map_size, PAGE_KERNEL);
> +                                          map_size, prot);
>                 }
>         }
>
> --
> 2.20.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
