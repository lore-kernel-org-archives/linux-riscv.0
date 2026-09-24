Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11402C98311
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc7DknwoqQ7Ds99lAH8Xf4uXv09sTPMkFDCwEK0SvO4=; b=lMINHBGQhJwgR6
	OHbpCxHz4E7MZ/yG6R/RcGgC5FQiwdEwv1QaGhfQs5Zf/sLb9Z4aMyAAiMV8/BVwrxN4tPiIL0yBF
	8VJWkIywQFDykPrfBxZA3/wP05h/uEkA7FLlwZujnmxDSgnctztkMYXE0hP3qLqn+DaRzyugcqga7
	QXVUppX8cO3tkksXqLhOF3xNj00COiDpjWa8VpwO9w/fGVHYKAGbbWLZUzLp/kBgcQcSHNigXU2vx
	RyWbJuUTsR2eiqkrUDOs8SN9KSYHcDoTxg5sJCxTD8cGyOjkqwALfpAz7U9GgMSOKvbRfZkxCZqbC
	oRE12qqagBAkuGHzeHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fwK-0000000AbtG-3f4h;
	Thu, 24 Sep 2026 09:40:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fwJ-0000000AbsW-1UI5
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 09:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a96LkkmuXFGGVYfJXyIQixSkn7JQ3ktxkpeKhGb7ILo=; b=piPuOMaMlsO1/hCRK90i+tqIYe
	Ys8eYkSmDFNWN8eukKvk+eu5C+51Jj68al5slsuT3gl6ihDFF+7YIb1qsdtawpM+cCkNgfsI1n9P7
	sCWhMx/XKBcxbF6uHaJPJ43KrtwQuLECpUxvU9yGx19N8QrPHyhF+mEKhjGwSw6HFXGRUaViXEpn0
	in0H+Scuzmg5Mi2D4axxeGcmuiNe/Li+70kRdQBNcCkloqfDOMCt+iCx2mDNMgXw6sTBE+7lXfLoN
	eJhUjikQ/7z4dI711EI4pMLO8+zM78R68nMjj1viN1CzdqiRzopJGCAzLbMRllFb8MXNIcdfCsHul
	fOs2uLYw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fwF-0000000FnVF-3rx8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 09:40:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0324F1477;
	Thu, 24 Sep 2026 02:40:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D96F3F86F;
	Thu, 24 Sep 2026 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790242821; bh=ytV70JGtueyA9wVEFGvsbYuPa11Ur11sihpGQa0sFKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PulG5RP9pNTf+khs8603GELGSzUZxwkXLCow3DrOvxJjyciAOFENLHzscInC/KF1N
	 diLHF2hdmJLbl/4+YTR+/vWWWkwVpRTEg4briEAA12H0Sofy5lkYEzj2jzZllg9uGh
	 +d68h9dMmwTbLBOM2QhRIYl0oQtDJYa2rZrtuGN0=
Message-ID: <6b39d774-461b-437a-8449-768092af2726@arm.com>
Date: Thu, 24 Sep 2026 10:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Resctrl and I/O
To: James Morse <james.morse@arm.com>, "Luck, Tony" <tony.luck@intel.com>,
 alex@ghiti.fr, aou@eecs.berkeley.edu, babu.moger@amd.com,
 baolin.wang@linux.alibaba.com, corbet@lwn.net, cuiyunhui@bytedance.com,
 Dave.Martin@arm.com, fustini@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
 kevin.tian@intel.com, palmer@dabbelt.com, pjw@kernel.org,
 reinette.chatre@intel.com, robin.murphy@arm.com, shuah@kernel.org,
 tomasz.jeznach@linux.dev, wangzhou1@hisilicon.com, will@kernel.org,
 xiaqinxin@huawei.com, yuanzhu@bytedance.com, zengheng4@huawei.com,
 zhangzhanpeng.jasper@bytedance.com
Cc: x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <arKx__kOPe4B5gDW@agluck-desk3>
 <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104024_518193_405D7479 
X-CRM114-Status: GOOD (  39.62  )
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

Hi James,

On 23/09/2026 18:13, James Morse wrote:
> Hi Tony,
> 
> On 22/09/2026 17:51, Luck, Tony wrote:
>> Patches for ARM[1] and RISC-V[2] are both at RFC status.
>>
>> They appear to be based on similar h/w capabilities where architecture
>> specific tags can be added to transactions from I/O devices by the IOMMU
>> servicing the device. Device enumeration is handled outside of the resctrl
>> file system.

[...]

>>
>> Fitting this into resctrl
>> -------------------------
>>
>> RISC-V description of "architecture specific device tokens" sounds great.
>> I'll have to find some ares of /sys to provide the mapping of tokens to
>> "device groups".
>> There's no association with IOMMUs, so this will be some
>> other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
>> from ACPI IRDT table.
> 
> What about using the device behind the IOMMU instead? Presumably the kernel
> could allocate ids that don't clash with those in the IRDT, and use those
> for the IOMMU.
> 
> 
>> Need an info file to tell users the format and source for device tokens.
> 
> I'd prefer we have one consistent way of doing this across architectures.
> Especially if we're going to add something new to sysfs.
> 
> 
> The sysfs path probably covers all bases - but I wouldn't want to parse that
> in the kernel.
> 
> 
>> I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
>> number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
>> events} files in resctrl group directories when rdtgroup::mon::rmid >=
>> num_io_rmids? But that feels clumsy.
> 
> I had a half baked idea on how to do this. (which Ben has poked some holes in)
> 
> Assigning a device to a ctrl/mon group needs to be able to fail. We can use this
> to re-allocate the RMID into the range the new device can use. The CPU tasks can
> be repainted to use the new value - but the obvious problem is the old data in
> the caches that uses the old RMID.
> As no new traffic will be generated for that RMID, it might be possible to keep
> it associated with the ctrl/mon group (which would now have two RMID) to keep the
> user-space view of the counters correct until the old RMID falls below the
> reallocation threshold, and it can be free'd.

One limitation, "hole", is that it relies on assigning your devices early. If you've used all your
rmids and then want to assign a device then that will only succeed for a subset of the monitor
groups but you don't know which ones. Then you are left with trying until you see what works,
peering into the debug interface or just remounting.

Thanks,

Ben

> 
> It's worse if we ever needed/wanted to do this with CLOSID. Two CAT bitmaps
> can be configured the same - but MBA doesn't alias in the same way. Tasks would
> be able to burst higher than the configured limit - but the size is limited by
> the size of the caches. And if no new traffic can be generated with the old
> CLOSID/RMID, then the effect can't be made to last forever.
> 
> 
> For a totally wild suggestion (that I don't think works here) - I had
> mooted having a second mount of resctrl for islands of the SoC where the
> properties are different. I don't think it works in this case as the IO-RMID
> presumably gets seen by some other monitors later.
> 
> 
>> Domains are based on I/O L3 cache instances. So a new rdt_resource with
>> new line in the schemata file for IOL3 cache masks per domain. In the
>> future when there are I/O MBA controls, new line(s) for those too.
> 
> 
> Thanks,
> 
> James
> 
> 
> [4] https://support.arm.com/documentation/ihi0069/hb/?lang=en search for "MPAM" in the pdf.
> 
>>
>> [1] https://lore.kernel.org/linux-iommu/20260901140802.1215508-1-xiaqinxin@huawei.com/
>> [2] https://lore.kernel.org/lkml/20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com/
>> [3] Linked from the bottom of https://www.intel.com/sdm under "Related Specifications", or
>> direct link: https://cdrdv2.intel.com/v1/dl/getContent/789566?erpm_id=1158389_ts1790091453223
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
