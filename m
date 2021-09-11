Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03010C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCBDE6121F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCBDE6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIvbQi5h0UpQhk6Ak/tkKCbftrBbuO3uFf0xK6a/xes=; b=YKVVLNnABgHWkT
	bZLuNe83JMRwFJ/DFd41hbijInB8bfr0ZN9RKenhS/P//T/5EBBwXhRvbr4yN2BoYT1HJpwOKgS6C
	lqC5A0pjXKhHIBgrpNen0EvOkteMqHyQvwou3810WLuULLDA/dSshMcUgdxodNGYWhE9PTPQOV1K3
	r6ycDNE/V6bEqj+++WW8ZJhMqBrtBzV2YywmzmMNy0eR2AKbzankZXtyp2wppwyrv6ruY+JYJgDZt
	FMZYIGTgbwjbJmCGgodKn1XqV6ye1NS/dNrdnLd6xF1/VSDCZoouE8lLhFixACeQ98hGkC+QLxOXC
	Yllppfa4Gy/f4tiPrmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzDQ-00Eb4o-35; Sat, 11 Sep 2021 09:22:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzDN-00Eb38-4A
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D4AC61208;
 Sat, 11 Sep 2021 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352144;
 bh=LjAKkpiCnirsB4Y6pdvnBZ3V6hPR2NG4vhp7kebZdOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rQseqkLEQnMLI8Sfk0Mox519Abj3QiSjmQtZCJBU3ctwqKIF9DUwIeLfDghYCSWpx
 mUxS7MpliI+o/ilhDblwmTRXEooaTbRWLTgl7ij5aX0/3id0uf6OMv7I/2ETs7sfkA
 Jd/ifC2HV04/a6vF7E8W/GQZFtl5AHIGXN9EQ8VmieGx636gOhSfffplrqcD7tnk5H
 Z4MRewQbeAwzjH/alNr0O2dRTcNX/yERk66Tsu+bUnIlEUAB/o5kWsPSNN7DFpTX8y
 ZzUF7tYHCc443tCBF0WvHv4g5XhJNjusSMZu97o0bvhUuNzQONwgtw4gVQQQ+FlX5w
 S+1MPZqBE3qIg==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V4 5/6] riscv: errata: Support T-HEAD custom dcache ops
Date: Sat, 11 Sep 2021 17:21:38 +0800
Message-Id: <20210911092139.79607-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911092139.79607-1-guoren@kernel.org>
References: <20210911092139.79607-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022225_277831_977337FB 
X-CRM114-Status: GOOD (  12.62  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Here are the DMA sync ops needed by Allwinner D1. RISC-V CMO
extension is still in progress, and D1 is using custom CMO
instructions:

 dcache.ipa rs1 (invalidate)
 | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
   0000001    01010      rs1       000      00000  0001011

 dcache.cpa rs1 (clean)
 | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
   0000001    01001      rs1       000      00000  0001011

 dcache.cipa rs1 (clean then invalidate)
 | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
   0000001    01011      rs1       000      00000  0001011

 sync.s (completion barrier)
 | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
   0000000    11001     00000      000      00000  0001011

TODO:
 - Using alternative patch_text based on Atish's patch.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Signed-off-by: Wei Fu <wefu@redhat.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/errata/alternative.c      |  5 +++
 arch/riscv/errata/thead/errata.c     | 61 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  2 +
 3 files changed, 68 insertions(+)

diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
index b879aa546bc5..396aab1b62c2 100644
--- a/arch/riscv/errata/alternative.c
+++ b/arch/riscv/errata/alternative.c
@@ -46,6 +46,11 @@ static void __init init_alternative(void)
 	case SIFIVE_VENDOR_ID:
 		vendor_patch_func = sifive_errata_patch_func;
 		break;
+#endif
+#ifdef CONFIG_ERRATA_THEAD
+	case THEAD_VENDOR_ID:
+		vendor_patch_func = thead_errata_patch_func;
+		break;
 #endif
 	default:
 		vendor_patch_func = NULL;
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 1f5c0f82bc23..9c0bf9b25be3 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -5,6 +5,7 @@
 #include <linux/bug.h>
 #include <asm/patch.h>
 #include <asm/alternative.h>
+#include <asm/dma-noncoherent.h>
 #include <asm/vendorid_list.h>
 #include <asm/errata_list.h>
 #include <asm/pgtable-bits.h>
@@ -45,3 +46,63 @@ void __init thead_errata_setup_vm(unsigned long archid, unsigned long impid)
 	__riscv_pbmt.mt[MT_IO]	= _PAGE_MT_IO;
 #endif
 }
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+/*
+ * dcache.ipa rs1 (invalidate)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01010      rs1       000      00000  0001011
+ *
+ * dcache.cpa rs1 (clean)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01001      rs1       000      00000  0001011
+ *
+ * dcache.cipa rs1 (clean then invalidate)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01011      rs1       000      00000  0001011
+ *
+ * sync.s
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000000    11001     00000      000      00000  0001011
+ */
+#define DCACHE_IPA_A0	".long 0x02a5000b"
+#define DCACHE_CPA_A0	".long 0x0295000b"
+#define DCACHE_CIPA_A0	".long 0x02b5000b"
+
+#define SYNC_S		".long 0x0190000b"
+
+#define CACHE_OP_RANGE(OP, start, size) \
+	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1); \
+	for (; i < ALIGN(start + size, L1_CACHE_BYTES); i += L1_CACHE_BYTES) \
+		__asm__ __volatile__(OP); \
+	 __asm__ __volatile__(SYNC_S);
+
+static void c900_cache_invalidate(phys_addr_t start, size_t size)
+{
+	CACHE_OP_RANGE(DCACHE_IPA_A0, start, size);
+}
+
+static void c900_cache_clean(phys_addr_t start, size_t size)
+{
+	CACHE_OP_RANGE(DCACHE_CPA_A0, start, size);
+}
+
+static void c900_cache_flush(phys_addr_t start, size_t size)
+{
+	CACHE_OP_RANGE(DCACHE_CIPA_A0, start, size);
+}
+
+static struct riscv_dma_cache_sync c900_dma_cache_sync = {
+	.cache_invalidate = c900_cache_invalidate,
+	.cache_clean = c900_cache_clean,
+	.cache_flush = c900_cache_flush,
+};
+#endif
+
+void __init thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				     unsigned long archid, unsigned long impid)
+{
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	riscv_dma_cache_sync_set(&c900_dma_cache_sync);
+#endif
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3605894081a8..a519671fa7d1 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -35,6 +35,8 @@ struct errata_checkfunc_id {
 
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid);
+void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			      unsigned long archid, unsigned long impid);
 
 void thead_errata_setup_vm(unsigned long archid, unsigned long impid);
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
