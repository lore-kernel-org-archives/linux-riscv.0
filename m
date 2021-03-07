Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E83AC433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13FA165004
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13FA165004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=E3RjrOFtx8wMtcxH/3c1g4v9KMpGm5z1BerdZWpJDzg=; b=JNTYRYB8dI4qAGJ4WXM+8qDoj
	JVnyuUp0Z5A6AYJB5aROmuG8EfJ4Ep1Ql0vuO5ZqtzY1WXMfXiY0YVYbcra9qipNHMywZjj/IxKFj
	VKyiKMYM2NnQzC9VHI08fDf82z3l4z52O1Mzwk6hbEw5sj2bzbIdijQI++8/ngPYHd0rrRIbRr48r
	/FaBcf92NhVuFhkMtdLqaRZMOjvw+3esvdfhDKx3N387mgb3UMReRLBVP1W+zwj8VQNb6oq9WtHd2
	NcKaUjjCgsOt2vv0CEJ2KXSFCe/u4+pnz0F1VQol3Mi2BXEkwvlD9eAl4sLsNzwXmUTbsIXYTCPA8
	F78FFmp+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvIY-00AgLh-U3; Sun, 07 Mar 2021 15:26:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvI6-00Ag7j-GP; Sun, 07 Mar 2021 15:26:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C0A65105;
 Sun,  7 Mar 2021 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615130757;
 bh=qMt2ZYEDmvgLayuuE3eRvVYgnzeUJqjO0YYaCuCmmd8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=F2ksuzdLnoLN855JIqVTRNKv/RvKfQpPLZCBm2kdWAvspCKN+qc9xaoMiTWzSdY4b
 jbIKezMJsF2etVV6mErLaQSikcZU5g7NFXxBavHn1893FbVoUpDRWyfKkSvRqFtbtq
 iyczxF4m4P4ggJ/B4dwphLMNgvVKdnzm31eMfnDg=
Subject: Patch "arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges"
 has been added to the 5.10-stable tree
To: akpm@linux-foundation.org, anshuman.khandual@arm.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com,
 frowand.list@gmail.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 guro@fb.com, jingxiangfeng@huawei.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 nsaenzjulienne@suse.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, rppt@kernel.org,
 song.bao.hua@hisilicon.com, sudeep.holla@arm.com, wangkefeng.wang@huawei.com,
 will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 07 Mar 2021 16:25:44 +0100
In-Reply-To: <20210303073319.2215839-6-jingxiangfeng@huawei.com>
Message-ID: <161513074423216@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_152559_905602_90889096 
X-CRM114-Status: GOOD (  15.81  )
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

    arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-set-zone_dma-size-based-on-devicetree-s-dma-ranges.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Mar  7 04:22:37 PM CET 2021
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Wed, 3 Mar 2021 15:33:17 +0800
Subject: arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>, <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>, <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
Cc: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <frowand.list@gmail.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>, <wangkefeng.wang@huawei.com>
Message-ID: <20210303073319.2215839-6-jingxiangfeng@huawei.com>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

commit 8424ecdde7df99d5426e1a1fd9f0fb36f4183032 upstream

We recently introduced a 1 GB sized ZONE_DMA to cater for platforms
incorporating masters that can address less than 32 bits of DMA, in
particular the Raspberry Pi 4, which has 4 or 8 GB of DRAM, but has
peripherals that can only address up to 1 GB (and its PCIe host
bridge can only access the bottom 3 GB)

The DMA layer also needs to be able to allocate memory that is
guaranteed to meet those DMA constraints, for bounce buffering as well
as allocating the backing for consistent mappings. This is why the 1 GB
ZONE_DMA was introduced recently. Unfortunately, it turns out the having
a 1 GB ZONE_DMA as well as a ZONE_DMA32 causes problems with kdump, and
potentially in other places where allocations cannot cross zone
boundaries. Therefore, we should avoid having two separate DMA zones
when possible.

So, with the help of of_dma_get_max_cpu_address() get the topmost
physical address accessible to all DMA masters in system and use that
information to fine-tune ZONE_DMA's size. In the absence of addressing
limited masters ZONE_DMA will span the whole 32-bit address space,
otherwise, in the case of the Raspberry Pi 4 it'll only span the 30-bit
address space, and have ZONE_DMA32 cover the rest of the 32-bit address
space.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Link: https://lore.kernel.org/r/20201119175400.9995-6-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/init.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -42,8 +42,6 @@
 #include <asm/tlb.h>
 #include <asm/alternative.h>
 
-#define ARM64_ZONE_DMA_BITS	30
-
 /*
  * We need to be able to catch inadvertent references to memstart_addr
  * that occur (potentially in generic code) before arm64_memblock_init()
@@ -188,9 +186,11 @@ static phys_addr_t __init max_zone_phys(
 static void __init zone_sizes_init(unsigned long min, unsigned long max)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
+	unsigned int __maybe_unused dt_zone_dma_bits;
 
 #ifdef CONFIG_ZONE_DMA
-	zone_dma_bits = ARM64_ZONE_DMA_BITS;
+	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
+	zone_dma_bits = min(32U, dt_zone_dma_bits);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif


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
