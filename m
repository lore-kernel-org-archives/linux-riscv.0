Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81435C5CFC1
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 02:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:Mime-Version:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2nuZ5coOoxnA8GOpEONnpfSg2ePsTiu3h+z7Iif3XU=; b=h200jGrXSaWVCL
	ujw6hN0Y3+nr8dc3k+VoQW96tSfYNOCJyDInu0jwqnWXi55xXH5Cx4q/nkBG3XUMMh0OLj5y+HcK7
	cXCX0ckD8uNiJe73UvTS4PWgvevtvyIuyUImHEzyAShCipKE84D8jXc+AksAzVWtS5n3PBYuIZamW
	vZr7UundyGV8UUcGyhDyz6TriSipO8iS4YW5xqZu6oVko0DUQqAq+6kMQLBTDnWSYVur933KoJWPz
	EI4wbLMgLDiL1cxOgxmisKaY43X9TPIA0N1nftzeH7nn0m/d7SUD0TGVpchCqRtnkVZTwLuW8xpfD
	LMwOjk4epGrnbk9r6Ekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyvL-0000000FIJu-1Z7w;
	Wed, 12 Aug 2026 02:42:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyvI-0000000FIIG-0bNL
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 02:42:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5aec201b582so605317e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 19:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502550; cv=none;
        d=google.com; s=arc-20260327;
        b=kHpQQyRaZ8CavKy9LIdS25qDHsqptRShfQb8TuxfvZqepbmG5BTkFF1R+cBb+pxq+j
         h0Av7BtPWSN4GWKb/W0xFczUt8f4kTr9NpEbQtU2dMIrzMPp0lZkMW9IjI9HrCbOuoQe
         RPHbWJ0sgFT/EqdlMtosnCVRpyuImGoxXlXHz+qIUj2H7PeWIeGbOe8EkiKy4IMjCZ4F
         XgmIiUWHnaNuwvh5opXvHwITy5wCnkPMN5RvNshOZQ5xevlIqBoStpLBo6pGeMUWO8ix
         1t+rHjGKwEvWqyjiESDYBLNNMX022PZT13nrA6MbS/tg/HZ0kC5IO7d1/HG5gxQDWLcZ
         Gbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:user-agent
         :mime-version:references:dkim-signature;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        fh=nfg0NZFhVuHJ2Nd0ivGv24nBqPpAuWTged6oAwuZmOQ=;
        b=FKMlLDXZ+FUEArgQBA8+IO5Prw8D/o0TxHEBbgK56dX24IJJrfpoWNMltpCOobyoJW
         rp5LV6+5GQtwusjbLSjzVC5zHRZODW5LKs8e/fhAEIdSO6OVoaHd/7lw4AH/Q8dzczfK
         gaHzcrP3st7mFJcPEOUuQW4YLFjDeTlQEgVTj3YZBpzT1HlYOBRCoALbhhrH6t1zx9hr
         JCl+ztJyip6+7DtRSYQdYeJhaVC/dNHye0k4uGrX+alQbdz0zwka7ahSHhiEJvkkrrpH
         P2a+7hXLm5+6YUxHt+aRFdhbPnAlek9LUjLXHJCzN6IkL8nmgqIXUTZWeGadUwfso3dR
         aKvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502550; x=1787107350; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=ko4MDrVfTykWDsnfEmp8aJw1vdfFmSgUwz+hvMW3KGCbqknOcYnRqKCn+imKHF9uX0
         /8uSAlPwSPskNQOSYvWVZSTskIg81mT+TYRgny4Kt8SX4s0BF3T5JxS8WMK4sOrugLmn
         ys0jZRoJeV75f+8CcyvWG2RJ6nMvXl+ERYUkdQd0rydcBGcrBmq7kQ3PEdSda44tNbvn
         U5HIpQcONytWQ4fjNIkwvFkx0ra4/N/Ll7P+BWpP/X5nNdaLD4fD17GterNdgfwktkrz
         4NENXjU13yK16GIOGcsgG9qJvqNIpn+mOyC0kbGNzgxZGSilvA7u9IOS+p1NVM50Lvtb
         S1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502550; x=1787107350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=AmySgKyFDfq+6mlBzxDE0sxjU2RV25u4Q3a5mXiuETuO2P0utwirwwO2EJrqH63m3t
         LJtgw7omLAhfJkpNJaa//fB6IHB4qQOMB/BIbkyVf/vHvoamcfMFyNTJGcBx4dZoWzP2
         KqFnVA+2K6mAyw26ieg3O2xYFACuatPeZ6sCT7cZO6z2dYgYTOYe0txzcueqwJ28LJkN
         QQZf2RLQKOHC4+bs2mqz4Rz7ZOJUGbjR18U1pAXprDUJOv9KxseAaJ6gZHGeEdgjaxQf
         lNPLry5vW5OHiET7Zow8tzUmoo64T+noG8egfvNK8ZjkobydLGwcxAufEzZhU/UWGuGQ
         qChw==
