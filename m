Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EDBC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138E52075B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWSqQVho";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cM82FP4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138E52075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iJexYN4L8A3gwdbrGY8Z6+043+JA7VKaecCvCwuEov4=; b=tWSqQVho21ZZ6bRtVOCVvd17V
	QTIKexiZvr5Sa8L0DRUlV4FMQBPgkKCbE21hfJm0ELpIvXcn9GXH4inv+/pgYfv+ehSuVO3p+B3GR
	xSCNAVRBjOCZ5dALeZhBN5k2h9+RcLEZen8qtjlrsMmaXcbE9bScLIMwVW+qcleA3sgZOsOgZRf9F
	1bon28Nk+kCrIkztJPLP0LzYOal62+UiR8rgeC+dVI2/0rOk3+dleczK7h95mKGd2fgtuDxiMlBZY
	su8CkYCgmWIaXCxR7v7tl9mwtR5F/soBzV0dt4eoKk3w+LHy/Bb5Gp62HpxlpsvEMg7z/a7/HtNyv
	1XbubjExA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG9mW-0003F8-75; Mon, 15 Apr 2019 22:08:52 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG9mT-0003EP-6N
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 22:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555366130; x=1586902130;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bIdsCbNgVTeGyll6RglGPST7YtEfsxDOqqCeO+0jW6Y=;
 b=cM82FP4gkeOJ9F9aF2Pwz/zRZyRW95wLVr9XOl9oZ5HFUQL85Tz5plQE
 wbKjDcqbY0liJA1Lvy4uka32s/rcm0x5/rZKhdVrwAr9faldlQ/3Ik0be
 0OiVp2yiH1hGjt6xlvv0Cu97L9t87h4BMoQW01sASrzTkgQ/Io2oPumXZ
 B6B0QwUEtu1Qohfm/l3VSjgRRvPUI8iF4j++WvXw21KDwH+aLs4qK7c/J
 DbADpIXZnAH9ZAiK9i4RznMwSb+howGXdZVzZ6gtaVnW1pxyI8R+bbSmX
 Iv9Rgk40oQpy90z71f2ncswDm5NBP57pTSQ2Tc4enZloTTe6i9RUtuBgf g==;
X-IronPort-AV: E=Sophos;i="5.60,355,1549900800"; d="scan'208";a="107775769"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2019 06:08:48 +0800
IronPort-SDR: Bl6ZxgQkeXfuS8ueip6KTN0jDMCZv6Pl/rzLWE+weQ2MVw0zWKWV5ZAOC1wQ0MsONPbzEupicQ
 VSbGiHRU/x0mNkNqkOQqwdXnWIJ9vlLPVl1LaE+M2wcu+/IFwbU+S0c5qGzYjubT+0innFyax6
 NZxaz6uPJQLG4G4YYomOiNx9hL83jBa7SKcfTLI6qQxnoc6k7cAaSAWcMGjHcTJFHIk1Om+bLk
 yDoit4WC/2tw5bg+tWeTD5vp0JxqFWUwYs+alo24cg7lsQApOyA1W/fGJFsQUPnlD/B5IwbxsM
 ISJFf42HO+xCMXKAYUZxoPga
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 15 Apr 2019 14:45:32 -0700
IronPort-SDR: EqBvw8M5kci9MXpnfo4jBCpv+opR8xO7XpQ7/+x4BwpzyBvetVMzVBUhUt3J+RpsgcbgJcAuz9
 8c55e2v7iTF27P0mAz+gXZZYj2vOLTJzmf+5fgDn+nUrBqhGzgbuT2A+k5e/v42FAIwEaBvmXQ
 dJp47lxy21l2I8EUvM9zoufcm257Vvht+H8NBcfmZOzv7hvU2D7F8sqjnAeW0qLE1IwBItAC7E
 LgXOQqAo8ikg3AkYeX9T+SKEvwPFM1b4+lpS7Cp0t6uUfTaU4e2juVa2clvwMeki2Ur70qjZXL
 uck=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Apr 2019 15:08:47 -0700
Subject: Re: [RFT/RFC PATCH v3 3/5] cpu-topology: Move cpu topology code to
 common code.
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-4-atish.patra@wdc.com>
 <20190415152741.GA28623@e107155-lin>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <5c5b720f-414a-706c-3415-642c27baef1f@wdc.com>
Date: Mon, 15 Apr 2019 15:08:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415152741.GA28623@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_150849_280059_F275F7DB 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Anup Patel <anup@brainfault.org>, Morten Rasmussen <morten.rasmussen@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Otto Sabart <ottosabart@seberm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/15/19 8:27 AM, Sudeep Holla wrote:
> Hi Atish,
> 
> Thanks again for doing this. Overall changes look good except a couple
> of minor nit, see below.
> 
> On Wed, Mar 20, 2019 at 04:48:04PM -0700, Atish Patra wrote:
>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>> their cpu topology. It's better to move the relevant code to
>> a common place instead of duplicate code.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   arch/arm64/include/asm/topology.h |  23 ---
>>   arch/arm64/kernel/topology.c      | 303 +-----------------------------
>>   drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>>   drivers/base/topology.c           |   1 +
>>   include/linux/arch_topology.h     |  28 +++
>>   5 files changed, 330 insertions(+), 323 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index edfcf8d9..6cc6a860 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -6,8 +6,8 @@
>>    * Written by: Juri Lelli, ARM Ltd.
>>    */
>>   
>> -#include <linux/acpi.h>
>>   #include <linux/arch_topology.h>
>> +#include <linux/acpi.h>
>>   #include <linux/cpu.h>
>>   #include <linux/cpufreq.h>
>>   #include <linux/device.h>
>> @@ -16,6 +16,11 @@
>>   #include <linux/string.h>
>>   #include <linux/sched/topology.h>
>>   #include <linux/cpuset.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/init.h>
>> +#include <linux/percpu.h>
>> +#include <linux/sched.h>
>> +#include <linux/smp.h>
>>   
>>   DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
>>   
>> @@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
>>   #else
>>   core_initcall(free_raw_capacity);
>>   #endif
>> +
>> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> 
> Why can't the above one be just GENERIC_ARCH_TOPOLOGY ?
> I may be missing to find it myself, but would like to know.
> 
GENERIC_ARCH_TOPOLOGY is now used for both RISCV, ARM & ARM64.
The below functions under this #ifdef have different implementation for 
ARM and ARM64.

parse_dt_topology
cpu_coregroup_mask
update_siblings_masks

While we can combine the later two functions and move them to common 
code as well, parse_dt_topology is significantly different.

That's why we need some kind of #ifdef or renaming of parse_dt_topology 
for ARM32 code.

Thanks for the review!!

Regards,
Atish
>> +
>> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> 
> Ditto.
> 
> --
> Regards,
> Sudeep
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
