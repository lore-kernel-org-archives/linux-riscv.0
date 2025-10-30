Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F4ECCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0xplJbu2yTyUmDmv7ajbihM9ddHolhewmR1K1xSQJk=; b=0YSR7mdX9WH+sCIxvUNCyAYkN2
	le+pZbxXQbbiZvYwdU8qGKP+0op9/934kyYLzwzCrUQKUY9SfIMz14mO/y32EAn+PXwuOT5byoJl4
	Kiu/Y6sCGUdhvp4LGqyXKh0d+uXzCDcnmqf3w+2SiBpgNviGVhoJ5dsKgYQBf6B7uq+oGcuEtIooT
	u5G89K8r7OHKdERa7PN9jMEAZ4uqqyeMbMO8gFyo2p/wNtNPiDkohSXG72hbWumjNoiAHUH9kxV9i
	qTMt1mXKMd6NEXmeDJaYo62A+pjKo5E4jHIvh3+iSjkWi7mYZJc8JgyxqNmMaZCKxUjNc35jczdos
	+TJCC2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOJ6-00000003mfX-3mHM;
	Thu, 30 Oct 2025 08:46:56 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOJ3-00000003meI-46wp
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 08:46:55 +0000
Message-ID: <e9c2021a-fa7f-4b01-9b48-afe5fa73135f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761814007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ts8r14E983Oj7YJR45lgRteJfrOnqFoS1A/vTyH0UoY=;
	b=btc86mXT8yRgDvLIH42JPCXR2Rr3nleh9BvTKXgCEXn70QTw0Ku+Ixlyj+Cs7I3GbhVomY
	8htPfQqzMpamGyA7XQOi/EbQDnBw3pxmBDWQN0KZ6emQTsR/OaNJ97p1Biq3PfpzMd66uz
	hoWrQlgogjMrUtz5L82iYBNSPTf8keM=
Date: Thu, 30 Oct 2025 01:46:40 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org,
 luxu.kernel@bytedance.com, cleger@rivosinc.com, ajones@ventanamicro.com,
 apatel@ventanamicro.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org,
 bjorn@rivosinc.com, charlie@rivosinc.com, masahiroy@kernel.org,
 valentina.fernandezalanis@microchip.com, jassisinghbrar@gmail.com,
 conor.dooley@microchip.com
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <20251027133431.15321-4-cuiyunhui@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014654_447200_5655E736 
X-CRM114-Status: GOOD (  27.01  )
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

On 10/27/25 6:34 AM, Yunhui Cui wrote:
> NMI is more robust than IPI for stopping CPUs during crashes,
> especially with interrupts disabled. Add SBI_SSE_EVENT_LOCAL_CRASH_NMI
> eventid to implement NMI for stopping CPUs.
> 

Resending it again as my previous response was rejected due to 
gmail/html issue.

This should be used as the last resort instead of the preferred approach 
for below reasons.

1. Invoking SSE on this path may lead to some race conditions if 
interruption is enabled.
2. With AIA IPI will be faster than SSE if interrupt is enabled.

Can we do a hybrid approach where we use CRASH_NMI (or SOFTWARE_INJECTED 
event) only when IPI fails.
Looking at other architecture implementations, it already does something 
similar.

> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/include/asm/crash.h   |  1 +
>   arch/riscv/include/asm/sbi.h     |  1 +
>   arch/riscv/kernel/crash.c        | 31 +++++++++++++-
>   drivers/firmware/riscv/sse_nmi.c | 71 +++++++++++++++++++++++++++++++-
>   include/linux/sse_nmi.h          |  8 ++++
>   5 files changed, 109 insertions(+), 3 deletions(-)
>   create mode 100644 include/linux/sse_nmi.h
> 
> diff --git a/arch/riscv/include/asm/crash.h b/arch/riscv/include/asm/crash.h
> index b64df919277d4..5076f297cbc15 100644
> --- a/arch/riscv/include/asm/crash.h
> +++ b/arch/riscv/include/asm/crash.h
> @@ -5,6 +5,7 @@
>   
>   #ifdef CONFIG_KEXEC_CORE
>   void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
> +void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
>   #else
>   static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>   {
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 52d3fdf2d4cc1..65cce85237879 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -487,6 +487,7 @@ enum sbi_sse_attr_id {
>   #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
>   #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
>   #define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
> +#define SBI_SSE_EVENT_LOCAL_CRASH_NMI		0xffff0002
>   #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
>   
>   #define SBI_SSE_EVENT_PLATFORM		BIT(14)
> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
> index 12598bbc2df04..9f3f0becfdd95 100644
> --- a/arch/riscv/kernel/crash.c
> +++ b/arch/riscv/kernel/crash.c
> @@ -3,14 +3,16 @@
>   #include <linux/cpu.h>
>   #include <linux/delay.h>
>   #include <linux/kexec.h>
> +#include <linux/sse_nmi.h>
>   #include <linux/smp.h>
>   #include <linux/sched.h>
>   
> +#include <asm/crash.h>
>   #include <asm/cpu_ops.h>
>   
>   static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>   
> -inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
> +void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>   {
>   	crash_save_cpu(regs, cpu);
>   
> @@ -27,6 +29,11 @@ inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>   		wait_for_interrupt();
>   }
>   
> +inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
> +{
> +	cpu_crash_stop(cpu, regs);
> +}
> +
>   /*
>    * The number of CPUs online, not counting this CPU (which may not be
>    * fully online and so not counted in num_online_cpus()).
> @@ -38,6 +45,24 @@ static inline unsigned int num_other_online_cpus(void)
>   	return num_online_cpus() - this_cpu_online;
>   }
>   
> +#ifdef CONFIG_RISCV_SSE_NMI
> +static int send_nmi_stop_cpu(cpumask_t *mask)
> +{
> +	unsigned int cpu;
> +	int ret = 0;
> +
> +	for_each_cpu(cpu, mask)
> +		ret += carsh_nmi_stop_cpu(cpu);
> +
> +	return ret;
> +}
> +#else
> +static inline int send_nmi_stop_cpu(cpumask_t *mask)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>   void crash_smp_send_stop(void)
>   {
>   	static int cpus_stopped;
> @@ -66,7 +91,9 @@ void crash_smp_send_stop(void)
>   	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
>   
>   	pr_crit("SMP: stopping secondary CPUs\n");
> -	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
> +
> +	if (send_nmi_stop_cpu(&mask))
> +		send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
>   
>   	/* Wait up to one second for other CPUs to stop */
>   	timeout = USEC_PER_SEC;
> diff --git a/drivers/firmware/riscv/sse_nmi.c b/drivers/firmware/riscv/sse_nmi.c
> index 2c1eaea2bbabc..152d787075345 100644
> --- a/drivers/firmware/riscv/sse_nmi.c
> +++ b/drivers/firmware/riscv/sse_nmi.c
> @@ -4,13 +4,16 @@
>   
>   #include <linux/nmi.h>
>   #include <linux/riscv_sbi_sse.h>
> +#include <linux/sse_nmi.h>
>   #include <linux/sysctl.h>
>   
> +#include <asm/crash.h>
>   #include <asm/irq_regs.h>
>   #include <asm/sbi.h>
>   
>   int unknown_nmi_panic;
>   static struct sse_event *unknown_nmi_evt;
> +static struct sse_event *crash_nmi_evt;
>   static struct ctl_table_header *unknown_nmi_sysctl_header;
>   
>   static int __init setup_unknown_nmi_panic(char *str)
> @@ -32,6 +35,12 @@ const struct ctl_table unknown_nmi_table[] = {
>   	},
>   };
>   
> +static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
> +					  unsigned long arg1)
> +{
> +	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
> +}
> +
>   static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
>   {
>   	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
> @@ -73,9 +82,69 @@ static int unknown_nmi_init(void)
>   	return ret;
>   }
>   
> +#ifdef CONFIG_KEXEC_CORE
> +int carsh_nmi_stop_cpu(unsigned int cpu)
> +{
> +	unsigned int hart_id = cpuid_to_hartid_map(cpu);
> +	u32 evt = SBI_SSE_EVENT_LOCAL_CRASH_NMI;
> +	struct sbiret ret;
> +
> +	ret = sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
> +	if (ret.error) {
> +		pr_err("Failed to signal event %x, error %ld\n", evt, ret.error);
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	return 0;
> +}
> +
> +static int crash_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
> +{
> +	cpu_crash_stop(smp_processor_id(), regs);
> +
> +	return 0;
> +}
> +
> +static int crash_nmi_init(void)
> +{
> +	int ret;
> +
> +	crash_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_CRASH_NMI, 0,
> +				 crash_nmi_handler, NULL);
> +	if (IS_ERR(crash_nmi_evt))
> +		return PTR_ERR(crash_nmi_evt);
> +
> +	ret = sse_event_enable(crash_nmi_evt);
> +	if (ret) {
> +		sse_event_unregister(crash_nmi_evt);
> +		return ret;
> +	}
> +
> +	pr_info("Using SSE for crash NMI event delivery\n");
> +
> +	return 0;
> +}
> +#endif
> +
>   static int __init sse_nmi_init(void)
>   {
> -	return unknown_nmi_init();
> +	int ret;
> +
> +	ret = unknown_nmi_init();
> +	if (ret) {
> +		pr_err("Unknown_nmi_init failed with error %d\n", ret);
> +		return ret;
> +	}
> +
> +#ifdef CONFIG_KEXEC_CORE
> +	ret = crash_nmi_init();
> +	if (ret) {
> +		pr_err("Crash_nmi_init failed with error %d\n", ret);
> +		return ret;
> +	}
> +#endif
> +
> +	return 0;
>   }
>   
>   late_initcall(sse_nmi_init);
> diff --git a/include/linux/sse_nmi.h b/include/linux/sse_nmi.h
> new file mode 100644
> index 0000000000000..548a348ac0a46
> --- /dev/null
> +++ b/include/linux/sse_nmi.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_RISCV_SSE_NMI_H
> +#define __LINUX_RISCV_SSE_NMI_H
> +
> +int carsh_nmi_stop_cpu(unsigned int cpu);
> +
> +#endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
