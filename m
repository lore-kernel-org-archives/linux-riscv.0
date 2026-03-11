Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C809FD0640
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TZvDqJVtUh6wzHIAWs0WWZ5C7KxzdD/mHtszztsn9ME=; b=4HMRGOP2qkeAn3
	1TCXe0bsQIqEjFvCuv1FYBnARZeoogYZH0boY81Y/D/g4YhzfPR/ggm1AulaavDVdA2ahh2JqbpLH
	NvvzwCS0PAdWQ+OkwmsmKM2GxoBAMiJZsIvAjzBwDyFFk8QkEDEIviUAo6LcASt5gSjwqc2wNs616
	q3HYS1o3SooJ39iQqiBjw5Sjb6wZrQf3WXzhjFRd/vvjKiO7kigSDafWBJh0yHonAsk+3VNzKJedM
	gB0fRz7qPljzhVtT5A25PjlTzU7DdpN/g64Vs3SNkzkoXRkw3nkFFeBHWgRHmTnZ4QXgPZppFCayb
	lqXmsfWEiMneObyjHKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dlj-0000000B2d3-0BiD;
	Wed, 11 Mar 2026 07:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dli-0000000B2c4-0DvF
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=P2CZl/konHNEFWaHnqjahUZkUI8rr/R/i2nJhL4jcWE=; b=j+hgMbEnJu/9YPYIHg9VDHHzrP
	GTeuIXH4XswDL2jOnsP9IOSI9z/Qmbb2UG5PIeBP7cINNpccLVQe8fKrDPzRaeKs6aRUK8q+GKI/9
	3Udxjia23NifwLk9ZnDOh6D4DRDuvdhW4+VygpRPsPuTjpE/x/dDwAAslQpTQ7nW1d5QqG5LjtMdT
	xoJ2MrrC2zTN9b8VN+LHSia3dELIFlp7Uya8h+QF4xx5cpBqrOiU2k+NYhBX72iFdvp2JG4TPjOn3
	SVtAAlexS5cqo+jTSKLYQC9sfT7sFzkllwArY0c5RL3Wy/n/i8l2MgZJpFrCcWSSVjlI3rBk6lQPl
	1wUiaDqg==;
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dle-0000000GEMm-2wtZ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 07:14:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P2CZl/konHNEFWaHnqjahUZkUI8rr/R/i2nJhL4jcWE=;
	b=KqAP1cnLaQi0tzUUOpXd8va4Lumcg1YJjPufh5PyPA7HywXPAO2tLoKQrRw7aDxPvTElyx+f0
	0g6XY1tNWp0KjrwE0myEH7xx3bGrBZBoupHJLG4fiogspmdhxK0PHPhHb+FPjXRwqJyM0VLCh4A
	XodCQFRfKp/sRCGp/2ir9BE=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fW2021CPYzKm5n;
	Wed, 11 Mar 2026 15:08:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 184E240363;
	Wed, 11 Mar 2026 15:13:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Mar
 2026 15:13:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Wed, 11 Mar 2026 15:13:44 +0800
Message-ID: <20260311071344.3305640-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_071407_415454_0FD76487 
X-CRM114-Status: GOOD (  16.11  )
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

The RISC-V Bit-manipulation Extension for Cryptography (Zbkb) provides
the 'brev8' instruction, which reverses the bits within each byte.
Combined with the 'rev8' instruction (from Zbb or Zbkb), which reverses
the byte order of a register, we can efficiently implement 16-bit,
32-bit, and (on RV64) 64-bit bit reversal.

This is significantly faster than the default software table-lookup
implementation in lib/bitrev.c, as it replaces memory accesses and
multiple arithmetic operations with just two or three hardware
instructions.

Select HAVE_ARCH_BITREVERSE and provide <asm/bitrev.h> to utilize
these instructions when the Zbkb extension is available at runtime
via the alternatives mechanism.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/bitrev.h | 46 +++++++++++++++++++++++++++++++++
 lib/bitrev.c                    |  3 ---
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..e7a04b96c0c8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_BITREVERSE
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
new file mode 100644
index 000000000000..b1977600638a
--- /dev/null
+++ b/arch/riscv/include/asm/bitrev.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_BITREV_H
+#define __ASM_BITREV_H
+
+#include <linux/types.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+
+extern u8 const byte_rev_table[256];
+static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBKB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB)) {
+		unsigned long result = x;
+
+		asm volatile(
+			".option push\n"
+			".option arch,+zbkb\n"
+			"rev8 %0, %0\n"
+			"brev8 %0, %0\n"
+			".option pop"
+			: "+r" (result)
+		);
+
+		if (__riscv_xlen == 64)
+			return (u32)(result >> 32);
+
+		return (u32)result;
+	}
+
+	return (u32)byte_rev_table[x & 0xff] << 24 |
+	       (u32)byte_rev_table[(x >> 8) & 0xff] << 16 |
+	       (u32)byte_rev_table[(x >> 16) & 0xff] << 8 |
+	       (u32)byte_rev_table[x >> 24];
+}
+
+static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
+{
+	return __arch_bitrev32((u32)x) >> 16;
+}
+
+static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
+{
+	return __arch_bitrev32((u32)x) >> 24;
+}
+#endif
diff --git a/lib/bitrev.c b/lib/bitrev.c
index 81b56e0a7f32..05088231f31f 100644
--- a/lib/bitrev.c
+++ b/lib/bitrev.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#ifndef CONFIG_HAVE_ARCH_BITREVERSE
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/bitrev.h>
@@ -43,5 +42,3 @@ const u8 byte_rev_table[256] = {
 	0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
 };
 EXPORT_SYMBOL_GPL(byte_rev_table);
-
-#endif /* CONFIG_HAVE_ARCH_BITREVERSE */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
