Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10CC5AC67
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 02:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:Mime-Version:From:In-Reply-To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E3DHhoO+PnyxGtsvJnZLAVhSJSR+hTXkWr+IXV4/kOU=; b=lkzovXr9Ph04tui3Rc3LCbWC5M
	pWzAVPUajDV4HgjBxU/ZCUcqE/QkmN5dmq1t/Hu4/1pJysnX7k6qMjES+pw+G4zUP+SryxXpl3p9E
	jKi0+ptcr0jhtU0sdF+jNRyYJt3CVsFqrfY/dPrqqB3sUK2FeV/BOzTmbmRCcMWdgmk8kwc3CWxb0
	0cGqSQ6+qCDsdAAvB+OyTVJ2CceumUQDNunWQ6C5Sx9xFvjcV7AhsPS/pxGQut83B4TlxtWqd3pRX
	gzzBmDTfIEVh8cGhHbFp9KCawjevOKysGQRpz8wpx/GsWP8yBmtm96sZo/fxN8bQddWrVT2pYwmKr
	q3kZeoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyrg-0000000FHd6-41ZJ;
	Wed, 12 Aug 2026 02:38:48 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyrd-0000000FHch-2Hmr
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 02:38:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so4144311fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 19:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502323; cv=none;
        d=google.com; s=arc-20260327;
        b=QPI2r0JoxD7GOWFj5Aryh7MBoy8vydm5htpS6Wf18x9dluU+aDM9I3Q+mez+KAtZhp
         kV0Fr2s1I970yMx9VYXxi+DENcwMrtWEsWRrpXCAuHhl9CY/n1hwPa8/geSYnu4/zPVR
         zOmc+HLomzln9LiEafvo7fCja7/KUe2qm2P8ZTNfEhy2qiounf4FMCE/rrtxr2LWGMSH
         Guq8ty5nCSgNd/UGyc5H/LzQJsSozgPgwi3Wxo3/BRvZD6wgMPsestAMy0QHftlP4wAp
         z8RYuts9JaDtVQpUCUfm1Sfb6aq9Qx+zEoekzU7y/IVwDi2MOquRJNe4dmSFeRqIZRKA
         OYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:mime-version:from
         :in-reply-to:user-agent:dkim-signature;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        fh=rVQHOmLkNY8yieRFR3LTPVt5DO8vfZMN0Mq6+vyL468=;
        b=O5Crcgj8Xoep7PX7Ut6dKBpHAofVsoL9swNhXs0BA7Qb/m1f8uJT9PHc72+S1NzmDp
         WevsrQdCnt/VicrHvOyQO40A0UN182vz86pLAdBXRjkMC+NlK46sPovn2YF5guTkJuCc
         nfBnz37/mPfld72JCum95oPNyHwZee0DwlRS5fg3IyWiNPeM1UFJ1CwYAwTFVcFuueQ/
         HzUcCN3TJDVq899bqTZHNd+wb2GjOEB5BbKQTbUZHSxmRRhJwmioOJHifnbsrRl0RrX2
         3EN9GZbFdQNvJEHHFSoDE6w9FqOoEgJrQiD7woB0gDiCK88DpDWBotxAgNL3SrVd4HO+
         EF6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502323; x=1787107123; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=UaAJBmpqUB2X0mTAAK5t4NxewuLudayC2ljsQnuQqeX4w5uLwGYi4jDKD9XfeyAVGP
         8eGkvDPZlfBBCTid1VXJpv2g1RfpArT3yIebPFcodvropBG84ejKbM8IGET+2EaKuk/O
         fOf1o9sXG+v+1efxixc+xhNGTmI4L5w2OuLtWyLJPP9qvrbqoOHQd40vA2hMyyDnjsjI
         /QIfUaPiZFaQ5bd1SYqjdkD9G+CbgSjyT852l1Kpko5U9R/NyJoAa68PxF33aWVyfX0K
         JHBHxXXN9KDHPaSSjVlQ2nQkrF9o4Zoa/7ksfqk9gvU/o/BVqouDv4oh9GUCttMpjZgh
         Likw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502323; x=1787107123;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=O1FvYEvuN9mnRFBIK5BsVCdK2kofaKDZ9H+cOgMLv2fsezGeaOSVUjZhyhxJlTDMFD
         QT9DAEHhkvmXRiHedAWQ75JsOd1WqZ13pkNUccD9OB935rgNr402SzSvtLVLY039HbfN
         r2CGexC0JF6Wg+0UOXaNF3QBm/+MFJtkzWQAYWsSB75D9uKuHsPFh5omIvBAi1L2JpnG
         uMSsRyB9hMAPAH1nqgNRvR/ByAGrYo7tYsFgRfKiUYyrt5c/ogq2NpUNLE+GWPl2DGOl
         /jmt5pnq49A3t9XcqLwQMHKOuuO05PdZusHewD4Smu8cFY1ZypItieSwy3QEjjhgD92i
         DQ1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrw0137RLfgUfQzEvh161VDXiHlUCFzJst5sq/AcBJIfHt6LdmPkRhqJNcbBAt9veLgC+ookc+c3zG3SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxThx24dMuru6whLXZShwaAg0yzYdM04UHQz30ekaIF6cYWGr0E
	YD5D7MYPUZvTykMQ+uy+zpoou125R5uEFcjqPlNgupAD4kwhmVq+H3FRFf/dXAey6zcOBCPXN9s
	gCkLrHnEdt03R2yo0iFJrQyxZDxYI6FD9/yciuTRHUw==
