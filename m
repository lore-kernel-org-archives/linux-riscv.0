Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30C1C00A89
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 18:12:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0A022273
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 18:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CA739MJY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0A022273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XGllYs9WTscZU9JbJZBPsOrK7bF4bTXcRO411c3UKnE=; b=CA739MJYg2eS3QVF7OHi0/aZH
	1zqiG89+ypegm1xKZHB7EUPYGp/NXIcXuz9WlSpL+l2ODOIkiJu4Rg0JcK45ExmkL1CtlrUv/yIwS
	FPhiSiDIsXMWvSnaZ9DNM7JgZLg5bQbXJ/8DXXhNPEFT4PJmGoRzxDoAQ3516ZWmUs9no1j8w16of
	y0bQP6gxvSqDPjfepBB+g5ORcXkcArHh+5Kvbyfr6lVKCgr/cFbXiAY1Jynwy1nGpikDsLB36hvqz
	a43XU/ta+IX6w0aeMt5Qx2T4yMn2MPgcMAZZTbFpIkktGetDjggooe1FPyEsTDlB4Q40FQNAHBt+u
	TgSwPAO6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYsP-00088M-QF; Fri, 30 Oct 2020 18:11:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYsI-00085U-3C; Fri, 30 Oct 2020 18:11:43 +0000
Received: from gaia (unknown [95.145.162.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3A17206E5;
 Fri, 30 Oct 2020 18:11:37 +0000 (UTC)
Date: Fri, 30 Oct 2020 18:11:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v5 0/7] arm64: Default to 32-bit wide ZONE_DMA
Message-ID: <20201030181134.GE23196@gaia>
References: <20201029172550.3523-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029172550.3523-1-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_141142_329050_9BB2880A 
X-CRM114-Status: GOOD (  22.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-mm@kvack.org,
 will@kernel.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 ardb@kernel.org, linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 06:25:43PM +0100, Nicolas Saenz Julienne wrote:
> Ard Biesheuvel (1):
>   arm64: mm: Set ZONE_DMA size based on early IORT scan
> 
> Nicolas Saenz Julienne (6):
>   arm64: mm: Move reserve_crashkernel() into mem_init()
>   arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
>   of/address: Introduce of_dma_get_max_cpu_address()
>   of: unittest: Add test for of_dma_get_max_cpu_address()
>   arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
>   mm: Remove examples from enum zone_type comment

Thanks for putting this together. I had a minor comment but the patches
look fine to me. We still need an ack from Rob on the DT patch and I can
queue the series for 5.11.

Could you please also test the patch below on top of this series? It's
the removal of the implied DMA offset in the max_zone_phys()
calculation.

--------------------------8<-----------------------------
From 3ae252d888be4984a612236124f5b099e804c745 Mon Sep 17 00:00:00 2001
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Fri, 30 Oct 2020 18:07:34 +0000
Subject: [PATCH] arm64: Ignore any DMA offsets in the max_zone_phys()
 calculation

Currently, the kernel assumes that if RAM starts above 32-bit (or
zone_bits), there is still a ZONE_DMA/DMA32 at the bottom of the RAM and
such constrained devices have a hardwired DMA offset. In practice, we
haven't noticed any such hardware so let's assume that we can expand
ZONE_DMA32 to the available memory if no RAM below 4GB. Similarly,
ZONE_DMA is expanded to the 4GB limit if no RAM addressable by
zone_bits.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/init.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 095540667f0f..362160e16fb2 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -175,14 +175,21 @@ static void __init reserve_elfcorehdr(void)
 #endif /* CONFIG_CRASH_DUMP */
 
 /*
- * Return the maximum physical address for a zone with a given address size
- * limit. It currently assumes that for memory starting above 4G, 32-bit
- * devices will use a DMA offset.
+ * Return the maximum physical address for a zone accessible by the given bits
+ * limit. If the DRAM starts above 32-bit, expand the zone to the maximum
+ * available memory, otherwise cap it at 32-bit.
  */
 static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
 {
-	phys_addr_t offset = memblock_start_of_DRAM() & GENMASK_ULL(63, zone_bits);
-	return min(offset + (1ULL << zone_bits), memblock_end_of_DRAM());
+	phys_addr_t zone_mask = (1ULL << zone_bits) - 1;
+	phys_addr_t phys_start = memblock_start_of_DRAM();
+
+	if (!(phys_start & U32_MAX))
+		zone_mask = PHYS_ADDR_MAX;
+	else if (!(phys_start & zone_mask))
+		zone_mask = U32_MAX;
+
+	return min(zone_mask + 1, memblock_end_of_DRAM());
 }
 
 static void __init zone_sizes_init(unsigned long min, unsigned long max)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
