Return-Path: <SRS0=kGhb=SS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142E6C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 18:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE2B20868
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 18:54:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p+qi6hdL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="a3ci5zAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE2B20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jaDFpvKAuUzl8Kkx+YqBKme+wt/kPcBcVHcZlNeC91w=; b=p+qi6hdLY8AfMKJz8+5gdD4hW
	E88HUR/YnO7ACr6k99SJKrFsH9tBf4ZJRI/ezQ2ZsOCo+c5MyTAoL6DHv/f1FWggQslW0i0NucD2S
	699tc7bIMpb4eNF8DKKYrGyH+UAU1inF25v0BwZ+CjpJE7NtdUcW168Pjv3EY+4T1SXTDSTeupyxQ
	WftZPxCakVXbhOoEXox17nhhpDs2HicYhuQfcQhcjXJmpg6BR12Dg9y6f1RFh8VDN9dzj226EmxOm
	DrZgApkETypRB1yivxq6IBLfoUsR/FlGPnAYvbQM4A45+cPdnv/9Ikv/hX3v8NHj3/3tPw/UAnTPV
	ePqNMefVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTEO-0008SC-W0; Tue, 16 Apr 2019 18:54:56 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTEM-0008RO-Dj
 for linux-riscv@lists.infradead.org; Tue, 16 Apr 2019 18:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555440894; x=1586976894;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZT0B97dSH1Ijy8Uz6tkERdBIjfHUkvFmhigXZV6/kCM=;
 b=a3ci5zAWLUToSh3dIGM7xFVmB4PDpnXN5JQRKtniE1oCL0FYPYjq5kXu
 EEY+s7O4jZVuCDYmsyQ6iDltxZ2UJAwhsNpHtewk3NOLd98Y0B/sKnKWJ
 GQEGLzJ21yPqFJ1zIgY3zhvde4szH+LNZNnvJVpsePLiVYzwDVxBrnD4Z
 mh1UVNEUeoTj8DO1I2OoUeSTajxodpGg7DlRzlzDN7X50Kr+om1JiIfqa
 KaJ1rE6dDn5AGBszb+1i8ScF3aHoqkmFbwQPudi9YvAAo/gZYkMbiSdgS
 d4oADlPzs2s+yQECo+/dovU0KTvZL3V23z/gx8DyJWiDD7jikfcfuk7T9 w==;
X-IronPort-AV: E=Sophos;i="5.60,358,1549900800"; d="scan'208";a="107341136"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2019 02:54:50 +0800
IronPort-SDR: LACXkZuLyNcZC4NAHwf55/evX5Yd7t2cd8KjuDINHbxjxHay74kUkQ9xQWQzEHViOaIAD9WxAZ
 uENKNh1mDWQ8Y8+n+EBzQwsHtRZacEvWHgSRCa2beRyYxJhR+Q/6qU/eYu9H9dMxygzbjCnvjj
 2OBg4hEl7uC3CTR+1FIrcOPrZDozFEFUbSEJr2/E4fBMrCuLmYfRDMIZKloGge9Ow6xiCQUb+3
 dDEC5KAL5B+6BI2W7SL7BQeOA2Pu6MckaYY3VwGeR+kBec2e6TF42CpjdB/L784mOr2IXXzvC3
 ibeL6qSj3O3v92n+uCPA3PvK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 16 Apr 2019 11:33:43 -0700
IronPort-SDR: lp/jOdP+DmZq8I6+T6uki2xICfwqvEelUfHXocVeqDgAp7Jutc6jpm3A3kdRfNpBMZQcL153Ng
 jSzTEyR35BoZwlMzAWuCm+7N4Ovs5k1pa199lkoQFLypTJUhotRW/rSOu84pQQSAYlz7XVQWSV
 oaBFQJQz9+GyPCmmFCWXw48jXcGz5GWGS8z62Bm2zZEUlO/VtZyyMLdvQQ8GnNDxiy3kQxVIf/
 pF2xCkK/STyOzjLCY2DwXC+ipD1EPZmggngSUTXd9MbmuenvxS84uPaoS3tpfjqrSdNqpI3cPi
 ZsE=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Apr 2019 11:54:49 -0700
