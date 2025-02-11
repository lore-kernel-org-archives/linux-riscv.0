Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C9C0219D
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aXl33I3wsSvvd99nIuyffFR7mWmTMAz+xTj0/cM4EeQ=; b=Swfa5uYbuda7uq
	83CE3qjbtHWCG349CKJ/3XvpebOWI/q0L3JPF1f4rvTIYItu3buDWvRaTnaViSkXepQ4a86Yzb/0W
	2RNh1v+VfMrKbM7RB5bd6Z6ujJiiykc7wgzh0a3Srm5pZljDYg+XKWDJiHEXZ8XnRw786iH7zBmJx
	fiMuI1GHSzC6p/9qo+dlOVHRoR5Q1sojprPBC8jGe+vrLWEO+WbbwBPYLuEOZmOS0+0oyTqDhIoEf
	Gfz3gtt/idI1HWBkS6JHg1Mp1yfS8ZpbkTLyxcS629ivYwLIuEDC2nSeT9TjlPZ7ALG6ladd9UXZB
	WEsEwmm78AC9NOC2oY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlLH-00000002wgN-2Rtl;
	Tue, 11 Feb 2025 08:10:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlJZ-00000002wJ6-1hEW
	for linux-riscv@bombadil.infradead.org;
	Tue, 11 Feb 2025 08:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KA4jpQ5V3ysCO6YGflqBLf2hPOtMTXa2birIlOr0EAw=; b=Vy+pGYvayVwXmMfOPENK2y7CdT
	VxNVP1d1Bqv2uAAC4z9ovxe9WhNIvHAYoiOQfxgAgcypi3haD7WEUbivUKPUTOr92abg8C9qJXaqe
	k/0tzrO5wG/HRRLPi+jelLNHFcUZTSDYWqL443gnXfUK2UGcOPL57J8/d7Z9HK6yj4DzJ+CynLfln
	fl01PFpYfKl9e1jUYqKa5IpJ9oJjY7HpqsfIfu7IlfRFOTx7OQ5RQB9wQ4SrMhu2WAE1yd1s3k86H
	q6Adejw5Y2ZPFELpuMEfj54tt3tccgFYVJuAyYtdS3R2gke5U1cSa4FIc879cLueOWpJm7Nt2nJ9q
	KdzyxteQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlJV-00000000W3w-2xDB
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 08:08:16 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f44353649aso7716500a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739261290; x=1739866090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KA4jpQ5V3ysCO6YGflqBLf2hPOtMTXa2birIlOr0EAw=;
        b=QbKApWovGRjydguDoB0a95wNtH3deeTDRvlKIrq9B2VZgVszo3nUqTdanQxvUnoKx5
         qZBWLUkWauGq29wG5nWP6gR/heLYbSmLm7nfrPNQIgTWDkUJRPn3vc5hNX+IF8rtnCKB
         +8WxyyuQlY2F+a+ZUzfxSY7Zrj88CLN+iMCkh6RM+dMOiObEeKxr2WemYLUBbdmJqIK7
         W/PzUBRk8GJAhKvF/THKbpYWN3jEQPQlSgMgup+QNFWZMsuieCEYA8vlZGAu76X6qOMe
         iuqkdLsA1QItnKQlBrDP4BO6o5h73MN+bm6TVRyLYHEqdDGBxVTOmJGwG3P1rVkI/v6L
         yWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261290; x=1739866090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA4jpQ5V3ysCO6YGflqBLf2hPOtMTXa2birIlOr0EAw=;
        b=mFPd+q8WkG1EDCWJoGw0PtKMuIjXtkmXtwzFR/pwgU7U4v1A7BZkXyjTu7OBKU0gg+
         +lvMTJykhxzh9JUOgrmjIvOXsDvltz7RnQq7Qjf6mCO+GgO4E7uuGSsSkLIj/L6oZYdZ
         dJmRZqSJAmqPI2H3dj7DJ11h+eVo8lqxWVQ7va+r68v/Xdm4SMnIa3MIqe2P3kpaKsMK
         qjoJRi5+9Uu31/FvBf6rkrSj9e2C6zoXPIoTJmFe4UMefNl98NKQgqhEXY+2RlspXesM
         0X/R0jM+tsrjZD8wyCheKRT0Cp7T1+b/a+LhOqRKaz5Mklr1yJIIAtMWmcNDl9CGyVo2
         EzUw==
