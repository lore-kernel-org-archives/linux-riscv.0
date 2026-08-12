Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EFCC5AC67
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 02:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	Mime-Version:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqEoW7tb0Dgelg/ZiM+2GLqetOiQr2wV2aQlS8NsA9k=; b=Epx76KV9fJNR1O
	PtgPt0Z/a48Mr6JDbZBas6dQ45U14q9uWBUziB4vSw/7rMuJfrn/jO3H2EbBiROoDHV1l6ikXR2ly
	Hxb0Lc+9iIdtLKcrIjWBEofmKANR7x1UCFECB2ebYz6Ir0OBzja12K2evY01PxmJ6rD2TTZnEI6Zf
	t1Dd6dKCFmN+87ZSgeG35p8+LoHSnqVhYdlgMnbr1PitRreNd2DtowRpN6MNPcOp5ZIgw4D6G/KYw
	IY6gZ+rmr8J0WglCbMzINrM5TZxiIVd2LaeqCXSYpsfDlTy93nRXlbS2QyNpECDRlElfTXS7HuMmh
	topJdQEMFjJu2LNJM6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtymD-0000000FHHS-2uHt;
	Wed, 12 Aug 2026 02:33:10 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtym8-0000000FHGu-0GJb
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 02:33:06 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b3119957f0so353019e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 19:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786501982; cv=none;
        d=google.com; s=arc-20260327;
        b=q5eJ6zk78ZQHytsm8TS2fVRoFE4VTPxXCnT5yFMcXsWQTfzEB9toRUSJzmTcMxoNp6
         YVupQU8FmHoNSbK4aemDlVFYx80TSQOQcFEYrFrfB3pbOA9CBuOU8rGQfKf+JLuTivQq
         LH2DqctUHSPmDi3aW2gdNMs5Pdien3ERVbv07GlZl+LoUoWJPo1qUbg0GxpIglSMuDcp
         q2zXrqVhzD+Y3yk1UxKTQoMS8/fUlUEw9EMVxXiqTTkETFj2HVHVqsGdpoxfGMVT57LR
         yv67svfhbeHivu3SFB4QuFCBnzFsme+HfqPgfEg16vs29IDhXfJG32MX/1yWjWUeaVnm
         Bfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:user-agent
         :in-reply-to:references:dkim-signature;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        fh=svELKD27tsbIC72wowwDzgpcwsuPnnYwqRQ0wDbMT08=;
        b=A9mDiLhyFnA0CJVuANWIfgKbo41u5QzUTOHwIFNOBY4k+yBD1zJe3N6obWgFsyJMJK
         nYTFO8a3sK5EglrrZmhT4feoytFfGjRpNTtIcTmx8Q+8PCDzw0lVTixWHxmKFuo7pcUJ
         v3lFjJrfwKY1gwEIW2uCu0gA2sY5ZACjH7em6VWTABgzwTDsCyZ7UEa+lfOF8rqzqOPX
         04Bq3J5MMMoQ04mKwW6mwzpVJonil4/BpRtMzRlUMZiNg9l/f98vZBI2MWrkODq5JDgj
         c/+mE2rJ1fU50/FLlaDdnJT38kRuKgGsmOvynvdDLPgVwX8iuu8HvXSmzIrnExBKl4Dl
         37yA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786501982; x=1787106782; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=WPhdK8WKUINx/KJf9953HF6GF5OxQnngKtkjiJoOlozr3+syjWpMnUUBv2E3mFK8fp
         009tMAjxrixmr1wJJk0UfZrIpjh60unbO3mA49BLeXE5WrDMzEVRuTK/amKJ/LRbTCuw
         K8kqASYWIzuFkY66XDJHJJ10bvANeXVV2LT3Z9G/VWvafjJatnlQEFOkV1tVUwnHdKBj
         Q8EhfBUYsByNdmrHQ4ztpVqegg12i5B7elBNwEYCfUDMDNrV1pIhvHcQt5f91vI50DwC
         8zlJJ9WyvEYFqPdi3dfHRxeqJ5KhPFkdC0JtO8ga0eBjouRKfHN0b7cs+rCGd/YNu7dy
         lPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786501982; x=1787106782;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=S/PXymGCmd1IzCJJyfJUARDktcR2EJ4ycmr6NEj9NlGiFKF85GMJSFtJJ1880M9H7n
         0KcmCw3jjvnGj31mEyp0PGkwTdoQsa4Q9UT44yfyZwY8zRssLMWO28cR0M7Ouzw1DVdJ
         f1tW8uf8K4oxpA0jk74Oab/A8B5Ekzpfl+YYaMzuTmxEtGdZYZ9uBnO+UzHCk2uvg/RG
         l4zUf+wRWEtx+SE5BEVfdjsU4UzI0K0oa7pniNIWWovvDhVi9KIIDc8pR+399P+WW3oH
         faeuBpdOhH+QDzEyFwtpNmMCxBL0ZNEU1FOA1ytZ45qW5B5qjZA2QAEhIZPWIk9srptj
         /CIg==
