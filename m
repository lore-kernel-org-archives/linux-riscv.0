Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A980FC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 23:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244332073A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 23:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244332073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6eSxPVEslTZRoZKdYX4H33KkyhEQN2ny1+pSSYfjC+A=; b=w99yTnIce2ZaHBJ8IV/tnCOOQ
	oZeX629qBjpVTCNh33+i/Bh9CV9qVZem0zEdF2avBxIiI1LwNc9qyIKwCT+sSGocc3nCbNOAm28PY
	k3nE2EsSuIUIEfEab4c4exEEiXgoOQ8iB1TPHeoB3QXal4kUkXjKJ2sWntje0CQ+v2yDtHf29QDMi
	QrCMYbB/mTR2bVVZnncQ2iUHOMY0d2NUv4yNO0RtmEpak0xWqcf1Alnll9lNYE8AkgdSXajyFb8Bw
	ArfpIVtZn7J3RnobePq0LUk6hO0WvOVkkgfoviZoePdkPIf/Yumn/AZDSYCkC2eCd7uABXDbobiM1
	mbB4vI1pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqPXu-0001WZ-2H; Fri, 18 Dec 2020 23:52:26 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqPXq-0001Vr-Jc
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 23:52:24 +0000
Received: by mail-il1-x134.google.com with SMTP id q1so3751219ilt.6
 for <linux-riscv@lists.infradead.org>; Fri, 18 Dec 2020 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLe4y38Dhux0r1qP5+NTUQsZ7P+ihwSg+ZZQLW/n97Y=;
 b=Gb+zQGsqj8ZjcDnHrwMAfxsklvEUYdmrM3ZfCAXzouLfJxRwgFyhcQP7SBXCq+32Rs
 lapkOOxWSdnidYHgbrSIBVL3PYSbV/+gKuU9/RQ+NAJTvVEw/d6jgWspOoNQCjfUBRy8
 HhXFCkSpQfMO+P8qGIct03lB3rq/E1iMLmaWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLe4y38Dhux0r1qP5+NTUQsZ7P+ihwSg+ZZQLW/n97Y=;
 b=EsHkFPEEBriWvI0RyMsuStRoLl4qjDAZ7afwtcg7qKAOF55YTR6kvr433JuwLG8uHg
 5JRGl1BiOVFC7BwE3REekcVJD+6lvhGOhTGWAiGC1IgrYUGmn51vItz7gVgYLAv4urtq
 sFEwsN8JNoIVj2NWYfdMccCHE3DioEYq3vIWVrMdrozJbPCaXYqhUudKhgSW0WegKrBZ
 eXQk4+7VFmn59wA2vlRiRsYnmlv/G1eSaW2iIDJ3rd6u32IZb5qXEQtiy2D4hdXHDQwe
 N8OgA2vDBbGJrZZXTQbgdrBwDLg8PI5wTJ35oXj+scbnDULy1purVapYhlvbrM7/zoqU
 +MRA==
X-Gm-Message-State: AOAM531yHQoyLSjagXzP60Gk/7CL7bp6+iVko7XHSryjxgQgpRyM+Hbp
 63J5LDb1SjGx0x7RXXzNB4h09qw6HpsmueavRjlEj8eIjVDRDYA=
X-Google-Smtp-Source: ABdhPJzdXDq4LlbNZylPre+qy879IUGXVwMICs35GEUX1irK+r50DB3c7G/5cOUmgD1KS1aBjq6EL+rEpuBze9ob85A=
X-Received: by 2002:a92:6410:: with SMTP id y16mr6796263ilb.126.1608335537822; 
 Fri, 18 Dec 2020 15:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20201012142410.308002-1-mick@ics.forth.gr>
 <mhng-1424155d-61cb-4125-9e22-d11072e2e1dd@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-1424155d-61cb-4125-9e22-d11072e2e1dd@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 18 Dec 2020 15:52:06 -0800
