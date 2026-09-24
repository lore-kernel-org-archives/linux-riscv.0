Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5379CC98311
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPhmOXj4fKUyW9soMlFeSLdvtRYPU85abilY0TPtAQE=; b=AaCMC0Z9B93xPa
	L0iuaPpVyF+/V39EVBh46etTGQBvaqjNoJYgG7T5uumjffwHC1a+ThppIyvplgvp0OzvIcqzyIluU
	TM1lWzG0Wwp+BlNn9UF39lYcOuxKFFqpVoAZdIIxQbf4D2iQRGde+1c9uyoetL3eBwQe0ULe6Nw/2
	DwB0TKhILRectvTM/lFe7RfkVQ6Bnyyoeq9DWsJbMuvNEUZEFf/9rVXNYG4VLhk0xDh9EXF3z+WrM
	XJhrLTiOqPQu6yL/pxb0BlRDVFg/kcvka87s7ADBYifb4mKknx7dr6hDksB/Ymeuqpf93fhC7O8AA
	ugPmNszf3BJZ6SJhlpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fux-0000000AbDg-1RTA;
	Thu, 24 Sep 2026 09:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fuv-0000000AbDL-0pgF
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 09:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=La2WgGkXeOCLDku5PZRWghApIYA3HwsR3lOMbh3fClY=; b=oGg7PYKzSqzOGTAxv6f5DxcJXB
	7GOC+C8GssMPGYr9x0X3hmlo/z/sBoW09xbOccG/vIdkkKT6xGQ7429ZN4HbL0KJWCMaO7Weo9I/M
	LvRoBDTWUlLimXlnFAVjSxT2OvaMkir4GgPCMlOAaC6VVjKposJghj2G+pb4MoACn3MAh/LPFHEDE
	LaMxYdlrzmH67KCUTv3TGoIBggF7MiWgnPTFdQR1MSu1a5/YIxUAB9fncvVqP1NU8/Z1X94eqADHr
	WzoqcspIO7mrGksqv6I6258vVEX9+1q7cPaqI+oJi+AXpe3gcI5VNnPJ5yGIEPpKu0EzWIx7mJvqE
	1GGSDOuA==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fuq-0000000FnNx-17jq
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 09:39:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=La2WgGkXeOCLDku5PZRWghApIYA3HwsR3lOMbh3fClY=;
	b=ddknL9alzSFipJSLnblaGwF5rQi8x+BGNmJcJdltXxiULwZLmhqUDyTMCtgkdT/dyt5+8S8l8
	9tRq/kJOirkDWHEGl/egORSlQcsxDctkXnwRh9DX3owA/hmLJD2IFRYd4uavMVR/uspcbcj3toM
	o+Pwo44p0lc5wKU1noxwTPs=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hr7kk4XHKzpSy8;
	Thu, 24 Sep 2026 17:26:38 +0800 (CST)
