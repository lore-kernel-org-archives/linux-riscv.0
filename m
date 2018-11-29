Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CCDC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 18:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CF42082F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 18:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C61OBBv3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OJfvc9Tj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CF42082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DK6jnirF0q1Fp6QaorfCMPT9jHFJBWPN78BdpynevcY=; b=C61OBBv35QOHRUJ76uvKYfgwB
	wppkHBCfozzu0wLG4ujfVVf0B3Yz+jwv4N15OMcrCDrTN2MWmfe1Np5kefNUf7Y7QCfXSLt5KBCpX
	JS3VZ5wEMbN2/tuDmKaeQI4TtOCfHf/C8xKRhbl68bcO0nJXfchwjZuV219OzeEwUUrLzTwvaU/CO
	Ie0+Fuwv1OiqG6v8b/yeNm3QPE+Revfl7gwt5RrdRKAHEgrwHfO7zeFXEIbhyOrBTxTY99GExzXuU
	xkDMaHIdiNDhwcArM6/VWxx7/i/CwwFDgi2gcr0FhK7QG1xW3RDCefBBfEC0pTQybTefDWWE+j2MN
	LEfftXbJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSRQl-0002ZH-GB; Thu, 29 Nov 2018 18:52:55 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSRQj-0002Ym-7a
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 18:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543517574; x=1575053574;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=yUCjpAZmJ2IbxUgy8USOfGzbafXejlGy+ExYqbfKscc=;
 b=OJfvc9TjIBe08477yNkadUNgrTLSJVc0IMJVsWYQuIoLDvbPsiHUHJ0g
 2Ehw48Bqq6dKfS8pslQldTqkFqNKQJv+2fjmbz3VZ7Q/qd6fDFWuc6PjI
 uTdMz8M2tz/nR2lYtmNTC3CGc1x2ZKlOcOmcNeO9srcuk4thafBgyDezG
 8cMv8EfRRE5AD5IWgOH/Mb+8NmBeXLLkKiiJ668abUo1iYx95yadtU7e+
 oy1ODHRgwSFNd3T2pKCtAsWFuIuTsJAiqvZywhzkfw6e8t6yd8BLniBhe
 0lCcl1sZu9rsfmYBYSnlRYXEI2RbiI//0dx6v99hi9MJnQTBORmS4alH5 g==;
X-IronPort-AV: E=Sophos;i="5.56,295,1539619200"; d="scan'208";a="100259646"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2018 02:52:41 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 29 Nov 2018 10:35:06 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.72.98])
 ([10.111.72.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Nov 2018 10:52:41 -0800
Subject: Re: [PATCH] riscv: don't stop itself in smp_send_stop
To: Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <mvmbm67etfg.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com>
Date: Thu, 29 Nov 2018 10:52:40 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mvmbm67etfg.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_105253_287479_5F2CC444 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/29/18 8:32 AM, Andreas Schwab wrote:
> Only run ipi_stop on other cpus, not itself.  Don't wait for ipi_stop to
> return, since it never does.  Also, mark each cpu offline.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/kernel/smp.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 57b1383e5e..5c6bb5fe5a 100644
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
> @@ -148,13 +149,27 @@ void arch_send_call_function_single_ipi(int cpu)
>   
>   static void ipi_stop(void *unused)
>   {
> +	set_cpu_online (smp_processor_id(), false);
>   	while (1)
>   		wait_for_interrupt();
>   }
>   
>   void smp_send_stop(void)
>   {
> -	on_each_cpu(ipi_stop, NULL, 1);
> +	unsigned long timeout;
> +	struct cpumask mask;
> +

No need to do mask copy this, if num_online_cpus() == 1.

> +	cpumask_copy (&mask, cpu_online_mask);
> +	cpumask_clear_cpu (smp_processor_id (), &mask);
> +	on_each_cpu_mask(&mask, ipi_stop, NULL, 0);

The function header of on_each_cpu_mask says func should be 
non-blocking. Not sure if that's a hard requirement or not.

If it is, we can introduce an extra IPI_STOP in ipi_names and just send 
ipi. The receiving CPU can handle the IPI_STOP.

> +
> +	/* Wait up to one second for other CPUs to stop */
> +	timeout = USEC_PER_SEC;
> +	while (num_online_cpus() > 1 && timeout--)
> +		udelay(1);
> +
> +	if (num_online_cpus() > 1)
> +		pr_warn("SMP: failed to stop secondary CPUs\n");

May be print the remaining online cpus so that we know which one failed ?

Regards,
Atish
>   }
>   
>   void smp_send_reschedule(int cpu)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
