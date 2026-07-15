Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA0C4450A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 02:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:Mime-Version:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W76WMQkeLhfxH8Z/+4uype0eScFX1IxQaecCDDIKnWI=; b=XeTC2Fyd4aLACmBLVU148gW5JY
	vcs0auUZ6zCkor2AtVIfuduQvpkI8dnX0lA3ouN2LTd942topB6oEIm5PdoeqU4GItHO5Ljgz1I7g
	l3gs58sj01l89DcAn1cbkEXTfLuf0ZbyMVBTEltstHvCrajJlUSjwfuo/9CVYhTULBbJA3oxSVLQW
	e4spV4dztgVPNKX18NlJGkgxcu9xl9P0CEik4N/ycb8k/4KGZrFQL+NopDXMMvKLh/0K3mVPyDzpf
	PaQqeuyzCMSqiZS3XDavBbaDVVpnualfg2p2yvp7Lss17YLowQiFf8xERKMPiU62ns7NvAngOV2XN
	sLXaEb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpm1-0000000DeN5-2hbL;
	Wed, 15 Jul 2026 02:55:01 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjplz-0000000DeMP-1uOg
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 02:55:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso4593806e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 19:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084097; cv=none;
        d=google.com; s=arc-20260327;
        b=LaLWYaCESYohW4FqLQaRneE6bXyA1NVhMpumC90JsTRIYSqj4cB+34kidyJggQg6hL
         6OErhWrzGqagX5ztp0R6m24ZmnV3TGj9DVBay0bc9bowHakc2rWTnzLrIW14y7VFYsjK
         vlTAXIfwuOZaWvI4YyVul43MtjGeIvR45NF1uXvmi+2TxqL8YSfzy1S83yoacXcDd53z
         3On3oyD5rrBl26+6zEPJM1fPMTGQ2AlSguSq3Q2rAZ74IrjTjsl/HTNTqc8X55UJfz+X
         dQS6mQFAhKzkE5lEF42+a+oEoCGSvqpuFX2lobtR+MP68/eGLa53Qom109gkEqf4pE9/
         ZnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:in-reply-to:mime-version
         :references:from:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=Mu8X0YRAuGe4tkKZslR1kPM+rDQT6+9TwpLN10Q7OVk=;
        b=W++1gmUwZh3twIXN/KcvHhaSfPIZC3j/ELfCBB7WDjn6khK0VM7IZfEz1cKw4b5oRB
         5Mb2X9JBomiLsNvT2XVJORIsyKOOUSWh6zqjULfhcc+8zWG9eROyfUYxdQEiG0jX2e2i
         yBbsQSb1DqRx3g4cQi/0jSHO661aAiA5tDjmIs+20kyzsla4O/4evvMj2ArHOHfowAW2
         QOFRMLHKcKUeh5x5gQ9BsnxmwgCa6BD2rnC8f9lGGjv8hQGNU60zOm2iVnnsyk+uAuiG
         +/268zQ+EL4OCl090rAM9nKZPzGtXNwMe+wmQzB4AJodho3mvEKDXePbRslmDyKCvlFz
         +w5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084097; x=1784688897; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=EHLu4MOiXrCXRjjVRhL0k4rPJYnO0TQ+CCUdcBBjwgZ9R9SCCQmJJmDi29cjgaiwvh
         7ZF1PrmiOhNSi2gTavPz/859ote1OddHs7Hikwie3xtcpSUkBc2FG8Grj/XEuFfi1uT8
         sYdV8ZkDlo77EtarE2kAV6bAFcRJpo6uXe2dRV0CBo35iI03ptyfSvjL2LtByD9HoS8B
         geE7wgkFAJXcPi5WJ0knAl/S0clDzMbYr+LRKYpF6Jd7hetblfaxX75rCJYmHRa2Kj+V
         4HQwYYxhvrkbvpwFB3F/SKxiPc6KwZzSSfgJFIbwTI5lLovB2ODJgociMwMFIU6OuwGs
         kxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084097; x=1784688897;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=qpRItwje1BoOL/SPyjs/8RoEJ5sjsmfuTp2MqY/iNVDAXWRYsMDIHgce2k+m1RWdaa
         sO+wL9GwGqe8rf9La+KouX6ggtTQ9UsOWQuU1lZWRsagLjr6qfmgfuob2LcFcp+Bz2Sw
         nY/md2+Zp9JCCXY9Nhxd1tG0Th5LmkWHotwP+xnQBPH/feG8MQxe2r2TvRScG6g2HhrB
         BcFvZ+A2EKfVHeiXP0dPM2LoDaUApdNzaPwwkZ7dQDJyVYV8EpL98nK4JK+rZQjxK3MQ
         tRM1AxKToMY+pKHCZ8CWm1jr0Cp1KGQlCoWOnh1oPB9UXs02tE2nvnbwILbCk0JlZEWh
         wSHg==
