Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D674AC07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 23:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A341D20837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 23:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A11nHqjD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PTyTc6di"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A341D20837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L8G3+gih0uUbPgZguOWb2ov+TVg628Bpe417WKEiz5M=; b=A11nHqjD9dxGRApVMlo+Ofov/
	q9FGiDz6pyQ/iaFSiZGLDcqWAo2yqbLM+dBdp+AQyaPMV8wWwuTwEgjObNRrJTqtBVcVz23q6uZwm
	LnlRxiWThm7/hfeXHrvIfArQeWUxWm5eg454RAH01I4+M3PNpoLk+kldzCGl0Yjc3/9cMAsFaP+Go
	fnQ/rCaT1YN12Ao5+5VOgqQ/cc6PxqbHDcqLOoggg+VaKIjPYG4KtP3mab8h+eU2ntHImMpxhJfAs
	DAAiCiucl3zcHnytBRMfhJGblukYQli9uLAdWIbvtLHddOAkd6EIKE9vBUbuLIoEO6xJbeOimNMyq
	D9et8SL6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVPau-0001Ow-RE; Fri, 07 Dec 2018 23:31:40 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVPar-0001O1-Sd
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 23:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544225498; x=1575761498;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gp8yzVzUL8W53fQqIVpzt3aNkutFWi/UJL35JdE9sP4=;
 b=PTyTc6diL8h+45KWyCKTEmPAJU/Wqys0N65d+XAryTgGsMqc5LBQboWZ
 0nAAqttX10wJ/UdYXvOpfvRgjMXyGGLBouF9NoGxPHLnPVY5TXDFeAtzc
 y8EYTjh9nxobyWXcH5FLPI3TlNpAvD9YE87h0HlzJKxjK/t9L5lXvDY/j
 /V3G20rP96R9sqaeL7lwddMcy22sMAEznkmQ8fbKVx/bLfBDFAzy2kc6B
 IDcXiWhG8E3+VulOMhH1vTUFk2u1yp8BaDApo6U0vDUUbFmQW5m0hMkOW
 7sXazdl9VVA8LqtNG8RvL/y95zIwvgMgUFKX5iToTs1oOfrceyuzRghGP w==;
X-IronPort-AV: E=Sophos;i="5.56,327,1539619200"; d="scan'208";a="96112436"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 07:31:25 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Dec 2018 15:14:09 -0800
Received: from gj0bt32.ad.shared (HELO [10.86.57.164]) ([10.86.57.164])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Dec 2018 15:31:24 -0800
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <74dcf9b4-2343-0f56-1b56-80cc064728fb@wdc.com>
Date: Fri, 7 Dec 2018 15:31:23 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_153137_964153_73F19036 
X-CRM114-Status: GOOD (  17.35  )
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

On 12/7/18 9:00 AM, Palmer Dabbelt wrote:
> On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
>> Currently, clocksource registration happens for an invalid cpu
>> for non-smp kernels. This lead to kernel panic as cpu hotplug
>> registration will fail for those cpus.
>>
>> Do not proceed if hartid is invalid. Take this opprtunity to
>> print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   drivers/clocksource/riscv_timer.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>> index 39de6e49..4af4af47 100644
>> --- a/drivers/clocksource/riscv_timer.c
>> +++ b/drivers/clocksource/riscv_timer.c
>> @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>   	int cpuid, hartid, error;
>>
>>   	hartid = riscv_of_processor_hartid(n);
>> +	if (hartid < 0)
>> +		return hartid;
> 
> This seems like it's just hiding a bug somewhere else.  We should at least put
> out a WARN here, as I'm not sure the error will propagate anywhere useful.
> 
ok. I will add a warning here. That's what we are doing in plic as well.

Regards,
Atish
>>   	cpuid = riscv_hartid_to_cpuid(hartid);
>>
>>   	if (cpuid != smp_processor_id())
>> @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>
>>   	/* This should be called only for boot cpu */
>>   	riscv_timebase = riscv_timebase_frequency(n);
>> -	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>> +	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>>
>> +	if (error) {
>> +		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> +		       error, cpuid);
>> +		return error;
>> +	}
>>   	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>>   			 "clockevents/riscv/timer:starting",
>>   			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>>   	if (error)
>> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> -		       error, cpuid);
>> +		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> +		       error);
>>   	return error;
>>   }
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
