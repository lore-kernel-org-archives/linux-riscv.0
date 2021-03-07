Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E22AC433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B24F6501E
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B24F6501E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JcIGhqHb4WUie1fOFOFGrFv2xKJn7HcE/Ta6Qkw9gKs=; b=NEqkmcG3xW9xJEEnlAPpOt4J6
	aRkS4VbJmrQzQ5BXTtFNl9LBk3traAKUuvZq4o769VD/HfUlKPuNUyjRNntvoIhIChd6Dt+AuGcTo
	FqZRHcXpHUS3g305gJq0A27c21NHgpMw5aTq7029uxUjpV1TqDFykC0d05ZeVXILf4+pm/xnogdDi
	rOW9FGyou0tpeWWBcXw2kKLB67aWO/WnliLFt8hAjMigl4lorXBeWuPNGMtTalizuPFjTpE/XMi+K
	7QXljMMr7qNba5MKd0p2yalnl57Umu9cgLjWcxqT6jVTA9wq2JtMSw049HaBPQBPnInlaogHZX8sa
	V65fO/UqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvIO-00AgGp-Re; Sun, 07 Mar 2021 15:26:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvI3-00Ag6l-UM; Sun, 07 Mar 2021 15:25:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13A2565106;
 Sun,  7 Mar 2021 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615130754;
 bh=wtrL4fjAG4kiDEurlTA9//RwCwfz7N27etvauyhLrSE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=TFf55ZVteoOds9uZYd0W+DGXTIyd1t6BsCrAR8SUDoST/7JYrMWXenG7cxiud7l6K
 hM1oiD9s9T7GRPnMdGpeKOZ3uLw8pg/0m2zjFS0gJtkxTDpHoLLjd0QjK7dpvswVP4
 1fJ79n2V9fVaeFVr3NnwAB6AYnJuHGa/sShewA/8=
Subject: Patch "arm64: mm: Move zone_dma_bits initialization into
 zone_sizes_init()" has been added to the 5.10-stable tree
To: akpm@linux-foundation.org, anshuman.khandual@arm.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com,
 frowand.list@gmail.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 guro@fb.com, jeremy.linton@arm.com, jingxiangfeng@huawei.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 nsaenzjulienne@suse.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, rppt@kernel.org,
 song.bao.hua@hisilicon.com, sudeep.holla@arm.com, wangkefeng.wang@huawei.com,
 will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 07 Mar 2021 16:25:44 +0100
In-Reply-To: <20210303073319.2215839-3-jingxiangfeng@huawei.com>
Message-ID: <1615130744227221@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_152556_798204_5E961B58 
X-CRM114-Status: GOOD (  11.47  )
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


This is a note to let you know that I've just added the patch titled

    arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-move-zone_dma_bits-initialization-into-zone_sizes_init.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Mar  7 04:22:37 PM CET 2021
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Wed, 3 Mar 2021 15:33:14 +0800
Subject: arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>, <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>, <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
Cc: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <frowand.list@gmail.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>, <wangkefeng.wang@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <20210303073319.2215839-3-jingxiangfeng@huawei.com>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

commit 9804f8c69b04a39d0ba41d19e6bdc6aa91c19725 upstream

zone_dma_bits's initialization happens earlier that it's actually
needed, in arm64_memblock_init(). So move it into the more suitable
zone_sizes_init().

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jeremy Linton <jeremy.linton@arm.com>
Link: https://lore.kernel.org/r/20201119175400.9995-3-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/init.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -190,6 +190,8 @@ static void __init zone_sizes_init(unsig
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 
 #ifdef CONFIG_ZONE_DMA
+	zone_dma_bits = ARM64_ZONE_DMA_BITS;
+	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 #ifdef CONFIG_ZONE_DMA32
@@ -376,11 +378,6 @@ void __init arm64_memblock_init(void)
 
 	early_init_fdt_scan_reserved_mem();
 
-	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
-		zone_dma_bits = ARM64_ZONE_DMA_BITS;
-		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
-	}
-
 	if (IS_ENABLED(CONFIG_ZONE_DMA32))
 		arm64_dma32_phys_limit = max_zone_phys(32);
 	else


Patches currently in stable-queue which might be from jingxiangfeng@huawei.com are

queue-5.10/of-unittest-add-test-for-of_dma_get_max_cpu_address.patch
queue-5.10/mm-remove-examples-from-enum-zone_type-comment.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-devicetree-s-dma-ranges.patch
queue-5.10/of-address-introduce-of_dma_get_max_cpu_address.patch
queue-5.10/arm64-mm-move-zone_dma_bits-initialization-into-zone_sizes_init.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-early-iort-scan.patch
queue-5.10/arm64-mm-move-reserve_crashkernel-into-mem_init.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