X-Forwarded-Encrypted: i=1; AJvYcCUDgxCCWMFjNy51n5mXpyc812I1seGAqhpbSSFRwvtQW6T2Kifb+Uxgn2qV55bt8N5s/okIRlQB09Mr8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0gyAQi3g1eq3ml5KWr9l9wMHDTh5mDMe9dMDlNYoYMlHkaQRG
	xtQ0aS/IH8TPZ/K75W/9u0KqIlNvJjo47PG/7cyfqSobLXvmh7xY
X-Gm-Gg: ASbGncsctaf3I3N7ARUZpYwJdcDfX/V4pn7t9/tx1moR/Ijb2tNXdxWnDY2lJrVmmrX
	fymL1PLZw9Bn/ub53hL+bRl99Yy5f1XtuZ0EHOMrPFbSOyXizlAh6xUsB3vifwquyCUm/qml/Pu
	w7yFLY98zEJFpAl1Ep+mKYTE0rLX1SXlea6Xww/xk68ZNlWJSxMe15IvCNPD7n4III8C8NroVtp
	6YXc5vNjLfms3BfaTFtZagItu5B7h7mRXjTn2kgi5bFAsbrmzVdrjcY4P/oOjmKY00k2rk05yzV
	kOnZcR106dRKDXLx810SEwOB4FOvjLO9SxrTy1BosiVxmG7sSrRPDESCJML9YQ==
X-Google-Smtp-Source: AGHT+IE5uSVRXFS1dB2KUSrGTxStqiYVu8rwl/uUt4ZvP6YcriprR65a1RWTFCq4qlSgVSruBDbWag==
X-Received: by 2002:a17:90b:2703:b0:2f7:7680:51a6 with SMTP id 98e67ed59e1d1-2fa9ed5d432mr3284958a91.6.1739261290205;
        Tue, 11 Feb 2025 00:08:10 -0800 (PST)
