Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B17CF588C3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSHIFGyUXz/6cCHL9JklCjGG2Z893FJLg4aCN1YVlD0=; b=LHfEg6y/4jJ8+M
	6oUtr2US/tdUP2aiFgLbI2KLAPk37ugUzNQ51BK3tuC21evMb+vgIVMm8weojfTL0z2K1+swdAIR/
	+vQEo8nM4iekwfIYwQevXa5+rD41LawDH6/9/TwPs4LdEFdBGe7BSlZ91oIKkdeieZ8GpegW+u3YN
	GNjDSvjMlr85Ii1IF/fvEfUPQlfmC684EqPd03nwDGG+Sx+U++/ApwBNHIVZhJBHKgEAbKf/R2+jZ
	NmmYNg9B2MysPVx+FDuqyY9My+zuosSu6lEoUlFBd+ksI6fgxdXyNNSnecxHUtQZJS7n1H1lIsI+a
	HB0YE04lNrSNCEFA1Usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoNC-00000006xEO-0ji1;
	Mon, 20 Apr 2026 13:09:10 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoN8-00000006xCk-2Dte
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 13:09:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ipsV3XWXSwWOct2tUlbmnwA9zImNAKxGQCaaa918MtM=;
	b=hKLSojiD6b/2tSRhuW+9FwNBkjWbnZ+bA8wr0s+pXWUTLTKX8h9Mhbbjg51AtcF1/8SE9H/tI
	PXmey/Dh163E7f8Y0NX8KLtPDubDE3cbCU3137D0AkSLhG/1BKVT2p6lGonZs+TwJCw04yAAIit
	4hqrEuc6FANEiha0Rg1MkHk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fzlyM32Jrz1K9D4;
	Mon, 20 Apr 2026 21:02:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A72C440561;
	Mon, 20 Apr 2026 21:08:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Apr
 2026 21:08:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
Subject: [PATCH v4 1/2] bitops: Define generic __bitrev8/16/32 for reuse
Date: Mon, 20 Apr 2026 21:12:51 +0800
Message-ID: <20260420131252.179729-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420131252.179729-1-ruanjinjie@huawei.com>
References: <20260420131252.179729-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_060906_975762_32793326 
X-CRM114-Status: GOOD (  15.67  )
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

Define generic __bitrev8/16/32 using the implementation
in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
such as RISCV.

And introduce a NEED_BYTE_REVERSE_TABLE Kconfig option, so byte_rev_table
is only compiled when !HAVE_ARCH_BITREVERSE or when an architecture (like
RISC-V) explicitly selects it as a fallback. This avoids bloating the .data
section for architectures that have full hardware bit-reverse support and
don't need the table.

Reviewed-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++++++++++++++
 include/linux/bitrev.h                | 20 ++++----------------
 lib/Kconfig                           |  4 ++++
 lib/bitrev.c                          |  4 ++--
 4 files changed, 35 insertions(+), 18 deletions(-)
 create mode 100644 include/asm-generic/bitops/__bitrev.h

diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
new file mode 100644
index 000000000000..9d7d3d369364
--- /dev/null
+++ b/include/asm-generic/bitops/__bitrev.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
+#define _ASM_GENERIC_BITOPS___BITREV_H_
+
+#ifdef CONFIG_NEED_BYTE_REVERSE_TABLE
+#include <asm/types.h>
+
+extern u8 const byte_rev_table[256];
+static __always_inline __attribute_const__ u8 generic___bitrev8(u8 byte)
+{
+	return byte_rev_table[byte];
+}
+
+static __always_inline __attribute_const__ u16 generic___bitrev16(u16 x)
+{
+	return (generic___bitrev8(x & 0xff) << 8) | generic___bitrev8(x >> 8);
+}
+
+static __always_inline __attribute_const__ u32 generic___bitrev32(u32 x)
+{
+	return (generic___bitrev16(x & 0xffff) << 16) | generic___bitrev16(x >> 16);
+}
+#endif /* CONFIG_NEED_BYTE_REVERSE_TABLE */
+
+#endif /* _ASM_GENERIC_BITOPS___BITREV_H_ */
diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
index d35b8ec1c485..11620a70e776 100644
--- a/include/linux/bitrev.h
+++ b/include/linux/bitrev.h
@@ -12,22 +12,10 @@
 #define __bitrev8 __arch_bitrev8
 
 #else
-extern u8 const byte_rev_table[256];
-static inline u8 __bitrev8(u8 byte)
-{
-	return byte_rev_table[byte];
-}
-
-static inline u16 __bitrev16(u16 x)
-{
-	return (__bitrev8(x & 0xff) << 8) | __bitrev8(x >> 8);
-}
-
-static inline u32 __bitrev32(u32 x)
-{
-	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
-}
-
+#include <asm-generic/bitops/__bitrev.h>
+#define __bitrev32 generic___bitrev32
+#define __bitrev16 generic___bitrev16
+#define __bitrev8 generic___bitrev8
 #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
 
 #define __bitrev8x4(x)	(__bitrev32(swab32(x)))
diff --git a/lib/Kconfig b/lib/Kconfig
index 0f2fb9610647..75cbb647b1da 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -62,6 +62,10 @@ config HAVE_ARCH_BITREVERSE
 	  This option enables the use of hardware bit-reversal instructions on
 	  architectures which support such operations.
 
+config NEED_BYTE_REVERSE_TABLE
+	bool
+	default y if !HAVE_ARCH_BITREVERSE
+
 config ARCH_HAS_STRNCPY_FROM_USER
 	bool
 
diff --git a/lib/bitrev.c b/lib/bitrev.c
index 81b56e0a7f32..d9d5ee00229c 100644
--- a/lib/bitrev.c
+++ b/lib/bitrev.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#ifndef CONFIG_HAVE_ARCH_BITREVERSE
+#ifdef CONFIG_NEED_BYTE_REVERSE_TABLE
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/bitrev.h>
@@ -44,4 +44,4 @@ const u8 byte_rev_table[256] = {
 };
 EXPORT_SYMBOL_GPL(byte_rev_table);
 
-#endif /* CONFIG_HAVE_ARCH_BITREVERSE */
+#endif /* CONFIG_NEED_BYTE_REVERSE_TABLE */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