Subject: Re: [RFT/RFC PATCH v3 3/5] cpu-topology: Move cpu topology code to
 common code.
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-4-atish.patra@wdc.com>
 <20190415152741.GA28623@e107155-lin>
 <5c5b720f-414a-706c-3415-642c27baef1f@wdc.com>
 <20190416132324.GB24669@e107155-lin>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <ad175efb-9545-5772-e0dc-ac0b0ae5139b@wdc.com>
Date: Tue, 16 Apr 2019 11:54:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416132324.GB24669@e107155-lin>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_115454_579914_FC677AC6 
X-CRM114-Status: GOOD (  22.12  )
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

On 4/16/19 6:23 AM, Sudeep Holla wrote:
> On Mon, Apr 15, 2019 at 03:08:45PM -0700, Atish Patra wrote:
>> On 4/15/19 8:27 AM, Sudeep Holla wrote:
>>> Hi Atish,
>>>
>>> Thanks again for doing this. Overall changes look good except a couple
>>> of minor nit, see below.
>>>
>>> On Wed, Mar 20, 2019 at 04:48:04PM -0700, Atish Patra wrote:
>>>> Both RISC-V & ARM64 are using cpu-map device tree to describe
>>>> their cpu topology. It's better to move the relevant code to
>>>> a common place instead of duplicate code.
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> ---
>>>>    arch/arm64/include/asm/topology.h |  23 ---
>>>>    arch/arm64/kernel/topology.c      | 303 +-----------------------------
>>>>    drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>>>>    drivers/base/topology.c           |   1 +
>>>>    include/linux/arch_topology.h     |  28 +++
>>>>    5 files changed, 330 insertions(+), 323 deletions(-)
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>>>> index edfcf8d9..6cc6a860 100644
>>>> --- a/drivers/base/arch_topology.c
>>>> +++ b/drivers/base/arch_topology.c
>>>> @@ -6,8 +6,8 @@
>>>>     * Written by: Juri Lelli, ARM Ltd.
>>>>     */
>>>> -#include <linux/acpi.h>
>>>>    #include <linux/arch_topology.h>
>>>> +#include <linux/acpi.h>
>>>>    #include <linux/cpu.h>
>>>>    #include <linux/cpufreq.h>
>>>>    #include <linux/device.h>
>>>> @@ -16,6 +16,11 @@
>>>>    #include <linux/string.h>
>>>>    #include <linux/sched/topology.h>
>>>>    #include <linux/cpuset.h>
>>>> +#include <linux/cpumask.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/percpu.h>
>>>> +#include <linux/sched.h>
>>>> +#include <linux/smp.h>
>>>>    DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
>>>> @@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
>>>>    #else
>>>>    core_initcall(free_raw_capacity);
>>>>    #endif
>>>> +
>>>> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>>>
>>> Why can't the above one be just GENERIC_ARCH_TOPOLOGY ?
>>> I may be missing to find it myself, but would like to know.
>>>
>> GENERIC_ARCH_TOPOLOGY is now used for both RISCV, ARM & ARM64.
>> The below functions under this #ifdef have different implementation for ARM
>> and ARM64.
>>
>> parse_dt_topology
>> cpu_coregroup_mask
>> update_siblings_masks
>>
>> While we can combine the later two functions and move them to common code as
>> well, parse_dt_topology is significantly different.
>>
> 
> Sure, had a quick glance and indeed they may look different, but won't
> it defeat the purpose of this binding consolidation ?
> 
I didn't want change too much at first go.

>> That's why we need some kind of #ifdef or renaming of parse_dt_topology for
>> ARM32 code.
>>
> 
> I am fine if we want to take this up later to keep the impact minimum.
> But cpu_coregroup_mask and update_siblings_masks can and must be unified.

Sure. I will just leave parse_dt_topology as it is for now and unify 
other two functions.

I think we should unify parse_dt_topology in separate series.

Regards,
Atish
> In fact the existing generic version must work on ARM32 too.
> 
>> Thanks for the review!!
>>
> 
> You are welcome.
> 
> --
> Regards,
> Sudeep
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
