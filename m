Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lRMd9Ce4A4IFZNjHS+SkreX0gS6kNcQ9ZU8Qii+W+g=; b=TEMmCJ/3Ds2Ej9l+oyCAxoxtw6
	AAxO6xaEzar8s/xuGPT3s/vL3st5x/kOWd6d3Tgi7wE5SOq1wh202hCAdvcExMpTGRR6Vr/DU6JnM
	xP2XF55lcLVW+FGHTADAxPu6sWbPnnis6irIFY465rYr85SelN5Q4G9/lhgYjh/bMrmCaaIXpaTMr
	hbKzpPrgn1WwamT1CnFjNzpN04Lom9EgynRAGhrHjxB3QPhg7dins35bdgVgTZ1dmee5yM7efn9Gp
	uC73pnhx2nSKLxgSkyepilLzitRkoOqAKc3kv0sWvXbRyaM8hv79njbsnrkPJBiJcHihBvSZQ4RcL
	BgL/8JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwkvF-009aHy-Rp; Mon, 13 Dec 2021 12:59:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwkvC-009aGu-Ab; Mon, 13 Dec 2021 12:59:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60C4CB80EC0;
 Mon, 13 Dec 2021 12:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD64C34601;
 Mon, 13 Dec 2021 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639400351;
 bh=qJhlNMK+UWhRz8sIHd9S207y7AHw4ZcsrcX5mlUBMLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qP0UhRn3T8klszkTd3zr5EgUei4SajRGBoBjGn536TIsb4qsBbNLWJWEEgj5g01tO
 ONnA+QbgrJFuRKkCmZqgsW9Qq71n4YY5JZ/Wi3nxOOLrAO5ud1Xah7fsF4Nx5bgGsH
 4tDFQVfdvVRrtmPKefEDrsnoqXd+LUpZCVnnzMImWeZMDEefSfpvrew7maBdq2b1d3
 RKZVMUVTXz+3M+IS7SNXvZ68sw2dyofHD6KouG0Q4WsMtuB+XywqEh5uSYwjIKpvC3
 Br8x9DDJoGODAe/r7/IhBIDJAoHdehvgIWIgbw7dxGrZ2RVLYv3ySYaqXxChyJj2TQ
 38Nvy6L7H1vBg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mwkv7-00Bnbl-4B; Mon, 13 Dec 2021 12:59:09 +0000
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 12:59:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, Greentime
 Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org, Nanyong Sun
 <sunnanyong@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg
 <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool
 <vitaly.wool@konsulko.com>
Subject: Re: [RFC 3/6] RISC-V: Use __cpu_up_stack/task_pointer only for
 spinwait method
In-Reply-To: <20211204002038.113653-4-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-4-atishp@atishpatra.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <48012a35c4f66340547ff50525792a29@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: atishp@atishpatra.org, linux-kernel@vger.kernel.org,
 atishp@rivosinc.com, alex@ghiti.fr, anup.patel@wdc.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com, xypron.glpk@gmx.de,
 mingo@kernel.org, jszhang@kernel.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org, sunnanyong@huawei.com,
 mick@ics.forth.gr, palmer@dabbelt.com, paul.walmsley@sifive.com,
 penberg@kernel.org, vincent.chen@sifive.com, vitaly.wool@konsulko.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_045914_707665_36A0BCDB 
X-CRM114-Status: GOOD (  22.93  )
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

On 2021-12-04 00:20, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> The __cpu_up_stack/task_pointer array is only used for spinwait method
> now. The per cpu array based lookup is also fragile for platforms with
> discontiguous/sparse hartids. The spinwait method is only used for
> M-mode Linux or older firmwares without SBI HSM extension. For general
> Linux systems, ordered booting method is preferred anyways to support
> cpu hotplug and kexec.
> 
> Make sure that __cpu_up_stack/task_pointer is only used for spinwait
> method. Take this opportunity to rename it to
> __cpu_spinwait_stack/task_pointer to emphasize the purpose as well.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpu_ops.h     |  2 --
>  arch/riscv/kernel/cpu_ops.c          | 16 ----------------
>  arch/riscv/kernel/cpu_ops_spinwait.c | 27 ++++++++++++++++++++++++++-
>  arch/riscv/kernel/head.S             |  4 ++--
>  arch/riscv/kernel/head.h             |  4 ++--
>  5 files changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpu_ops.h 
> b/arch/riscv/include/asm/cpu_ops.h
> index a8ec3c5c1bd2..134590f1b843 100644
> --- a/arch/riscv/include/asm/cpu_ops.h
> +++ b/arch/riscv/include/asm/cpu_ops.h
> @@ -40,7 +40,5 @@ struct cpu_operations {
> 
>  extern const struct cpu_operations *cpu_ops[NR_CPUS];
>  void __init cpu_set_ops(int cpu);
> -void cpu_update_secondary_bootdata(unsigned int cpuid,
> -				   struct task_struct *tidle);
> 
>  #endif /* ifndef __ASM_CPU_OPS_H */
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 3f5a38b03044..c1e30f403c3b 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -8,31 +8,15 @@
>  #include <linux/of.h>
>  #include <linux/string.h>
>  #include <linux/sched.h>
> -#include <linux/sched/task_stack.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> 
>  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> 
> -void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> -void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> -
>  extern const struct cpu_operations cpu_ops_sbi;
>  extern const struct cpu_operations cpu_ops_spinwait;
> 
> -void cpu_update_secondary_bootdata(unsigned int cpuid,
> -				   struct task_struct *tidle)
> -{
> -	int hartid = cpuid_to_hartid_map(cpuid);
> -
> -	/* Make sure tidle is updated */
> -	smp_mb();
> -	WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> -		   task_stack_page(tidle) + THREAD_SIZE);
> -	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> -}
> -
>  void __init cpu_set_ops(int cpuid)
>  {
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c
> b/arch/riscv/kernel/cpu_ops_spinwait.c
> index b2c957bb68c1..9f398eb94f7a 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -6,11 +6,36 @@
>  #include <linux/errno.h>
>  #include <linux/of.h>
>  #include <linux/string.h>
> +#include <linux/sched/task_stack.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> 
>  const struct cpu_operations cpu_ops_spinwait;
> +void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
> +void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> +
> +static void cpu_update_secondary_bootdata(unsigned int cpuid,
> +				   struct task_struct *tidle)
> +{
> +	int hartid = cpuid_to_hartid_map(cpuid);
> +
> +	/*
> +	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
> +	 * errors for __cpu_spinwait_stack/task_pointer. That is not always 
> possible
> +	 * for platforms with discontiguous hartid numbering scheme. That's 
> why
> +	 * spinwait booting is not the recommended approach for any platforms
> +	 * and will be removed in future.

How can you do that? Yes, spinning schemes are terrible.
However, once you started supporting them, you are stuck.

Best case, you can have an allow-list and only allow some
older platforms to use them. You can also make some features
dependent on non-spin schemes (kexec being one).

But dropping support isn't a valid option, I'm afraid.

Thanks,

          M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
