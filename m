Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE94CA9EDE
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:Mime-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VsdydGWm0FIDgj3Tc7NzCetE3glWWykzpftaPcDCQsE=; b=zc0HrrUHW0K/WirYrnO0WkTjhg
	wmcIKDjV59I0E804aUHWu0TDNSk6586pOXZQC+almunXC2V0Z+mPyNhN4KCszSN0lxL67xHNZMHlq
	NXQams4rT5CKc8+F5OD64KqbVsLApqWM52yzouq3VT2SrmVezSJUsxpF4A44UTM7udiTc1R3o+qGo
	xLxlvs7rAOTc4ygNeGL+DyUHNy8u2nuOq1LPpIBYxFlaWAu+uvluLVUOdXm6T3Fck7z3wF6sAG/JU
	1QgFqGFiGsx8ESJUsQvefqOQ5RSRD719vh1wAZqZ0gjeMIfNpSj4bQToQ4q1KdJYpfYfqE194dZY0
	kQ+wch9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCQ8-0000000GlNX-0fp3;
	Thu, 15 Oct 2026 03:46:20 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCQ4-0000000GlLR-3Fj2
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 03:46:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso4387552e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 20:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792035971; cv=none;
        d=google.com; s=arc-20260327;
        b=XQB5tXuwbCFfg6mDaWYtKw/zujEAg8okqOv6Fuds5prnw4yDem0+g2ydh34iJ6+I5+
         XswK/bGE/hytkLs+k3slybaUhGF/ATY1mJ45PRalMMxbx6UtRGFTdWMOfZmqhxtNZ/3C
         xceol8kkwc17G+1UJ/i97N5lcUvm/jKQrFewb8z5HRD9al2LdddQanosrhH+sTWjuzp1
         LFrILAuIRgEATO+j5QYeLCT0kL5MXMmlovkPOUck5TY/Hli1z+4jdnVFJG8J+m0q99It
         XC6o3fM8pWFZ2ZgkX+3g1tYh2/EsqWsl8UaPzfqkRdXlcXOrUVUclXzKRmSVUaVPE3tQ
         XXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:user-agent:dkim-signature;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        fh=yAUBYeC4KB7w69GZjOB4yZ3iOeH/+Fcu6YICBKvxAGY=;
        b=EN8Cq4FNPEWkpn36zg9QUNjKUM3JPJo6EOuP1PrmKrl1D/qkDl+Gj8cHdtX6CRie3y
         u1EUA3TagnxYuf+5aXELhn4v8FQc4hUuo4F5z3KBxCKzrR/3lVbsnRC2SgAJ6mn+R7tR
         H9FMPK7kMJs9w/FLHXeU7KM5ThcHIZPBnoVCmthLNtrZIq+5XhBxyLmmwmWCP4HzGs7N
         C2wGNWF7z/3gxjIDrQzRn5xT9N3P3rjiSM5GAXiG3YY55yRfT9bxARkyXsPzSc83KB+o
         FSLVI4XfqdpGQqAfsQKmGg+kFK6Mxa/jop4/0nH664jBzCR+YM2v6gvQo2YifGaTfdMr
         NAQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792035971; x=1792640771; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :in-reply-to:from:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        b=hDATbTxbAu1osKHGdAhWotWCinVZNPpvDT9aXoQ+4YDbeigPywxhMKN6JWzz2h8E5g
         LIR2/63LSo/7bbmKM7vRtiH8flFj9++W4q7kmsWX3WEqso9FRyjIcyHHaSHiNpwxZpW1
         9xcz8B6PjDjSKyXRi5x9k9M+Pb+e1hAcuSPNNIOvkuUp5pV/k2R7xwV67SxfTLTCqGex
         u520nh97ni+nFtS5qXfwBdmadRuPPzAZC+aqJwsJ8gEafP27KA1kOi2OMuc4gExYLVLZ
         k+0sJechX8FGJVpBWfUE76fOCK7TJFbP83RohrkyPtdb04knMAIEDk5nv1av+shK7E/N
         Q9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035971; x=1792640771;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :in-reply-to:from:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+21BlRaonYej0puQeH33HEePTVzDShA+6xV7c9sZ/A=;
        b=2TNvG8wKART/o/cl11oL/ioAv6d7aXx2+UPruhftaV0OorNuQRsby8Ur738+Te5RrB
         wWyqY0F7M0wstdWjpsuogagQrUddRM22Z5yqWoaSbQHYLxjoeYa+PsYc+LsTjrOc1ys9
         hRz/ciuiQszUMSRFe14l20YV9+CR21SGaJ1J6XfCqfDxDtOi0rDcm3p6zBZxuX/oxZUC
         cXAF75EKp5d4wUwn+41c5Lq7Fv8JkwYx4/4FgfHClWjiXfTOxiDd/CZfDf2ppVnYfGs7
         R6KZFv/9QOYYSZi0EG5L2yT6nJjwKAjlRZTELT13H8AC3c4nlQLOr5GEHEbABBVCz8+w
         xDFg==
