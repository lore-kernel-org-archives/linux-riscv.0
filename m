Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E8F43688
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vYplen8pxAFf6m7AY9Dy6i5ggJl2rEdEAzyqiw65bM=; b=IGZFlf7BY9kJUy
	bqiqwCIXPTXgCAUOzrShoudn9fQSyE+AjzZ6KGwb1SO9JOTMT9n6JihFRklS0wlqAg2iDu56z/PoU
	w5wMdCfKPZ/mLrUOpp+htOylOmgBrBwKSJN/UmhSJKLvypEvRc7OCFLXK5n2tYGBXO0wO6yOsP3fU
	T74bc4xrgyXHNCNKyAr9fa3gcLJvXvpKyYI+RBSE6DrwZE3DAafHjPiPsSsuwJ+xw1Ehxay9o2+Ng
	isY+LJ7Guu8nzaRCoO1+EGTryDBpFgUFngYi+yVaYsqC3wNNgE0HI5kcWYkO2bHZP+wNo9mIahbE2
	KDdCUgKZRyaQ1YvbTQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfV9-00000003osE-40aZ;
	Fri, 17 Apr 2026 09:28:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU5-00000003nJV-4BR7
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Apr 2026 09:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=FxlOPvECtnjnV1ZPXJ4JS7Iipj4rGHRkRHW8wOcFGus=; b=GXN4TNkdYwuYrc9UF6d4InAbG2
	gSZwAzS4kF7KZk+z7Y8WWnlfAaA0xShxteqLy/FXT2p/YCyLgPKSe8Cd4uFPRKDsvf1P8jRNt6S+7
	CLFO6VOxo2+hF5f3cLME//J9ns+RwKHZaa2n/kaB653XLqlmC8zk5TxVfAlcFgmPH9LDajnBLweF4
	CluL8uHeVsveZuOhUlADJhLmlkDryNbKj9xEjcuhRrwdFTFgwlR5Cpfi7rZZ3kGozSRq1oYx+I9Zd
	ztK3s7Gc6RMSqPjUQgOl/SonIBT7/yTOWOJM9lE7Mz3laYgy+9NMNvOXDbIll5nRohA6vZyZoJu6s
	gzF2gAVA==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU1-000000054iV-20hp
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 09:27:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FxlOPvECtnjnV1ZPXJ4JS7Iipj4rGHRkRHW8wOcFGus=;
	b=27xrz80Lb6YDOwbToRfaauDbt5LrRgkq5V+ucI30qtuXhCW8heYYUHT/QuoKW/nKImoUWxRip
	v5Y+zVVhNpKzaTsMa8gZzyoblGxL5KMwjBYukCSrrBkQI47mFz3f8NF3afLNBPaEy4EiA+RoTH8
	J0BkdHhlvJ2AOgevXdJuw8g=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fxqBL6FRdz1T4Hx;
	Fri, 17 Apr 2026 17:21:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 59EBE40569;
	Fri, 17 Apr 2026 17:27:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Apr
 2026 17:27:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>
Subject: [PATCH v3 2/2] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Fri, 17 Apr 2026 17:31:02 +0800
Message-ID: <20260417093102.3812978-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417093102.3812978-1-ruanjinjie@huawei.com>
References: <20260417093102.3812978-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102730_149324_58EC1FE7 
X-CRM114-Status: GOOD (  13.11  )
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

Link: https://docs.riscv.org/reference/isa/unpriv/b-st-ext.html
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/bitrev.h | 55 +++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/riscv/include/asm/bitrev.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..05f2b2166a83 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_BITREVERSE if RISCV_ISA_ZBKB
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
new file mode 100644
index 000000000000..eef263cc6655
--- /dev/null
+++ b/arch/riscv/include/asm/bitrev.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_BITREV_H
+#define __ASM_BITREV_H
+
+#include <linux/types.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+#include <asm-generic/bitops/__bitrev.h>
+
+static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
+{
+	unsigned long result = (unsigned long)x;
+
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
+		return generic___bitrev32(x);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbkb\n"
+		"rev8 %0, %0\n"
+		"brev8 %0, %0\n"
+		".option pop"
+		: "+r" (result)
+	);
+
+#if __riscv_xlen == 64
+	return (u32)(result >> 32);
+#else
+	return (u32)result;
+#endif
+}
+
+static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
+{
+	return __arch_bitrev32((u32)x) >> 16;
+}
+
+static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
+{
+	unsigned long result = (unsigned long)x;
+
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
+		return generic___bitrev8(x);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbkb\n"
+		"brev8 %0, %0\n"
+		".option pop"
+		: "+r" (result)
+	);
+
+	return (u8)result;
+}
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
