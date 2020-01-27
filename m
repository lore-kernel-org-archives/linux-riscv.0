Return-Path: <SRS0=yeT2=3Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F00C2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2020 14:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928DC20720
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2020 14:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XXdOBIdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928DC20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YjEUvbW8MNlmMEYSlfG6PbPrlelZyJrOjBlR+I8eXFQ=; b=XXdOBIdfZEydATwcp1xZYqX6P3
	lWRWMpiZ01jdUAgc3bWpbTwfNQIgiX3s5Qju7UWBqDVnQwbAVk4v9cibNK6I50rHQYRnqQyPFKyeZ
	eVjqaXwcTii2EN+dTzaTN6o9kXqVPzrmhfMungfyNSfZ8hLhdxc4yqyhjfuxmyr0mO/hn4nz68gYR
	JxqvBEDGVA4R4pkWphoJteahwRLblb+NbNUIkiwPhVnk7HKKwJlqqHqGgDLpaPoaErcaHoP+UqKKj
	aEaqnXQZRnVixaAL3UC1hGwlmagRncsdfZsBYTd8hzuJmUVFdsuUXJd8VtRdpIhsNon85VMeqYzZp
	sqiM0zZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw5if-0001v2-NC; Mon, 27 Jan 2020 14:50:29 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw5ic-0001tM-CE
 for linux-riscv@lists.infradead.org; Mon, 27 Jan 2020 14:50:27 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488; MF=guoren@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0Toc6Kte_1580136614; 
Received: from localhost(mailfrom:guoren@linux.alibaba.com
 fp:SMTPD_---0Toc6Kte_1580136614) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Jan 2020 22:50:14 +0800
From: Guo Ren <guoren@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	andrew@sifive.com,
	palmer@dabbelt.com
Subject: [PATCH V2] riscv: Use flush_icache_mm for flush_icache_user_range
Date: Mon, 27 Jan 2020 22:50:08 +0800
Message-Id: <20200127145008.2850-1-guoren@linux.alibaba.com>
X-Mailer: git-send-email 2.17.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_065026_574193_49227DB2 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch is the fixup for the commit 08f051eda33b by Andrew.

For copy_to_user_page, the only call path is:
__access_remote_vm -> copy_to_user_page -> flush_icache_user_range

Seems it's ok to use flush_icache_mm instead of flush_icache_all and
it could reduce flush_icache_all called on other harts.

Add (vma->vm_flags & VM_EXEC) condition to flush icache only for
executable vma area.

ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE is used in a lot of fs/block codes.
We need it to make their pages dirty and defer sync i/dcache in
update_mmu_cache().

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Andrew Waterman <andrew@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>

---
Changelog V2:
 - Add VM_EXEC condition.
 - Remove flush_icache_user_range definition.
 - define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
---
 arch/riscv/include/asm/cacheflush.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index b69aecbb36d3..ae57d6ce63a9 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -8,7 +8,7 @@
 
 #include <linux/mm.h>
 
-#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
+#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
 
 /*
  * The cache doesn't need to be flushed when TLB entries change when
@@ -62,7 +62,8 @@ static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
 	do { \
 		memcpy(dst, src, len); \
-		flush_icache_user_range(vma, page, vaddr, len); \
+		if (vma->vm_flags & VM_EXEC) \
+			flush_icache_mm(vma->vm_mm, 0); \
 	} while (0)
 #define copy_from_user_page(vma, page, vaddr, dst, src, len) \
 	memcpy(dst, src, len)
@@ -85,7 +86,6 @@ static inline void flush_dcache_page(struct page *page)
  * so instead we just flush the whole thing.
  */
 #define flush_icache_range(start, end) flush_icache_all()
-#define flush_icache_user_range(vma, pg, addr, len) flush_icache_all()
 
 void dma_wbinv_range(unsigned long start, unsigned long end);
 void dma_wb_range(unsigned long start, unsigned long end);
-- 
2.17.0


