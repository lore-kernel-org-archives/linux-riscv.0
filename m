Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F05F8FA72
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0tHN3oNv+47Ob/ohmh1Q/YW5vls/jw5PXOp+zZe8UA=; b=RWf/oRG5VMgPQR
	p792MTVToix4kcBPrOAJagD8Odbxe4KH0H/5Zo41zJ4WImxLHw9dx/OkG5Lk0wKaTZI1Sb/Os7UHV
	M9Yh1QaUrUyoPW5pyrCE/IH3JYaTW5nfwvzjx81gyLnsZSbr6iU+mGpCEYDiQJSvUt/JtD+/Tc/dl
	tCFW8i75niFXUoEOkn+VimeiJIvd+C5kJw+vTxLeznrEDSEvOKOecPcYSLgUUk+/b2l4DuHVZgUH4
	cGutMQySPXPVIxyBPg1SQpbfYMLRDpKVR3PV1nHNDtf5JdLMBJTVlaADEq1IrCWjuFRrIpJfMv8s2
	CYnKYz3Q0+X4V5ouG1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAm5-00000008d79-2LDx;
	Tue, 21 Apr 2026 13:04:21 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAm2-00000008d3o-1wcJ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 13:04:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8xr2wRfVymqzTlY+VubEP21KyNGScLO5UnuHqiprrb0=;
	b=dnzTqMANzpxbCo8Vct6700JQH4qek4wXIaVpboky5PZZ3GKIfg4peFonZr55VdWw2G4mCF20V
	IlppPRGujT4VB6W2IyhhiwNSJ3PhNzlV/vxFE9w3nvhsQMmDkE/fIRM0D3yyZhS6i2vE+XFbr5f
	42Qb/HfYgVmoGXB1i0xyUs8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4g0MpL4tDrzLlVS;
	Tue, 21 Apr 2026 20:57:46 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E36F40539;
	Tue, 21 Apr 2026 21:04:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Apr
 2026 21:04:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
Subject: [PATCH v5 3/3] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Tue, 21 Apr 2026 21:07:52 +0800
Message-ID: <20260421130752.607500-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421130752.607500-1-ruanjinjie@huawei.com>
References: <20260421130752.607500-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060418_873071_11ABD664 
X-CRM114-Status: GOOD (  13.21  )
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

Select HAVE_ARCH_BITREVERSE as well as GENERIC_BITREVERSE,
and provide <asm/bitrev.h> to utilize these instructions when
the Zbkb extension is available at runtime via the alternatives
mechanism.

Link: https://docs.riscv.org/reference/isa/unpriv/b-st-ext.html
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/Kconfig              |  2 ++
 arch/riscv/include/asm/bitrev.h | 51 +++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/riscv/include/asm/bitrev.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..4f9e1caee5f9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -105,6 +105,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_8B if DYNAMIC_FTRACE_WITH_CALL_OPS
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_BITREVERSE
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
@@ -128,6 +129,7 @@ config RISCV
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_BITREVERSE if RISCV_ISA_ZBKB
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
new file mode 100644
index 000000000000..4b9b8d34cc3b
--- /dev/null
+++ b/arch/riscv/include/asm/bitrev.h
@@ -0,0 +1,51 @@
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
+	unsigned long result;
+
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
+		return generic___bitrev32(x);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbkb\n"
+		"rev8 %0, %1\n"
+		"brev8 %0, %0\n"
+		".option pop"
+		: "=r" (result) : "r" ((long)x)
+	);
+
+	return result >> (__riscv_xlen - 32);
+}
+
+static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
+{
+	return __arch_bitrev32(x) >> 16;
+}
+
+static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
+{
+	unsigned long result;
+
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
+		return generic___bitrev8(x);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbkb\n"
+		"brev8 %0, %1\n"
+		".option pop"
+		: "=r" (result) : "r" ((long)x)
+	);
+
+	return result;
+}
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
