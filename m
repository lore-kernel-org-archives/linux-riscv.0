Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A948C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 03:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5268B20652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 03:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sYUzM5Or";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CYKnHFLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5268B20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pmj5Nspx3mv6mUl21PKxy85WphuZSV9ajy1iDojuQAI=; b=sYUzM5OrPa+CcJe11jsMtxJiv
	MU4qn+av7s9xLFEigOv5PVJaGRpOpzTX+r63mziKUVVD6KqoSfJkdbBGSpUcL5IV234R2DiSXwTAn
	I7yHgcHs9sqoRwUEQQ5Mne11s6vC0yr22o7f8Mx7jJEBEA8I42rG4Yyy0cRZYqKXkoCPImVOpawq+
	kS+DeIjPryR/Ra0FF69tUFCMqHJ8Fjr0LD0G2J0BKzz2MUR4dBd5o2H+7mzOwOpqACK41Vl2ckvSM
	bGRBi6ZET1SVlpmurb6UsSwgnkznWicC4Jg/ZMMXQeuORYOgFC8KShM8Nfkalh/qlt/9KgZVXKFi2
	vC0tQkxbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7B9j-0002E9-5w; Tue, 02 Oct 2018 03:15:27 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7B9g-0001kK-Dl
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 03:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538450125; x=1569986125;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=swXHSlz0rGED/u1x4HbN/mEnAFfRaa9aotws9bQZS5I=;
 b=CYKnHFLZ8YJhH/+IFpIZxaFXpTCvgP50tJfEW6XyVcVIuel1yUG0A9Aq
 cqBAOiDd+tAbWhDLFqifJxMdqTFWYp8fzRtB+bb2OsEHTvo3Ax+PTaUoY
 9AnaCvxWnLp7km2aBmDBS4h6bpbN1P+9EK0FdnWR7hNP614gtBtnGwhJq
 ke0qpiu1MHnDqC8PbqMekKfUdYZmF7SjnQh93kvKl3hwM4YDoEgcbicKp
 tCsVRb10iGl7ux+w+RSsTHDWsetQqWqrNWMITmxwCxPaLKjj0UWGXuN6Q
 ZSsObv+jSUAMeVPPbzcWK1NBZvyewdG349QWMCpNRpZXpC1j8vpD8xFeW Q==;