Received: from stone-arch-VM.localdomain ([103.233.162.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa274407f5sm8122188a91.15.2025.02.11.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:08:09 -0800 (PST)
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
To: ebiggers@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ardb@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Subject: [PATCH v4 RESEND] riscv: Optimize crct10dif with zbc extension
Date: Tue, 11 Feb 2025 16:07:29 +0800
Message-ID: <20250211080729.205872-1-zhihang.shao.iscas@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080814_208646_20A4B792 
X-CRM114-Status: GOOD (  16.58  )
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

The current CRC-T10DIF algorithm on RISC-V platform is based on
table-lookup optimization.
Given the previous work on optimizing crc32 calculations with zbc
extension, it is believed that this will be equally effective for
accelerating crc-t10dif.

Therefore this patch offers an implementation of crc-t10dif using zbc
extension. This can detect whether the current runtime environment
supports zbc feature and, if so, uses it to accelerate crc-t10dif
calculations.

This patch is updated due to the patchset of updating kernel's
CRC-T10DIF library in 6.14, which is finished by Eric Biggers.
Also, I used crc_kunit.c to test the performance of crc-t10dif 
optimized by crc extension.

Acked-by: Eric Biggers <ebiggers@kernel.org>
Tested-by: Eric Biggers <ebiggers@kernel.org>
Reviewed-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
---
v4:
- Use proper data types and remove #defines according
to Eric's comments. (Eric)
---
v3:
- Rebase for Eric's crc tree. (Eric)
---
v2:
- Use crypto self-tests instead. (Eric)
- Fix some format errors in arch/riscv/crypto/Kconfig. (Chunyan)
---
 arch/riscv/Kconfig                |   1 +
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/crc-t10dif-riscv.c | 120 ++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 arch/riscv/lib/crc-t10dif-riscv.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..db1cf9666dfd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
+	select ARCH_HAS_CRC_T10DIF if RISCV_ISA_ZBC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 79368a895fee..689895b271bd 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -16,6 +16,7 @@ lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 obj-$(CONFIG_CRC32_ARCH)	+= crc32-riscv.o
+obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-riscv.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/arch/riscv/lib/crc-t10dif-riscv.c b/arch/riscv/lib/crc-t10dif-riscv.c
new file mode 100644
index 000000000000..da90e2900ca7
--- /dev/null
+++ b/arch/riscv/lib/crc-t10dif-riscv.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Accelerated CRC-T10DIF implementation with RISC-V Zbc extension.
+ *
+ * Copyright (C) 2024 Institute of Software, CAS.
+ */
+
+#include <asm/alternative-macros.h>
+#include <asm/byteorder.h>
+#include <asm/hwcap.h>
+
+#include <linux/byteorder/generic.h>
+#include <linux/crc-t10dif.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#define CRCT10DIF_POLY 0x8bb7
+
+#if __riscv_xlen == 64
+#define CRCT10DIF_POLY_QT_BE 0xf65a57f81d33a48a
+
+static inline u64 crct10dif_prep(u16 crc, const __be64 *ptr)
+{
+	return ((u64)crc << 48) ^ __be64_to_cpu(*ptr);
+}
+
+#elif __riscv_xlen == 32
+#define CRCT10DIF_POLY_QT_BE 0xf65a57f8
+
+static inline u32 crct10dif_prep(u16 crc, const __be32 *ptr)
+{
+	return ((u32)crc << 16) ^ __be32_to_cpu(*ptr);
+}
+
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+static inline u16 crct10dif_zbc(unsigned long s)
+{
+	u16 crc;
+
+	asm volatile   (".option push\n"
+			".option arch,+zbc\n"
+			"clmulh %0, %1, %2\n"
+			"xor    %0, %0, %1\n"
+			"clmul  %0, %0, %3\n"
+			".option pop\n"
+			: "=&r" (crc)
+			: "r"(s),
+			  "r"(CRCT10DIF_POLY_QT_BE),
+			  "r"(CRCT10DIF_POLY)
+			:);
+
+	return crc;
+}
+
+static inline u16 crct10dif_unaligned(u16 crc, const u8 *p, size_t len)
+{
+	size_t bits = len * 8;
+	unsigned long s = 0;
+	u16 crc_low = 0;
+
+	for (int i = 0; i < len; i++)
+		s = *p++ | (s << 8);
+
+	if (len < sizeof(u16)) {
+		s ^= crc >> (16 - bits);
+		crc_low = crc << bits;
+	} else {
+		s ^= (unsigned long)crc << (bits - 16);
+	}
+
+	crc = crct10dif_zbc(s);
+	crc ^= crc_low;
+
+	return crc;
+}
+
+u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
+{
+	size_t offset, head_len, tail_len;
+	const __be64 *p_ul;
+	unsigned long s;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+			     RISCV_ISA_EXT_ZBC, 1)
+		 : : : : legacy);
+
+	offset = (unsigned long)p & (sizeof(unsigned long) - 1);
+	if (offset && len) {
+		head_len = min(sizeof(unsigned long) - offset, len);
+		crc = crct10dif_unaligned(crc, p, head_len);
+		p += head_len;
+		len -= head_len;
+	}
+
+	tail_len = len & (sizeof(unsigned long) - 1);
+	len = len >> ilog2(sizeof(unsigned long));
+	p_ul = (const __be64 *)p;
+
+	for (int i = 0; i < len; i++) {
+		s = crct10dif_prep(crc, p_ul);
+		crc = crct10dif_zbc(s);
+		p_ul++;
+	}
+
+	p = (const u8 *)p_ul;
+	if (tail_len)
+		crc = crct10dif_unaligned(crc, p, tail_len);
+
+	return crc;
+legacy:
+	return crc_t10dif_generic(crc, p, len);
+}
+EXPORT_SYMBOL(crc_t10dif_arch);
+
+MODULE_DESCRIPTION("CRC-T10DIF using RISC-V ZBC Extension");
+MODULE_LICENSE("GPL");
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
