Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66F3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 18:55:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847676137A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 18:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 847676137A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR2RS0krE+wCMq6lQryVaBerll+il3cGuujmAPIsMYo=; b=Dy9vbdr82beEpT
	FHFP9qO4pxRvPLcfXErJNfIMDmLKQX0b44ObFUYz7acNbtx5/T0ZZ+Ax0OzKAqpslCuu3zX20Q7Ii
	3EN9edDtkTkbjbR/KzAiEEUoE21HBcqjMU/0ygsxkPmQqmJfaZRgDutZnunMogtCm72gvP8waEzZG
	LNty1C17Cq0hOQxY44a9YpqTonMsvnvYNYAck9JdMFxisQHpP5MaYy7b7T7NAZI3yixR9V+zzDIVe
	uqHetWlVBelMp2v5qyAGd9ziKLi3Aw8STLor13r9sEAENErNLhA3V8n+l9kHOXvEp6lUcDc93tKJB
	B+maITyPjDqKsN2HyKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW1Co-00Fk7h-10; Thu, 30 Sep 2021 18:54:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW18r-00FiIj-Kn; Thu, 30 Sep 2021 18:50:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8637261350;
 Thu, 30 Sep 2021 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633027849;
 bh=ISUQEAeabD8TFuzFwCipkjqJm558AV8oII+raBjMcR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s/nujFn9CMUdpbr325ijsunQ25k2M/i9/fhbz5LMb3fbAE+MyzkyTivG+OFV7pGA0
 0mMCr9cL+6NMUzw1OueI7eDhpkmWrqSBHnTh+7Nay6CoC0XZhtahIjyxjuWdGb1TMY
 1fRZO+c8HfzVCLDgD/FPrUdTCnminsC4OmaCiVgNI2Caxtuy3ub58zJW0FfPkLYG/4
 R7PbZYxgMJggZ9+WvzrbboZwD/xf9+ZJDL5nQhjHdCwwqiZtN4l9t+qSPzTUbjwwk1
 i6P2OXjm/YcqSpDPT9ALm+2hHHTDISEFV6snwAfjb4Ntj5CMY+VJ95ZP8rE0c/vFKI
 9qAPHZmD3sE5A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/6] arch_numa: simplify numa_distance allocation
Date: Thu, 30 Sep 2021 21:50:26 +0300
Message-Id: <20210930185031.18648-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_115049_791417_E8B336FF 
X-CRM114-Status: GOOD (  10.21  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Memory allocation of numa_distance uses memblock_phys_alloc_range() without
actual range limits, converts the returned physical address to virtual and
then only uses the virtual address for further initialization.

Simplify this by replacing memblock_phys_alloc_range() with
memblock_alloc().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 drivers/base/arch_numa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 00fb4120a5b3..f6d0efd01188 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -275,15 +275,13 @@ void __init numa_free_distance(void)
 static int __init numa_alloc_distance(void)
 {
 	size_t size;
-	u64 phys;
 	int i, j;
 
 	size = nr_node_ids * nr_node_ids * sizeof(numa_distance[0]);
-	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0, PFN_PHYS(max_pfn));
-	if (WARN_ON(!phys))
+	numa_distance = memblock_alloc(size, PAGE_SIZE);
+	if (WARN_ON(!numa_distance))
 		return -ENOMEM;
 
-	numa_distance = __va(phys);
 	numa_distance_cnt = nr_node_ids;
 
 	/* fill with the default distances */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
