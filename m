Return-Path: <SRS0=TUPX=OW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CDFC65BAE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4532080F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRoVtRY0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T8fF+sND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F4532080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AqwtNf1kQx4mlZDv6JaDk2gRtoM7mSBY1nWu759d0IU=; b=aRoVtRY0nGY7LUaDHenpm7+4a
	80y4wxl6eSoJ+ZaZponi0Nm+fGl/78n/D8IEYPjAdQKR6ifmVGDFp+OoQ5ZAboUnLESIszkyRh06y
	ezPSsV05FqAVWF0jXoW470XsACPidhqlekvXkeGuYrmfM0P7UH8bvPKZ6na/OUUO7dSXbEdEEcmLZ
	2JVoBA+yc+Axm5kK2ENA+9t1CDLpJUgqxUHJ7AVO3aqagbA9Vt9dgHLZlz1b6cNJLualQ5Feg1jNj
	46yweZnMMkio9Fb/Gzw2NZ/FVUBTIE/8QkjzEjWRK8kGJsJtofZ7QL3lHgR0xsil7HvTAZ9P4MTzn
	LvEm91sQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXaOU-0000NS-V7; Thu, 13 Dec 2018 23:27:50 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXaOS-0000Mv-1R
 for linux-riscv@lists.infradead.org; Thu, 13 Dec 2018 23:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544743668; x=1576279668;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=20y/H3o8pTUm2JxYdVrZde40/XNAuEA40InwAzBSdiA=;
 b=T8fF+sNDi+CwpFFTa4yjypNSEWbNu2IBGnFreLfg0L4uuAq3vdgUQYml
 7zX+CiNprF8+a4H8OEkz2cKR0s6GEyfAXpawA6JBZnUNYrZ9O9Ok4k0Rr
 8OE5/46JDJFim2DbAsbqAfLMWqAhXSEvtSJRtkvn4Dr2eNILdDLdPZLIh
 FeG6/1j1X/YE4hLwgFTEtpG5VdObhlx1sunjqM1D2b2A56kqD+qc4HUu8
 KXv4SvhioUaMCIJog3qEebmHCl43SvwTs7SkTVCV7M91u5ZY4EblMjHEZ
 Mti/I0y3AwPIw4o3DEJ8mHD3iL0gXEvuOj1B8J+oDpMscx0kUJGD3Cb/r Q==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="97772484"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 07:27:37 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Dec 2018 15:09:11 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.79.36])
 ([10.111.79.36])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2018 15:27:37 -0800
Subject: Re: [PATCH v2] riscv: don't stop itself in smp_send_stop
To: Andreas Schwab <schwab@suse.de>
References: <mvmbm67etfg.fsf@suse.de>
 <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com> <mvmsgz5bqd7.fsf@suse.de>
 <mvmd0q89xfr.fsf_-_@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <5c751657-298e-9eda-86bb-48e79e3b6305@wdc.com>
Date: Thu, 13 Dec 2018 15:27:36 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <mvmd0q89xfr.fsf_-_@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_152748_190116_95461D82 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/11/18 2:20 AM, Andreas Schwab wrote:
> Add IPI_CPU_STOP message and use it in smp_send_stop to stop other cpus,
> but not itself.  Mark cpu offline on reception of IPI_CPU_STOP.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/kernel/smp.c | 43 ++++++++++++++++++++++++++++++++++-------
>   1 file changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 57b1383e5e..b813264416 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,6 +23,7 @@
>   #include <linux/smp.h>
>   #include <linux/sched.h>
>   #include <linux/seq_file.h>
> +#include <linux/delay.h>
>   
>   #include <asm/sbi.h>
>   #include <asm/tlbflush.h>
> @@ -31,6 +32,7 @@
>   enum ipi_message_type {
>   	IPI_RESCHEDULE,
>   	IPI_CALL_FUNC,
> +	IPI_CPU_STOP,
>   	IPI_MAX
>   };
>   
> @@ -66,6 +68,13 @@ int setup_profiling_timer(unsigned int multiplier)
>   	return -EINVAL;
>   }
>   
> +static void ipi_stop(void)
> +{
> +	set_cpu_online (smp_processor_id(), false);
> +	while (1)
> +		wait_for_interrupt();
> +}
> +
>   void riscv_software_interrupt(void)
>   {
>   	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
> @@ -94,6 +103,11 @@ void riscv_software_interrupt(void)
>   			generic_smp_call_function_interrupt();
>   		}
>   
> +		if (ops & (1 << IPI_CPU_STOP)) {
> +			stats[IPI_CPU_STOP]++;
> +			ipi_stop();
> +		}
> +
>   		BUG_ON((ops >> IPI_MAX) != 0);
>   
>   		/* Order data access and bit testing. */
> @@ -121,6 +135,7 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
>   static const char * const ipi_names[] = {
>   	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
>   	[IPI_CALL_FUNC]		= "Function call interrupts",
> +	[IPI_CPU_STOP]		= "CPU stop interrupts",
>   };
>   
>   void show_ipi_stats(struct seq_file *p, int prec)
> @@ -146,15 +161,29 @@ void arch_send_call_function_single_ipi(int cpu)
>   	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
>   }
>   
> -static void ipi_stop(void *unused)
> -{
> -	while (1)
> -		wait_for_interrupt();
> -}
> -
>   void smp_send_stop(void)
>   {
> -	on_each_cpu(ipi_stop, NULL, 1);
> +	unsigned long timeout;
> +
> +	if (num_online_cpus() > 1) {
> +		cpumask_t mask;
> +
> +		cpumask_copy(&mask, cpu_online_mask);
> +		cpumask_clear_cpu(smp_processor_id(), &mask);
> +
> +		if (system_state <= SYSTEM_RUNNING)
> +			pr_crit("SMP: stopping secondary CPUs\n");
> +		send_ipi_message(&mask, IPI_CPU_STOP);
> +	}
> +
> +	/* Wait up to one second for other CPUs to stop */
> +	timeout = USEC_PER_SEC;
> +	while (num_online_cpus() > 1 && timeout--)
> +		udelay(1);
> +
> +	if (num_online_cpus() > 1)
> +		pr_warning("SMP: failed to stop secondary CPUs %*pbl\n",
> +			   cpumask_pr_args(cpu_online_mask));
>   }
>   
>   void smp_send_reschedule(int cpu)
> 

Checkpatch warnings.
WARNING: space prohibited between function name and open parenthesis '('
#40: FILE: arch/riscv/kernel/smp.c:73:
+       set_cpu_online (smp_processor_id(), false);

WARNING: Prefer pr_warn(... to pr_warning(...
#100: FILE: arch/riscv/kernel/smp.c:185:
+               pr_warning("SMP: failed to stop secondary CPUs %*pbl\n",


Otherwise, Looks good to me.
Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
