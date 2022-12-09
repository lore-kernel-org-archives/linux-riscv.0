Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 03:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0BRBSeVlHW3QBgpa8/AnCTO7D56+xvG7FWbPgXTonE=; b=Fdyi/KUaecCetP
	FTikbs+eFwFZ98Vd6ZYK5ukO82dVXXG/eqzr+U2K5LvTpDdgHqTfq+mSIFsSXWWb6Zt84/beP7Hg7
	tDGiItYIjw6iMlAvWz6mUSdNSwCH9TEFGcukMFFhQUC180SAnIY0CPvqBEpK4u+KON9HPcLREOWX6
	eZvxiX1Hm6rbd+3wHvdc78B6iGWoMdZzvM1/djfgW9ua3W7uFNyUxkU7vIQ+GTRWaFAk2BzYy/Gyc
	q1xS9zt1BMjpW+OjcGCKCYVpt06sKYlmuLzcD9Q6ktVCNnwDt28GBcdo4Zz/bStMS4aq87KNLWBXY
	jzNDFlmCNexR7qCgavRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Tpa-001sgA-WB; Fri, 09 Dec 2022 03:13:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3TpX-001saw-Ln
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 03:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9A576214D
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 03:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F061C433F1
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 03:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670555622;
	bh=x+9MrQMMOfSTvflWMJ+YfKIq/lzAfeXGJeLdsIAP3fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bwphORUVbhRZlcJYegc5KIHzlojwm+TIe0e5QN9c1zeizXhSujyIYNOhK8qTsBHbD
	 re8U0EJVP4cY9lRM+Fg2+vkOCNQJ71qzMSzMcU+cIEU3FVQMhAn9X29g7LzBHWH9jN
	 tcSSa/9+42Hr0i9sOL0uvYPuMnOE5bc4mCZ3fNPJNad87+wApMuwY1uwVmGXgyXE6l
	 xp8emKZ/HpsqCzouReH+8tNbHLOHtvKLklSklaplrJ0zsL7/1wCKGGFGJCk1ssC3JB
	 5r26U3dND08rfeOZxivd5mS6zWoRHp8z8YAo4Yxip9IkNXyF6n0eBuhxxIIEkw68Ew
	 iT+Urxw9PGiVA==
Received: by mail-ej1-f52.google.com with SMTP id vv4so8564273ejc.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 19:13:42 -0800 (PST)
X-Gm-Message-State: ANoB5plPWHi2N9O4GdjRBLo5p7hBaRXueeuB2HhrRrqfEbtEH8i9Dj0H
	RidlrabG+RLP4mgYzK0bG494HGXiPiwESUkbKVE=
X-Google-Smtp-Source: AA0mqf46N45tPba3FH4c8/5VKiowiVnhF8psDwbHD8oJxrSPlp44NQUMpaslqZTw59wcxYXGf93Q6V16adxCICV3DiM=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr64225763eji.74.1670555620457; Thu, 08
 Dec 2022 19:13:40 -0800 (PST)
MIME-Version: 1.0
References: <Y3fxsWPLPlKGfMBj@curiosity> <mhng-1d55338a-53a1-42eb-bf5c-91655fde2734@palmer-ri-x1c9a>
In-Reply-To: <mhng-1d55338a-53a1-42eb-bf5c-91655fde2734@palmer-ri-x1c9a>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Dec 2022 11:13:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQqF8GG77SKm9MpJC28DQebHsjuSoD_+FRRV0GcKpQFCg@mail.gmail.com>
Message-ID: <CAJF2gTQqF8GG77SKm9MpJC28DQebHsjuSoD_+FRRV0GcKpQFCg@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application crash
To: Palmer Dabbelt <palmer@rivosinc.com>, geomatsi@gmail.com, philipp.tomsich@vrull.eu, 
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org
Cc: Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, alex@ghiti.fr, 
	Christoph Hellwig <hch@lst.de>, ajones@ventanamicro.com, gary@garyguo.net, jszhang@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	guoren@linux.alibaba.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_191343_829036_6013A6EE 
X-CRM114-Status: GOOD (  33.68  )
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

