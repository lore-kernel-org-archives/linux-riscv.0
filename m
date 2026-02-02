Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F37FE7DF08
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMBQmrH0beDK8XlapqsTIGvrve3okiA0ZTtqNQFozQM=; b=s5PNmSZBhdiYIv
	kkpD2ZRCWy8NEpKvXXyRz4fqIGPjyxyBxJbYUEuqnSkNg0S4mf4YL8Ck0tV+lqZgulGliBpYM2MPx
	+DEaBlGusZw2l64sFcC1rNMK3Mdcoq8iTiI97vNA7yTYrJKjQO51KnygJsFo/y6KZLxazRt9V5kWy
	bmU+NuV9qHrMNPDXWxfYaD/i6eshCfYG5kE1jAwVWdbTu7E6TG96d0XOAgmlNZnI7v9oQNAwi0lsm
	l0r3jWnVLhJ9yf1rQxvmjYG6XYlrxJwXETOkHRI2WdGWlvEmcLgsf8XaKg0Y8tK5AZUyuET9F636w
	Ku3vzFfDKx4Fsfl3m7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmx1r-00000005Jez-2BH8;
	Mon, 02 Feb 2026 16:43:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmx1o-00000005JeI-1b6L
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 16:43:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C58D3339;
	Mon,  2 Feb 2026 08:43:47 -0800 (PST)
Received: from [10.57.54.50] (unknown [10.57.54.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CC153F778;
	Mon,  2 Feb 2026 08:43:51 -0800 (PST)
Message-ID: <794b6121-b66b-4819-b291-9761ed21cd83@arm.com>
Date: Mon, 2 Feb 2026 16:43:48 +0000
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
 <8c46864e-4625-49f4-90b3-a7467cec8b7b@arm.com>
 <20260202143720.GN2223369@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260202143720.GN2223369@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_084356_510530_B40042E7 
X-CRM114-Status: GOOD (  29.54  )
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

On 2026-02-02 2:37 pm, Jason Gunthorpe wrote:
> On Mon, Feb 02, 2026 at 02:00:07PM +0000, Robin Murphy wrote:
> 
>>> DMA-FQ requires two functionalites from the page table:
>>> 1) use gather->freelist to avoid a HW UAF (iommupt always does this)
>>
>> Nope, correct DMA API usage would almost never unmap an entire table, so
>> synchronous non-leaf maintenance in that path still doesn't hurt DMA-FQ
>> either (e.g. io-pgtable-arm).
> 
> Well, it certainly would hurt workloads like IB MR's which can have
> quite alot of IOVA in a single dma_map_sg() and we do want to see the
> table levels removed to avoid the waste that Pasha has talked
> about. Doing single invalidations of potentially a lot of levels in a
> DMA-FQ environment is unnecessary overhead.
> 
> But I get your point that simple, say storage, use of the DMA API
> wouldn't be bothered by this and you could still get alot of benefit
> without using the free list.

Yeah, users dealing with giant non-physically-contiguous scatterlists
are the exception (hence "almost"), but such big things are already
taking the slow path for IOVA allocation/freeing, and they're presumably
not churning at high frequency, so would stand to see a lot less benefit
from flush queues in the first place. If anything, having big lumps of
IOVA space (and pagetable memory) tied up in the queues could even make
matters worse overall.

>> If a pagetable implementation wanted to refcount and eagerly free empty
>> tables upon leaf unmaps, then yes it would need deferred freeing, but
>> frankly it would be better off just not doing that at all for DMA-FQ anyway
>> (as IOVA caching would make it likely to need to repopulate the same level
>> of table soon.)
> 
> Today it isn't done with refcounts, just if the iova range unmapped
> fully contains a table level then the table level can go away too. It
> does trim interior page tables for large IOVA allocations but small
> ones are unlikely to free anything.

Right, and other than the non-contiguous scatterlist case, anything
where a dma_unmap_*() might take out a table-sized region at once, the
corresponding dma_map_*() would have put it down as a block anyway.

>>> The one call to iommu_iotlb_sync() is only for the para-virtualization
>>> optimization of narrowing invalidations. It would be nonsensical for a
>>> driver to enable this optimization and offer IOMMU_CAP_DEFERRED_FLUSH.
>>
>> Not necessarily - in the PV case it can be desirable to minimise
>> over-invalidation *if* you're trapping for targeted invalidations in strict
>> mode. However, depending on the usage pattern it may also be beneficial to
>> have non-strict let the FQ mechanism batch up work to minimise the number of
>> traps taken - e.g. s390 is in this situation, and is precisely why we added
>> IOMMU_DMA_OPTS_SINGLE_QUEUE to help optimise for that.
> 
> Okay, so if I understand you right, it should check for
> iommu_iotlb_gather_queued() and disable PT_FEAT_FLUSH_RANGE_NO_GAPS
> mode entirely? ie there is no point in doing small invalidations if
> the caller is going to do a flush all?
> 
> This way the user gets to pick using DMA-FQ or DMA-strict ?

Indeed, and furthermore we permit relaxing from DMA to DMA-FQ on a
live domain, so although a virtualisation-aware driver may use
PT_FEAT_FLUSH_RANGE_NO_GAPS and also call iommu_set_dma_strict() by
default, that doesn't mean IOMMU_CAP_DEFERRED_FLUSH can't still be
brought into play later. So I guess probably something like the below
(except the other fix just sent breaks the if/else logic, ho hum...)

> Also Intel would probably benefit from .shadow_on_flush too?

I think it mostly depends on how the vIOMMU is implemented. It did seem
potentially mildly beneficial to virtio at the time, not sure if
anyone's ever tried it for Intel/AMD.

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index 3327116a441c..b5cc3094f543 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -51,7 +51,9 @@ static void gather_range_pages(struct iommu_iotlb_gather *iotlb_gather,
  		iommu_pages_stop_incoherent_list(free_list,
  						 iommu_table->iommu_device);
  
-	if (pt_feature(common, PT_FEAT_FLUSH_RANGE_NO_GAPS) &&
+	if (iommu_iotlb_gather_queued(iotlb_gather)) {
+		/* No need to bother, FQ will take care of TLBs */
+	} else if (pt_feature(common, PT_FEAT_FLUSH_RANGE_NO_GAPS) &&
  	    iommu_iotlb_gather_is_disjoint(iotlb_gather, iova, len)) {
  		iommu_iotlb_sync(&iommu_table->domain, iotlb_gather);
  		/*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
