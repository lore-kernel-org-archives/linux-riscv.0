Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D2FC4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A88160BD3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A88160BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gydKNRegS3ftQq4uCJUCmVEvGx/qPoG01QObmbbRfa8=; b=zrurEDbkA7jPIIuVu1CMIdJVon
	VJoFQpCnWkmqxm5BeHMIzVhbfVWDRMZYav0Pig6AKmw8pH550LX5E4fr6I2ZamHV0i3ko9vLkg59/
	Yzxk0v8CT5Zz0TQpACocrPlWkV/ArH9HMugLEFNkMTE8C5dKGTSnnTSo3EMpOZTFPGQI1+qWkAL37
	QHtrKZbAds1i4B8NuPDD6A+CfXvBiwGYLm9j1voP9Yo2WItDC9ym8b5y+fSENqlz4iSvfiN3q3SDh
	Lp34zm1UKjzGWtQCfqM0pvpFJhBtRu/xOauova5K77YIRgBDwDQzlQ3+K+mvyRgXxLJGBrEWJl4cV
	HicJOupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvyqN-00A2Uu-MD; Wed, 23 Jun 2021 09:06:47 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvyqK-00A2Sz-TA; Wed, 23 Jun 2021 09:06:46 +0000
IronPort-SDR: 7XGBcarvL/09LzeV5Vr6R11QrSUn6LPIDkFLDQMfnB9hCIm3x36udikSNr3/86N5xHkP2nY0dd
 OYoqIao2NtgQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207266457"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207266457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:06:42 -0700
IronPort-SDR: g2eO6eKo7NA4GY19a7CouO+5j1o7GAnTSLroawrK3+rYpOJrEVfMjr60J7q5kjcIpvJfXcjBDr
 3E4HH0+4OM1A==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="487232734"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.255.30.127])
 ([10.255.30.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:06:38 -0700
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, pbonzini@redhat.com
Cc: Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, bp@alien8.de,
 kan.liang@linux.intel.com
References: <20210622093823.8215-1-lingshan.zhu@intel.com>
 <20210622093823.8215-2-lingshan.zhu@intel.com>
 <92fdf981-68ef-92a2-b1ae-0c5f347ae460@oracle.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <43f6bb94-616c-f0c9-edc6-a72ea1244f59@intel.com>
Date: Wed, 23 Jun 2021 17:06:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <92fdf981-68ef-92a2-b1ae-0c5f347ae460@oracle.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_020645_040119_85265A09 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thanks Boris, I will fix this in V8

On 6/23/2021 1:31 AM, Boris Ostrovsky wrote:
>
> On 6/22/21 5:38 AM, Zhu Lingshan wrote:
>
>> -static int xen_is_user_mode(void)
>> -{
>> -	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
>> +	state |= PERF_GUEST_ACTIVE;
>>   
>> -	if (!xenpmu_data) {
>> -		pr_warn_once("%s: pmudata not initialized\n", __func__);
>> -		return 0;
>> +	if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_PV) {
>> +		if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_USER)
>> +			state |= PERF_GUEST_USER;
>> +	} else {
>> +		if (!!(xenpmu_data->pmu.r.regs.cpl & 3))
>> +			state |= PERF_GUEST_USER;
>
>
> Please drop "!!", it's not needed here. And use "else if".
>
>
> With that, for Xen bits:
>
> Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>
>
> -boris
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
