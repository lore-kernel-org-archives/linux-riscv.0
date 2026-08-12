Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553ACC5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 06:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlp3Uw64wPLwYTNm05iIIX9OqHrdadlU0CgWeMWLWT8=; b=FNFXRPT5QUbcRR
	I5dTOXxTCt3rqjrm9mj+y3B3abBPVOeRlYiaE5SrzE8yXTkmP2pY9PuY/gIYyEOrgVy0z7VhATMcD
	sxC1sNEv0QG+RbNX4IhZHIk7pp4PNt3Y76zR1IxLso58rxTzrHkrZgus45OSR3qIIxu6hBayfL/cY
	O+IjzJnIg0J/LigfbnVAhHpkWgLyFXw8nyCZ9pJ8/DEFukj9qsS+eu8zkWVOtxXCJF5R5aCC/BpRs
	+P7KyKVO0NI96cMJ2TnghB9x8rkcc3K2cl/xz6C0ucefM3VcFBmCc6Ok2JKciC6QZ6NxGj9RZNcb6
	Ea3b5DlGV2/AbstqlMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Mx-0000000FVoj-2TXy;
	Wed, 12 Aug 2026 06:23:19 +0000
Received: from out28-77.mail.aliyun.com ([115.124.28.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Mu-0000000FVmZ-2myz
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 06:23:18 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07452478|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00740962-0.00245956-0.990131;FP=12855025378607845755|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=shaoqing.qin@redrisc.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.ik.PRue_1786515773;
Received: from thinkpadx1.localdomain(mailfrom:shaoqing.qin@redrisc.com fp:SMTPD_---.ik.PRue_1786515773 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 14:23:08 +0800
From: Shaoqing Qin <shaoqing.qin@redrisc.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shaoqing Qin <shaoqing.qin@redrisc.com>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: mm: mark KASAN vmalloc shadow mappings as valid
Date: Wed, 12 Aug 2026 14:22:50 +0800
Message-ID: <20260812062250.181-1-shaoqing.qin@redrisc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_232316_887120_D1CDCACD 
X-CRM114-Status: GOOD (  10.17  )
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

With CONFIG_KASAN_VMALLOC, KASAN allocates shadow memory for vmalloc
mappings on demand. After installing new shadow PTEs, KASAN calls
flush_cache_vmap() for the shadow address range.

RISC-V uses flush_cache_vmap() to mark newly valid kernel mappings. If
an access subsequently faults, the early exception handler checks this
mark, executes sfence.vma when required, and retries the faulting
instruction.

However, flush_cache_vmap() currently recognizes only vmalloc, module,
and vmemmap addresses. KASAN shadow addresses are outside these ranges,
so creating a KASAN vmalloc shadow mapping does not mark it as newly
valid.

On implementations without Svvptc, an invalid PTE may remain cached
after the PTE has been made valid in memory. This caused a store page
fault in __memset() while KASAN was unpoisoning shadow memory for a DMA
atomic pool vmap mapping. The page table dump showed that the PTE in
memory was already valid and writable.

Recognize the KASAN shadow range and mark these mappings as newly valid,
allowing the existing fault-time sfence.vma and retry mechanism to
handle the stale invalid PTE.

Tested on a single-core RISC-V FPGA without Svvptc using Sv48 and
CONFIG_KASAN_VMALLOC=y. The kernel boots successfully through DMA
atomic pool initialization after this change.

Fixes: 503638e0babf ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Shaoqing Qin <shaoqing.qin@redrisc.com>
---
 arch/riscv/include/asm/cacheflush.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index c2b0a2928f06..056aaf894644 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#include <asm/kasan.h>
 
 static inline void local_flush_icache_all(void)
 {
@@ -57,7 +58,9 @@ static inline void mark_new_valid_map(void)
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 {
 	if (is_vmalloc_or_module_addr((void *)start) ||
-	    (start >= VMEMMAP_START && end <= VMEMMAP_END))
+	    (start >= VMEMMAP_START && end <= VMEMMAP_END) ||
+	    (IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
+	     start >= KASAN_SHADOW_START && end <= KASAN_SHADOW_END))
 		mark_new_valid_map();
 }
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