Message-ID: <CAOnJCUJab4bBgYFMMDHP6WFt4brHSiRBVwfYqRUmdnK7=ps5zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add kernel image sections to the resource tree
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_185222_757983_102AAFFB 
X-CRM114-Status: GOOD (  44.59  )
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
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 10:37 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 12 Oct 2020 07:24:10 PDT (-0700), mick@ics.forth.gr wrote:
> > This patch (previously part of my kexec/kdump series) populates
> > /proc/iomem with the various sections of the kernel image. We need
> > this for kexec-tools to be able to prepare the crashkernel image
> > for kdump to work. Since resource tree initialization is not
> > related to memory initialization I added the code to kernel/setup.c
> > and removed the original code (derived from the arm64 tree) from
> > mm/init.c.
> >
> > Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> > ---
> >  arch/riscv/kernel/setup.c | 160 ++++++++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/init.c      |  27 -------
> >  2 files changed, 160 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 2c6dd3293..450f0142f 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -4,6 +4,8 @@
> >   *  Chen Liqin <liqin.chen@sunplusct.com>
> >   *  Lennox Wu <lennox.wu@sunplusct.com>
> >   * Copyright (C) 2012 Regents of the University of California
> > + * Copyright (C) 2020 FORTH-ICS/CARV
> > + *  Nick Kossifidis <mick@ics.forth.gr>
> >   */
> >
> >  #include <linux/init.h>
> > @@ -48,6 +50,163 @@ atomic_t hart_lottery __section(.sdata);
> >  unsigned long boot_cpu_hartid;
> >  static DEFINE_PER_CPU(struct cpu, cpu_devices);
> >
> > +/*
> > + * Place kernel memory regions on the resource tree so that
> > + * kexec-tools can retrieve them from /proc/iomem. While there
> > + * also add "System RAM" regions for compatibility with other
> > + * archs, and the rest of the known regions for completeness.
> > + */
> > +static struct resource code_res = { .name = "Kernel code", };
> > +static struct resource data_res = { .name = "Kernel data", };
> > +static struct resource rodata_res = { .name = "Kernel rodata", };
> > +static struct resource bss_res = { .name = "Kernel bss", };
> > +
> > +static int __init add_resource(struct resource *parent,
> > +                             struct resource *res)
> > +{
> > +     int ret = 0;
> > +
> > +     ret = insert_resource(parent, res);
> > +     if (ret < 0) {
> > +             pr_err("Failed to add a %s resource at %llx\n",
> > +                     res->name, (unsigned long long) res->start);
> > +             return ret;
> > +     }
> > +
> > +     return 1;
> > +}
> > +
> > +static int __init add_kernel_resources(struct resource *res)
> > +{
> > +     int ret = 0;
> > +
> > +     /*
> > +      * The memory region of the kernel image is continuous and
> > +      * was reserved on setup_bootmem, find it here and register
> > +      * it as a resource, then register the various segments of
> > +      * the image as child nodes
> > +      */
> > +     if (!(res->start <= code_res.start && res->end >= data_res.end))
> > +             return 0;
> > +
> > +     res->name = "Kernel image";
> > +     res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +
> > +     /*
> > +      * We removed a part of this region on setup_bootmem so
> > +      * we need to expand the resource for the bss to fit in.
> > +      */
> > +     res->end = bss_res.end;
> > +
> > +     ret = add_resource(&iomem_resource, res);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = add_resource(res, &code_res);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = add_resource(res, &rodata_res);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = add_resource(res, &data_res);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = add_resource(res, &bss_res);
> > +
> > +     return ret;
> > +}
> > +
> > +static void __init init_resources(void)
> > +{
> > +     struct memblock_region *region = NULL;
> > +     struct resource *res = NULL;
> > +     int ret = 0;
> > +
> > +     code_res.start = __pa_symbol(_text);
> > +     code_res.end = __pa_symbol(_etext) - 1;
> > +     code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +
> > +     rodata_res.start = __pa_symbol(__start_rodata);
> > +     rodata_res.end = __pa_symbol(__end_rodata) - 1;
> > +     rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +
> > +     data_res.start = __pa_symbol(_data);
> > +     data_res.end = __pa_symbol(_edata) - 1;
> > +     data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +
> > +     bss_res.start = __pa_symbol(__bss_start);
> > +     bss_res.end = __pa_symbol(__bss_stop) - 1;
> > +     bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +
> > +     /*
> > +      * Start by adding the reserved regions, if they overlap
> > +      * with /memory regions, insert_resource later on will take
> > +      * care of it.
> > +      */
> > +     for_each_memblock(reserved, region) {
> > +             res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);

Is there a specific reason to invoke memblock_alloc while iterating
reserved regions ?
memblock_alloc also adds calls memblock_reserve. So we are modifying
the reserved region entries
while iterating it. It resulted in below warning for rv32.

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:795
__insert_resource+0x8e/0xd0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
5.10.0-00022-ge20097fb37e2-dirty #549
[    0.000000] epc: c00125c2 ra : c001262c sp : c1c01f50
[    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : ffffcf20
[    0.000000]  t1 : 00000000 t2 : 00000000 s0 : c1c01f60
[    0.000000]  s1 : ffffcf00 a0 : ffffff00 a1 : c1c0c0c4
[    0.000000]  a2 : 80c12b15 a3 : 80402000 a4 : 80402000
[    0.000000]  a5 : c1c0c0c4 a6 : 80c12b15 a7 : f5faf600
[    0.000000]  s2 : c1c0c0c4 s3 : c1c0e000 s4 : c1009a80
[    0.000000]  s5 : c1c0c000 s6 : c1d48000 s7 : c1613b4c
[    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
[    0.000000]  s11: 00000000 t3 : c1d4a000 t4 : ffffffff
[    0.000000]  t5 : c1008e38 t6 : 00000001
[    0.000000] status: 00000100 badaddr: 00000000 cause: 00000003
[    0.000000] irq event stamp: 0
[    0.000000] hardirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000] hardirqs last disabled at (0): [<00000000>] 0x0
[    0.000000] softirqs last  enabled at (0): [<00000000>] 0x0
[    0.000000] softirqs last disabled at (0): [<00000000>] 0x0
[    0.000000] random: get_random_bytes called from __warn+0xd8/0x11e
with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Failed to add a Kernel code resource at 80402000

Here is the fix that works:
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -127,7 +127,9 @@ static void __init init_resources(void)
 {
        struct memblock_region *region = NULL;
        struct resource *res = NULL;
-       int ret = 0;
+       int ret = 0, i = 0;
+       int num_mem_res;
+       struct resource *mem_res;

        code_res.start = __pa_symbol(_text);
        code_res.end = __pa_symbol(_etext) - 1;
@@ -145,16 +147,17 @@ static void __init init_resources(void)
        bss_res.end = __pa_symbol(__bss_stop) - 1;
        bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

+        num_mem_res = memblock.memory.cnt + memblock.reserved.cnt;
+       mem_res = memblock_alloc(num_mem_res * sizeof(*mem_res),
SMP_CACHE_BYTES);
+       if (!mem_res)
+               panic("%s: Failed to allocate %zu bytes\n", __func__,
num_mem_res * sizeof(*mem_res));
        /*
         * Start by adding the reserved regions, if they overlap
         * with /memory regions, insert_resource later on will take
         * care of it.
         */
        for_each_reserved_mem_region(region) {
-               res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-               if (!res)
-                       panic("%s: Failed to allocate %zu bytes\n", __func__,
-                             sizeof(struct resource));
+               res = &mem_res[i++];

                res->name = "Reserved";
                res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
@@ -181,11 +184,8 @@ static void __init init_resources(void)

        /* Add /memory regions to the resource tree */
        for_each_mem_region(region) {
-               res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-               if (!res)
-                       panic("%s: Failed to allocate %zu bytes\n", __func__,
-                             sizeof(struct resource));

+               res = &mem_res[i++];

If this looks okay to you, I will send the patch.

> > +             if (!res)
> > +                     panic("%s: Failed to allocate %zu bytes\n", __func__,
> > +                           sizeof(struct resource));
> > +
> > +             res->name = "Reserved";
> > +             res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> > +             res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
> > +             res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
> > +
> > +             ret = add_kernel_resources(res);
> > +             if (ret < 0)
> > +                     goto error;
> > +             else if (ret)
> > +                     continue;
> > +
> > +             /*
> > +              * Ignore any other reserved regions within
> > +              * system memory.
> > +              */
> > +             if (memblock_is_memory(res->start))
> > +                     continue;
> > +

Shouldn't we free the res in this case ? The allocated memblock is
useless as it is not going to be added
to the resource tree.

> > +             ret = add_resource(&iomem_resource, res);
> > +             if (ret < 0)
> > +                     goto error;
> > +     }
> > +
> > +     /* Add /memory regions to the resource tree */
> > +     for_each_memblock(memory, region) {
> > +             res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> > +             if (!res)
> > +                     panic("%s: Failed to allocate %zu bytes\n", __func__,
> > +                           sizeof(struct resource));
> > +
> > +             if (unlikely(memblock_is_nomap(region))) {
> > +                     res->name = "Reserved";
> > +                     res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> > +             } else {
> > +                     res->name = "System RAM";
> > +                     res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +             }
> > +
> > +             res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> > +             res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> > +
> > +             ret = add_resource(&iomem_resource, res);
> > +             if (ret < 0)
> > +                     goto error;
> > +     }
> > +
> > +     return;
> > +
> > + error:
> > +     memblock_free((phys_addr_t) res, sizeof(struct resource));
> > +     /* Better an empty resource tree than an inconsistent one */
> > +     release_child_resources(&iomem_resource);
> > +}
> > +
> > +
> >  void __init parse_dtb(void)
> >  {
> >       if (early_init_dt_scan(dtb_early_va))
> > @@ -73,6 +232,7 @@ void __init setup_arch(char **cmdline_p)
> >
> >       setup_bootmem();
> >       paging_init();
> > +     init_resources();
> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> >       unflatten_and_copy_device_tree();
> >  #else
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index f750e012d..05d6cf0c2 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -541,39 +541,12 @@ void mark_rodata_ro(void)
> >  }
> >  #endif
> >
> > -static void __init resource_init(void)
> > -{
> > -     struct memblock_region *region;
> > -
> > -     for_each_memblock(memory, region) {
> > -             struct resource *res;
> > -
> > -             res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> > -             if (!res)
> > -                     panic("%s: Failed to allocate %zu bytes\n", __func__,
> > -                           sizeof(struct resource));
> > -
> > -             if (memblock_is_nomap(region)) {
> > -                     res->name = "reserved";
> > -                     res->flags = IORESOURCE_MEM;
> > -             } else {
> > -                     res->name = "System RAM";
> > -                     res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > -             }
> > -             res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> > -             res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> > -
> > -             request_resource(&iomem_resource, res);
> > -     }
> > -}
> > -
> >  void __init paging_init(void)
> >  {
> >       setup_vm_final();
> >       sparse_init();
> >       setup_zero_page();
> >       zone_sizes_init();
> > -     resource_init();
> >  }
> >
> >  #ifdef CONFIG_SPARSEMEM_VMEMMAP
>
> Thanks, this is on for-next.  I had to fix up a few things, LMK if I screwed
> anything up.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
