Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE6C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcZ3DnbhdkmTIgB2q1GstQKz4Q/OHCYDJjOzxyq50xk=; b=Ce34t3SJxOgMUH
	+LgfINKeiBHKQLIo9/ZP24/b5479NyyiX3TB2T1qZ60r9nIp/WkrGJ4Fe5bt5cWL4by7ZMTePsmbk
	8C/MqxfzsDalr4hG0oNkoy7OxSpTG1QUKa1gdXfXrgx7Y35XxLigl/rEIk48LLAr+SfT6vlMDyKV/
	WcPt+1XflfObpXevyr48rqxqc036lHCiZUdizDqKd/BAp8trtHDFLjz8YLbGM1WsTlTXOdHKdoLx3
	u+kUSh6NeBiNSySLiLO9BW1R7fmmAW9t8ikuuPdEO/ws4N09oXh7GyHrn009duXwX1AbB4iME78YG
	GreQtI5Jud+dxVKOf6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ouY-00000003XdA-18Hn;
	Wed, 22 May 2024 16:33:54 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ouU-00000003XbJ-2w3k
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:33:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09163FF80D;
	Wed, 22 May 2024 16:33:43 +0000 (UTC)
Message-ID: <327ef5d4-f47a-48ee-b1a0-fc2a9564e245@ghiti.fr>
Date: Wed, 22 May 2024 18:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: prevent pt_regs corruption for secondary idle
 threads
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
References: <20240424221927.900612-1-geomatsi@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240424221927.900612-1-geomatsi@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_093350_919799_B85990D9 
X-CRM114-Status: GOOD (  18.62  )
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

Hi Sergey,

On 25/04/2024 00:19, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> Top of the kernel thread stack should be reserved for pt_regs. However
> this is not the case for the idle threads of the secondary boot harts.
> Their stacks overlap with their pt_regs, so both may get corrupted.
>
> Similar issue has been fixed for the primary hart, see c7cdd96eca29


This revision does not exist but I found the commit under the revision 
c7cdd96eca28.


> ("riscv: prevent stack corruption by reserving task_pt_regs(p) early").
> However that fix was not propagated to the secondary harts. The problem
> has been noticed in some CPU hotplug tests with V enabled. The function
> smp_callin stores several registers on stack, corrupting top of pt_regs
> structure including status field. As a result, kernel attempted to save
> or restore inexistent V context.
>
> Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
> Fixes: 2875fe056156 ("RISC-V: Add cpu_ops and modify default booting method")
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>   arch/riscv/kernel/cpu_ops_sbi.c      | 2 +-
>   arch/riscv/kernel/cpu_ops_spinwait.c | 3 +--
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index 1cc7df740edd..e6fbaaf54956 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -72,7 +72,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>   	/* Make sure tidle is updated */
>   	smp_mb();
>   	bdata->task_ptr = tidle;
> -	bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
> +	bdata->stack_ptr = task_pt_regs(tidle);
>   	/* Make sure boot data is updated */
>   	smp_mb();
>   	hsm_data = __pa(bdata);
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index 613872b0a21a..24869eb88908 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -34,8 +34,7 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
>   
>   	/* Make sure tidle is updated */
>   	smp_mb();
> -	WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
> -		   task_stack_page(tidle) + THREAD_SIZE);
> +	WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid], task_pt_regs(tidle));
>   	WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
>   }
>   


With the revision fixed, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
