Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20208C71155
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxSkAsjxxh0WTyGeaViVlEuHPxmVGwR5d7/WDS3qe5Y=; b=d67nWfuJgcp33k
	RvP3dGeTcxZVG3LV1sNuKh3O8eDXvptZs8dkD7wWl6DuRUi6LKstAiYm7bt0yt4LbuGeO3cupPOwD
	xodGy1giBC5PmrXL6UiuM4eGSMDLAc4TSigTYH9C7AhvmM1tdD0B6/SQzhoZgAbfWIpTRDiFUQm7E
	C+thWUmvH8kwl4+rkMSIg/rPDD/Ush7NRXfNj69D8VkkDa4q0t91i1fyxCJHbIdHMDli5YFoSLrle
	f5OWZCAShicdQnK5Vp8WRF+maTGNn4vTf+b9uPsUqm2lb9//UvSpU6WeBiATLp+irxZgwt2MkBV/B
	J5PmQMI11kzpUZdEmFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaIg-0000000FVci-1Bva;
	Fri, 20 Jun 2025 11:52:54 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZjp-0000000FRfy-0hVz
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750418211; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=+lnOL77aXhqazlnRRdN1jhJKODwRdDKGIkoGxnroMu0=;
	b=uZxTXkwdKKtaUSacsd1aYf3WAK7PAX9YUOHG5GRy06Fv5gACCnpBYB2wvrr+g4Fp/mC1QRZNiO7bCI/WJxnVM26fhlM+hdD98tXmJ0Nafqc8mIvAo3mIfA1Mx36Hha2mJgz6Tb7ME8xeDXR2wbBBmCrPBfgd22NTW6QVI8G63oU=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WeKdQKG_1750418202 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 19:16:50 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	arnd@arndb.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 1/2] bitops: generic rotate
Date: Fri, 20 Jun 2025 19:16:09 +0800
Message-ID: <20250620111610.52750-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620111610.52750-1-cp0613@linux.alibaba.com>
References: <20250620111610.52750-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041653_348965_49FC73A3 
X-CRM114-Status: GOOD (  11.45  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

This patch introduces a generic bitops rotate implementation that moves
the ror* and rol* functions from include/linux/bitops.h.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 include/asm-generic/bitops.h        |  2 +-
 include/asm-generic/bitops/rotate.h | 98 +++++++++++++++++++++++++++++
 include/linux/bitops.h              | 80 -----------------------
 tools/include/asm-generic/bitops.h  |  2 +-
 4 files changed, 100 insertions(+), 82 deletions(-)
 create mode 100644 include/asm-generic/bitops/rotate.h

diff --git a/include/asm-generic/bitops.h b/include/asm-generic/bitops.h
index a47b8a71d6fe..8f30aac8325c 100644
--- a/include/asm-generic/bitops.h
+++ b/include/asm-generic/bitops.h
@@ -29,7 +29,7 @@
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/hweight.h>
 #include <asm-generic/bitops/lock.h>
-
+#include <asm-generic/bitops/rotate.h>
 #include <asm-generic/bitops/atomic.h>
 #include <asm-generic/bitops/non-atomic.h>
 #include <asm-generic/bitops/le.h>
diff --git a/include/asm-generic/bitops/rotate.h b/include/asm-generic/bitops/rotate.h
new file mode 100644
index 000000000000..65449fefb402
--- /dev/null
+++ b/include/asm-generic/bitops/rotate.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_ROTATE_H_
+#define _ASM_GENERIC_BITOPS_ROTATE_H_
+
+#include <asm/types.h>
+
+/**
+ * generic_rol64 - rotate a 64-bit value left
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u64 generic_rol64(u64 word, unsigned int shift)
+{
+	return (word << (shift & 63)) | (word >> ((-shift) & 63));
+}
+
+/**
+ * generic_ror64 - rotate a 64-bit value right
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u64 generic_ror64(u64 word, unsigned int shift)
+{
+	return (word >> (shift & 63)) | (word << ((-shift) & 63));
+}
+
+/**
+ * generic_rol32 - rotate a 32-bit value left
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u32 generic_rol32(u32 word, unsigned int shift)
+{
+	return (word << (shift & 31)) | (word >> ((-shift) & 31));
+}
+
+/**
+ * generic_ror32 - rotate a 32-bit value right
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u32 generic_ror32(u32 word, unsigned int shift)
+{
+	return (word >> (shift & 31)) | (word << ((-shift) & 31));
+}
+
+/**
+ * generic_rol16 - rotate a 16-bit value left
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u16 generic_rol16(u16 word, unsigned int shift)
+{
+	return (word << (shift & 15)) | (word >> ((-shift) & 15));
+}
+
+/**
+ * generic_ror16 - rotate a 16-bit value right
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u16 generic_ror16(u16 word, unsigned int shift)
+{
+	return (word >> (shift & 15)) | (word << ((-shift) & 15));
+}
+
+/**
+ * generic_rol8 - rotate an 8-bit value left
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u8 generic_rol8(u8 word, unsigned int shift)
+{
+	return (word << (shift & 7)) | (word >> ((-shift) & 7));
+}
+
+/**
+ * generic_ror8 - rotate an 8-bit value right
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static __always_inline u8 generic_ror8(u8 word, unsigned int shift)
+{
+	return (word >> (shift & 7)) | (word << ((-shift) & 7));
+}
+
+#ifndef __HAVE_ARCH_ROTATE
+#define rol64(word, shift) generic_rol64(word, shift)
+#define ror64(word, shift) generic_ror64(word, shift)
+#define rol32(word, shift) generic_rol32(word, shift)
+#define ror32(word, shift) generic_ror32(word, shift)
+#define rol16(word, shift) generic_rol16(word, shift)
+#define ror16(word, shift) generic_ror16(word, shift)
+#define rol8(word, shift)  generic_rol8(word, shift)
+#define ror8(word, shift)  generic_ror8(word, shift)
+#endif
+
+#endif /* _ASM_GENERIC_BITOPS_ROTATE_H_ */
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..1f8ef472cfb3 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -97,86 +97,6 @@ static __always_inline unsigned long hweight_long(unsigned long w)
 	return sizeof(w) == 4 ? hweight32(w) : hweight64((__u64)w);
 }
 
