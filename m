Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13DEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xNpbpp+/Wfr7eJ/9tzuXffTXImTg0mdXSVmxCbWH4g=; b=Q1TneJ+4VTf0U2
	wP4UidQKsgGWXL3QvFNNY7CnvdVqHOE+Ywzv4H5TeCtoo4AwvbHvQ1UZGjmzmm47xawrNTbR5mbuA
	DYp+9a10/Frj6jEy4e7a28+lM30XUO6ZrySW0JKKSvAkVhgQPXEMXPZRTPowcdNORh5e3JG1poGMX
	lBDFUmMVKtCQBnliMAKokGLEzfetf4zKJx9Rft3Y4u76FhMDHh+6z2uSz4gWAXvN0oiTvCmDmnJ1L
	+tlibYY6mq7dHe73RQqRb3baRk5dyY/uK0XAXBjyYn1ZmjtRuFaSzAyXJoBKlaqpH7MyXSZ/Z3On3
	oAlLknxzXoKZVJiBJnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8hYg-0089MZ-LQ; Fri, 23 Dec 2022 12:53:54 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8hYa-0089HH-Bf
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 12:53:50 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 83so4330123yba.11
        for <linux-riscv@lists.infradead.org>; Fri, 23 Dec 2022 04:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddwl2eXurQm27aQuatUeFHpduWH+gP/YWJaFq+Y/k28=;
        b=kQltr/P0KxpXcfOlYI0CzgzhH/bAsWjzhykkDJJ+xgVS32fgPJfoMw2A0SCZtxc94o
         fF9RFLXeMNCQVOUUzcOtWgltNc9JswVzufQ/vV8llRhR5NrbtXnzgylmEY+mNv5OCKKX
         DwiEL4neDqZWWl2KvIyWuGxwPYzk31V/1RBHRud6OddWqqFYJvHR6tDwyNuBoLT6DQrC
         F0UKtbpNkwRtmTmWAnXmjQTpdacAyHsEJVssDI8KK2C8Z0MVgdKjEMAj3OPPoLNbiLKZ
         Hxk++a9sR+IhV+YUyQsnMzdij6Fjk/l8oX1HIoKbhjO3+56UxeJJXIszHv5cc7L/SjD8
         8RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddwl2eXurQm27aQuatUeFHpduWH+gP/YWJaFq+Y/k28=;
        b=GnPO04ho8277IUYW2HX6L/ZZexnKLKPjpNUs9doGOOBikeMDrqWhtlTrMesm1BF9HD
         n57gMGO6BpzySgBfmEfeqhe9jYSzVVJZ/7i0Pozoa5o2JPV/CrizkQC/z7rPPuHHTBAp
         OYqZKBUha7hHBHwOH5kL/sMhfUpU9d+9v0GxJ5LuKCVCQX+8FSPp8SMYC5UrXjmCF2nJ
         XhA3dDoOprWrNVv2EY0g8Fyi86KZOSVRFDDjtSPwz3TblHrbeSaNF3x1Y6KPIRSAZrIk
         9RKRb5H9asoCHrPI+GqENX/xAjG3lNWzDfg1QY1dM7Na+EiK3NPIG1Wk7JgempZSXVCh
         iGDg==
X-Gm-Message-State: AFqh2krqrgJ43SoLnK/7x05fYLI+qD2QH+y6SYsEGQD58NMfs7Ou9z2C
	Qka1QQvo9dZYL/pmRWhrNMDrhwdb3nTn0ATLdGk=
X-Google-Smtp-Source: AMrXdXuPNjW1/ValhDj6KqDhCWENtVPP90a7xAg83ZTdS2f4qyMJUYCiBo3F4LGH8LvJ8b38FEf/kqGNuCzly1FcPfg=
X-Received: by 2002:a25:d311:0:b0:6fa:40a8:5952 with SMTP id
 e17-20020a25d311000000b006fa40a85952mr981148ybf.594.1671800026317; Fri, 23
 Dec 2022 04:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20221111075902.798571-1-guoren@kernel.org>
In-Reply-To: <20221111075902.798571-1-guoren@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Dec 2022 12:53:19 +0000
Message-ID: <CA+V-a8tbFhefuYF0UrGNrKZn6CpHEUhOvsf4GNmdLza0gWvf=w@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application crash
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, philipp.tomsich@vrull.eu, 
	alex@ghiti.fr, hch@lst.de, ajones@ventanamicro.com, gary@garyguo.net, 
	jszhang@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, 
	Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_045348_424051_89336FF4 
X-CRM114-Status: GOOD (  38.37  )
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

Hi Guo,

Thank you for the patch.

