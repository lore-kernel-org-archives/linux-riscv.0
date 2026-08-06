Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D9CC55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 05:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+BuGwCsrMSTxDkesII3PMABeERzQAIH6XUFdMHxeqA=; b=Bwp8R3SmvTeyJB
	BkqCdC4F4U+QlHBTb7MZMejUKCQsY6VAWOf2QW+IQm1pr7MmtmPDAvqH6uvB4AyxQzljy3nHxfiqN
	R8lqiYTAmoC2E/6JLeQ0UKBxc/kEipO3SzXr54etIUD2ri2a1Z3rr2+jdoLV8O99Q5w8GYIHrYUTI
	s9Z4gBUaPCyr/HGe1UyDRdRjV6chZkh++YWEQo1YO+Xyk17G8wDyx1KwDrmBafEeq/3pUY8PMpEj0
	GY2eVb/iyHZ1yxTVyykCzp9n8U7PoKipVbDm4e1yIrk06ebrqmN+S/0cA5hTvNClufILH4N5U2awb
	EISaKA06Vd3vHZNHlQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqaD-00000004ydD-2hkZ;
	Thu, 06 Aug 2026 05:23:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqaB-00000004yca-38kE
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 05:23:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 347CD40C01;
	Thu,  6 Aug 2026 05:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17B71F000E9;
	Thu,  6 Aug 2026 05:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785993835;
	bh=nGUsqZ9RJANQTX4cFkBlQkPsf7GNKP6d1ba13+NtzNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxx1fg/O5f0UuVL1DBWUTFwB6czE67TjponNaQJ6hDBbO7K3J20+B+gtnpGtE2EHp
	 rAYyji6NuNaTUGeqF46kTwC2M7YbgXsjwKLvmeWuFfrx6RJwW8ThPiF9e3AlBewIdu
	 Yt58roYQMaKAnSMS6u4ntZnpmNXP5ntAEepXmcWQvZGKEvePNd8juzw+UHlNuwjUhc
	 +eg931sMy/6/d1swtuJORhOO74AZxy6WXG5pgjO/NGSCggG2H4xNnuYHqv/Ajilgby
	 dadyrRTqc3LSA0sWym7qXm1iqql6EANUinvBX3hPHY2ZA7RyixT1QTefSp8DKu0eCh
	 EkFhBAW/82RLQ==
Date: Wed, 5 Aug 2026 22:23:53 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: ben.horgan@arm.com, xiaqinxin@huawei.com, zengheng4@huawei.com,
	palmer@dabbelt.com, tony.luck@intel.com, reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com,
	pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
	corbet@lwn.net, shuah@kernel.org, jgg@ziepe.ca,
	kevin.tian@intel.com, cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support for resctrl
 device assignment
Message-ID: <anQaaQvpEXFTRYvS@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
> This RFC extends RISC-V CBQRI/resctrl support to external requesters
> behind a RISC-V IOMMU.
[..]
> Open questions for this RFC:
> 
>   * whether a common resctrl "devices" file is the right ABI for
>     associating external requesters with a resource group;

I think a separate file is the right approach to avoid confusing iommu
groups with pids. 

I should note that James Morse had an ARM MPAM "extras" tree [1] which
carried an iommu_group assignment interface, using the same
iommu_group:<id> format, but writing it to the tasks file. However, Ben
Horgan clarified back in March [2] in a reply to Qinxin Xia that it is
no longer maintained. Ben also wrote that the interface would likely
change upstream. I've added Ben Horgan and Qinxin Xia to the CC list so
hopefully they can chime in.

I plan to review the patches in this series further but I didn't want to
delay any further in pointing out the above.

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2Bextras/v6.18-rc1
[2] https://lore.kernel.org/lkml/d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