X-Forwarded-Encrypted: i=1; AHgh+RoHfv/c4A1OsyhPIRVTjK7gAuIqEqu0eXcAdeKPMki0WbiSt2fwKeWHrENvtefUgKJrQ8+3g6WfcVgJTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY2ojrffNen99LRqGa0LYpiloKXpGCq1U6tyl4AbfTUo1pysrw
	zjKCZIzE/yH9VV81MoZwjbH3ZTar6cOr1Zy9R3SCKQhOmq43pxTAtOn1H6mudouCgreGz20o3jn
	mzuec12dnJCJE5mlusYC9bfhXyYxVB4/uZ6fw1TT6tA==
X-Gm-Gg: AR+sD10wFkN8Z1SSXtphevAbDcEhTNiBJEa3Bk/hoDTrC3Gi22csKrY45UTzAPHXYn+
	EFzgS3umBTzEfNIcUrZm7LYdt44h31Umc9g+jtbmU/QVfftyV/iihWwbIewfff2xoyx+oEaig5C
	evQSuTnyA0bFTWlB2CKw8WrFHtUbEfZp6thaM83YPgfhHqm8BTivekuVqykRupnDFsjB717DU/9
	xEF4FzpdlqVA0N7F7WTk5ghhgRd7Si1L5UJavzEn/mJGoSEafaLsK/E4CVCCwzL9Pwf1MqGTm36
	OfyatnDfxjH6D6n7JGwmzpHrz8Kn+ePfr8/itXlQDDY=
X-Received: by 2002:a05:6512:2211:b0:5b2:f211:130e with SMTP id
 2adb3069b0e04-5b44e31916amr194307e87.37.1786501981558; Tue, 11 Aug 2026
 19:33:01 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com> <andiWrKhz5rLPVuq@x1>
In-Reply-To: <andiWrKhz5rLPVuq@x1>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
Mime-Version: 1.0
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:33:00 -0700
X-Gm-Features: AUfX_mzrwSJAC7ECp6FZeYOMnrio9pumdwlfO90AszxP14I4KKFHzAruOFpbNJA
Message-ID: <CACnXVndvxVx+a3U8jbyMKwFPEz_ex8u1ima5OEh+vhuV=esbuw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] iommu/riscv: Program QoS IDs for assigned groups
To: Drew Fustini <fustini@kernel.org>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, 
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, cuiyunhui@bytedance.com, 
	yuanzhu@bytedance.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_193304_148603_112A24B3 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Drew,

On 8/9/26 1:07 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:54PM +0800, Zhanpeng Zhang wrote:
>> Program RCID and MCID for RISC-V IOMMU groups through the device context
>> TA fields. The resctrl group assignment is per device group, so reject
>> BARE mode where only the per-IOMMU iommu_qosid global default is
>> available.
>>
>> Validate every group member, firmware ID, device context, field value,
>> and QoS ID capability before changing hardware. Then update all members
>> through the checked IOMMU group helper so a validation failure leaves the
>> group unchanged.
>>
>> Serialize DC.ta changes with context setup under qosid_lock. Change only
>> the RCID and MCID fields with ordinary accesses so fixed DDT mappings are
>> not subject to atomic LR/SC operations, invalidate active device contexts
>> after an update, and clear the IDs when a device is released.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/include/asm/qos.h     |  16 +++
>>   drivers/iommu/riscv/iommu-bits.h |  15 +++
>>   drivers/iommu/riscv/iommu.c      | 200 ++++++++++++++++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h      |   3 +
>>   4 files changed, 232 insertions(+), 2 deletions(-)
>>
> [..]
>> +static void riscv_iommu_dc_update_qosid(struct riscv_iommu_device *iommu,
>> +					struct riscv_iommu_dc *dc,
>> +					u32 rcid, u32 mcid)
>> +{
>> +	u64 qos_ta = riscv_iommu_qosid_ta(rcid, mcid);
>> +	u64 ta;
>> +
>> +	lockdep_assert_held(&iommu->qosid_lock);
>
> It seems that qosid_lock is not defined until the next patch. I think
> you should move the definition to this patch so that the series is
> bisectable.
>
> Thanks,
> Drew

You're right. qosid_lock is first used in this patch, so its definition
should be added here as well. I will fix the patch ordering in v2.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