X-IronPort-AV: E=Sophos;i="5.54,329,1534780800"; d="scan'208";a="92665399"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Oct 2018 11:15:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 01 Oct 2018 20:00:53 -0700
Received: from us8y4bjc2.ad.shared (HELO [10.86.63.177]) ([10.86.63.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Oct 2018 20:15:10 -0700
Subject: Re: [PATCH v3] RISC-V: Show IPI stats
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20180929062605.12888-1-anup@brainfault.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7d40c900-cfb2-f3a0-fce9-0136814781fe@wdc.com>
Date: Mon, 1 Oct 2018 20:15:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180929062605.12888-1-anup@brainfault.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_201524_504751_88CB954C 
X-CRM114-Status: GOOD (  23.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002031508.vxMmls9B6CsJlgzoEfdV8GEjQkA1NSri4Hd88TJ8hE4@z>

On 9/28/18 11:26 PM, Anup Patel wrote:
> This patch provides arch_show_interrupts() implementation to
> show IPI stats via /proc/interrupts.
> 
> Now the contents of /proc/interrupts" will look like below:
>             CPU0       CPU1       CPU2       CPU3
>    8:         17          7          6         14  SiFive PLIC   8  virtio0
>   10:         10         10          9         11  SiFive PLIC  10  ttyS0
> IPI0:       170        673        251         79  Rescheduling interrupts
> IPI1:         1         12         27          1  Function call interrupts
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> 
> Changes since v2:
>   - Remove use of IPI_CALL_WAKEUP because it's being removed
> 
> Changes since v1:
>   - Add stub inline show_ipi_stats() function for !CONFIG_SMP
>   - Make ipi_names[] dynamically sized at compile time
>   - Minor beautification of ipi_names[] using tabs
> 
> ---
>   arch/riscv/include/asm/smp.h |  9 +++++++++
>   arch/riscv/kernel/irq.c      |  8 ++++++++
>   arch/riscv/kernel/smp.c      | 39 +++++++++++++++++++++++++++++-------
>   3 files changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index fce312ce3516..5278ae8f1346 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -25,8 +25,13 @@
>   extern unsigned long __cpuid_to_hardid_map[NR_CPUS];
>   #define cpuid_to_hardid_map(cpu)    __cpuid_to_hardid_map[cpu]
>   
> +struct seq_file;
> +
>   #ifdef CONFIG_SMP
>   
> +/* print IPI stats */
> +void show_ipi_stats(struct seq_file *p, int prec);
> +
>   /* SMP initialization hook for setup_arch */
>   void __init setup_smp(void);
>   
> @@ -47,6 +52,10 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
>   
>   #else
>   
> +static inline void show_ipi_stats(struct seq_file *p, int prec)
> +{
> +}
> +
>   static inline int riscv_hartid_to_cpuid(int hartid)
>   {
>   	return 0;
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index ca4593317e45..48e6b7db83a1 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -8,6 +8,8 @@
>   #include <linux/interrupt.h>
>   #include <linux/irqchip.h>
>   #include <linux/irqdomain.h>
> +#include <linux/seq_file.h>
> +#include <asm/smp.h>
>   
>   /*
>    * Possible interrupt causes:
> @@ -24,6 +26,12 @@
>    */
>   #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
>   
> +int arch_show_interrupts(struct seq_file *p, int prec)
> +{
> +	show_ipi_stats(p, prec);
> +	return 0;
> +}
> +
>   asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
>   {
>   	struct pt_regs *old_regs = set_irq_regs(regs);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 89d95866f562..686fa7a427ff 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -22,22 +22,24 @@
>   #include <linux/interrupt.h>
>   #include <linux/smp.h>
>   #include <linux/sched.h>
> +#include <linux/seq_file.h>
>   
>   #include <asm/sbi.h>
>   #include <asm/tlbflush.h>
>   #include <asm/cacheflush.h>
>   
> -/* A collection of single bit ipi messages.  */
> -static struct {
> -	unsigned long bits ____cacheline_aligned;
> -} ipi_data[NR_CPUS] __cacheline_aligned;
> -
>   enum ipi_message_type {
>   	IPI_RESCHEDULE,
>   	IPI_CALL_FUNC,
>   	IPI_MAX
>   };
>   
> +/* A collection of single bit ipi messages.  */
> +static struct {
> +	unsigned long stats[IPI_MAX] ____cacheline_aligned;
> +	unsigned long bits ____cacheline_aligned;
> +} ipi_data[NR_CPUS] __cacheline_aligned;
> +
>   int riscv_hartid_to_cpuid(int hartid)
>   {
>   	int i = -1;
> @@ -67,6 +69,7 @@ int setup_profiling_timer(unsigned int multiplier)
>   void riscv_software_interrupt(void)
>   {
>   	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
> +	unsigned long *stats = ipi_data[smp_processor_id()].stats;
>   
>   	/* Clear pending IPI */
>   	csr_clear(sip, SIE_SSIE);
> @@ -81,11 +84,15 @@ void riscv_software_interrupt(void)
>   		if (ops == 0)
>   			return;
>   
> -		if (ops & (1 << IPI_RESCHEDULE))
> +		if (ops & (1 << IPI_RESCHEDULE)) {
> +			stats[IPI_RESCHEDULE]++;
>   			scheduler_ipi();
> +		}
>   
> -		if (ops & (1 << IPI_CALL_FUNC))
> +		if (ops & (1 << IPI_CALL_FUNC)) {
> +			stats[IPI_CALL_FUNC]++;
>   			generic_smp_call_function_interrupt();
> +		}
>   
>   		BUG_ON((ops >> IPI_MAX) != 0);
>   
> @@ -111,6 +118,24 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
>   	sbi_send_ipi(cpumask_bits(&hartid_mask));
>   }
>   
> +static const char *ipi_names[] = {
> +	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
> +	[IPI_CALL_FUNC]		= "Function call interrupts",
> +};
> +
> +void show_ipi_stats(struct seq_file *p, int prec)
> +{
> +	unsigned int cpu, i;
> +
> +	for (i = 0; i < IPI_MAX; i++) {
> +		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> +			   prec >= 4 ? " " : "");
> +		for_each_online_cpu(cpu)
> +			seq_printf(p, "%10lu ", ipi_data[cpu].stats[i]);
> +		seq_printf(p, " %s\n", ipi_names[i]);
> +	}
> +}
> +
>   void arch_send_call_function_ipi_mask(struct cpumask *mask)
>   {
>   	send_ipi_message(mask, IPI_CALL_FUNC);
> 
some checkpatch errors.

patches/smp_cleanup/0014-RISC-V-Show-IPI-stats.patch
----------------------------------------------------
WARNING: Missing a blank line after declarations
#115: FILE: arch/riscv/kernel/smp.c:40:
+       unsigned long stats[IPI_MAX] ____cacheline_aligned;
+       unsigned long bits ____cacheline_aligned;

WARNING: usage of NR_CPUS is often wrong - consider using 
cpu_possible(), num_possible_cpus(), for_each_possible_cpu(), etc
#116: FILE: arch/riscv/kernel/smp.c:41:
+} ipi_data[NR_CPUS] __cacheline_aligned;

WARNING: static const char * array should probably be static const char 
* const
#151: FILE: arch/riscv/kernel/smp.c:121:
+static const char *ipi_names[] = {

total: 0 errors, 3 warnings, 120 lines checked

Let me know if they were ignored on purpose.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
