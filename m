Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F66D61006
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oFfa1MApSd7/UjB/B0LXSgxlZYVYfxgqz0DNLin1V4=; b=q14C2ARE4jCuhs
	OTqnQozO7Ysy2DixlfkORGPTsmOwsXX7HsK7ee26WLiAJw2f0N6QXJLjAt0IhfMekAjlSfnm2j8zl
	OfgXi8wOA6oEd5Zr76NzStgUtR2V8cRYYdeKmeRVUEj4SGn8I//96VwcRQlA6gZkjh8rKPOj2r+Ap
	TZ91kgFTgQtyR2lXGqtUpCACliBGAgDuj2YM/THuPmX8GxAodWvK6HiX4HoWwOxqqCK071gNjQhkM
	rPePbmcrb+iyM/ZxDouoxX9U3NaE6b38Xm4YUghs3f9+R+eOt0WTVsA9nX4nJVcZGSRxlDveu5guc
	ga0RPf4MwmjWBUdugf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQ65-000000002gc-3tZv;
	Thu, 29 Jan 2026 11:22:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQ63-000000002gJ-40PV
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 11:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFB41516;
	Thu, 29 Jan 2026 03:21:52 -0800 (PST)
Received: from [10.57.51.104] (unknown [10.57.51.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D53883F73F;
	Thu, 29 Jan 2026 03:21:55 -0800 (PST)
Message-ID: <b1b220be-fd5e-4f83-8f5e-7d5282be39f9@arm.com>
Date: Thu, 29 Jan 2026 11:21:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>, Vincent Chen <vincent.chen@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Will Deacon <will@kernel.org>, lihangjing@bytedance.com,
 Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev,
 xieyongji@bytedance.com
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
 <20260122153134.GO1134360@nvidia.com>
 <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
 <CABvJ_xhY_4ADOsVVbjhkBm8U1mKVOSwzKMfBw5mUsJe=kkUiLg@mail.gmail.com>
 <20260123135234.GW1134360@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260123135234.GW1134360@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_032200_043330_A3FB96B6 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

On 2026-01-23 1:52 pm, Jason Gunthorpe wrote:
> On Fri, Jan 23, 2026 at 08:29:01PM +0800, Vincent Chen wrote:
> 
>> With this codebase, the IOMMU group type is now correctly configured as
>> DMA:
>>
>>    # cat /sys/kernel/iommu_groups/0/type
>>    DMA
>>    # cat /sys/kernel/iommu_groups/1/type
>>    DMA
>>
>> I re-ran the iperf3 test in this environment, and the test passed
>> successfully.
> 
> OK great thanks alot!
> 
> I'm surprised it doesn't say DMA-FQ, someone from RISCV may want to
> investigate that, it is probably reducing performance..

The driver does not advertise IOMMU_CAP_DEFERRED_FLUSH, as the existing 
pagetable code has never implemented the conditional TLB maintenance 
optimisation that makes it meaningful. Mind you, I don't see any 
reference to iommu_iotlb_gather_queued() in generic_pt either, so I have 
no idea how that's trying to do it :/

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
