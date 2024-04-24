Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D4DC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4E+bVcft4Fj1cFKnSHvCySFMcVASFRykmT+V7uwfWo=; b=hpNg33ks/KrKrh
	EnxNvvHiLymkuY1cWY3HPk19lKtU12DYZZW81UIuvDpzptTQVVjmks7ovXr4MI//IRkS4tj2xCQik
	hNGVggEGKL42mlfY8cSZ1fbGX2qgnU5YMW+uEnXGlbgPIUQFDmHzgrkzUwt19AN6GoV4AKpTybd0E
	Y0CI4yeUyxu2uFU/mhVe1bV+dgfncsH4iuu+soiekPoUyNPLq1oPGUneDyKzlHud9Hi1aHx+pas2D
	1UOoT/ZxeI+NjTH0I3FF5tQ+SrFpilul5SKZwSaOtqJWNZC+NmZ2+US4ND62tJjzajxrl1jHNdclZ
	nLQRXah7LE11qlv/2MqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjZA-000000060Oi-0TeM;
	Wed, 24 Apr 2024 20:50:08 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjZ7-000000060ND-143u
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:50:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E73F940004;
	Wed, 24 Apr 2024 20:50:00 +0000 (UTC)
Message-ID: <0187110f-e312-407e-85ec-8234ec029305@ghiti.fr>
Date: Wed, 24 Apr 2024 22:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] riscv: Flush the instruction cache during SMP
 bringup
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
 <20240327045035.368512-2-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240327045035.368512-2-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_135005_472850_3DC66174 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Samuel,

On 27/03/2024 05:49, Samuel Holland wrote:
> Instruction cache flush IPIs are sent only to CPUs in cpu_online_mask,
> so they will not target a CPU until it calls set_cpu_online() earlier in
> smp_callin(). As a result, if instruction memory is modified between the
> CPU coming out of reset and that point, then its instruction cache may
> contain stale data. Therefore, the instruction cache must be flushed
> after the set_cpu_online() synchronization point.
>
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v4)
>
> Changes in v4:
>   - New patch for v4
>
>   arch/riscv/kernel/smpboot.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index d41090fc3203..4b3c50da48ba 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -26,7 +26,7 @@
>   #include <linux/sched/task_stack.h>
>   #include <linux/sched/mm.h>
>   
> -#include <asm/cpufeature.h>
> +#include <asm/cacheflush.h>
>   #include <asm/cpu_ops.h>
>   #include <asm/irq.h>
>   #include <asm/mmu_context.h>
> @@ -234,9 +234,10 @@ asmlinkage __visible void smp_callin(void)
>   	riscv_user_isa_enable();
>   
>   	/*
> -	 * Remote TLB flushes are ignored while the CPU is offline, so emit
> -	 * a local TLB flush right now just in case.
> +	 * Remote cache and TLB flushes are ignored while the CPU is offline,
> +	 * so flush them both right now just in case.
>   	 */
> +	local_flush_icache_all();
>   	local_flush_tlb_all();
>   	complete(&cpu_running);
>   	/*


This should go into -fixes, would you mind sending this patch on its 
own? I think it is easier for Palmer.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
