Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A42F41982
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFZujS4aELNwPCFMkEwwcT1+Zb3kwekYJcFBcwlQ0io=; b=f+WXriNP2wB/4W
	/joMEZSA+jIIylfMqzMcBQDHvJB+5kw1ZXbW57EHQHfEO1d9GszzhybfgP9Eayt8wLQWoESMIHoi8
	TA9Irr0sEEpmRNDQ686brltFpe8ILnEiUCX3gh3XPNJNmRzrcjyoX9SnEx+CJ5w7KvfBN6Z+Lt2Yx
	rvDsCL6aW6QGGFW52/8eQtI8zJOGUJA/rYiAehcNCe8+nCgrW7pFS8cNpFlakGaoTTbeMY2u8ak1T
	lDEz7jWzivZ2R+FUCSp6OQIwFd99rih2vD1qwb2cyAMUen5jXBCX5aKVf7MHikcoYwrGdqcWTtt2c
	sCcq0WVxDtoVLuJJSh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCweH-00000000uqM-0Wvk;
	Wed, 15 Apr 2026 09:35:05 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCweD-00000000uoC-23R0
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 09:35:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3rcuULcz1Pyzw1DzJpbcb1yxL1sVr10wsmtquP3Zpz8=;
	b=j6aaRnnv6WXsKn9TtPQ+OigAKw/q/Er7UQgKDehYEOaV4z9cNnz/0HVrKzK6cgWGEnmnKvgNZ
	kRt+U8ngaMdJ50nnlvx+o1pctX847IpWBGY/D5EjvJski/KKEvqbDTWngbeYFi58UueNUM6FZ9V
	HkksFiUn2wnvRwbnfjT8KLg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fwbRX5lqBzcZyN;
	Wed, 15 Apr 2026 17:28:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E29F040561;
	Wed, 15 Apr 2026 17:34:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 15 Apr
 2026 17:34:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <cp0613@linux.alibaba.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 2/2] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Wed, 15 Apr 2026 17:38:27 +0800
Message-ID: <20260415093827.2776328-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415093827.2776328-1-ruanjinjie@huawei.com>
References: <20260415093827.2776328-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_023502_185835_ACA7451D 
X-CRM114-Status: GOOD (  13.81  )
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
 arch/riscv/include/asm/bitrev.h | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
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
index 000000000000..9f205ac84796
--- /dev/null
+++ b/arch/riscv/include/asm/bitrev.h
@@ -0,0 +1,41 @@
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
+	unsigned long result = x;
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
+	if (__riscv_xlen == 64)
+		return (u32)(result >> 32);
+
+	return (u32)result;
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
