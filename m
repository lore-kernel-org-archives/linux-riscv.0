Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47981C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 00:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwtJ6uq2tkWIRydjPNxf1YgTo//+svFe7DwqfvcCwNE=; b=YdTZnSGGhgHPq5
	eDUyZT+TnKHVQo4QBhm4bENIb+mMHXT0xGARTBuxRdhSk52Yj9rGCwcDfwm9ai9db91f4cnFLrACB
	TW9MLnQNDx06hgD4bUyCUn3kqa95yZZu4D8KcHUAYqIc3p4QNlZmLROKXCLGGx1geUpx3utIceAsS
	PywqGvDuJpv5dX2uJ1RNWqKGoKYnye8e5pl+UHDFPFV/jATlYq3O5HWPCu+5FoiCTHEW8FTIZTW9v
	/VVSYIN50p+OvmWaf8GNjU04XcBKrmD6AieH/osavrvvb9QFZqzBYBKjiMLhMKLUF/UpC5ESgGgde
	8vrfMNHk2+4euqAVvgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYzk-009Psy-Cw; Wed, 09 Nov 2022 00:31:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYzh-009Ps3-C6
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 00:31:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 703C1B81CB9
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 00:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3A6C43147
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667953860;
	bh=xd/O2mH6veguQD1GJ01IVz86tNpLc2HbY3EB+jSy0TE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZfdxaE1XrHI6q95W/7EhwwKdhaVbhNo7LoAkdz6PGh7bGEoNbL6vxDvxUqjujlTUP
	 El85H4I2gs7K4XPWc0r7fPaVIWcWQOfuLirIH61QZd1fbh4/aogsjdtVK7Z1JQO60c
	 qQ8jTu/TcobCDLzKjjIT6A0zCSLEDaphgoZ9PAAJnI5YwgXdADmi2GSwq8+wet44e/
	 kFUkQO3zRj1Xrmf7f8HvxdR/ExuGGnZuIlYTZREr24oFfZ75/0hqVX0TokpJ3wSwp3
	 x9ROUr//N9lb9YBaddkXSxhNQBJ50RyNzTYEtkqHZUr8BFeBf9qcNhSkqHBuBcJ4AU
	 0ToYOcpnh9eCg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13bd19c3b68so18088214fac.7
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 16:31:00 -0800 (PST)
X-Gm-Message-State: ACrzQf1+3micudLoEwkyzpoX/jjG9uUq4B0Y/b6o+cE+mafoCgUIDCJ8
	OoiXD4zfOufA8Qy+yxqvdUwuE4KczNZoA5pXXic=
X-Google-Smtp-Source: AMsMyM4oPoZj7R74b9VIzROExjmUtHt+v4aXcnQhUub4txSApKVJ2UpDlqQT2Y9voCeuBc7okpQfZmc8Mc6/4idA4mU=
X-Received: by 2002:a05:6870:64a1:b0:13c:d09d:79f9 with SMTP id
 cz33-20020a05687064a100b0013cd09d79f9mr32770652oab.112.1667953859771; Tue, 08
 Nov 2022 16:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20221108102044.3317793-1-guoren@kernel.org> <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
 <Y2pmNUBocENfS4uK@wendy>
In-Reply-To: <Y2pmNUBocENfS4uK@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Nov 2022 08:30:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSFPRAKdsKKvE2yiKmQmFD+TN3_k1G3QjHKeRXwqwWa6w@mail.gmail.com>
Message-ID: <CAJF2gTSFPRAKdsKKvE2yiKmQmFD+TN3_k1G3QjHKeRXwqwWa6w@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv: asid: Fixup stale TLB entry cause
 application crash
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, heiko@sntech.de, 
	philipp.tomsich@vrull.eu, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_163105_715098_A8BE4F8B 
X-CRM114-Status: GOOD (  27.62  )
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

Yes, thx for pointing that out.

On Tue, Nov 8, 2022 at 10:23 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Nov 08, 2022 at 10:27:51AM +0000, Conor Dooley wrote:
> >
> >
> > On 8 November 2022 10:20:44 GMT, guoren@kernel.org wrote:
> > >From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > >After use_asid_allocator enabled, the userspace application will
> > >crash for stale tlb entry. Because only using cpumask_clear_cpu without
> > >local_flush_tlb_all couldn't guarantee CPU's tlb entries fresh. Then
> > >set_mm_asid would cause user space application get a stale value by
> > >the stale tlb entry, but set_mm_noasid is okay.
> > >
> > >Here is the symptom of the bug:
> > >unhandled signal 11 code 0x1 (coredump)
> > >   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
> > >   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> > >=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> > >(gdb) i r s0
> > >s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> > >(gdb) x/16 0x3fd6d92490
> > >0x3fd6d92490:   0xd80ac8a8      0x0000003f
> > >The core dump file shows that the value of register s0 is wrong, but the
> > >value in memory is right. This is because 'ld s0, -148(s0)' use a stale
> > >mapping entry in TLB and got a wrong value from a stale physical
> > >address.
> > >
> > >When task run on CPU0, the task loaded/speculative-loaded the value of
> > >address(0x3fd6d92490), and the first version of tlb mapping entry was
> > >PTWed into CPU0's tlb.
> > >When the task switched from CPU0 to CPU1 without local_tlb_flush_all
> > >(because of asid), the task happened to write a value on address
> > >(0x3fd6d92490). It caused do_page_fault -> wp_page_copy ->
> > >ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
> > >The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need
> > >tlb flush, but CPU0 had cleared the CPU0's mm_cpumask in previous switch_mm.
> > >So we only flushed the CPU1 tlb, and setted second version mapping
> > >of the pte. When the task switch from CPU1 to CPU0 again, CPU0 still used a
> > >stale tlb mapping entry which contained a wrong target physical address.
> > >When the task happened to read that value, the bug would be raised.
> > >
> > >Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> > >Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > >Signed-off-by: Guo Ren <guoren@kernel.org>
> > >Cc: Anup Patel <apatel@ventanamicro.com>
> > >Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > >---
> > > arch/riscv/mm/context.c | 4 +++-
> > > 1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > >index 7acbfbd14557..8ad6c2493e93 100644
> > >--- a/arch/riscv/mm/context.c
> > >+++ b/arch/riscv/mm/context.c
> > >@@ -317,7 +317,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> > >      */
> > >     cpu = smp_processor_id();
> > >
> > >-    cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > >+    if (!static_branch_unlikely(&use_asid_allocator))
> > >+            cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > >+
> > >     cpumask_set_cpu(cpu, mm_cpumask(next));
> > >
> > >     set_mm(next, cpu);
> >
> > This is a completely different patch to what you already sent.
> > Why have you marked it RESEND rather than v2?
>
> In addition, it seems to break the build for the nommu defconfigs.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
