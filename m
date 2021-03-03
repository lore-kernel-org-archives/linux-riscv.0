Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC64C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 22:37:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB1364EA4
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 22:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB1364EA4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F/hdXjPRNMf8D0tosZQwLWQMz+hYZENvkodtXNt0HwM=; b=kow/0bM78e2uNkFYmGrMp+yTS
	3Xsllj81Xepu+7jvkYA2l47Y/EvwWoCHhR9tAFFRwJgmFjNqQ/ZT0y2nMMm8eeQuhBw9sAwYdG8kD
	D7T/N/Jj0VNIjHfZJnmakIpQtJRqp8JL+4QxTyw2irhbMtBB4SnbBLA6SApJm61MRYNDlxM7EcCK8
	/K9tyxbqaQtKK7qDEdUtvG304T7KSILJa2mvy3FpbWMeBvvTSzVRt35RSmlEkpitNhbVf8D9L12eK
	BNyDxi4fSR16KRjstghczjEerYKwG9Mpjw0NJqKZuBIfjY0hBm5Em9bMAaiYAF7U0BNancu/DrkwN
	LsuIgJ1yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHa4A-006liD-FH; Wed, 03 Mar 2021 22:34:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTB3-005Koe-IP; Wed, 03 Mar 2021 15:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=4Zy9OY6fx2/oU4L2eni2q/jcefF37OJjrso/hpuWwQw=; b=f0SBDMnOPuGwU3d630hPDoyVC1
 QITEag+dIIq/J/h4YDdxh/4XN4sNEljbiydkYmJ8HCgydVSe4DFR2Nnmnrjw3DaKQZ5XcDjz2P/a9
 Pzx6DWoRE8EzBO+JQZMwOhavCnZzPAQT1cRR2PPF7XshhlkzF77uoWZk9bEaa+hkaMb5JOH1PLTns
 Am9Oq55RRaZ8JQIILFDGd1OSzWb/78tR9d/5bRQ5f0KHwGW6xyStdklKjxXyF5vJVmCgG1aGIbE4O
 aA8A9mz2YQvcEaXJ+tm0KGSsJETqpLsTu0omXKNZMv1P1cKAzFtzG8zdbAzhj96/YwdxNLgY7WS/7
 U8QhSgfw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLoI-001eYn-OS; Wed, 03 Mar 2021 07:20:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dr5272kJlzMhPF;
 Wed,  3 Mar 2021 15:18:23 +0800 (CST)
Received: from ubuntu-82.huawei.com (10.175.104.82) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 15:20:24 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
 <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>,
 <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, 
 <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
CC: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <frowand.list@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>,
 <wangkefeng.wang@huawei.com>
Subject: [PATCH stable v5.10 5/7] arm64: mm: Set ZONE_DMA size based on
 devicetree's dma-ranges
Date: Wed, 3 Mar 2021 15:33:17 +0800
Message-ID: <20210303073319.2215839-6-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_072043_684109_34BA4FA4 
X-CRM114-Status: GOOD (  10.48  )
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
---
 arch/arm64/mm/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 7da912bf4222..05a1c2773629 100644
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
@@ -188,9 +186,11 @@ static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
