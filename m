Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A67C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j4xH28e30TCzSGG4cAOgQbUVYU1ljq7iXSCX/11teLg=; b=tYbqSiYjfAod5I
	Sjio/xpS8b6BA3IR/w3eruUr1EUb1BOoUexAJN40fNMRteRZ/1bJpooXUAgEwSPKjMecUtFnO5yDQ
	A4XCFJb22bfdcchO39wNz0c4b7+9gLwyVfIde3nEHj9R+vmn7CODXDBktDvf1r79Ox2ygs2/W5Gui
	olk3Ei5HYxV9f1zkaLDCk9az/WRTtoVNKn2BKyUoHYQ5KnVbcjGdWQb9WsBcMV+YaTsHilQRdW3XG
	YcCB8Xq3PBMFPl1xp8Moi/uRTxWi/VnrqvJ7PULRSRayWj0/CqcT7kQMZWJGYxpQYfqHXBUsLK3SK
	sR/fKxZq54od6buoYLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BxJ-00000006rl0-1X2R;
	Wed, 23 Sep 2026 01:39:29 +0000
Received: from out-244.mta1.migadu.com ([2001:41d0:203:375::f4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BxF-00000006rkD-0Ful
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:39:27 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QblcXYUfe5vm9aEiyal5oASFj94h7Yg01drrDC5pSPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790127561; v=1; x=1790732361;
 b=cYfqO/+H0Zu/7xoySYZiQiz4GYoqyOr1Kfs2qjEEfFG4a49gPmFYAM1yO1GGl+xLzX5HObcW
 aUSfEozegpJ/FYxbgHUwlCMDW/nyeuXj2LhvGSn2JUxmtlyvCmol4sUfUtlrPyhaWzpLRQ68+xy
 2SkPOFH5pvNCYtgbjW1ja/ik=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e5dffd9b6f3a2118;
	Wed, 23 Sep 2026 01:39:21 +0000
X-Mizu-Trace-ID: e5dffd9b6f3a2118
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] riscv: use generic relaxed MMIO accessors
Date: Wed, 23 Sep 2026 09:39:08 +0800
Message-ID: <20260923013913.357710-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_183925_323240_C5E4113C 
X-CRM114-Status: GOOD (  12.47  )
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

The relaxed MMIO accessors duplicate the generic implementation, as noted
by their FIXME comment. Remove those definitions and their empty barrier
hooks so asm-generic/io.h supplies them through the existing asm/io.h
include path.

The M-mode timer uses the lightweight asm/mmio.h header before the
generic relaxed accessors are available. Use readl_cpu() and readq_cpu()
there, which perform the same accesses and endian conversion as the
existing relaxed accessors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v3: don't touch asm-generic, and preserve custom __raw_* helpers.

v2: split asm-generic/io.h to fix M-mode build
    https://lore.kernel.org/linux-riscv/20260920014357.7069-2-qingfang.deng@linux.dev/

v1: https://lore.kernel.org/linux-riscv/20250530032252.3092502-1-dqfext@gmail.com/
---
 arch/riscv/include/asm/mmio.h  | 27 ---------------------------
 arch/riscv/include/asm/timex.h |  6 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 06cadfd7a237..61299a093b75 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -98,33 +98,6 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #define writeq_cpu(v, c)	((void)__raw_writeq((__force u64)cpu_to_le64(v), (c)))
 #endif
 
-/*
- * Relaxed I/O memory access primitives. These follow the Device memory
- * ordering rules but do not guarantee any ordering relative to Normal memory
- * accesses.  These are defined to order the indicated access (either a read or
- * write) with all other I/O memory accesses to the same peripheral. Since the
- * platform specification defines that all I/O regions are strongly ordered on
- * channel 0, no explicit fences are required to enforce this ordering.
- */
-/* FIXME: These are now the same as asm-generic */
-#define __io_rbr()		do {} while (0)
-#define __io_rar()		do {} while (0)
-#define __io_rbw()		do {} while (0)
-#define __io_raw()		do {} while (0)
-
-#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
-#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
-#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
-
-#define writeb_relaxed(v, c)	({ __io_rbw(); writeb_cpu((v), (c)); __io_raw(); })
-#define writew_relaxed(v, c)	({ __io_rbw(); writew_cpu((v), (c)); __io_raw(); })
-#define writel_relaxed(v, c)	({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
-
-#ifdef CONFIG_64BIT
-#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
-#define writeq_relaxed(v, c)	({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
-#endif
-
 /*
  * I/O memory access primitives.  Reads are ordered relative to any following
  * Normal memory read and delay() loop.  Writes are ordered relative to any
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index f660afa30530..9c4550902935 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,18 +17,18 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
-	return readq_relaxed(clint_time_val);
+	return readq_cpu(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
-	return readl_relaxed(((u32 __iomem *)clint_time_val));
+	return readl_cpu(((u32 __iomem *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
-	return readl_relaxed(((u32 __iomem *)clint_time_val) + 1);
+	return readl_cpu(((u32 __iomem *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
