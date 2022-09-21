Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6ABC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2kW+H0kDQt6fmxUb969xwjYSwMoZXi1TjmenJoJTnw=; b=a+iV5bG3stkeTF
	r02nIKogISsaql9TqYhU6iiC6sv7QYamEQ1hdCbufuVo+h7PIXESjLnzrUdlzPvgcZdJMNFP99q8H
	7DG8wRTVRlyKwXOogsIZ27yPircvWmRN/Xy2lJ6W0R4FXYXDjocp0ZfeJaMdo5918mP6a5r2E5GKd
	WAc91Wr6NNvjFzcUmrC9wc6M5j9Xw6kGZeYauRlAtVxNldFyixVN8HPRB3ixTAsDv2WCPO7dgQm9m
	i4hnA8NmapegIafhXzcVIs1SGW+F5JS/Ob/mXcbImlik4+iLLwLHJQzNntvBbaLYU+0JtPO4bPDrY
	dcvEyyZk4fs3awP0Tsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oatcf-009OeM-Sf; Wed, 21 Sep 2022 06:54:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oatcR-009OYw-O2; Wed, 21 Sep 2022 06:54:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D8C143D;
	Tue, 20 Sep 2022 23:54:00 -0700 (PDT)
Received: from [10.162.41.8] (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0949D3F73D;
	Tue, 20 Sep 2022 23:54:11 -0700 (PDT)
Message-ID: <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
Date: Wed, 21 Sep 2022 12:23:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
 yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
 zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Barry Song <21cnbao@gmail.com>,
 wangkefeng.wang@huawei.com, xhao@linux.alibaba.com,
 prime.zeng@hisilicon.com, Barry Song <v-songbaohua@oppo.com>,
 Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220822082120.8347-5-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_235403_836491_5EF5EDC2 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 8/22/22 13:51, Yicong Yang wrote:
> +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
> +{
> +	__flush_tlb_page_nosync(mm, uaddr);
> +}
> +
> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> +{
> +	dsb(ish);
> +}

Just wondering if arch_tlbbatch_add_mm() could also detect continuous mapping
TLB invalidation requests on a given mm and try to generate a range based TLB
invalidation such as flush_tlb_range().

struct arch_tlbflush_unmap_batch via task->tlb_ubc->arch can track continuous
ranges while being queued up via arch_tlbbatch_add_mm(), any range formed can
later be flushed in subsequent arch_tlbbatch_flush() ?

OR

It might not be worth the effort and complexity, in comparison to performance
improvement, TLB range flush brings in ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
