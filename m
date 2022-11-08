Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF08C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgfHGazfxKwHO2cagZ8R40705/6ByOjTvbFZh4bGdXU=; b=VxXqKGM4FLYn2f
	c3LFM9tzJBUDdknHlSgz2isC4QJh6yuvJakkKBAeTq4ReNr5yaL69DHm83TswwiEYpfBpZGArAcCX
	kbOsylQjugDxbeMW1swtfImoonCwR9kik8ZR+7YW7Csg5KZwAm52Mfl5WS1PFsSn/+fCetVii9g+c
	hr/P/+LAkgyVLrH3CFdJz3uKRStWI1Aytjcm80WVS9JX/dfd+KzzkLdGmj4Di2x0vzaCu9+I36k3f
	OtNh4u55EuGABPkbq2bVBpX74BuXQE7ur+gQYdhz0v1VelYZiLWBIPcbfvBaYR/ppcykUuXzdH3Do
	vfJImBRz5EuamboQvPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKtg-0044KP-53; Tue, 08 Nov 2022 09:27:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKtd-0044Jq-Vn
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 09:27:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81FA1614C6
	for <linux-riscv@lists.infradead.org>; Tue,  8 Nov 2022 09:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EB7C433D7
	for <linux-riscv@lists.infradead.org>; Tue,  8 Nov 2022 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667899672;
	bh=khP7zt/guUCxQlqZfXenhn3wm8xVRGG4tWOWfHwzHcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QNwbKtDZwudFYvidhOOnyBG+Y9l7XlnR4nSiwefsCzPO70heIQKwGYk+Q57JSC2Vn
	 bMowXF6fXRdITe6C/g0DmaQAX0HQm2n1r/bqMhsoVTs4y5dvA+uY1WbXZkLokiZCMT
	 5H6y890tVe9DPFZvMclgKAK5gzSsTLEgaUOY2y30ZDp5baW0HEUrWSuOfqs0MejRn2
	 SRZoJ4UcZRpZH0oyKt6JBK1WP9InRpwt03RrT+QIXw0Wl9EepXmmF1RJYDLXpYxRgn
	 pbsxfOMXttRVhcIQ06fXSvS4q6DHduPLOEAlAkqKVGNRmT+pP3+tzi1G+KheJxwNjW
	 Jep8ofB8UuSlQ==
Received: by mail-oo1-f42.google.com with SMTP id x196-20020a4a41cd000000b0049f064d2591so419576ooa.11
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 01:27:52 -0800 (PST)
X-Gm-Message-State: ACrzQf3GfGh4W8CqanLVJWYqO04w8J0i+KAMMxSAm69HHpRy1Ldkp6Ws
	n1xB7PAA/D0CPdq4QWmOLvEhWqTaYiQD6VCf/o8=
X-Google-Smtp-Source: AMsMyM5AsLj9Dy2hdCxJVobOohjEwP3qodBaGh85/ZsjRrhMB1JUE+OjpaKmIU+NAE8eeEFWOenlO2HFwdJI1d0yhog=
X-Received: by 2002:a4a:d8d4:0:b0:49c:e0de:ebbe with SMTP id
 c20-20020a4ad8d4000000b0049ce0deebbemr14337615oov.31.1667899672075; Tue, 08
 Nov 2022 01:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108090219.3285030-1-guoren@kernel.org> <CAJF2gTQpA_PMKmRshuPa9PT_SuLXwS4nVJbZA07vOtOtztbhDQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQpA_PMKmRshuPa9PT_SuLXwS4nVJbZA07vOtOtztbhDQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Nov 2022 17:27:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRA6uRq-XNdYVS8O9-X9jWbbn=cQD=FLXMtwTUxVecfg@mail.gmail.com>
Message-ID: <CAJF2gTTRA6uRq-XNdYVS8O9-X9jWbbn=cQD=FLXMtwTUxVecfg@mail.gmail.com>
Subject: Re: [PATCH] riscv: asid: Fixup stale TLB entry cause application crash
To: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexandre.ghiti@canonical.com, conor.dooley@microchip.com, heiko@sntech.de, 
	philipp.tomsich@vrull.eu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_012754_113611_B373AA16 
X-CRM114-Status: GOOD (  30.77  )
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

On Tue, Nov 8, 2022 at 5:25 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Nov 8, 2022 at 5:02 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > When use_asid_allocator is enabled, the userspace application would
> > crash by stale tlb entry. Because only using cpumask_clear_cpu without
> > local_flush_tlb_all couldn't guarantee CPU's tlb contains fresh mapping
> > entry. Then set_mm_asid would cause user space application get a stale
> > value by stale tlb entry, but set_mm_noasid is okay.
> >
> > Here is the symptom of the bug:
> > unhandled signal 11 code 0x1 (coredump)
> >    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
> >    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> > => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> > (gdb) i r s0
> > s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> > (gdb) x/16 0x3fd6d92490
> > 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> > The core dump file show us the value of register s0 is wrong, but the
> > value in memory is right.
> >
> > When task run on CPU0, the task loaded/speculative-loaded the value of
> > address-0x3fd6d92490, the first version tlb mapping enter in CPU0's tlb.
> > When the task switched from CPU0 to CPU1 without local_tlb_flush_all
> > (because of asid), the task happened to write a value on address:
> > 0x3fd6d92490 that caused do_page_fault -> wp_page_copy ->
> > ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
> > The flush_tlb_page would use mm_cpumask(mm) to determine which CPUs need
> > tlb flush, but CPU0 cleared the CPU0's mm_cpumask in previous switch_mm.
> > So we only flushed the CPU1's tlb entry, and setted second version mapping
> > of the pte. When the task switch from CPU1 to CPU0 again, it still used a
> > stale tlb entry on CPU0 which contained a wrong target physical address.
> > When the task happened to read that value, the bug would be raised.
> >
> > Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Anup Patel <apatel@ventanamicro.com>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  arch/riscv/mm/context.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 7acbfbd14557..843e86b63532 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -317,7 +317,6 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >          */
> >         cpu = smp_processor_id();
> >
> > -       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> It should be:
>
> -       cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +       if (static_branch_unlikely(&use_asid_allocator))
Sorry,
        if (!static_branch_unlikely(&use_asid_allocator))

I would RESEND the patch.

> +               cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +
>
> No bug on noasid part.
>
> >         cpumask_set_cpu(cpu, mm_cpumask(next));
> >
> >         set_mm(next, cpu);
> > --
> > 2.36.1
> >
>
>
> --
> Best Regards
>  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
