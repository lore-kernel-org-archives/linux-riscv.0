Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0A2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 18:21:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB6521927
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 18:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdYiw6IA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gKeJ4YHN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB6521927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F/fehdC6pDHLdxH8AWpsrIhJg2/hmXNrR/trw3Yb/kU=; b=qdYiw6IA9ppuCwLLIh0MEKCL2
	/8f6pceXm7tTmnEWSiPVeuLij1NRv0SJ8IrdETlesj54mTu49rOEJx8b60vemC6s5+iOmsZJKEcBQ
	WIkIbgst+8SSZdv9nm+krXyLr+itaawrNMv9AfrHrFwNbwRd1uE1+zvs2AeW8aquO7i4pF+xGktqr
	RISmIQkiICvfOyNgA1lmfMPZXaQqXglkFNCbjf2GjLIQVG0ZUsBGLp673OQKGPndaNdlkGMfRQ6jJ
	SsQo38D64Aylfgotr25AH1RBCUmYz+W3dbxfDPVOsAhX8hQ9kZ6NZT1MAXwV7yd+bzLBJs7ITCtH0
	Eh8W0Bdzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guLdc-0003kY-E5; Thu, 14 Feb 2019 18:21:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guLdZ-0003kF-Ma
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 18:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550168490; x=1581704490;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Bo+VzpBFXXwdzwQHKYuR4+jxlAb8abN0EXR3PAVtxIQ=;
 b=gKeJ4YHNgIvAV5DlU9O1Z4/wdSY6tY87d0SRAuWAr4LLouFOekOY+0nC
 FYXH5Pv3oq/Q7UJQ//IZ9BmQf9+OCBtfjuqnYPbfY8mxb4rpI4uacLwJB
 jBVizXAfsQ/M6tpi5dWxwJQSm/TREwE4PX8US8HUHP8B/Sga9v45EvRKa
 XvKd/gcnthRRdHK5M3Ipwaln6FWrFRKqrLl/bsF13h36YvqfpSgiJxgSh
 SMgzPpZRmUKhVTwDDiwvH14B4KskxLNohK7LRBEOtSJOp7cbYN1Sbu2jG
 v1cppq/4OC43v+PNMZadWFIEzusJI3lhuoJad9GhnSlR1I9kBGxkajy7L Q==;
X-IronPort-AV: E=Sophos;i="5.58,369,1544457600"; d="scan'208";a="103050478"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2019 02:21:07 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 14 Feb 2019 10:01:39 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.47])
 ([10.111.66.47])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Feb 2019 10:21:07 -0800
Subject: Re: [v5 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
 <1550089092-28783-7-git-send-email-atish.patra@wdc.com>
 <bf8f0535-26d4-843a-d89c-8ab235411b4c@linaro.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a0917630-489c-3ca4-e965-5a4ef2e4c4ca@wdc.com>
Date: Thu, 14 Feb 2019 10:21:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <bf8f0535-26d4-843a-d89c-8ab235411b4c@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_102129_781168_7FE3405D 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/14/19 2:24 AM, Daniel Lezcano wrote:
> On 13/02/2019 21:18, Atish Patra wrote:
>> Currently, clocksource registration happens for an invalid cpu for
>> non-smp kernels. This lead to kernel panic as cpu hotplug registration
>> will fail for those cpus. Moreover, riscv_hartid_to_cpuid can return
>> errors now.
>>
>> Do not proceed if hartid or cpuid is invalid. Take this opprtunity to
>> print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> Hi Atish,
> 
> I applied this patch for 5.1 with the typo fixed and the reviewed-by tags.
> 
>    -- Daniel
> 

Thanks!!

Regards,
Atish
>> ---
>>   drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> index 43189220..e8163693 100644
>> --- a/drivers/clocksource/timer-riscv.c
>> +++ b/drivers/clocksource/timer-riscv.c
>> @@ -95,13 +95,30 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   	struct clocksource *cs;
>>   
>>   	hartid = riscv_of_processor_hartid(n);
>> +	if (hartid < 0) {
>> +		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
>> +			n, hartid);
>> +		return hartid;
>> +	}
>> +
>>   	cpuid = riscv_hartid_to_cpuid(hartid);
>> +	if (cpuid < 0) {
>> +		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
>> +		return cpuid;
>> +	}
>>   
>>   	if (cpuid != smp_processor_id())
>>   		return 0;
>>   
>> +	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>> +	       __func__, cpuid, hartid);
>>   	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>> -	clocksource_register_hz(cs, riscv_timebase);
>> +	error = clocksource_register_hz(cs, riscv_timebase);
>> +	if (error) {
>> +		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> +		       error, cpuid);
>> +		return error;
>> +	}
>>   
>>   	sched_clock_register(riscv_sched_clock,
>>   			BITS_PER_LONG, riscv_timebase);
>> @@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   			 "clockevents/riscv/timer:starting",
>>   			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>>   	if (error)
>> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> -		       error, cpuid);
>> +		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> +		       error);
>>   	return error;
>>   }
>>   
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
