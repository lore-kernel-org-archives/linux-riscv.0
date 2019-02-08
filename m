Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519ECC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 22:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E44B21841
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 22:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euVDRKoy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YKoYzu+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E44B21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RpCxuJlqd9uRkj17LkkakbCQzVWg8uG/S5RcGNbv1p0=; b=euVDRKoycWbFQ1AzdmYzy7b6t
	hX6VJe8KvLNbHAEbPX5bRzuE7CMtXpJE8hFSf3Pv1y9qXXI53211dZY9HtkAOdpyIR2qG1nX0uPFH
	jrcqCnEjgxrUlL7wkQ24rrHBqRUc7QIh6mgDQeldn57xCvx1jG4z1wsdWNIXkKPwzbESM6ZVE+e8W
	mScRnB5K+juzSu0n5wZffNHaBBdy4OXKHyhHJKkZiVqkTwD0D+Bn39Kkrg5jSs3ngZooDS55WGml2
	F3wVyJwEtzN8RApT5wXITFuFm5DjATYxi6ncWmAeuiFxv7qZ5hivxZuFJ+d4IgWbzux8gj2GiI30U
	NU0iAovZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsF4I-00074n-Ta; Fri, 08 Feb 2019 22:56:22 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsF4F-00073c-CP
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 22:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549666580; x=1581202580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JJVjRFZ0MjlKPtlNZx40KnljAAcqK9QsHXHfcYZKklo=;
 b=YKoYzu+kQGWimpGvo7WO0y4vd4NRWq5/DdRZgZj3TVDcoUNuQ7c+bVNi
 vfAT2LBJjO9AHJXaVBJwt01oI5LFT+oJTRi/DfztrnnbBpj7lvingkjjN
 qBq0koDRfGlAmUHv3R3Sj/9Eh7PqDKJwLEe0g75XKVbAcQJJntfmUarTU
 JhrbLv/nTUj6uLsmq0mcD2TT7yzkEEpLVU4vy61PTIAZ/0QR7iKDdYHlA
 eI9LlBI3m6hIu5qn9O1mxRkgCRs/CHECUsGlKPq+bV9EXJSLgjLezFnzP
 jw+gAM+iz91a8SAXgqCqgraLLzJYF8TJBqP7wZ4uNNfBk+qa8yeQ2XM+L w==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="105811948"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 06:56:15 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Feb 2019 14:36:56 -0800
Received: from usa003289.ad.shared (HELO [10.86.59.147]) ([10.86.59.147])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Feb 2019 14:56:15 -0800
Subject: Re: [v3 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
To: Christoph Hellwig <hch@infradead.org>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-7-git-send-email-atish.patra@wdc.com>
 <20190208090405.GC16932@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7e6afb87-73e1-9688-7602-b7579fb94590@wdc.com>
Date: Fri, 8 Feb 2019 14:56:13 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190208090405.GC16932@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_145619_560761_89ED88DF 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/8/19 1:04 AM, Christoph Hellwig wrote:
> On Thu, Feb 07, 2019 at 05:51:19PM -0800, Atish Patra wrote:
>> Currently, clocksource registration happens for an invalid cpu
>> for non-smp kernels. This lead to kernel panic as cpu hotplug
>> registration will fail for those cpus. Moreover,
>> riscv_hartid_to_cpuid can return errors now.
>>
>> Do not proceed if hartid or cpuid is invalid. Take this opprtunity
>> to print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> index 43189220..3c7ea75b 100644
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
>> +	pr_err("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>> +	       __func__, cpuid, hartid);
> 
> This does not look like an error case to me.  At best it is info,
> if not debug.
> 
Thanks for catching. It was a typo. I will fix it in next version.

Regards,
Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