X-Gm-Gg: AR+sD13NZ84P6YsELYzXdt0qZVMZj+mLpCK8/vffMOfC4Ke4hTh6y4Q+Ss2gvmbFJyH
	Do41+OxcRBziN/gmudcoRNs50+ju+yB72GxpZQT5PrPoRooI5as/OIJSI+63bdwIgsUnIXplt+o
	/F0CRCinKgZMYyN5M8ZFEbopO0kuErmyuI9EGSaG+YfMg84dxinkUmez4XPh1aIV9ks3LTppjUQ
	hH6vuvkRKAwA8lzhnf857bywG8Aw+9NsFbFhWI4bUNHgSolaBWrgilOGhIl9CCfd3q1m+D0xgGR
	+uFgU+KIYAbkSVoQFKn29UXfysp92C0/gxmFdmn2AOw=
X-Received: by 2002:a05:651c:b21:b0:39c:753a:853f with SMTP id
 38308e7fff4ca-3a10d18f514mr1416711fa.3.1786502323254; Tue, 11 Aug 2026
 19:38:43 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
User-Agent: Mozilla Thunderbird
In-Reply-To: <andiub47zsUsL4qh@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <andiub47zsUsL4qh@x1>
Date: Tue, 11 Aug 2026 19:38:42 -0700
X-Gm-Features: AUfX_mzVF_qtHGnSgVqubj7FrTSqgmuPuhnXiNhwESKsg66sjHqWMZRBEXVi9Ls
Message-ID: <CACnXVnd14LEAOfakzpasXnteaVfZo3nsH1a4fEjvHNOQ8bMeXg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260811_193847_038936_2AC70D20 
X-CRM114-Status: GOOD (  18.05  )
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

On 8/9/26 1:09 AM, Drew Fustini wrote:
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
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> new file mode 100644
>> index 000000000000..b0cd68997f17
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> @@ -0,0 +1,27 @@
>> +What:		/sys/class/iommu/<iommu>/qosid
>> +Date:		June 2026
>> +KernelVersion:	6.18
>> +Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> +Description:
>> +		The RISC-V IOMMU global default QoS IDs for this IOMMU.
>> +		The file is present only when the IOMMU reports the QOSID
>> +		capability.
>> +
>> +		Reading the file returns the RCID and MCID fields from the
>> +		iommu_qosid register:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>> +
>> +		Writing the file updates the RCID and MCID fields while
>> +		preserving reserved/WPRI bits:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>
> I think it might fit sysfs better if the rcid and mcid are separate
> files in that directory. Is there a reason you combine them into one
> file?
>
> Thanks,
> Drew

Agreed. There is actually no particular need to update the two fields
together; combining them was mostly a habit on my part... I will split
the interface into qosid/rcid and qosid/mcid in v2.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
