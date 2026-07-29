Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E7C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 22:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqjPrQ0junEZW46B2Flo5d7H14ujbcMrDHuHQZtE7gc=; b=AEFDeTj+vP0T+t
	HJt1aHmDN+LUhdys9XTWKtUK8roMScdAdA72ZcebmEUyGalpOZYPiYEteIivjIK/F00zvegkRkWir
	/32gt/zGeI07tsf0DEkUNocdKO67QMxsNVXUwcjeRMV3z7NZp54Bn6wct6ZrhPR0wt77VW4YuD+9d
	gY6hxQ+s5aNSuNOix2UvswHm/orq+fULqoUIqQnJNSMyyX4ks2yjbXZpzdBga5OTBdUF7h8mICEuB
	T5I5noeisjEZAX2jNN+FpxLnWbwHM8a2+1Gy5MCVOla2eY3ItC9tWD/44vHXWzRk16i6oi3GhWQ4g
	g4l19HV1b2uiW6G0jcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCXL-000000092o2-0x2w;
	Wed, 29 Jul 2026 22:14:03 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCXI-000000092nX-02d5
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 22:14:01 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-497d3e4460aso170582b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 15:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785363238; x=1785968038; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1D+HkhN0JGURssVguSrnqL8XOdmLvKJnfMkdT83LrY=;
        b=IBBjaPgJLRkx7l5gypxvIYofRv1k9049FatP+Miv2PQ2b/p9s4o6U3YX9zSE7lk9FH
         ePXZ3NqlQF0cCY6qUcYIab/5IE55ZUT0udNJOuU/LEO48dVLGwQDkfOdtjuWWHCbVEmI
         hO1vRf+dCw8ffdTxUAfPEIIkaq9xf5fwVfzZHLKaThFVK8ZOHIrcrAq/yO/iblqvfHy+
         OtatC6QsW4EGmZbkWju0/TwwEBWlLvQu+v4KHa66SGGb2omMLtnD3qKrKZx4wIDJgQZQ
         ab4GCWAxyKu8GBarJBe/DMOS5X8RVi6s6BoBzEzfk6lPCge1tFIRmtyjVrTHMsC9dYGA
         JGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785363238; x=1785968038;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1D+HkhN0JGURssVguSrnqL8XOdmLvKJnfMkdT83LrY=;
        b=Rphg3epZvtgTLbKDMhnqmqq9hqJGqJeBQrjwArEY+o6Rr+ivYHUV7qV9clE2uUa+By
         jhjNx63h1SHxbjFqjl8q9YX3ObT69il5RUFvzZXlqTtgCHiIelxCQkPAwkLeL3Vok26g
         ArkC2F1iStVW34F6EOizDvtd3U6rY+dG/9M/2iebvUeLXaIjl83MIAxNS31kr5tuZZyf
         EHlF63T4KJTsPrU3qZYxNs+urnLkyYqcexgik67Vv90flWO1ZCLRIVt4vtHB+baHt1JX
         ry8XL2/Q6wFUjfKmJtItaKL/9FuDOeyzRV/MVFoxKUANxTynvcjP5eMX1+bvNEaCf80x
         Iw5w==
X-Forwarded-Encrypted: i=1; AHgh+RoWJMAFjHHCidOMNj08iDKc5uvRSrsD5/ZTmYXLD8CvN91xT5edjNY/fZX+ygytaRrkyJMNFHsj2il/ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT/7oVVF/hVBDsooRTtXUXsv7pvUGB/um8xFn0F1lya9mYY/p5
	kfaff0hGgc+FmA1pHo+eXQWPoI/4sfVpGqvDLjunocqp+L/aN0DO5K34K8OxzAvvRxA=