On Fri, Nov 11, 2022 at 8:00 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> After use_asid_allocator is enabled, the userspace application will
> crash by stale TLB entries. Because only using cpumask_clear_cpu without
> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> Then set_mm_asid would cause the user space application to get a stale
> value by stale TLB entry, but set_mm_noasid is okay.
>
> Here is the symptom of the bug:
> unhandled signal 11 code 0x1 (coredump)
>    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
>    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> (gdb) i r s0
> s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> (gdb) x /2x 0x3fd6d92490
> 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> The core dump file shows that register s0 is wrong, but the value in
> memory is correct. Because 'ld s0, -148(s0)' used a stale mapping entry
> in TLB and got a wrong result from an incorrect physical address.
>
> When the task ran on CPU0, which loaded/speculative-loaded the value of
> address(0x3fd6d92490), then the first version of the mapping entry was
> PTWed into CPU0's TLB.
> When the task switched from CPU0 to CPU1 (No local_tlb_flush_all here by
> asid), it happened to write a value on the address (0x3fd6d92490). It
> caused do_page_fault -> wp_page_copy -> ptep_clear_flush ->
> ptep_get_and_clear & flush_tlb_page.
> The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need TLB
> flush, but CPU0 had cleared the CPU0's mm_cpumask in the previous
> switch_mm. So we only flushed the CPU1 TLB and set the second version
> mapping of the PTE. When the task switched from CPU1 to CPU0 again, CPU0
> still used a stale TLB mapping entry which contained a wrong target
> physical address. It raised a bug when the task happened to read that
> value.
>
>    CPU0                               CPU1
>    - switch 'task' in
>    - read addr (Fill stale mapping
>      entry into TLB)
>    - switch 'task' out (no tlb_flush)
>                                       - switch 'task' in (no tlb_flush)
>                                       - write addr cause pagefault
>                                         do_page_fault() (change to
>                                         new addr mapping)
>                                           wp_page_copy()
>                                             ptep_clear_flush()
>                                               ptep_get_and_clear()
>                                               & flush_tlb_page()
>                                         write new value into addr
>                                       - switch 'task' out (no tlb_flush)
>    - switch 'task' in (no tlb_flush)
>    - read addr again (Use stale
>      mapping entry in TLB)
>      get wrong value from old phyical
>      addr, BUG!
>
> The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
> which could guarantee to invalidate all stale TLB entries during TLB
> flush.
>
> Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes in v3:
>  - Move set/clear cpumask(mm) into set_mm (Make code more pretty
>    with Andrew's advice)
>  - Optimize comment description
>
> Changes in v2:
>  - Fixup nommu compile problem (Thx Conor, Also Reported-by: kernel
>    test robot <lkp@intel.com>)
>  - Keep cpumask_clear_cpu for noasid
> ---
>  arch/riscv/mm/context.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>
As reported on the patch [0] I was seeing consistent failures on the
RZ/Five SoC while running bonnie++ utility. After applying this patch
on top of Palmer's for-next branch (eb67d239f3aa) I am no longer
seeing this issue.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[0] https://patchwork.kernel.org/project/linux-riscv/patch/20220829205219.283543-1-geomatsi@gmail.com/

Cheers,
Prabhakar

> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..0f784e3d307b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -205,12 +205,24 @@ static void set_mm_noasid(struct mm_struct *mm)
>         local_flush_tlb_all();
>  }
>
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +                         struct mm_struct *next, unsigned int cpu)
>  {
> -       if (static_branch_unlikely(&use_asid_allocator))
> -               set_mm_asid(mm, cpu);
> -       else
> -               set_mm_noasid(mm);
> +       /*
> +        * The mm_cpumask indicates which harts' TLBs contain the virtual
> +        * address mapping of the mm. Compared to noasid, using asid
> +        * can't guarantee that stale TLB entries are invalidated because
> +        * the asid mechanism wouldn't flush TLB for every switch_mm for
> +        * performance. So when using asid, keep all CPUs footmarks in
> +        * cpumask() until mm reset.
> +        */
> +       cpumask_set_cpu(cpu, mm_cpumask(next));
> +       if (static_branch_unlikely(&use_asid_allocator)) {
> +               set_mm_asid(next, cpu);
> +       } else {
> +               cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +               set_mm_noasid(next);
> +       }
>  }
>
>  static int __init asids_init(void)
> @@ -264,7 +276,8 @@ static int __init asids_init(void)
>  }
>  early_initcall(asids_init);
>  #else
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +                         struct mm_struct *next, unsigned int cpu)
>  {
>         /* Nothing to do here when there is no MMU */
>  }
> @@ -317,10 +330,7 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>          */
>         cpu = smp_processor_id();
>
> -       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> -       cpumask_set_cpu(cpu, mm_cpumask(next));
> -
> -       set_mm(next, cpu);
> +       set_mm(prev, next, cpu);
>
>         flush_icache_deferred(next, cpu);
>  }
> --
> 2.36.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
