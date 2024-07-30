Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F52C3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQPwHDL3HF6Hj6lV/gcMLXl9M68KfaVwpfqlhrR1iFY=; b=w+i06ruAP/3Jg3
	Of/LYNczgGJdUvmDqlWBJ0uIw3Wni9WD/TdeLKaUC3fkDut/AjBG1ZEq/Als2gmVo0arpMpDUqte1
	Dqk0KkBJj1mAS70TrqcvDfnTqDvnINyeJrOo45BFlH4qRKadnLc5URlUI7tk9LEuAe+UpIQiz9Ndg
	kAsdwNEYeXFogImitmgrqJstTfnxyWTHE+zdvPBVx0RQUwCsLT7NOYfrfJA3j+KKmr4MNEhEBrJcY
	VlFxMZFQ988ND/GtNq+YZh4L/7cKcA4gQIumB0ZCk1z0rj/HybUldqlmlWMOTVd/AYYMrOtZUltr9
	gKyZwJpdfeXjN1v+OvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnDQ-0000000FL7P-2bcC;
	Tue, 30 Jul 2024 13:48:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnDN-0000000FL68-2DL0
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 13:48:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 668071007;
	Tue, 30 Jul 2024 06:48:56 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F13E83F5A1;
	Tue, 30 Jul 2024 06:48:27 -0700 (PDT)
Message-ID: <dc2a28b6-566c-4c17-9834-874513f1d4f1@arm.com>
Date: Tue, 30 Jul 2024 14:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 24/37] kvx: Add memory management
To: Christoph Hellwig <hch@infradead.org>, ysionneau@kalrayinc.com
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Borne <jborne@kalrayinc.com>, Julian Vetter
 <jvetter@kalrayinc.com>, Clement Leger <clement@clement-leger.fr>,
 Guillaume Thouvenin <thouveng@gmail.com>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Jules Maselbas <jmaselbas@zdiv.net>, Julien Hascoet
 <jhascoet@kalrayinc.com>, Louis Morhet <lmorhet@kalrayinc.com>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>,
 Marius Gligor <mgligor@kalrayinc.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20240722094226.21602-1-ysionneau@kalrayinc.com>
 <20240722094226.21602-25-ysionneau@kalrayinc.com>
 <Zp5zrkwyagnkoY7F@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Zp5zrkwyagnkoY7F@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_064833_652718_19DAAB9B 
X-CRM114-Status: GOOD (  16.85  )
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

On 22/07/2024 3:58 pm, Christoph Hellwig wrote:
>> +#include "../../../drivers/iommu/dma-iommu.h"
> 
> This is not a public header as you can guess from the file path.
> 
>> +	switch (dir) {
>> +	case DMA_TO_DEVICE:
>> +		break;
>> +	case DMA_FROM_DEVICE:
>> +		break;
>> +
>> +	case DMA_BIDIRECTIONAL:
>> +		inval_dcache_range(paddr, size);
> 
> Doing this just for bidirectional is weird unless your architecture
> never does any speculative prefetching.  Other architectures
> include DMA_FROM_DEVICE here.
> 
>> +#ifdef CONFIG_IOMMU_DMA
>> +void arch_teardown_dma_ops(struct device *dev)
>> +{
>> +	dev->dma_ops = NULL;
>> +}
>> +#endif /* CONFIG_IOMMU_DMA*/
> 
> This should not be needed right now.

More than that, per 8b80549f1bc6, it's now actually a latent bug.

>  And will be completley
> useless once we do the direct calls to dma-iommu which we plan
> to do for Linux 6.12.
> 
>> +void arch_setup_dma_ops(struct device *dev, bool coherent)
>> +{
>> +	dev->dma_coherent = coherent;
>> +	if (device_iommu_mapped(dev))
>> +		iommu_setup_dma_ops(dev);
>> +}
> 
> And this seems odd, as iommu_setup_dma_ops is called from the iommu
> code and you shouldn't need it here.

Yeah, this smells like it was based on the old arm64 code, but then 
rebased without reference to the equivalent arm64 changes, hence the 
#include hack. Enabling iommu-dma for an architecture should now be a 
one-liner in drivers/iommu/Kconfig, however I don't see an IOMMU driver 
being added in this series so it's not clear it's actually necessary (yet).

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