X-Gm-Gg: AR+sD10WHwEQygYXW1DrMn5DcjfEOVJGWd/4B2Tmn6R0bFDqArNRWYbOq7dwC3Nb+we
	956UmUwHDwPitD2PR+HEwdbW5nF8OM8jQgkBEYT0hqXuYt0zEui/1/qIYGCUM4GiIVqnBPE/45S
	l9ShZO6iLfLXY79d7iZH9lRBwrITj0AtoAblIhwHHu7MulWOXATkSPLzlsr9KMXcvQo/SdmCVlz
	sOMMSL59WoqaVLoIaHKeOukB+qJe4gN7V7Gi2uTdpHgbAuHWdrN61xFI5dRFdNQNMXS0ZMU6u73
	jvOtjBQEnAzyQE3Za5CAwuQ+iF/U5HPA5odQl3yvDCaREDy9aQ8752iuhJWFqG2pgP2dAqeAcvM
	TkiSWLOr8kQL4nkaZEb687GqCsPLjly18aJgPREwDQRPFKvIgCUq0D6exGCrekKBNgfSU4H4Yvj
	cwDIv03QTnJ76nyPb/Vw5aML9Sg9VkrqSEKGee+iDoku9fDzqy5d1lyaSDIP05tR92ARa33KDab
	rrBkLO+PtIf
X-Received: by 2002:a05:6808:3010:b0:492:3ad9:15d9 with SMTP id 5614622812f47-4ad8864c94fmr78174b6e.6.1785363238099;
        Wed, 29 Jul 2026 15:13:58 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.109])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6f03403fsm2769409b6e.18.2026.07.29.15.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 15:13:57 -0700 (PDT)
Message-ID: <51f32966-86a2-456e-9e45-c9bf8add0676@sifive.com>
Date: Wed, 29 Jul 2026 17:13:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous
 for fw_dynamic platforms
To: Paul Sherman <shermanpauldylan@gmail.com>, palmer@dabbelt.com,
 pjw@kernel.org
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729083414.39339-1-shermanpauldylan@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260729083414.39339-1-shermanpauldylan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_151400_108156_7F9B8314 
X-CRM114-Status: GOOD (  39.22  )
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

Hi,

On 2026-07-29 3:34 AM, Paul Sherman wrote:
> On platforms where firmware (e.g. fw_dynamic) releases all harts to the
> same Linux entry point simultaneously, the hart selected by OpenSBI as
> Domain0 Boot HART is already in SBI_HSM_STATE_STARTED when Linux later
> attempts to bring it online as a secondary CPU via SBI HART_START.
> OpenSBI correctly returns SBI_ERR_ALREADY_STARTED, but Linux has no
> recovery path: with CONFIG_RISCV_BOOT_SPINWAIT=n, there is no secondary
> wait path in _start_kernel for harts that entered Linux directly from
> firmware, and sbi_cpu_start() has no handler for SBI_ERR_ALREADY_STARTED.

