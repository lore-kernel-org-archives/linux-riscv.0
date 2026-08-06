Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C7C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIxyCL5x2JjrhvwctAjra1uf6PTuo7FLRy7NyEp49A0=; b=41lb/c8bZVV1Ma
	YLnLgW+USLjlEbc4OxGBjNfovWz1BjCQIv2Y38DSRyNT9mDWfvfaNy3PDzivAWUEeYGNEMuf0n2LX
	G257v8uz9p9wcFtJHR+oXDM8tuHds6jVWW2Jx8QwgJwd8n7pPuzxokgmtnJ9t8Hu8DdVWCohlQ3Wq
	l7uTeb0hjVYQ2/S1nbkRBiJZT0VqkGhiPECKjBiIlD+YuKbJ1NB5RydPGf4Z+zzwEdswGehvDuRcj
	z57r7SiMt3pzZVF24PkTzbl6S71mi4lDK+j2a1dELhAOgehfRoPOX73L3iVt50CVaAoUXRVmxpFTK
	JUHrgB7R7m+0hrLPV4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtgK-00000005GaP-3jVJ;
	Thu, 06 Aug 2026 08:42:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtgI-00000005Ga1-03IF
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 08:42:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8811153B;
	Thu,  6 Aug 2026 01:42:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F433F632;
	Thu,  6 Aug 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786005742; bh=1XZ52c7N7R/7ik+1Q56O2gFc7n1LYmIvcHRd9KWsOdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vk3YFbseN1J/KkpXJV6XxeMhp8z09cM7QKEaGOWthnB2rK15LrGgVvARUQKfSIB3A
	 q+/JfafIf6kUrbpn/GxsrT0SfxqyDag4S4foyW9/Kksq3ryx9lyhrhSqMaGBY5RWAa
	 Z36t681xIH1xquFeoaBivxQxzxvg4wMqdvfwdNBs=
Message-ID: <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
Date: Thu, 6 Aug 2026 09:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support for resctrl
 device assignment
To: Drew Fustini <fustini@kernel.org>,
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: xiaqinxin@huawei.com, zengheng4@huawei.com, palmer@dabbelt.com,
 tony.luck@intel.com, reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, shuah@kernel.org,
 jgg@ziepe.ca, kevin.tian@intel.com, cuiyunhui@bytedance.com,
 yuanzhu@bytedance.com, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <anQaaQvpEXFTRYvS@x1>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <anQaaQvpEXFTRYvS@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014226_447685_923EE554 
X-CRM114-Status: GOOD (  13.34  )
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

On 06/08/2026 06:23, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
>> This RFC extends RISC-V CBQRI/resctrl support to external requesters
>> behind a RISC-V IOMMU.
> [..]
>> Open questions for this RFC:
>>
>>   * whether a common resctrl "devices" file is the right ABI for
>>     associating external requesters with a resource group;
> 
> I think a separate file is the right approach to avoid confusing iommu
> groups with pids. 
> 
> I should note that James Morse had an ARM MPAM "extras" tree [1] which
> carried an iommu_group assignment interface, using the same
> iommu_group:<id> format, but writing it to the tasks file. However, Ben
> Horgan clarified back in March [2] in a reply to Qinxin Xia that it is
> no longer maintained. Ben also wrote that the interface would likely
> change upstream. I've added Ben Horgan and Qinxin Xia to the CC list so
> hopefully they can chime in.

I haven't thought about the interface much but Reinette let me know here [1], with good reasons,
that we should consider the format of the tasks file fixed.

Thanks,

Ben

[1] https://lore.kernel.org/all/f9b08563-4958-4f3c-ad6c-1e7fa3047896@intel.com/

> 
> I plan to review the patches in this series further but I didn't want to
> delay any further in pointing out the above.
> 
> Thanks,
> Drew
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2Bextras/v6.18-rc1
> [2] https://lore.kernel.org/lkml/d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
