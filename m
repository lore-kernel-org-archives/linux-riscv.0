Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD4C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:From:References:Mime-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W76WMQkeLhfxH8Z/+4uype0eScFX1IxQaecCDDIKnWI=; b=RmsdEX3ezNtl8h3h0WjDNtWbfS
	PE+YV/sXKPb2O5t0TEjfA6Qhz0bmlDdHEEPltlNUG7Br1XWTuaazSUgzj/7iIhTqlQKmBVLhjwOHm
	Bh/AC04lyu694vhsvDS1rAvggj6mpN5a98ELuF1NTkQYj8zDUF+KCxDCaUTvvE2XQ2y3DrXBYPw0H
	C+1zPakp2n6NPySguB9uziJFKmPXJg/BQ19C/puvZO4LFwjjNQPE32JEZMZ5MMEOwnj+lU0brOtSV
	2yReYcWNZmOis7TCFKxFyxW6RtJTtTVXXh2Zt/uVLkZtYl1Rtg2LYQ59I3ZXAlbYATw4JSV/atkzD
	F/Vn2dJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpmQ-0000000DeQu-3Om8;
	Wed, 15 Jul 2026 02:55:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpmK-0000000DeQ2-1jXj
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 02:55:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad8076b01so58994335ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 19:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084119; cv=none;
        d=google.com; s=arc-20260327;
        b=Hj9Q0J+Xs5+0EEe3amgtQh9LJ/Uh4L0HSjVqHg7iN10r4bWnx9V7sKxtBCKIoPbeq1
         7cOOZv7VzWZDlzaY6YszX13djpYFzkHkkjwVEyVsMC9f/Btp1IwI3ws/FbChABEw0qxn
         CQ6nqZiSjeWFSCAQrlyMS0r3ETRIivjMdwQsRiPHbAeyCZmnSaiz54ODshn+tEPU33k6
         zhcLamup0JsN3SYybU0Jv6MgMULfzLsDEbFggImsVxxrUJtlsbdZwWO01KZcRPF8hkLY
         tJpJLhNRqh2X5Mus5xpZsIFpxEmrrj9gdPDPZQe0+t+3eDJzN5K1XMENl6MgKOdqpUIY
         K69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:from:references
         :user-agent:mime-version:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=vW2uy7QsBaoMPGUNZjdCnBUo5ejV2wa0HTLExpsiykM=;
        b=afDNCQTdhokrJSClr5SnNoPMFh3/UydC6XEDm9Vv5pDLxSkMaYkc6tBuTVXDYgfRsg
         Vfv854NfeVMQWu1fjeA8kk4D12gE7wibvfQ0t2P92gKJbMJpPrFIb7MCWZjjLAVveIDq
         /74bmdYr7du3D0zuJxCkfvzjGroylujCD47S3IZ4/V2rO8Ozd7R47eFvyGIqJEssYtif
         zMD0k1AIa0UZ1MZ4YXcZtAo03Y6YF1r6NzHj0fyB+lZvsW1w3dO7eId4O6FWu6LMjoeh
         xaxjKkDxeXFQoK2YW1vWnbrSNZ9Ncz8x3uvqfk4+xlltdSaEgorQXvN9rj7W23LgvNnU
         JZYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084119; x=1784688919; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=gzFma33Zew/9ydm3ttDgnuCNMg9DJGEMVmGxK9bpzm5TpJ6vYEhWtIHh4aTniYDf92
         48SU3qlOjyfZLLKx28RwGS8h4EuTWyxpG7o/j6QrbFV1hHiLNb1l/J5FOeJVqmA+ojFh
         1AfTIHt2Z6qYKPnnrVDRMAW5wcl1GfKZdfMddgL7P+s7oGpcQm7GNeD6akxyM7a6Gv22
         o9Mg44tBYMQQpASK0KZXD1jod5P0UapGtEDpMxndnpXfU3oWYR9pUcTpxkrBRrV1Xzap
         nw7tJucH0rhEu7xEX1OTIhZtc3956dd4mmF2zZDzC/2nUDH2LX0llHcUmkRA+iWXge4E
         73sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084119; x=1784688919;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=JAkFSFo5ZAmF5BRckf5Fdc40RZn8zWmAkEFmboJ/cbUIBkvilW6IvnkxQ7daF9C/ut
         Laqt2BFdu2Z3bOH21fO6o1WdP+jF+PuGoFiHjPvSkxs+1759tcgsjoHzEkXB2xXTgj74
         FfTng1TFOhjuKWHMgjnAV79Zu904xzq/qd1dEo0L9OVdh+2IXPSeXbIJVZgVpRLoYQdW
         uWM2ekpJWHc1Cg/rQi0Nyodzudbbf4tMDZ269n0FtJyUlW5WSbcKlmaFzDlmWMQIdtvw
         m//7aYpJqa8MdejqgUngohzH4UqH5pDd70YDWmZziux7jG7qSn+mmmaMjtaqNYf4BFLt
         /J6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq46IKFv8WyKAFxrzxEJ4mQ7VHvuCcufUwSx5jeP3Emowr08dJnse7sNFx2YZIXDV4vGAXMqQ15Co+n1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKV8BV93peVwIuVNdBqQJKxrWcnqjul42G8/IYT/Ni6xkUveIo
	+Wi8URjvndz0LMSf1IBF+eMiNZRKZNr5rdVjhN2Rhvnn5919lZAlT1S5OHveTGGVbH3QXT+LBln
	d1FIb0blT8mD7GqM0XOSI5/n8COqnx/RPfx58OPN4YQ==
X-Gm-Gg: AfdE7cnexqAZMVguxz0iwybISAi0nIjNJ4VfyGk028dcSaJyjudFezrZ/ZoT6CVWylZ
	87DsHgNDadcGF/oaoTHQgHZKAQwkJJ21Az+QPAwm7deIHBz1ov61fB/fzcB/sQbRU8icvJD7meR
	CUmxTaLP6XveQNCdTbroa5AYZ9N/PPMhP3z2/Cj4VUCJ7p4AYCN38j0+eBrSoNpadZB9E8Rl+EQ
	0+kLBsOyEjO0wLOwQRzrnsSNFs+5BsHc6RHR32R3sazSp9EgpIh5UlhKnB/51lFqaeulmI=
X-Received: by 2002:a17:902:f64d:b0:2ca:5d24:720b with SMTP id
 d9443c01a7336-2cee9b82e93mr60194075ad.39.1784084119427; Tue, 14 Jul 2026
 19:55:19 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
Date: Tue, 14 Jul 2026 21:55:16 -0500
X-Gm-Features: AUfX_mwCsBOf_hgb5yUzS2yT7xbSqsn1sQG_-ZF1ldFSOzP_jx_ehBg3xh3TSj4
Message-ID: <CACnXVnc4T40uUJKViZH0dzp8=RBjgC08KG6Pjz8btjPJ+aiG8Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260714_195522_348507_FB74DF34 
X-CRM114-Status: GOOD (  13.67  )
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
