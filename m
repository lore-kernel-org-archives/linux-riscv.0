Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B69C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FA820700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="niLgAkcQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VhNQ1Tm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FA820700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouBr2x2IX5zgCJC7MgqlKCx97ozicrYXf2LPRj8oxtQ=; b=niLgAkcQK+w5js
	QC2vdVjDNK9btOaiA339kAWYNDyCbdJdaMQ5FF4pUOYGu1mLS7VpuaIHWkXMA1JozYydSfFwms53g
	yBf6hEVNlslLGCHlNBLlxgqZmgUHFG57+p2ZFMeCBxhEfVTGHMvcsEaftWojBxM7D1gFmA6xtU37n
	84/+Q4sHUX6UoQhVaDXDjGnNpo29Ta/66ak2ZcB3x/a16FGl6eoLsvN1lAlSat7wu5/wwcYfRVqZo
	Mk9sIh5B1jVYgWLZgSGRiwoFSW44K78twJRRUsfKpWooORqqQSavSyYg9RMAO3AgNtIj/NUE4TuUL
	ZnMjWepmxT5iDFIEMMqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Oow-0000J9-2e; Thu, 28 Mar 2019 06:47:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Oop-0000Cq-6Y
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 06:47:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so13977130wro.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzCNnUHmgS8qrTlBpJ5GQ01rD6pDjW0N5CD7esPF0cE=;
 b=VhNQ1Tm4Wq19uVqa7hxSi3zQL8Sbp0c0FZ+XeV6b8LkKtYcKiih9kWQwlmQKoWoMjf
 p/fbskcIkdiOCuXH6T4GHjzb03WgOg3zoBdLyXaT9v4sKg5aLNWHPhRMnflue06K/isP
 ZyFhJCADeDTyDczQyBgz0u346bI9htBGjvP8SVN0wBFYqiMs5QyAywqbf04EQjicJVo9
 7O6ksFfQoJBlwVmYjKFW0ZSrPGeTownyU73g+SkJLp8qqadxXjdgtFiCzRx1gRqu/GiD
 5nCVeh5M+v2Emrh7Io4tCpw8Rnd+nO4VIk9ZGCRjNVkchhNxuaBleKT6/K9/p0XMOblE
 wB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzCNnUHmgS8qrTlBpJ5GQ01rD6pDjW0N5CD7esPF0cE=;
 b=ZW/BK8NvKgh9P5TFrwvWAiA06JcUqBBHCtBzuQwMXm3fnRQGV+jpHtzI8nKlskhuy3
 rxubecP9ftUWIGmEBjzcZgWW7gOfGLL6WQL/LvnXYB7oEL6FTVroMZP26y8gWuypDbxP
 Ihl66wKfofcQX3txO+7W7vkxvt+Kpj2wHEgH8ZpkKekYvCWch6BKL6fwI2ZaY2pzQsQa
 hAP1D2PD8XtzQWkvFHS9F+XmmXJtXuCeF5hLxDrWYIpOQB6GRhmimlQpkaIrJbKDhvTy
 KYoAdAVqW2Lq6Usv4kL94VF2d6vGp8FQkjkhd1SrzxkDDjXdNnaSn9Du/hjZ9+gckqE8
 wn4A==
X-Gm-Message-State: APjAAAVHZv5f9QtblibMEmt8vVzAWpeAoV4c2Dl75YH8tPabJyyG2qEz
 MCM/xWevxrg5zYR+DrpNH/NqLvXVUP/x52p7YsgMOA==
X-Google-Smtp-Source: APXvYqxV8pehTFrIM0rQeun+9L8a4f2OOc6CWz1UcOO1Okb9etU6L+etAzCCzs47ei9shMJm2sJezrat7TnGEdWPDaw=
X-Received: by 2002:adf:9427:: with SMTP id 36mr27254563wrq.128.1553755635456; 
 Wed, 27 Mar 2019 23:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
