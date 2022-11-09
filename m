Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4452C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEoJLl49FCdEA3WWZ8NkWDIEqgJfMwE4HiOO6ZxArPw=; b=gJ8+45VKfwwnb6
	INhPE5hWAtnLir4/vQyUo1FaC3+SvO9wXSZJVGYKiTLqYTBVLe8KQNcuj8JIJua/e6sP96oe1hC84
	ytnfMovJeadtXOh9fYEHcakOn3J/L65x8XlaY4z4LIctA8HzJe3zzG1K23j52AstdEnIsjQuRqgTR
	AgGYSOZNQz5R3PTvLLCGtSZ4XrSB1DzrWzx/s16W9UP1NQ9Fzu8XC9K3QJPKQCsr+WTMDbVy8t0Rt
	cTlIuJes3FIFkzXLzGO755g5ngPIdgDc+EV12U20Q4X/w3XupW0OkyCaG8zRVxoGVeLxQxbMwJmB4
	lSti2V4tJUDzFyMn3rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYzD-009PlM-OG; Wed, 09 Nov 2022 00:30:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYzA-009Pk2-5Q
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 00:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8644CB81CB9
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 00:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396D0C433D7
	for <linux-riscv@lists.infradead.org>; Wed,  9 Nov 2022 00:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667953829;
	bh=4U+Q54//+8Mboh9W6Q6zPTJ7xO2e6TEWWaIKq4egqf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T6pifDpyDY9W/BL+dD3rbswhsVaUX1R6D4bPDtYnqoxioAPUe7Z2yIdJDv2C7CNR7
	 gey6571QstRyfw90KQzYoYezE74GTPls3RGqcoywjIbI5f48IPuuQ1pTosN/MmAPMt
	 30CTxEwePs9oFrGruIfhBKbfiNrkur/4Sx/6kzu6GQAUNRJNrlc1uI6LmwH0+EANLz
	 pSF5R4hx23vPDyZi+SHAddMr/9tOPmkqbj32I+T6Tl/ZWZRqk1TPaQgVBvuc4WhDk/
	 AbZPllCfx7wBtFoxk11XVrRx9Kd6mccHTtJIoTNjZSqhxWKKy+QavRPbBE/PvfNG8K
	 7HPJGlGO+1YcA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so18116637fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 16:30:29 -0800 (PST)
X-Gm-Message-State: ACrzQf3bPXH5Gm1U//3c0AzbanoihOqA7Bhoq3jMBzGF6J3kPNuli3mt
	RmRN+ZM0BpSZA448qcdfAs/rS5VezOjCZJCrKTA=
X-Google-Smtp-Source: AMsMyM7btQd6y9sjJLT3OMXScXk6Ha1OX/HDrYukpNuUGedjdtK2GUIWsEZeVzi5C653Sx06j60ACuEbVm8AbMRyJNA=
X-Received: by 2002:a05:6870:64a1:b0:13c:d09d:79f9 with SMTP id
 cz33-20020a05687064a100b0013cd09d79f9mr32769397oab.112.1667953828298; Tue, 08
 Nov 2022 16:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20221108102044.3317793-1-guoren@kernel.org> <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
In-Reply-To: <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Nov 2022 08:30:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRKtWPP18kmU+50npg4h33-Hr3aUUQKcyx416jTvMUWzw@mail.gmail.com>
Message-ID: <CAJF2gTRKtWPP18kmU+50npg4h33-Hr3aUUQKcyx416jTvMUWzw@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv: asid: Fixup stale TLB entry cause
 application crash
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com, 
	heiko@sntech.de, philipp.tomsich@vrull.eu, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_163032_511783_6F1F36D2 
X-CRM114-Status: GOOD (  22.71  )
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

On Tue, Nov 8, 2022 at 6:27 PM Conor Dooley <conor@kernel.org> wrote:
>
>
>
> On 8 November 2022 10:20:44 GMT, guoren@kernel.org wrote:
> >From: Guo Ren <guoren@linux.alibaba.com>
> >
> >After use_asid_allocator enabled, the userspace application will
> >crash for stale tlb entry. Because only using cpumask_clear_cpu without
> >local_flush_tlb_all couldn't guarantee CPU's tlb entries fresh. Then
> >set_mm_asid would cause user space application get a stale value by
> >the stale tlb entry, but set_mm_noasid is okay.
> >
> >Here is the symptom of the bug:
> >unhandled signal 11 code 0x1 (coredump)
> >   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
> >   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> >=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> >(gdb) i r s0
> >s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> >(gdb) x/16 0x3fd6d92490
> >0x3fd6d92490:   0xd80ac8a8      0x0000003f
> >The core dump file shows that the value of register s0 is wrong, but the
> >value in memory is right. This is because 'ld s0, -148(s0)' use a stale
> >mapping entry in TLB and got a wrong value from a stale physical
> >address.
> >
> >When task run on CPU0, the task loaded/speculative-loaded the value of
> >address(0x3fd6d92490), and the first version of tlb mapping entry was
> >PTWed into CPU0's tlb.
> >When the task switched from CPU0 to CPU1 without local_tlb_flush_all
> >(because of asid), the task happened to write a value on address
> >(0x3fd6d92490). It caused do_page_fault -> wp_page_copy ->
> >ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
> >The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need
> >tlb flush, but CPU0 had cleared the CPU0's mm_cpumask in previous switch_mm.
> >So we only flushed the CPU1 tlb, and setted second version mapping
> >of the pte. When the task switch from CPU1 to CPU0 again, CPU0 still used a
> >stale tlb mapping entry which contained a wrong target physical address.
> >When the task happened to read that value, the bug would be raised.
> >
> >Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> >Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >Signed-off-by: Guo Ren <guoren@kernel.org>
> >Cc: Anup Patel <apatel@ventanamicro.com>
> >Cc: Palmer Dabbelt <palmer@rivosinc.com>
> >---
> > arch/riscv/mm/context.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> >index 7acbfbd14557..8ad6c2493e93 100644
> >--- a/arch/riscv/mm/context.c
> >+++ b/arch/riscv/mm/context.c
> >@@ -317,7 +317,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >        */
> >       cpu = smp_processor_id();
> >
> >-      cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >+      if (!static_branch_unlikely(&use_asid_allocator))
> >+              cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >+
> >       cpumask_set_cpu(cpu, mm_cpumask(next));
> >
> >       set_mm(next, cpu);
>
> This is a completely different patch to what you already sent. Why have you marked it RESEND rather than v2?
Okay, I should send v2.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