X-Forwarded-Encrypted: i=1; AHgh+RrsDNwvwAJ7vo7A3gPdi8yWC7piJssiGXCIYdrlt3YzOwWkVVHgZkIoIWyjrNgJuCF8wyg/Il62IbQqAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoXQFs70LUbv95wkBJfKYCoZNg4rhUD9eWBZt43aXNn8dV2TtS
	skIjSZOVUo+gX9UePXio6Oiu15cfozXsyfM1ny6NeFHj5NDrmpJPevp2c4gcU7YmDQ/PIkL5zdq
	XzOX6bW3CvnaSj83lgA/W4WLtIHviC4HSdSbHnN0ZaA==
X-Gm-Gg: AR+sD13ZlVgSaDqn2nAnvoMxxPQn5bewRLraM4eM1xePHPpab78MsELIjKedyRZWcNN
	Bfs1RKMuDx/4ISFi9M0h70bsED0wFnHnqWXQIMC54Jg34c4+1qvZdoYmca88LtbyL1DjUOxSb7f
	N/orMvaXjh8yHvCV0SX03wx1sPsI8qje+JWjytiyyNA7DXFkC8rZ6wKDnssdqOrMFvKcUEtFRiO
	uT7KzJ558zk+KzQC2K/KhKV+Pjd9FcfONLIu6TBt/8jbd/tYAN8qu3dRT4Du1sL07kSUze07634
	W6w1LHXFti0kEhgGUwQ9zbdzXpMrHmE9zKqWn4XDVt5mcA==
X-Received: by 2002:ac2:4c52:0:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5b44e2d9076mr214876e87.15.1786502549982; Tue, 11 Aug 2026
 19:42:29 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <anuSdFS4Enajdqff@x1>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <anuSdFS4Enajdqff@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:42:29 -0700
X-Gm-Features: AUfX_mxVuesSQBbvklGRHcVkXo5XtC5KWv0jTTFlxpw_NNWMsenVNQ5v5yGezCg
Message-ID: <CACnXVncPrZms8PMJYbK58PEqR_mFzNxG=6CsziQCi8QCyr4eHg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] iommu/riscv: Expose global QoS IDs in sysfs
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
X-CRM114-CacheID: sfid-20260811_194232_312912_C5B7BD6C 
X-CRM114-Status: GOOD (  13.69  )
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

On 8/12/26 5:21 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:55PM +0800, Zhanpeng Zhang wrote:
>> The RISC-V IOMMU QoS extension provides iommu_qosid as a per-IOMMU
>> global default tag. It is used for IOMMU-originated DDT, CQ, FQ, PQ, and
>> MSI accesses, and for device-originated requests when DDTP is in BARE
>> mode.
>>
>> Initialize iommu_qosid to RCID 0 and MCID 0 when the hardware advertises
>> QOSID support. Preserve reserved and WPRI bits with read-modify-write,
>> and use register readback to reject values which the WARL fields do not
>> retain.
>>
>> Add a qosid attribute to the RISC-V IOMMU class device. Reading returns
>> the current RCID and MCID values. Writing the documented
>> 'rcid=<rcid> mcid=<mcid>' form updates both fields while preserving the
>> other register bits.
>>
>> Keep this interface separate from resctrl group QoS. The sysfs attribute
>> controls the IOMMU-wide default, while resctrl device assignment programs
>> per-device DC.ta in translated modes.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +++
>>   MAINTAINERS                                   |  10 ++
>>   drivers/iommu/riscv/iommu.c                   | 159 +++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h                   |   9 +-
>>   4 files changed, 202 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
> [..]
>> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
>> index 2c57625637bf..13ea67b7e42d 100644
>> --- a/drivers/iommu/riscv/iommu.h
>> +++ b/drivers/iommu/riscv/iommu.h
>> @@ -12,8 +12,12 @@
>>   #define _RISCV_IOMMU_H_
>>
>>   #include <linux/iommu.h>
>> -#include <linux/types.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#ifdef CONFIG_RISCV_IOMMU_32BIT
>> +#include <linux/spinlock.h>
>> +#endif
>
> RISCV_IOMMU_32BIT does not seem to exist upstream and these lines
> to just be deleted later in patch 6.
>
>
> Drew

Oops. These lines are leftovers from downstream code. I'll fix that.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