In-Reply-To: <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 12:17:03 +0530
Message-ID: <CAAhSdy0SmphwEdQ+v98bEvUFm=87H1567FNDosPqd8BLq5UAsw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] riscv: move switch_mm to its own file
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_234719_240436_2D91F14C 
X-CRM114-Status: GOOD (  25.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 6:11 AM Gary Guo <gary@garyguo.net> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> switch_mm is an expensive operations that has two users.
> flush_icache_deferred is only called within switch_mm and can be moved
> together. The function is expected to be more complicated when ASID
> support is added, so clean up eagerly.
>
> By moving them to a separate file we also removes some excessive
> dependency of tlbflush.h and cacheflush.h.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  arch/riscv/include/asm/mmu_context.h | 59 +----------------------
>  arch/riscv/mm/Makefile               |  1 +
>  arch/riscv/mm/context.c              | 71 ++++++++++++++++++++++++++++
>  3 files changed, 74 insertions(+), 57 deletions(-)
>  create mode 100644 arch/riscv/mm/context.c
>
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 336d60ec5698..bf4f097a9051 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -20,8 +20,6 @@
>
>  #include <linux/mm.h>
>  #include <linux/sched.h>
> -#include <asm/tlbflush.h>
> -#include <asm/cacheflush.h>
>
>  static inline void enter_lazy_tlb(struct mm_struct *mm,
>         struct task_struct *task)
> @@ -39,61 +37,8 @@ static inline void destroy_context(struct mm_struct *mm)
>  {
>  }
>
> -/*
> - * When necessary, performs a deferred icache flush for the given MM context,
> - * on the local CPU.  RISC-V has no direct mechanism for instruction cache
> - * shoot downs, so instead we send an IPI that informs the remote harts they
> - * need to flush their local instruction caches.  To avoid pathologically slow
> - * behavior in a common case (a bunch of single-hart processes on a many-hart
> - * machine, ie 'make -j') we avoid the IPIs for harts that are not currently
> - * executing a MM context and instead schedule a deferred local instruction
> - * cache flush to be performed before execution resumes on each hart.  This
> - * actually performs that local instruction cache flush, which implicitly only
> - * refers to the current hart.
> - */
> -static inline void flush_icache_deferred(struct mm_struct *mm)
> -{
> -#ifdef CONFIG_SMP
> -       unsigned int cpu = smp_processor_id();
> -       cpumask_t *mask = &mm->context.icache_stale_mask;
> -
> -       if (cpumask_test_cpu(cpu, mask)) {
> -               cpumask_clear_cpu(cpu, mask);
> -               /*
> -                * Ensure the remote hart's writes are visible to this hart.
> -                * This pairs with a barrier in flush_icache_mm.
> -                */
> -               smp_mb();
> -               local_flush_icache_all();
> -       }
> -#endif
> -}
> -
> -static inline void switch_mm(struct mm_struct *prev,
> -       struct mm_struct *next, struct task_struct *task)
> -{
> -       if (likely(prev != next)) {
> -               /*
> -                * Mark the current MM context as inactive, and the next as
> -                * active.  This is at least used by the icache flushing
> -                * routines in order to determine who should
> -                */
> -               unsigned int cpu = smp_processor_id();
> -
> -               cpumask_clear_cpu(cpu, mm_cpumask(prev));
> -               cpumask_set_cpu(cpu, mm_cpumask(next));
> -
> -               /*
> -                * Use the old spbtr name instead of using the current satp
> -                * name to support binutils 2.29 which doesn't know about the
> -                * privileged ISA 1.10 yet.
> -                */
> -               csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> -               local_flush_tlb_all();
> -
> -               flush_icache_deferred(next);
> -       }
> -}
> +void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> +       struct task_struct *task);
>
>  static inline void activate_mm(struct mm_struct *prev,
>                                struct mm_struct *next)
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index eb22ab49b3e0..d75b035786d6 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -3,3 +3,4 @@ obj-y += fault.o
>  obj-y += extable.o
>  obj-y += ioremap.o
>  obj-y += cacheflush.o
> +obj-y += context.o
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> new file mode 100644
> index 000000000000..fbb1cfe80267
> --- /dev/null
> +++ b/arch/riscv/mm/context.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + */
> +
> +#include <linux/mm.h>
> +
> +#include <asm/tlbflush.h>
> +#include <asm/cacheflush.h>
> +
> +/*
> + * When necessary, performs a deferred icache flush for the given MM context,
> + * on the local CPU.  RISC-V has no direct mechanism for instruction cache
> + * shoot downs, so instead we send an IPI that informs the remote harts they
> + * need to flush their local instruction caches.  To avoid pathologically slow
> + * behavior in a common case (a bunch of single-hart processes on a many-hart
> + * machine, ie 'make -j') we avoid the IPIs for harts that are not currently
> + * executing a MM context and instead schedule a deferred local instruction
> + * cache flush to be performed before execution resumes on each hart.  This
> + * actually performs that local instruction cache flush, which implicitly only
> + * refers to the current hart.
> + */
> +static inline void flush_icache_deferred(struct mm_struct *mm)
> +{
> +#ifdef CONFIG_SMP
> +       unsigned int cpu = smp_processor_id();
> +       cpumask_t *mask = &mm->context.icache_stale_mask;
> +
> +       if (cpumask_test_cpu(cpu, mask)) {
> +               cpumask_clear_cpu(cpu, mask);
> +               /*
> +                * Ensure the remote hart's writes are visible to this hart.
> +                * This pairs with a barrier in flush_icache_mm.
> +                */
> +               smp_mb();
> +               local_flush_icache_all();
> +       }
> +
> +#endif
> +}
> +
> +void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> +       struct task_struct *task)
> +{
> +       unsigned int cpu;
> +
> +       if (unlikely(prev == next))
> +               return;
> +
> +       /*
> +        * Mark the current MM context as inactive, and the next as
> +        * active.  This is at least used by the icache flushing
> +        * routines in order to determine who should be flushed.
> +        */
> +       cpu = smp_processor_id();
> +
> +       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +       cpumask_set_cpu(cpu, mm_cpumask(next));
> +
> +       /*
> +        * Use the old spbtr name instead of using the current satp
> +        * name to support binutils 2.29 which doesn't know about the
> +        * privileged ISA 1.10 yet.
> +        */
> +       csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> +       local_flush_tlb_all();
> +
> +       flush_icache_deferred(next);
> +}
> +
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Apart from nit pointed out by Christoph, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
