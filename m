Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE258C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 19:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4BB208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 19:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+xTnKBX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I0jCZglB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4BB208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rQga9XCwmvrqeVlBkhqq3FYHo+ruNvk8YWNQCJQwQ0U=; b=C+xTnKBXC3fYmsiOKgJnPqVEG
	D8K8gb8JczLg5VbXj1syuw06H55X6jsR01sOGMPMsJpNIGOsWgGIrtZxzrivjgJqTvDJsrxzjJnmU
	R2d1GGGOuw1td/sXnlb6rIM8Nq1YJH0wZCm4XhDy2+Z2Vq41Uyaih2aR7xlDxvcs4E7K9a/WGkqWF
	lTKz1OnzmcXxSsKe0Kx9IJ4TEY9z69XuJKubLjbMskiU+8+sJ+YdBPxwwfO+9pEeQVOi6z+vSWUYj
	6Cy5eNmI+LKQY9xLF/CFqgJ/gT8TfABwi9hkzoVhWR5GIWcvEqHsFrZg8xC+VgnFqOJ6oNFPgjbED
	CpSWKVILw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gf8ZR-0006Ei-FZ; Thu, 03 Jan 2019 19:22:21 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf8ZP-0006E5-1H
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 19:22:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id y126so17116501pfb.4
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 11:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gnYAv4gYPfA1LPpJO4KQamIFmNwZMb0xNWGjS2UBCsQ=;
 b=I0jCZglB6Vfhlw9LXm34jLJBH4wWR59g7iGGnsxShef0VM2K6n6p3lkDpfKnf9kdO2
 kjEB9eVypLmTMTNyrXwbUek7pWW+sd4gQ73T1sPEsexlZVqf7Zun4UJsMU8UdMw/Vyz1
 kd/RPk05ew3VH2+0ldOn1XT4Eimd3p3osFYQUUgB22HZ+pJIXxTn2Xgu/wULQhjEa24j
 5cHP5nVaINubLdN3v8JDft9YB61sDv5ZSaA+gl/kI3aEcGqHjwvnL9nk3cG4sEq22s9L
 ml46saZvnCYhnbx+rOQDALlOGClwTOwEPRBdZ+O8wIb4qdTprhriU5M7E5VQyZ3FtOio
 fn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gnYAv4gYPfA1LPpJO4KQamIFmNwZMb0xNWGjS2UBCsQ=;
 b=mE01jV4CDdry3m8dvspMB1I5/0nTQveoNgzCweTZ08OKcIlZlKuYzBCvhntZRYEbNH
 JEYHjPmqT/5fbWOdkhwKEB4BAu28JI1a6PmQ9jTvz7KdWCOYeLTyadCJ6yivxZliaavP
 o6D2qUTS5ThPiD+/YrIlr0uDz8ELIo11GLFSg34/SaAjfupoFmjGG/iI6y6q7LrLjoz5
 u8q6AS64retwbTt8xGoZ5OJ/nzIEgZJguBzDwsSiEQ2bKRnH5BcABCNPc3sx+0+krajM
 dE+X288oE3WK7wVLpgAETC7ov/IRe7EAPykQLdfCw0b+dta4MkqTZi87EfA4pmc0AYNL
 rmjw==
X-Gm-Message-State: AJcUukfEf904gvSKhu0npJfD0pLOZNA4JEWmWv/rCKcV5gV7iaw6WcZv
 1qogR1UWLO+M/99ZBuYjr8hlYwukFPE=
X-Google-Smtp-Source: ALg8bN51UwBV7tffg86XbIgkelKQy0lc66O6u3TzyalbqLqvTUaDnC2mffIHaUno+zh1zpoL2Mvv0g==
X-Received: by 2002:a63:5f50:: with SMTP id t77mr18142945pgb.76.1546543337645; 
 Thu, 03 Jan 2019 11:22:17 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p2sm78063603pfb.28.2019.01.03.11.22.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jan 2019 11:22:16 -0800 (PST)
