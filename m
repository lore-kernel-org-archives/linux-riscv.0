Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16187C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mhls4GGkqzzGzCFCK5aHQ9xraMfsEZKjVs9+1emqXOs=; b=AZVDittven9Hn9
	NUE0ERn59c2zk689GXjA9ZTv8tiOli5QD68OV3goKYw2FRY6vjeok6p1kxSSlNslIoGt08W5m3IaI
	X2MbQIEzgRQItSOgqyv28GbQHC85Xv4yRkG60xPwGxAJyqGEXv2JqdjtiDZoUVMg0q20d/uidOkul
	LMPPGHWB7dUaTc5Ne9oNg4CZChUTFN4mA1VnIXvQLoy1uMVory8wixxVT3z2iJpg26W7uPgwpcG20
	w/mjjrJc0nZuoDTUqfIbHrQilTfOLmtzF3/yfK+0GKqsjckztCccoEwzqp7SolOEdXvdCMcO+nZ7t
	MH63caipHmyoKQSsCy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4W7-00000004fsG-2QuI;
	Sat, 20 Jul 2024 07:28:31 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4Uz-00000004fVs-0PFg
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 07:27:23 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WQyfT5Cv8z1JCmb;
	Sat, 20 Jul 2024 15:22:09 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 42F49180104;
	Sat, 20 Jul 2024 15:26:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 15:26:49 +0800
Message-ID: <333494b6-b128-3804-b8f7-03f61dbca9d7@huawei.com>
Date: Sat, 20 Jul 2024 15:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] RISC-V: Implement kgdb_roundup_cpus() to enable IPI KGDB
 Roundup
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<samuel.holland@sifive.com>, <conor.dooley@microchip.com>,
	<takakura@valinux.co.jp>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20240719081210.1457512-1-ruanjinjie@huawei.com>
 <20240719-8841a9a99566e15c9bd1ff3d@orel>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240719-8841a9a99566e15c9bd1ff3d@orel>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_002721_522596_0FB961F2 
X-CRM114-Status: GOOD (  23.60  )
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



On 2024/7/19 23:14, Andrew Jones wrote:
> On Fri, Jul 19, 2024 at 04:12:10PM GMT, Jinjie Ruan wrote:
>> Until now, the generic weak kgdb_roundup_cpus() has been used for kgdb on
>> RISCV. A custom one allows to debug CPUs that are stuck with interrupts
>> disabled.
> 
> This confuses me since we're using an IPI for the roundup. How does that
> work on CPUs stuck with interrupts disabled? I think this text comes
> from the commit message for the arm64 patch, but arm64 does the roundup
> with a pseudo-NMI.

Sorry, you are right, this commit message is indeed from arm64, and it
will be more useful with IPI as NMI support, where it will work on CPUs
stuck with interrupts disabled.

