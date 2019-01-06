Return-Path: <SRS0=/Lqp=PO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43055C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Jan 2019 02:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0232E21A80
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Jan 2019 02:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSctqR9f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nooc7bGv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0232E21A80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NnOTVBTbzzow1vVmWgpyMFW8g1uiQxNdJxpQSTIRspI=; b=lSctqR9fIbtOxx1sXiTdNoqQB
	WNSXyk0wJa703ufL+F8lo3emqX/JV105Bun+webPMGvwJUSumfnOCX1CZ76QS/4evXfSiToNUMs3W
	pBHhmF5MWAFhZ6qivYvS8sQEhm8DYKAjdPbAwpxSmVJD+0aAEmOX3ICSMoQcsEVN3F4VNm4luV00E
	JdFcr+RsatYP0Z+xAjDtFXt4P2pDAfBslGknc6rWPNPpnRiIKt4iHtM60Q+vB0qK624y4rrNnXQl2
	TJP4Ic9LtJv6a5FGMB2Sv6HoZ5XQ7HbygtlOP/NMwab/uVEC2yD76Ce6KQse+F3BXLVAjTo0Lxqoh
	0Uquiyasg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfxwX-0002XG-Km; Sun, 06 Jan 2019 02:13:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfxwU-0002Wp-GV
 for linux-riscv@lists.infradead.org; Sun, 06 Jan 2019 02:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546740815; x=1578276815;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=o2HBpe4wq5YXplrB4SjcP/RF2pycF8MBcWWFBeXrrOk=;
 b=nooc7bGvITATSlFfSSKMoTkkqjmVVoNIgdH2Qz9CA9zHBaL3uZFtGYlw
 Mq6vdJqYjM/9othKcEfgWc1okFs0DkimxEaDYhHp8ZxmnBCoMExxtTyie
 V8NGlNh1EqIBSP4UID8qftUJUdNfGI092eqPgvMGAiblY5uYHN0dC77Cb
 VWEYDDVsLMByW/eTZVO5jRHcpTi80BNcMI+Z6ROVR84a5eycG/bh7REn+
 uIavvIM9I6CXVUTWfa0rou/r9o2RiLsQjeVeeIhK83/Jcg/7z3lb1Vrhf
 zjJ95S9upYfBxuWpdqByUNOAj6vUIfhB0FuizFT4SywWY/nJ72oSM1vOm w==;
X-IronPort-AV: E=Sophos;i="5.56,445,1539619200"; d="scan'208";a="98057322"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2019 10:13:33 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 05 Jan 2019 17:53:41 -0800
Received: from usa003333.ad.shared (HELO [10.86.60.238]) ([10.86.60.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Jan 2019 18:13:32 -0800
Subject: Re: [PATCH 2/3] RISC-V: Move cpuid to hartid mapping to SMP.
To: Anup Patel <anup@brainfault.org>
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
 <1545865741-22795-3-git-send-email-atish.patra@wdc.com>
 <CAAhSdy12XrVOXcSaoUj1s1DBT-qW5S1nMiVQpCvEVcQM31cRJw@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <4800edf7-5963-c472-affa-b6fdc58ba602@wdc.com>
Date: Sat, 5 Jan 2019 18:13:31 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAAhSdy12XrVOXcSaoUj1s1DBT-qW5S1nMiVQpCvEVcQM31cRJw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190105_181334_602221_81A83D7B 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/26/18 7:38 PM, Anup Patel wrote:
> On Thu, Dec 27, 2018 at 4:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Currently, logical CPU id to physical hartid mapping is
>> defined for both smp and non-smp configurations. This
>> is not required as we need this only for smp configuration.
>> The mapping function can define directly boot_cpu_hartid
>> for non-smp usecase.
>>
>> The reverse mapping function i.e. hartid to cpuid can be called
>> for any valid but not booted harts. So it should return default
>> cpu 0 only if it is a boot hartid
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/include/asm/smp.h | 13 +++++++++++--
>>   arch/riscv/kernel/setup.c    |  2 ++
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
>> index 41aa73b4..8f30300f 100644
>> --- a/arch/riscv/include/asm/smp.h
>> +++ b/arch/riscv/include/asm/smp.h
>> @@ -22,12 +22,13 @@
>>   /*
>>    * Mapping between linux logical cpu index and hartid.
>>    */
>> -extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
>> -#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>>
>> +extern unsigned long boot_cpu_hartid;
>>   struct seq_file;
>>
>>   #ifdef CONFIG_SMP
>> +extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
>> +#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>>
>>   /* print IPI stats */
>>   void show_ipi_stats(struct seq_file *p, int prec);
>> @@ -58,7 +59,15 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
>>
>>   static inline int riscv_hartid_to_cpuid(int hartid)
>>   {
>> +       if (hartid == boot_cpu_hartid)
>>                  return 0;
>> +       else
>> +               return -1;
>> +}
>> +static inline unsigned long cpuid_to_hartid_map(int cpu)
>> +{
>> +
>> +       return boot_cpu_hartid;
>>   }
>>
>>   static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 2c290e6a..bd4d7b85 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -83,6 +83,7 @@ EXPORT_SYMBOL(empty_zero_page);
>>   atomic_t hart_lottery;
>>   unsigned long boot_cpu_hartid;
>>
>> +#ifdef CONFIG_SMP
>>   unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
>>          [0 ... NR_CPUS-1] = INVALID_HARTID
>>   };
>> @@ -91,6 +92,7 @@ void __init smp_setup_processor_id(void)
>>   {
>>          cpuid_to_hartid_map(0) = boot_cpu_hartid;
>>   }
>> +#endif
> 
> Please move __cpuid_to_hartid_map[] and smp_setup_processor_id()
> to arch/riscv/kernel/smp.c
> 

Will do. Thanks for the review.

> Otherwise, looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> 

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