Date: Thu, 03 Jan 2019 11:22:16 -0800 (PST)
X-Google-Original-Date: Thu, 03 Jan 2019 11:08:51 PST (-0800)
Subject: Re: [PATCH v2] riscv: don't stop itself in smp_send_stop
In-Reply-To: <5c751657-298e-9eda-86bb-48e79e3b6305@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-14aba478-8865-4f14-bc07-84dd13eabf2f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_112219_166422_96F72586 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: schwab@suse.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Dec 2018 15:27:36 PST (-0800), atish.patra@wdc.com wrote:
> On 12/11/18 2:20 AM, Andreas Schwab wrote:
>> Add IPI_CPU_STOP message and use it in smp_send_stop to stop other cpus,
>> but not itself.  Mark cpu offline on reception of IPI_CPU_STOP.
>>
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>   arch/riscv/kernel/smp.c | 43 ++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 36 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
>> index 57b1383e5e..b813264416 100644
>> --- a/arch/riscv/kernel/smp.c
>> +++ b/arch/riscv/kernel/smp.c
>> @@ -23,6 +23,7 @@
>>   #include <linux/smp.h>
>>   #include <linux/sched.h>
>>   #include <linux/seq_file.h>
>> +#include <linux/delay.h>
>>
>>   #include <asm/sbi.h>
>>   #include <asm/tlbflush.h>
>> @@ -31,6 +32,7 @@
>>   enum ipi_message_type {
>>   	IPI_RESCHEDULE,
>>   	IPI_CALL_FUNC,
>> +	IPI_CPU_STOP,
>>   	IPI_MAX
>>   };
>>
>> @@ -66,6 +68,13 @@ int setup_profiling_timer(unsigned int multiplier)
>>   	return -EINVAL;
>>   }
>>
>> +static void ipi_stop(void)
>> +{
>> +	set_cpu_online (smp_processor_id(), false);
>> +	while (1)
>> +		wait_for_interrupt();
>> +}
>> +
>>   void riscv_software_interrupt(void)
>>   {
>>   	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
>> @@ -94,6 +103,11 @@ void riscv_software_interrupt(void)
>>   			generic_smp_call_function_interrupt();
>>   		}
>>
>> +		if (ops & (1 << IPI_CPU_STOP)) {
>> +			stats[IPI_CPU_STOP]++;
>> +			ipi_stop();
>> +		}
>> +
>>   		BUG_ON((ops >> IPI_MAX) != 0);
>>
>>   		/* Order data access and bit testing. */
>> @@ -121,6 +135,7 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
>>   static const char * const ipi_names[] = {
>>   	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
>>   	[IPI_CALL_FUNC]		= "Function call interrupts",
>> +	[IPI_CPU_STOP]		= "CPU stop interrupts",
>>   };
>>
>>   void show_ipi_stats(struct seq_file *p, int prec)
>> @@ -146,15 +161,29 @@ void arch_send_call_function_single_ipi(int cpu)
>>   	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
>>   }
>>
>> -static void ipi_stop(void *unused)
>> -{
>> -	while (1)
>> -		wait_for_interrupt();
>> -}
>> -
>>   void smp_send_stop(void)
>>   {
>> -	on_each_cpu(ipi_stop, NULL, 1);
>> +	unsigned long timeout;
>> +
>> +	if (num_online_cpus() > 1) {
>> +		cpumask_t mask;
>> +
>> +		cpumask_copy(&mask, cpu_online_mask);
>> +		cpumask_clear_cpu(smp_processor_id(), &mask);
>> +
>> +		if (system_state <= SYSTEM_RUNNING)
>> +			pr_crit("SMP: stopping secondary CPUs\n");
>> +		send_ipi_message(&mask, IPI_CPU_STOP);
>> +	}
>> +
>> +	/* Wait up to one second for other CPUs to stop */
>> +	timeout = USEC_PER_SEC;
>> +	while (num_online_cpus() > 1 && timeout--)
>> +		udelay(1);
>> +
>> +	if (num_online_cpus() > 1)
>> +		pr_warning("SMP: failed to stop secondary CPUs %*pbl\n",
>> +			   cpumask_pr_args(cpu_online_mask));
>>   }
>>
>>   void smp_send_reschedule(int cpu)
>>
>
> Checkpatch warnings.
> WARNING: space prohibited between function name and open parenthesis '('
> #40: FILE: arch/riscv/kernel/smp.c:73:
> +       set_cpu_online (smp_processor_id(), false);
>
> WARNING: Prefer pr_warn(... to pr_warning(...
> #100: FILE: arch/riscv/kernel/smp.c:185:
> +               pr_warning("SMP: failed to stop secondary CPUs %*pbl\n",
>
>
> Otherwise, Looks good to me.
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

I've fixed these up and added the patch to my fix queue, it should go up next 
week.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
