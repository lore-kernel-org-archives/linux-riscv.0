Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B19E7DEE0
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8naW18xgC+GLPmXd/9E08dmJoh0TihtMNWygWKYdsf4=; b=03qGs3vSNtoiJr
	GvyVR+D1bW+ckR14/MPUJWJn8r+Kubfaiq47+PWE3ijpy1M07L1rsCEFCy+YsKlcItfiTMB7a+o4J
	pka1xP2R69jy7H4JcwT8mQvGuXhYIIPBGRb+UVQbkNAL8sI3RPAIW5ibgyrSYenYwfK+/9SBisr7m
	u26Zh9vLlf14UzMid1RO4SOPJv/5VgsRWGoA2LsfP3Vg883FG9DwqZrCYdfc8Q8yJ2SrDlXmqW6th
	K4WdQpQpElp9RS4jtPboePfQXk55qIZfY4wbWVmf8yXKAvcmc9NHKNt4kgo28UZJqUOn44ot8NQKs
	pK68aHJOJQVJ1oiGCCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuTU-000000053uS-12et;
	Mon, 02 Feb 2026 14:00:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuTP-000000053td-1QIN
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 14:00:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054EF339;
	Mon,  2 Feb 2026 06:00:06 -0800 (PST)
Received: from [10.57.54.50] (unknown [10.57.54.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B759E3F7A6;
	Mon,  2 Feb 2026 06:00:09 -0800 (PST)
Message-ID: <8c46864e-4625-49f4-90b3-a7467cec8b7b@arm.com>
Date: Mon, 2 Feb 2026 14:00:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vincent Chen <vincent.chen@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>,
 patches@lists.linux.dev, xieyongji@bytedance.com
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
 <20260122153134.GO1134360@nvidia.com>
 <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
 <CABvJ_xhY_4ADOsVVbjhkBm8U1mKVOSwzKMfBw5mUsJe=kkUiLg@mail.gmail.com>
 <20260123135234.GW1134360@nvidia.com>
 <b1b220be-fd5e-4f83-8f5e-7d5282be39f9@arm.com>
 <20260131002728.GM2223369@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260131002728.GM2223369@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_060015_695524_F499F975 
X-CRM114-Status: GOOD (  25.57  )
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

On 2026-01-31 12:27 am, Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 11:21:53AM +0000, Robin Murphy wrote:
> 
>> The driver does not advertise IOMMU_CAP_DEFERRED_FLUSH, as the existing
>> pagetable code has never implemented the conditional TLB maintenance
>> optimisation that makes it meaningful. Mind you, I don't see any reference
>> to iommu_iotlb_gather_queued() in generic_pt either, so I have no idea how
>> that's trying to do it :/
> 
> Well, correct me if I've got it wrong..
> 
> DMA-FQ always does flush all, so the goal is to eliminate redundant
> flushes from within the page table logic itself.
> 
> DMA-FQ requires two functionalites from the page table:
> 1) use gather->freelist to avoid a HW UAF (iommupt always does this)

Nope, correct DMA API usage would almost never unmap an entire table, so 
synchronous non-leaf maintenance in that path still doesn't hurt DMA-FQ 
either (e.g. io-pgtable-arm).

If a pagetable implementation wanted to refcount and eagerly free empty 
tables upon leaf unmaps, then yes it would need deferred freeing, but 
frankly it would be better off just not doing that at all for DMA-FQ 
anyway (as IOVA caching would make it likely to need to repopulate the 
same level of table soon.)

> 2) avoid internal calls to iommu_iotlb_sync()

More like avoid issuing any kind of inline TLB maintenance at all, e.g. 
for SMMUv2 the significant work is done up-front in 
io_pgtable_tlb_add_page(), so only skipping iommu_iotlb_sync() would 
have very little benefit.

> When the gather reaches __iommu_dma_unmap() it discards any iova range
> inside it, queues the freelist, and queues a flush all. So any flush
> implied by the gather is removed by the core code.

Pretty much - the freelist is handed off to the FQ, which will only 
release the IOVA range and free any pages after completion of a 
flush_iotlb_all() at some point in future (iommu-dma still knows the 
whole IOVA range it unmapped - gather->iova is only for the actual 
gathering of TLB ops by the IOMMU implementation itself)

> iommu_iotlb_gather_queued() should be used in the page table to
> supress any internal flushes.

Yes.

> iommupt doesn't have any calls because it doesn't have any internal
> flushes. It calls iommu_iotlb_gather_add_range() which blindly updates
> the iova and never flushes.

For PT_FEAT_FLUSH_RANGE, I guess so.

> The one call to iommu_iotlb_sync() is only for the para-virtualization
> optimization of narrowing invalidations. It would be nonsensical for a
> driver to enable this optimization and offer IOMMU_CAP_DEFERRED_FLUSH.

Not necessarily - in the PV case it can be desirable to minimise 
over-invalidation *if* you're trapping for targeted invalidations in 
strict mode. However, depending on the usage pattern it may also be 
beneficial to have non-strict let the FQ mechanism batch up work to 
minimise the number of traps taken - e.g. s390 is in this situation, and 
is precisely why we added IOMMU_DMA_OPTS_SINGLE_QUEUE to help optimise 
for that.

> But it is a good point that riscv pagetable may not have supported it
> before, but it does now, so we should probably add
> IOMMU_CAP_DEFERRED_FLUSH. I'll send a patch next cycle.

Sounds good.

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