> 
>> And using an IPI is better than the generic one since it avoids
>> the potential situation described in the generic kgdb_call_nmi_hook().
> 
> This is true.
> 
>>
>> After this patch, the kgdb test show that:
>> 	# echo g > /proc/sysrq-trigger
>> 	[2]kdb> btc
>> 	btc: cpu status: Currently on cpu 2
>> 	Available cpus: 0-1(-), 2, 3(-)
>> 	Stack traceback for pid 0
>> 	0xffffffff81c13a40        0        0  1    0   -  0xffffffff81c14510  swapper/0
>> 	CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-g3120273055b6-dirty #51
>> 	Hardware name: riscv-virtio,qemu (DT)
>> 	Call Trace:
>> 	[<ffffffff80006c48>] dump_backtrace+0x28/0x30
>> 	[<ffffffff80fceb38>] show_stack+0x38/0x44
>> 	[<ffffffff80fe6a04>] dump_stack_lvl+0x58/0x7a
>> 	[<ffffffff80fe6a3e>] dump_stack+0x18/0x20
>> 	[<ffffffff801143fa>] kgdb_cpu_enter+0x682/0x6b2
>> 	[<ffffffff801144ca>] kgdb_nmicallback+0xa0/0xac
>> 	[<ffffffff8000a392>] handle_IPI+0x9c/0x120
>> 	[<ffffffff800a2baa>] handle_percpu_devid_irq+0xa4/0x1e4
>> 	[<ffffffff8009cca8>] generic_handle_domain_irq+0x28/0x36
>> 	[<ffffffff800a9e5c>] ipi_mux_process+0xe8/0x110
>> 	[<ffffffff806e1e30>] imsic_handle_irq+0xf8/0x13a
>> 	[<ffffffff8009cca8>] generic_handle_domain_irq+0x28/0x36
>> 	[<ffffffff806dff12>] riscv_intc_aia_irq+0x2e/0x40
>> 	[<ffffffff80fe6ab0>] handle_riscv_irq+0x54/0x86
>> 	[<ffffffff80ff2e4a>] call_on_irq_stack+0x32/0x40
>>
>> Rebased on Ryo Takakura's "RISC-V: Enable IPI CPU Backtrace" patch.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/riscv/kernel/smp.c | 27 +++++++++++++++++++++++++--
>>  1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
>> index 9b047899791c..c180a647a30e 100644
>> --- a/arch/riscv/kernel/smp.c
>> +++ b/arch/riscv/kernel/smp.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/module.h>
>>  #include <linux/kexec.h>
>> +#include <linux/kgdb.h>
>>  #include <linux/percpu.h>
>>  #include <linux/profile.h>
>>  #include <linux/smp.h>
>> @@ -35,6 +36,7 @@ enum ipi_message_type {
>>  	IPI_IRQ_WORK,
>>  	IPI_TIMER,
>>  	IPI_CPU_BACKTRACE,
>> +	IPI_KGDB_ROUNDUP,
>>  	IPI_MAX
>>  };
>>  
>> @@ -115,6 +117,7 @@ void arch_irq_work_raise(void)
>>  
>>  static irqreturn_t handle_IPI(int irq, void *data)
>>  {
>> +	unsigned int cpu = smp_processor_id();
>>  	int ipi = irq - ipi_virq_base;
>>  
>>  	switch (ipi) {
>> @@ -128,7 +131,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
>>  		ipi_stop();
>>  		break;
>>  	case IPI_CPU_CRASH_STOP:
>> -		ipi_cpu_crash_stop(smp_processor_id(), get_irq_regs());
>> +		ipi_cpu_crash_stop(cpu, get_irq_regs());
>>  		break;
>>  	case IPI_IRQ_WORK:
>>  		irq_work_run();
>> @@ -141,8 +144,11 @@ static irqreturn_t handle_IPI(int irq, void *data)
>>  	case IPI_CPU_BACKTRACE:
>>  		nmi_cpu_backtrace(get_irq_regs());
>>  		break;
>> +	case IPI_KGDB_ROUNDUP:
>> +		kgdb_nmicallback(cpu, get_irq_regs());
>> +		break;
>>  	default:
>> -		pr_warn("CPU%d: unhandled IPI%d\n", smp_processor_id(), ipi);
>> +		pr_warn("CPU%d: unhandled IPI%d\n", cpu, ipi);
>>  		break;
>>  	}
>>  
>> @@ -209,6 +215,7 @@ static const char * const ipi_names[] = {
>>  	[IPI_IRQ_WORK]		= "IRQ work interrupts",
>>  	[IPI_TIMER]		= "Timer broadcast interrupts",
>>  	[IPI_CPU_BACKTRACE]     = "CPU backtrace interrupts",
>> +	[IPI_KGDB_ROUNDUP]	= "KGDB roundup interrupts",
>>  };
>>  
>>  void show_ipi_stats(struct seq_file *p, int prec)
>> @@ -339,3 +346,19 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
>>  {
>>  	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
>>  }
>> +
>> +#ifdef CONFIG_KGDB
>> +void kgdb_roundup_cpus(void)
>> +{
>> +	int this_cpu = raw_smp_processor_id();
>> +	int cpu;
>> +
>> +	for_each_online_cpu(cpu) {
>> +		/* No need to roundup ourselves */
>> +		if (cpu == this_cpu)
>> +			continue;
>> +
>> +		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
>> +	}
>> +}
>> +#endif
>> -- 
>> 2.34.1
>>
> 
> Other than the commit message, the patch looks good to me, so
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> but I guess we should extend this and the CPU backtrace support to use
> NMIs when we have support for them.

Yes, arm64 has done what you said, now both CPU Backtrace and KGDB
Roundup on arm64 have swiched to NMI smoothly.

> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