-/**
- * rol64 - rotate a 64-bit value left
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u64 rol64(__u64 word, unsigned int shift)
-{
-	return (word << (shift & 63)) | (word >> ((-shift) & 63));
-}
-
-/**
- * ror64 - rotate a 64-bit value right
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u64 ror64(__u64 word, unsigned int shift)
-{
-	return (word >> (shift & 63)) | (word << ((-shift) & 63));
-}
-
-/**
- * rol32 - rotate a 32-bit value left
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u32 rol32(__u32 word, unsigned int shift)
-{
-	return (word << (shift & 31)) | (word >> ((-shift) & 31));
-}
-
-/**
- * ror32 - rotate a 32-bit value right
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u32 ror32(__u32 word, unsigned int shift)
-{
-	return (word >> (shift & 31)) | (word << ((-shift) & 31));
-}
-
-/**
- * rol16 - rotate a 16-bit value left
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u16 rol16(__u16 word, unsigned int shift)
-{
-	return (word << (shift & 15)) | (word >> ((-shift) & 15));
-}
-
-/**
- * ror16 - rotate a 16-bit value right
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u16 ror16(__u16 word, unsigned int shift)
-{
-	return (word >> (shift & 15)) | (word << ((-shift) & 15));
-}
-
-/**
- * rol8 - rotate an 8-bit value left
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u8 rol8(__u8 word, unsigned int shift)
-{
-	return (word << (shift & 7)) | (word >> ((-shift) & 7));
-}
-
-/**
- * ror8 - rotate an 8-bit value right
- * @word: value to rotate
- * @shift: bits to roll
- */
-static inline __u8 ror8(__u8 word, unsigned int shift)
-{
-	return (word >> (shift & 7)) | (word << ((-shift) & 7));
-}
-
 /**
  * sign_extend32 - sign extend a 32-bit value using specified bit as sign-bit
  * @value: value to sign extend
diff --git a/tools/include/asm-generic/bitops.h b/tools/include/asm-generic/bitops.h
index 9ab313e93555..bfa06c6babe3 100644
--- a/tools/include/asm-generic/bitops.h
+++ b/tools/include/asm-generic/bitops.h
@@ -24,7 +24,7 @@
 #endif
 
 #include <asm-generic/bitops/hweight.h>
-
+#include <asm-generic/bitops/rotate.h>
 #include <asm-generic/bitops/atomic.h>
 #include <asm-generic/bitops/non-atomic.h>
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