Received: from kwepemo500007.china.huawei.com (unknown [7.202.195.114])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A5A64057F;
	Thu, 24 Sep 2026 17:38:38 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemo500007.china.huawei.com (7.202.195.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 24 Sep 2026 17:38:37 +0800
Message-ID: <2e0a4052-9e6d-497e-91ea-fbff59c27b8a@huawei.com>
Date: Thu, 24 Sep 2026 17:38:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Resctrl and I/O
To: James Morse <james.morse@arm.com>, "Luck, Tony" <tony.luck@intel.com>,
	<alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <babu.moger@amd.com>,
	<baolin.wang@linux.alibaba.com>, <ben.horgan@arm.com>, <corbet@lwn.net>,
	<cuiyunhui@bytedance.com>, <Dave.Martin@arm.com>, <fustini@kernel.org>,
	<jgg@ziepe.ca>, <joro@8bytes.org>, <kevin.tian@intel.com>,
	<palmer@dabbelt.com>, <pjw@kernel.org>, <reinette.chatre@intel.com>,
	<robin.murphy@arm.com>, <shuah@kernel.org>, <tomasz.jeznach@linux.dev>,
	<wangzhou1@hisilicon.com>, <will@kernel.org>, <yuanzhu@bytedance.com>,
	<zengheng4@huawei.com>, <zhangzhanpeng.jasper@bytedance.com>
CC: <x86@kernel.org>, <iommu@lists.linux.dev>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <arKx__kOPe4B5gDW@agluck-desk3>
 <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo500007.china.huawei.com (7.202.195.114)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103857_083209_6C2BD310 
X-CRM114-Status: GOOD (  67.03  )
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



On 2026/9/24 01:13:27, James Morse <james.morse@arm.com> wrote:
> Hi Tony,
> 
> On 22/09/2026 17:51, Luck, Tony wrote:
>> Patches for ARM[1] and RISC-V[2] are both at RFC status.
>>
>> They appear to be based on similar h/w capabilities where architecture
>> specific tags can be added to transactions from I/O devices by the IOMMU
>> servicing the device. Device enumeration is handled outside of the resctrl
>> file system.
>>
>> ARM docs say "the device name is the one listed under /sys/kernel/iommu_groups/<id>/devices/"
> 
> I think using existing stuff in sysfs is a good idea.
> (Creating new things in sysfs fills me with dread!)
> 
> ARM/MPAM also has platform devices that can add the CLOSID/RMID metadata.
> e.g. the GIC ITS [4] - a kind of translator for MSIs.
> 
> For these we considered just using the device name as found in /sys/bus/platform/devices/,
> in the hope that can be tied back to a struct device - and we could add a callback for
> resctrl to configure the device with a CLOSID/RMID.
> (but - I've not seen a use-case for this yet - those devices generate very little traffic)
> 
> 
> Robin M set me straight on the iommu_group:
> Strictly that is the wrong abstraction as devices are in the same group if the
> driver can't stop them communicating, e.g. PCIe peer2peer. This doesn't mean it
> can't tell the traffic apart for CLOSID/RMID labelling.
> I picked this because its the device granularity VFIO works with.
> 
> Equally, a device may create multiple streams of traffic, where only the driver
> will know what each one corresponds to.
> 
> 
> Using iommu_group like this may need a bit more thinking....
> If we can fall back to using a device as seen by sysfs, then the arch differences
> here could be invisible to user-space.
> 
> 

Hi all,

Thanks for the feedback and the discussion. The device_name ->
iommu_group -> sid mapping shown in the patch[1] is only one
configuration example. It may not fully exploit MPAM capabilities,
especially when multiple devices share the same iommu_group.

There are other possible configuration approaches, for example deriving
the SID directly from the PCIe BDF. I prefer to use the device directly
  rather than iommu_group, as that is more aligned with the MPAM
specification. I also agree that iommu_group is not ideal as a new uAPI,
for the reasons Jason and others have pointed out.

However, there are two problems with using the device directly:

Not all devices can obtain their SID via a device name in the same way
PCIe devices can.

MPAM actually supports SSID-granularity control and monitoring, but
users currently cannot obtain the SSID.


>> RISC-V says architecture specific device tokens are "devices or device groups"
>>
>> In both cases assignments are made with:
>>
>> 	# echo {device} > {group}/devices
>>
>> So now I'm looking at the capabilities of Intel RDT hardware. I'm ignoring
>> the implementation on the Granite Rapids CPU, and looking at what is described
>> in the RDT Architecture Specification[3]. Here are the highlights:
> 
> 
>> 1) Enumeration is split between two ACPI tables. IRDT enumerates device groups
>> and provides MMIO addresses to assign CLOSID/RMID to each group.
> 
> For ARM/MPAM - this would always be driver specific. The fields may be share a register
> with other things the driver needs to consider.
> The IOMMU abstracts this for its devices, but this is still something the IOMMU driver
> needs to know about.
> 
> A driver hook, with a drivers/acpi fallback would be ideal.
> 
> 
> Do you have arbitrary grouping of devices? e.g. a USB controller and the UART.
> Or would the grouping make some sense to the OS. e.g. all the USB devices behind
> this port.
> 
> Having the UART show up when you add a USB controller to a control group is a bit odd.
> 
> 
>> ERDT provides
>> MMIO addresses to read event counts for RMIDs and to configure cache allocation
>> bit masks and memory bandwidth limits.
> 
> Arm's IOMMU does have controls/monitors that match the spec the MPAM driver needs,
> but we currently have no way to expose them through resctrl.
> The caches on the IOMMU are also relatively small - I've not yet seen anyone show that
> setting the controls there makes a big difference.
> 
> 
>> 2) All I/O monitoring and control is with respect to I/O caches, not to the L3
>> caches that legacy RDT features operate on.
> 
> Do you have I/O traffic that can turn up in the CPU L3 cache? I think PCIe calls
> this 'cache stashing'.
> 
> Arm's IOMMU is the same - but the traffic may also show up in the L3 depending on how
> the system is put together.
> 
> 
>> 3) The number of RMIDs supported for I/O is lower (maybe considearbly lower)
>> than the number supported for CPU monitoring.
> 
> MPAM can have this happen - and today it will sanitise the values to the lowest
> common value. Considerably lower becomes considerably upsetting!
> 
> I'd be interested if we have an approach for this - the IOMMU designers would argue
> they only need one RMID per device - but the system wide sanitised value means they
> have to match the rest of the system.
> 
> 
> For MPAM systems this shape is a big headache because on the platforms we've seen,
> the monitoring is done at the memory-controllers - so any RMID spaces get joined
> up eventually.
> 
> 
>> 4) Monitoring events are I/O cache occupancy, total i/o bandwidth, and i/o miss
>> bandwidth.
>>
>> 5) Current revision (1.4) of the specification doesn't include details of
>> I/O memory bandwidth control (The "IBAD" subtable of ERDT is reserved for this).
>>
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
> 

-- 
Thanks,
Qinxin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
