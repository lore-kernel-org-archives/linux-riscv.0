Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1818C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPHf8v5MO/1vlYd64IdG0tTqATLuItSAioghT5JpwvA=; b=N6vykqZ9wRNnVj
	7aQ/qKGD6zdxz9fom1/h1QSb9znj4hvevPYBfRbTCk2Z+E5o/F8NaFgMH2yYhDiQeIofqtfFTo2Hp
	uLqOkNe39oZ71ngPuizt4d0LlngvkRJXJR/yR4IYNvImHDIszl99DcvDyZmZQ+4g853lBGR5gbwtw
	sV3dMIvlGZqi7B9FZYqTBHeC9JLQ3Xei5xohW6hn3+00SywG/GJoYx7VLN+UxBYcpaiYYzID4Vo/t
	Yxxii1WUsM2u8qtt1q1U/nvg18ym+duFrzbG6GotK2MI4awpUbCMlLuJTiJr2Q9p9qJ2D4tltwBLh
	B3uXkYb2llzYTZF/z+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKrU-0043sh-Ri; Tue, 08 Nov 2022 09:25:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKrS-0043rs-Ni
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 09:25:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 037A3614DA
	for <linux-riscv@lists.infradead.org>; Tue,  8 Nov 2022 09:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4A2C43141
	for <linux-riscv@lists.infradead.org>; Tue,  8 Nov 2022 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667899537;
	bh=hwz50AYBkBCjPYIHa+6/89SwfK+btdFhDyOrJaSPMks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cpsdMAw4FoYr2AbgkYaLVZKhe5kQPFZNj6K6FhZV/ozTFhYBSE1JHU9OnYrATW/7S
	 D1dLSBW6GItXSsgxkJEZQ8JEAZ/HeW+pJVFoeFeNy7QqqoPJKxcUCc3rJf/M9URAfm
	 d8kcLL/RANglsnILwIk9c1WYY+CAN6dHV2vJJ6YQFCnUne01Qae9Y4B7BQTsNXWvnv
	 vSd8yS8PBb6e7buHSxg0v4cVEAZAT5IVKVUEIerT8Uk0naBnD+YyArGdw32wL4Atjs
	 NjNjtUFJapYQzXB07r9FswS0pLZZ8rdTZaw/tbnMJ4X7sBaNg5A7pDaf1GKKvEKtnI
	 pNFk1pD1MhA7g==
Received: by mail-oi1-f173.google.com with SMTP id n205so3844402oib.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 01:25:37 -0800 (PST)
X-Gm-Message-State: ACrzQf1YuC2ta21KoPthdjLZbxVsZS3Qwq35zIjKPvDPd7r0iy3o+fg6
	QDJgywBy8/lE5SOvvJZUz9Ek9YEq4tZvnFFgVMw=
X-Google-Smtp-Source: AMsMyM5LOvXRipq+RzM0Ku0ZPbzZmM1dSyqTGf4kLWGahPuyMBWgEsiOsBq8I1x98is6irZ0nzPBAUA/gA+/4LSap+U=
X-Received: by 2002:a05:6808:f0f:b0:35a:7892:a7f3 with SMTP id
 m15-20020a0568080f0f00b0035a7892a7f3mr8124472oiw.112.1667899536512; Tue, 08
 Nov 2022 01:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20221108090219.3285030-1-guoren@kernel.org>
In-Reply-To: <20221108090219.3285030-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Nov 2022 17:25:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQpA_PMKmRshuPa9PT_SuLXwS4nVJbZA07vOtOtztbhDQ@mail.gmail.com>
Message-ID: <CAJF2gTQpA_PMKmRshuPa9PT_SuLXwS4nVJbZA07vOtOtztbhDQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: asid: Fixup stale TLB entry cause application crash
To: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexandre.ghiti@canonical.com, conor.dooley@microchip.com, heiko@sntech.de, 
	philipp.tomsich@vrull.eu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_012538_865597_AE280908 
X-CRM114-Status: GOOD (  27.33  )
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

On Tue, Nov 8, 2022 at 5:02 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When use_asid_allocator is enabled, the userspace application would
> crash by stale tlb entry. Because only using cpumask_clear_cpu without
> local_flush_tlb_all couldn't guarantee CPU's tlb contains fresh mapping
> entry. Then set_mm_asid would cause user space application get a stale
> value by stale tlb entry, but set_mm_noasid is okay.
>
> Here is the symptom of the bug:
> unhandled signal 11 code 0x1 (coredump)
>    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
>    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> (gdb) i r s0
> s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> (gdb) x/16 0x3fd6d92490
> 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> The core dump file show us the value of register s0 is wrong, but the
> value in memory is right.
>
> When task run on CPU0, the task loaded/speculative-loaded the value of
> address-0x3fd6d92490, the first version tlb mapping enter in CPU0's tlb.
> When the task switched from CPU0 to CPU1 without local_tlb_flush_all
> (because of asid), the task happened to write a value on address:
> 0x3fd6d92490 that caused do_page_fault -> wp_page_copy ->
> ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
> The flush_tlb_page would use mm_cpumask(mm) to determine which CPUs need
> tlb flush, but CPU0 cleared the CPU0's mm_cpumask in previous switch_mm.
> So we only flushed the CPU1's tlb entry, and setted second version mapping
> of the pte. When the task switch from CPU1 to CPU0 again, it still used a
> stale tlb entry on CPU0 which contained a wrong target physical address.
> When the task happened to read that value, the bug would be raised.
>
> Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/mm/context.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..843e86b63532 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -317,7 +317,6 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>          */
>         cpu = smp_processor_id();
>
> -       cpumask_clear_cpu(cpu, mm_cpumask(prev));
It should be:

-       cpumask_clear_cpu(cpu, mm_cpumask(prev));
+       if (static_branch_unlikely(&use_asid_allocator))
+               cpumask_clear_cpu(cpu, mm_cpumask(prev));
+

No bug on noasid part.

>         cpumask_set_cpu(cpu, mm_cpumask(next));
>
>         set_mm(next, cpu);
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