X-Forwarded-Encrypted: i=1; AHgh+RoMWKiZtKEsSw7ysGKiyt1ribb8rmid1rN5jB4/cJFTyeCg3XkJBn1Dhd729SVyvniKTfhJxWPTZt9Dng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo29SWW+0UQYCXv+k0Gl1y5Dk2raxdX4YB0lAin3hApZaSem/v
	nPhKm7O87pWhIxERJ/XeX7R6Xmk37M9wPxVf6nTsHZbDnTz7IIvzWpls+sffNT/cNUjZo+6YOpg
	9Ikim3d+PD8z1zq2nDaXxGPOvXIYVXCT5eXZIDPTrfg==
X-Gm-Gg: AfdE7cneja8fEFX2u55REELVDtR7PLLnB3D2iNQZPa18sIrinatIhmZ+o71tCamNrek
	4C+Mo7ziLU1eLi5PviFeMzSQBW0IxkmYZz+kv/jNZ92jRd5vzeA0FauVQQANgxxvsPixjbHCEYT
	GQTWDU0i2iRyAdkrqAWs8W+KyKcQudRTFfqJU95qwNBVG8xJgr+nH/08/nXcEQCwbhUo963+EKq
	ei5R2Lfu6CcYduDZaYjpCrqfBClF7Fb25Ne0Sdd9+wGt1j6iy48rj48TbkgK/8iX1Qxh4hlqWbn
	aLuPj1B+
X-Received: by 2002:a05:6512:3f12:b0:5ae:b7d4:7ddb with SMTP id
 2adb3069b0e04-5b159b6fda3mr1064835e87.26.1784084097163; Tue, 14 Jul 2026
 19:54:57 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
User-Agent: Mozilla Thunderbird
Date: Wed, 15 Jul 2026 02:54:54 +0000
X-Gm-Features: AUfX_mzaekcsCjyK9vwKSYgr-sn1iFmjDQZenkFE6MLRADlmaaPOOGhkJ3gRioM
Message-ID: <CACnXVncfth5=ctoS6YqY8n1u_8JvZb-BpVgdniRqqjzxgNzdXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] iommu: Add group lookup by ID
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, fustini@kernel.org, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, shuah@kernel.org, 
	kevin.tian@intel.com, cuiyunhui@bytedance.com, yuanzhu@bytedance.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_195459_563348_1EE74718 
X-CRM114-Status: GOOD (  13.97  )
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

Hi Jason,

On 7/14/26 10:03 PM, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 09:06:51PM +0800, Zhanpeng Zhang wrote:
>> Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
>> the numeric ID used in /sys/kernel/iommu_groups.
>>
>> An ID lookup must keep the group object alive without also keeping an
>> otherwise empty group active. Embed the devices kobject in struct
>> iommu_group so its address remains valid until the parent group is
>> released, and return a reference on the parent kobject to ID lookup
>> callers. Add iommu_group_put_by_id() to release that reference and
>> iommu_group_is_active() to detect when the devices kobject has become
>> inactive.
>>
>> Serialize lookup against group teardown with iommu_group_kset_mutex and
>> only return groups whose devices kobject still has a live reference.
>> This prevents a concurrent lookup from dereferencing a stale child
>> kobject while allowing external users to discard bindings to empty
>> groups.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
>>   include/linux/iommu.h |  17 +++++++
>>   2 files changed, 113 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde..da269d10f6bf 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -40,6 +40,7 @@
>>   #include "iommu-priv.h"
>>
>>   static struct kset *iommu_group_kset;
>> +static DEFINE_MUTEX(iommu_group_kset_mutex);
>>   static DEFINE_IDA(iommu_group_ida);
>
> I think it would be better to change the ida to an xarray than to use
> a string search on a kset..
>
> Jason

Agreed. Using an XArray as both the ID allocator and the group lookup
table avoids the string-based kset lookup and the additional mutex.

I will refactor it in the next revision.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
