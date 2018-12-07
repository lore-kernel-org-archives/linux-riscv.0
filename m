Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC8CC07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 23:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A22420837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 23:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gh1RrMyA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OpaXWSIj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A22420837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MgzVtAGOGMWtBwFZg42PVmWFWWAlDUL2pAJmd6yF+Y8=; b=Gh1RrMyARhA9fIlLaEwOYSMXH
	pLEmPGsvTclydFmD9mxBE2nQ1MalHs/HMtN6iGnRIXlSK3kxNEFuShdzbJvuwCfrMtP17cU48NHc7
	tpqWjWr2LTtFfm8ckLdDnFC+hB3DGrkBX5vxdlwyI1kSBF2r+C8oy/2JwZTfLkK1+amnJlr/ptlnc
	2pGKo4DKuQ4QSx50+mDCDzaUmQ1CRroZERsQw+GWkzfRwmZe6Yz4hkE1Ju+onMEqo/q+X9pV9aiuo
	g8VM50+ypdOI5Xi6DbCILxIGDb4EoGKgJ1mo9Hskbc/ku7G5yu6odZ+mPQwDVkjnmHCH5o5mq+3AO
	amKSZ+7pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVPg9-0003N4-U5; Fri, 07 Dec 2018 23:37:05 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVPg6-0003ME-OQ
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 23:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544225822; x=1575761822;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oqFqUSGEZ527gvndpmSeiRdE8bBlWDIBdMBjfGtFk8g=;
 b=OpaXWSIjy2bVPk1ro92ZVdHP8bo8VlgSPKVgN6/qfUH8ikqy6Bi+OtTK
 cPpQ1MAbEpLfzQ1s7zjQl8Lm0m7pdNq0m9EVAM+bANRZivztCytQAqRZT
 USJdAwIcwvLLPZ/ABNRhFrqgcEO0Wz/zYx26x1G4iXeuzoS4lyuUJCNJy
 3KCidP+ACv5Hk6gFeWNP/KuknQWilkgQj6Il0ZTCm1hVugPdi30yWk81+
 1c6mKkZ2wUKgUv0Z4lsSWh0z8hQ0uTq6CBP3aadxSXDBbxmfHU9aajqBt
 4x/BHXcsi4Grpg3bzDLhyFegT4Ph4Wrvfk0anSYrHHcsfNfDW9ym748GJ A==;
X-IronPort-AV: E=Sophos;i="5.56,327,1539619200"; d="scan'208";a="101007005"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 07:36:50 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Dec 2018 15:18:47 -0800
Received: from gj0bt32.ad.shared (HELO [10.86.57.164]) ([10.86.57.164])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2018 15:36:50 -0800
Subject: Re: [PATCH 2/4] RISC-V: Support per-hart timebase-frequency
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-531f9ae3-9ab2-48cb-9f1f-4e6814498753@palmer-si-x1c4>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <f9769cec-2240-b668-c9e5-387212cf317e@wdc.com>
Date: Fri, 7 Dec 2018 15:36:49 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mhng-531f9ae3-9ab2-48cb-9f1f-4e6814498753@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_153702_911101_99DF3CBE 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "dmitriy@oss-tech.org" <dmitriy@oss-tech.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/7/18 8:42 AM, Palmer Dabbelt wrote:
> On Mon, 03 Dec 2018 12:57:29 PST (-0800), atish.patra@wdc.com wrote:
>> Follow the updated DT specs and read the timebase-frequency
>> from the boot cpu. Keep the old DT reading as well for backward
>> compatibility. This patch is rework of old patch from Palmer.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   arch/riscv/kernel/time.c          |  9 +--------
>>   drivers/clocksource/riscv_timer.c | 22 ++++++++++++++++++++++
>>   2 files changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
>> index 1911c8f6..225fe743 100644
>> --- a/arch/riscv/kernel/time.c
>> +++ b/arch/riscv/kernel/time.c
>> @@ -20,14 +20,7 @@ unsigned long riscv_timebase;
>>
>>   void __init time_init(void)
>>   {
>> -	struct device_node *cpu;
>> -	u32 prop;
>> -
>> -	cpu = of_find_node_by_path("/cpus");
>> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
>> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
>> -	riscv_timebase = prop;
>> +	timer_probe();
>>
>>   	lpj_fine = riscv_timebase / HZ;
>> -	timer_probe();
>>   }
>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>> index 084e97dc..96af7058 100644
>> --- a/drivers/clocksource/riscv_timer.c
>> +++ b/drivers/clocksource/riscv_timer.c
>> @@ -83,6 +83,26 @@ void riscv_timer_interrupt(void)
>>   	evdev->event_handler(evdev);
>>   }
>>
>> +static long __init riscv_timebase_frequency(struct device_node *node)
>> +{
>> +	u32 timebase;
>> +
>> +	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
>> +		return timebase;
>> +
>> +	/*
>> +	 * As per the DT specification, timebase-frequency should be present
>> +	 * under individual cpu node. Unfortunately, there are already available
>> +	 * HiFive Unleashed devices where the timebase-frequency entry is under
>> +	 * CPUs. check under parent "cpus" node to cover those devices.
>> +	 */
>> +	if (!of_property_read_u32(node->parent, "timebase-frequency",
>> +				  &timebase))
>> +		return timebase;
>> +
>> +	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
>> +}
>> +
>>   static int __init riscv_timer_init_dt(struct device_node *n)
>>   {
>>   	int cpuid, hartid, error;
>> @@ -94,6 +114,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   	if (cpuid != smp_processor_id())
>>   		return 0;
>>
>> +	/* This should be called only for boot cpu */
>> +	riscv_timebase = riscv_timebase_frequency(n);
>>   	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>>   	clocksource_register_hz(cs, riscv_timebase);
> 
> We need to check to make sure the timebase-frequency of each hart is the same.
> This is mandated by the RISC-V ISA specification but should be checked in the
> code.
> 
Fair enough. I will add a timebase-frequency verification function that 
will be executed for every cpu instead of boot cpu.

If any cpu's timebase-frequency doesn't match with boot cpu, should we 
just WARN? or Do we need panic given that DT is not following something 
that is mandated by ISA ?

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