There is no need to handle SBI_ERR_ALREADY_STARTED because the contract for the
"ordered booting" entry method (see
https://kernel.org/doc/html/latest/arch/riscv/boot.html#kernel-entry) requires
that only one hart is in the STARTED state when the kernel begins executing.

It sounds like your firmware implements something closer to the
RISCV_BOOT_SPINWAIT entry method, so if you disable CONFIG_RISCV_BOOT_SPINWAIT,
it is unsurprising that there would be problems.

Now, the kernel assumes that if the SBI HSM extension is present, the firmware
implements the "ordered booting" entry method. This seems like a reasonable
assumption. Why doesn't your firmware do that? Can you fix your firmware?

Regards,
Samuel

> This causes one CPU to be permanently dropped per boot. The missing CPU
> is always the OpenSBI Domain0 Boot HART, which varies between boots on
> Sophgo SG2042 (hart 1, 2, or 3), explaining the apparent 'moving victim'.
> 
> Fix with three cooperating changes:
> 
> 1. Initialize boot_cpu_hartid to INVALID_HARTID instead of relying on
>    BSS zero-initialization. Without this, boot_cpu_hartid aliases with
>    hart 0, causing hart 0 to always appear to win the boot CPU race
>    regardless of which hart actually stored its hartid first.
> 
> 2. Add a non-SPINWAIT secondary wait path in _start_kernel. When
>    firmware releases multiple harts to the same entry point, non-primary
>    harts divert into the existing spinwait rendezvous arrays (previously
>    used only by CONFIG_RISCV_BOOT_SPINWAIT) and wait for cpu_start() to
>    provide boot data before proceeding to secondary startup.
> 
> 3. Handle SBI_ERR_ALREADY_STARTED (-EALREADY) in sbi_cpu_start(). When
>    HART_START returns -EALREADY, the hart is already executing in Linux
>    and spinning in .Lwait_for_cpu_up_sbi. Write the spinwait rendezvous
>    arrays to release it into secondary startup, matching the approach
>    used by cpu_ops_spinwait.c.
> 
> The arrays __cpu_spinwait_stack_pointer and __cpu_spinwait_task_pointer
> are defined unconditionally in cpu_ops_spinwait.c but their extern
> declarations in head.h were guarded by CONFIG_RISCV_BOOT_SPINWAIT.
> Move the declarations outside the guard since the arrays are always
> present and now used by both boot paths.
> 
> Note: The NR_CPUS bound check mirrors the identical pattern in
> cpu_ops_spinwait.c:32 which guards the same arrays against out-of-range
> hartids on platforms with discontiguous hart numbering.
> 
> Link: https://lore.kernel.org/linux-riscv/20260727221508.5179-1-shermanpauldylan@gmail.com/
> Tested-on: Milk-V Pioneer (Sophgo SG2042, 64-hart RISC-V, 4-NUMA nodes,
>            128GB DDR4, OpenSBI v1.5, Linux v7.2-rc5)
> Result: boot_cpu_hartid correctly reflects Domain0 Boot HART, all 64
>         CPUs online in 2.7 seconds (was 63 CPUs, boot always on hart 0)
> Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
> ---
>  arch/riscv/kernel/cpu_ops_sbi.c | 41 ++++++++++++++++++++++++++++++++-
>  arch/riscv/kernel/head.S        | 25 ++++++++++++++++++++
>  arch/riscv/kernel/head.h        |  2 --
>  arch/riscv/kernel/setup.c       |  9 +++++++-
>  4 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index ee6e4b5cc39e9..3268fda5be35f 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -12,6 +12,7 @@
>  #include <asm/cpu_ops_sbi.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> +#include "head.h"
>  
>  extern char secondary_start_sbi[];
>  const struct cpu_operations cpu_ops_sbi;
> @@ -23,6 +24,18 @@ const struct cpu_operations cpu_ops_sbi;
>   */
>  static struct sbi_hart_boot_data boot_data[NR_CPUS];
>  
> +#ifndef CONFIG_RISCV_BOOT_SPINWAIT
> +/*
> + * Secondary hart rendezvous arrays, shared with head.S.
> + * These arrays are named for historical reasons after the spinwait
> + * boot protocol, but serve a generic purpose: holding per-hart boot
> + * data until a secondary hart is ready to proceed. Defined here when
> + * CONFIG_RISCV_BOOT_SPINWAIT=n; otherwise defined in cpu_ops_spinwait.c.
> + */
> +void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
> +void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> +#endif
> +
>  static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
>  			      unsigned long priv)
>  {
> @@ -62,6 +75,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>  	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
>  	unsigned long hartid = cpuid_to_hartid_map(cpuid);
>  	unsigned long hsm_data;
> +	int ret;
>  	struct sbi_hart_boot_data *bdata = &boot_data[cpuid];
>  
>  	/* Make sure tidle is updated */
> @@ -71,7 +85,32 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>  	/* Make sure boot data is updated */
>  	smp_mb();
>  	hsm_data = __pa(bdata);
> -	return sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
> +
> +	ret = sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
> +
> +	/*
> +	 * The firmware boot hart enters Linux directly from the bootloader
> +	 * and is already in SBI_HSM_STATE_STARTED when Linux attempts to
> +	 * bring it online as a secondary CPU. HART_START correctly returns
> +	 * SBI_ERR_ALREADY_STARTED in this case. The hart is spinning in
> +	 * .Lwait_for_cpu_up_sbi waiting for boot data - write the spinwait
> +	 * rendezvous arrays to release it into secondary startup.
> +	 *
> +	 * Guard against invalid or out-of-range hartids, matching the
> +	 * same constraint enforced in cpu_ops_spinwait.c.
> +	 */
> +	if (ret == -EALREADY) {
> +		if (hartid != INVALID_HARTID &&
> +		    hartid < (unsigned long)NR_CPUS) { /* array bound */
> +			/* Ensure bdata writes visible before spinwait arrays */
> +			smp_wmb();
> +			WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
> +				task_pt_regs(tidle));
> +			WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
> +		}
> +		ret = 0;
> +	}
> +	return ret;
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f6a8ca49e6277..da48f5efd928b 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -281,6 +281,31 @@ SYM_CODE_START(_start_kernel)
>  	la a2, boot_cpu_hartid
>  	REG_S a0, (a2)
>  
> +#ifndef CONFIG_RISCV_BOOT_SPINWAIT
> +	/*
> +	 * On platforms where firmware releases all harts to the same
> +	 * entry point (e.g. fw_dynamic), non-primary harts must divert
> +	 * here before MMU setup. Wait in the spinwait rendezvous arrays
> +	 * until cpu_start() provides boot data. a0 = hartid.
> +	 */
> +	REG_L a3, (a2)
> +	beq a0, a3, .Lprimary_hart
> +	slli a3, a0, LGREG
> +	la a1, __cpu_spinwait_stack_pointer
> +	la a2, __cpu_spinwait_task_pointer
> +	add a1, a3, a1
> +	add a2, a3, a2
> +.Lwait_for_cpu_up_sbi:
> +	fence r, r
> +	REG_L sp, (a1)
> +	REG_L tp, (a2)
> +	beqz sp, .Lwait_for_cpu_up_sbi
> +	beqz tp, .Lwait_for_cpu_up_sbi
> +	fence
> +	tail .Lsecondary_start_common
> +.Lprimary_hart:
> +#endif /* !CONFIG_RISCV_BOOT_SPINWAIT */
> +
>  	/* Initialize page tables and relocate to virtual addresses */
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
> diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
> index 05a04bef442b1..1b34f8e655581 100644
> --- a/arch/riscv/kernel/head.h
> +++ b/arch/riscv/kernel/head.h
> @@ -12,9 +12,7 @@ extern atomic_t hart_lottery;
>  
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa);
>  
> -#ifdef CONFIG_RISCV_BOOT_SPINWAIT
>  extern void *__cpu_spinwait_stack_pointer[];
>  extern void *__cpu_spinwait_task_pointer[];
> -#endif
>  
>  #endif /* __ASM_HEAD_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 52d1d2b8f338b..d2eecb7ad4965 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -47,7 +47,14 @@
>   * BSS.
>   */
>  atomic_t hart_lottery __section(".sdata");
> -unsigned long boot_cpu_hartid;
> +/*
> + * Initialize to INVALID_HARTID so that the first hart to store its
> + * hartid in head.S is unambiguously the boot CPU. Without this,
> + * boot_cpu_hartid starts as 0 (BSS), which aliases with hart 0 and
> + * causes hart 0 to always appear to win the boot CPU race regardless
> + * of which hart actually wrote first.
> + */
> +unsigned long boot_cpu_hartid = INVALID_HARTID;
>  EXPORT_SYMBOL_GPL(boot_cpu_hartid);
>  
>  /*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