X-Forwarded-Encrypted: i=1; AKwUvByu2g117KvCCppDEPXAlLP2skXthhRPiPZNS0EbbD5tPNS4JRYLeouUDaz/jk6+5xdV0WAwOMlhEDGnBg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIWNSEi4Z//6l4X74yjWELvedzDDcoilDB/C+LeiTq7W1k9zNdL
	l3y8xbfF5VU6rz+y7vLvsTCNL7+zhWpt/979tgZ66cT4Nh5mfz+BJmYLtD4N2X+1+hTtNmMJD/z
	nJkMlCtF9pBPoNK4+Lp4HSomU/k8EAC1M4Ag/1YaZTg==
X-Gm-Gg: AYBFou3ULaJzauI3Z96yqwq8lJnDIcBb07+FBCNnoksU3nGl/0Me3nNB8LZuIOJbvkj
	YKWBMLzXWRwCdaxrPBkL61U/b+hG8hgeFWWKSXSWgkHYlGAziNgSp7W+YJdg7bBx2SQowD1OdSy
	gcX3q7qu7qAjzoIfiVAs+UJqNc3D44MDQLqKvRgeFh3CXf7ruqhkxGo7qVQ3iFXzCzky6q52mzm
	ttmNLNy44bcsS4BQ5Bi5LbVFemzapDpUYkE5KgbqOLlCDOc/vXiKGU8oiM/sR9RIsXWS0AaeLpA
	a7mYCVFstXMST8YOvSaxSZDPFHl7oY2NLgsgm+sj+zmG5JtJOWk1Z94J
X-Received: by 2002:a05:6512:3c8c:b0:5b8:f52b:8119 with SMTP id
 2adb3069b0e04-5bcde6c3488mr6491386e87.28.1792035971468; Wed, 14 Oct 2026
 20:46:11 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 14 Oct 2026 20:46:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 14 Oct 2026 20:46:09 -0700
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Mime-Version: 1.0
References: <arKx__kOPe4B5gDW@agluck-desk3> <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
Date: Wed, 14 Oct 2026 20:46:09 -0700
X-Gm-Features: AclHuK-ifaTyE672LcfsNG1D0uvyO2aZ3Fent-KaK1PQbFh3W9LBjWXPCPycr_o
Message-ID: <CACnXVnfJvJXm58TRd92q0j2FuAt8=SYLvXn_8aYk9qNoBFj+Zw@mail.gmail.com>
Subject: Re: Resctrl and I/O
To: James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Luck Tony <tony.luck@intel.com>, 
	xiaqinxin@huawei.com, reinette.chatre@intel.com
Cc: x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com, alex@ghiti.fr, 
	corbet@lwn.net, tomasz.jeznach@linux.dev, robin.murphy@arm.com, 
	fustini@kernel.org, baolin.wang@linux.alibaba.com, aou@eecs.berkeley.edu, 
	pjw@kernel.org, linux-kernel@vger.kernel.org, babu.moger@amd.com, 
	wangzhou1@hisilicon.com, linux-riscv@lists.infradead.org, will@kernel.org, 
	joro@8bytes.org, kevin.tian@intel.com, yuanzhu@bytedance.com, 
	cuiyunhui@bytedance.com, zengheng4@huawei.com, palmer@dabbelt.com, 
	shuah@kernel.org, ben.horgan@arm.com, Dave.Martin@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_204616_886639_4455C374 
X-CRM114-Status: GOOD (  67.67  )
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

Hi all,

Thank you for the helpful discussion, and sorry for the late reply.

On 9/24/26 1:13 AM, James Morse wrote:
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
> >
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

I agree. DMA isolation groups do not necessarily match the granularity
at which QoS IDs can be assigned.

> If we can fall back to using a device as seen by sysfs, then the arch differences
> here could be invisible to user-space.
>
>
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

Building on James's callback suggestion, could the driver responsible
for tagging register supported devices with resctrl? Common resctrl
code could manage token lookup, group membership and assignment
cleanup, while the driver supplies the ID-programming callback.

For illustration:

     static const struct resctrl_device_ops iommu_resctrl_ops = {
         .set_ids = iommu_set_qos_ids,
     };

     /* After the device's tagging state is ready. */
     resctrl_device_register(dev, &iommu_resctrl_ops);

     /* Before releasing that state. */
     resctrl_device_unregister(dev);

For IOMMU-managed devices, the IOMMU driver could handle registration
and the callback, without changes to individual endpoint drivers.
We have an early PoC along these lines, but it is not yet ready for
an RFC.

A full sysfs path would identify the device unambiguously, but can
be long and cumbersome to use. Perhaps a bus-qualified device name under
`devices/`, such as `pci/<BDF>` or `platform/<name>`, could be an
alternative?

The token format, sub-device contexts, hardware-defined groups,
differing ID limits and detailed removal/error handling remain open.
I would appreciate your thoughts on whether this could be a useful
direction for a shared interface.

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

Regards,

Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