On Fri, Dec 9, 2022 at 7:30 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Fri, 18 Nov 2022 12:57:21 PST (-0800), geomatsi@gmail.com wrote:
> > Hi Guo Ren,
> >
> >
> >> After use_asid_allocator is enabled, the userspace application will
> >> crash by stale TLB entries. Because only using cpumask_clear_cpu without
> >> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> >> Then set_mm_asid would cause the user space application to get a stale
> >> value by stale TLB entry, but set_mm_noasid is okay.
> >
> > ... [snip]
> >
> >> +    /*
> >> +     * The mm_cpumask indicates which harts' TLBs contain the virtual
> >> +     * address mapping of the mm. Compared to noasid, using asid
> >> +     * can't guarantee that stale TLB entries are invalidated because
> >> +     * the asid mechanism wouldn't flush TLB for every switch_mm for
> >> +     * performance. So when using asid, keep all CPUs footmarks in
> >> +     * cpumask() until mm reset.
> >> +     */
> >> +    cpumask_set_cpu(cpu, mm_cpumask(next));
> >> +    if (static_branch_unlikely(&use_asid_allocator)) {
> >> +            set_mm_asid(next, cpu);
> >> +    } else {
> >> +            cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >> +            set_mm_noasid(next);
> >> +    }
> >>  }
> >
> > I observe similar user-space crashes on my SMP systems with enabled ASID.
> > My attempt to fix the issue was a bit different, see the following patch:
> >
> > https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/
> >
> > In brief, the idea was borrowed from flush_icache_mm handling:
> > - keep track of CPUs not running the task
> > - perform per-ASID TLB flush on such CPUs only if the task is switched there
>
> That way looks better to me: leaking hartids in the ASID allocator might
> make the crashes go away, but it's just going to end up trending towards
> flushing everything and that doesn't seem like the right long-term
> solution.
The penalty in switch_mm is too heavy!!!
 - If the system has multiple NUMA nodes, it will cause switch_mm_fast
flush unnecessary harts.
 - If flush_range is just 1 entry, it would case flush_tlb_all_asid.

switch_mm_fast:
        csr_write(CSR_SATP, virt_to_pfn(mm->pgd) |
                  ((cntx & asid_mask) << SATP_ASID_SHIFT) |
                  satp_mode);

        if (need_flush_tlb)
                local_flush_tlb_all();
+#ifdef CONFIG_SMP
+        else {
+                cpumask_t *mask = &mm->context.tlb_stale_mask;+
+
+               if (cpumask_test_cpu(cpu, mask)) {
+                        cpumask_clear_cpu(cpu, mask);
+                        local_flush_tlb_all_asid(cntx & asid_mask);
// penalty in switch_mm fast path
+                }
+        }
+#endif

And See:
 static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
                                  unsigned long size, unsigned long stride)
 {
+       struct cpumask *pmask = &mm->context.tlb_stale_mask;
        struct cpumask *cmask = mm_cpumask(mm);
        unsigned int cpuid;
        bool broadcast;
@@ -44,6 +29,15 @@ static void __sbi_tlb_flush_range(struct mm_struct
*mm, unsigned long start,
        if (static_branch_unlikely(&use_asid_allocator)) {
                unsigned long asid = atomic_long_read(&mm->context.id);

+               /*
+                * TLB will be immediately flushed on harts concurrently
+                * executing this MM context. TLB flush on other harts
+                * is deferred until this MM context migrates there.
+                */
+               cpumask_setall(pmask);
                 ^^^^^^^^^^^^^^^^^^^^^^^ It would flush all harts for
all NUMA nodes!!! Most of them deferred to switch_mm_fast. The penalty
contains unnecessary harts!
+               cpumask_clear_cpu(cpuid, pmask);
+               cpumask_andnot(pmask, pmask, cmask);

Please reconsider a bit, and make a smart decision. Just penalty the
harts who touched the mm, not all. And only flush the whole TLB when
some entries are needed.

The __sbi_tlb_flush_range is the slow path; keeping the fast path
performance is worth more than improving a slow one.

>
> So I've got that one on for-next, sorry I missed it before.
>
> Thanks!
>
> >
> > Your patch also works fine in my tests fixing those crashes. I have a
> > question though, regarding removed cpumask_clear_cpu. How CPUs no more
> > running the task are removed from its mm_cpumask ? If they are not
> > removed, then flush_tlb_mm/flush_tlb_page will broadcast unnecessary
> > TLB flushes to those CPUs when ASID is enabled.
> >
> > Regards,
> > Sergey



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
