Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C213C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11532086D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/XS+9ZR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NXvva8kD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D11532086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zwxPF1neiGwyT5rcEX0IXORwZlXriHUs3xImN429SyI=; b=N/XS+9ZRfL/eds34mRFiOVN3X
	KOUasKndvyt109qSNcramkiZjJYJ8ic+2UFHkiXyO6R6umLoxmcDfeq5P/ANua//sxlLkZzbR2hIr
	/4V94Cy0wX3SmyWTwqaIYDL0zVb0SzrXe+AxBrT6vsToAzUFe0JUJGCgHff2Y6tASAHAYehe5i3OU
	nS9f5qI0ODu6tqbspYr4Y40xn3lVUNTZpFVo2YKcmh2nQ+p5/rvw6OqtcRvKtD9OrRm+Y7IqgOsyK
	iNM4lRxyldtLTECLq5Xwkd/cnpUGfLXy50MOT6+mzuDD035b86jVmYaoVQqJArHeqQZPhhqCIqoWg
	Vna3gl12Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkK0W-0004Bw-69; Fri, 18 Jan 2019 02:35:44 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkK0T-0004Bc-IO
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 02:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547778941; x=1579314941;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=S4ml2sjUF5uB3w1kBdojfKVnCcsi+CAQRaRV4WaUbvA=;
 b=NXvva8kDCAYLl0qCJteF/eloWj+PxESj7Ay32TgRrBOT+PSEKCXFa72B
 BM9slcu1Tx1JKLJstqSOU1KaBtulzVdi9Udmhuoyi6vRtwfDH70tPVMh0
 sZfoLhjC9J90oRCGOPa6lZ09t0EUzklhA4aYTBWFyDTCETiisKai9z+V5
 xY0UzNGTY+rpS6sphWzq+0b1uJq2r3hWwfqDY3x86IMJX6JkJere5uQS8
 Wkew+lZ9pUb/csh/2w5QtUTgcWOxLcIdizFGc5nXMJ42xhX+1dRmtAghJ
 KfNtpHzPSPMRCOZ03Q+/R2/Ln5p0HgQlrAz/2fiJ+FFhQnwmmjYe+6RU1 g==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="100336337"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 10:35:40 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 17 Jan 2019 18:16:58 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2019 18:35:40 -0800
Subject: Re: [PATCH v2 1/8] RISC-V: Do not wait indefinitely in __cpu_up
To: Christoph Hellwig <hch@infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-2-git-send-email-atish.patra@wdc.com>
 <20190115135125.GA28946@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <1995e941-a8cf-c12e-71ae-7b50cf6c0ca5@wdc.com>
Date: Thu, 17 Jan 2019 18:35:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190115135125.GA28946@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_183541_729119_0651649D 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/15/19 5:51 AM, Christoph Hellwig wrote:
>>   
>>   void *__cpu_up_stack_pointer[NR_CPUS];
>>   void *__cpu_up_task_pointer[NR_CPUS];
>> +static DECLARE_COMPLETION(cpu_running);
>>   
>>   void __init smp_prepare_boot_cpu(void)
>>   {
>> @@ -81,6 +82,7 @@ void __init setup_smp(void)
>>   
>>   int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>>   {
>> +	int ret = 0;
>>   	int hartid = cpuid_to_hartid_map(cpu);
>>   	tidle->thread_info.cpu = cpu;
>>   
>> @@ -96,10 +98,15 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>>   		  task_stack_page(tidle) + THREAD_SIZE);
>>   	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
>>   
>> -	while (!cpu_online(cpu))
>> -		cpu_relax();
>> +	wait_for_completion_timeout(&cpu_running,
>> +					    msecs_to_jiffies(1000));
> 
> Having a global completion here worries me.  I bet we have some higher
> level serialization, but can we comment or even better lockdep assert on
> that?
> 

Yes. It is serialized from smp.c in smp_init(). It brings one cpu online
at a time for preset_cpu mask.

Do we still need a lockdep assert ?

Regards,
Atish
> Also please use up your available lines (72 in commit logs, 80 in source
> files) instead of adding spurious line wraps.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
