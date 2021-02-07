Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBB2C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 12:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0268664E02
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 12:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0268664E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k1y1tJ0es9d3r/N4IqLGgqpqxXDARLUue9eId9IQBi8=; b=MBP/3U5hfrdcUb1/jCJZ9m+ZG9
	YjtvuzIOcP8Au2Odfme2YapOfU6USWisxESF1bCEf0Wiqdaix6oYcZ4FZIBd5BtpKbcBbWn2bZ4cE
	wAU6IQ5Fo1TMoMbGG93DTvZ7udz19tRtgzg9O4a8hl6MlqAabsalWyvgWK3sFs33krGwBZDZW/W3R
	fZ8pk4fNesOw38H/ifHRX0tIduFbF1ftbDnvllen+rh2EoYG55fOG2JOUUtVfzI4BOpaEZv20YUFZ
	Zj8VqFRHg1Pro7xKrZaelLIXTic3SMKSivi4t2SR2iw/bYjsG9UCjLQC4896J5fYenkJJJ4aZgRIm
	as3LvgFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8jHD-0004ng-Hk; Sun, 07 Feb 2021 12:34:55 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8jHB-0004n1-7s
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 12:34:54 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYT8k5Tlgz164ss;
 Sun,  7 Feb 2021 20:33:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 20:34:41 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Cleanup setup_bootmem()
Date: Sun, 7 Feb 2021 20:38:56 +0800
Message-ID: <20210207123856.141737-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_073453_589686_DAF76749 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Cc: atish.patra@wdc.com, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul
 Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

After the following patches,

  commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
  commit 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
  commit b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")

some logical is useless, kill the mem_start/start/end and unneed code.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0b86a1a12da2..241f22348403 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -108,34 +108,17 @@ void __init mem_init(void)
 
 void __init setup_bootmem(void)
 {
-	phys_addr_t mem_start = 0;
-	phys_addr_t start, dram_end, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
+	phys_addr_t dram_end = memblock_end_of_DRAM();
 	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
-	u64 i;
-
-	/* Find the memory region containing the kernel */
-	for_each_mem_range(i, &start, &end) {
-		phys_addr_t size = end - start;
-		if (!mem_start)
-			mem_start = start;
-		if (start <= vmlinux_start && vmlinux_end <= end)
-			BUG_ON(size == 0);
-	}
 
-	/*
-	 * The maximal physical memory size is -PAGE_OFFSET.
-	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
-	 * as it is unusable by kernel.
-	 */
+	/* The maximal physical memory size is -PAGE_OFFSET. */
 	memblock_enforce_memory_limit(-PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	dram_end = memblock_end_of_DRAM();
-
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
