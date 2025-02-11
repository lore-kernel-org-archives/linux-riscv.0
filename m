Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52831C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YyfUri5z2u1H4xxWnqPTliXD8tP3W2eUNVv/vQm1YNs=; b=1lPYDIIA16tVNI
	tLBtggTIbLSmSxvzIISW1u2L+lz8msnspzVVyFwh+cyKnjPsqU+aOe7A1YWFE8DPE0j6fvXQoI7ts
	znHroYVeDNuQ0EuhgNmZQHIcRWfzcUFAfYpH+8fxscpiEANp2jxXKD/B2dU6dAsrHB4/DhYoXObHF
	t2o3VWfI0LZAREp7mCQ/UaIpGYShvn7ZfJELdbT+Z27psVylPuuNJSYTx2fWmt6SDQGI1UEJA/Qv1
	HYPuizoJ/59y2x20qGrpVr8G8kl3ZldoORhwNoLAtjdNQcIHnrZvDwHbRJfgAKU7HknW2v2ea7D+2
	MgWux8VzDVLXo86y9shQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkQM-00000002nHU-1k76;
	Tue, 11 Feb 2025 07:11:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkQJ-00000002nGB-2WlB
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 07:11:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f62cc4088so55921285ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 23:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739257870; x=1739862670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy+jKC2tlxNEcxoYxjCRSJtpvH8bNZPV6Hp8xEJuD6U=;
        b=I1u9F9XR1dWeV2uxERBpRLKJZBjqJunGzgnUyXhXIuYchH1iYz+//4bLffuCebAqF1
         FlD7aEd1eGh1qsBuKO8uxakYyfvkTPdApu0Umq87tmyzSRlJzOCt4fhRp4IupNFxocEd
         FL/Rn59An8sBclTj42HH4s5LvdUnsjfMPhdglBAEbzKNEtayFYEGKAysZkEkX3iBG+s4
         utj34SMupATPGtXqBwRolRrFpR0fMYD5NjG3OMxMp9yp1ytutuC0TTzBCHIGolk5n2Vi
         KyZHvJAOFx2kdN7JboAFTvqT3sYwJXXbeqom5Ixeb/lnEmnk/bcsHqciLGBGoaHK0gGp
         luNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739257870; x=1739862670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy+jKC2tlxNEcxoYxjCRSJtpvH8bNZPV6Hp8xEJuD6U=;
        b=QAG1WS9sN8GbCvR08aSVXpGYbl6XbT8v2TdmwR2wuwe2TCyTIARw9KpmJLz7igFdSG
         CUsZgMcnFnYjXbOFEkwXucuM1lnC8AzXITWJIQzpPK8kFF4qQ03WiRAAALDlEXDHVZd5
         TlhLWNpJ8WJ4GB/XjhQQpUotglSlApWhZ8qzByEXBmGwjUTi9IoVMj/C56+6E83i+zn8
         8yMoMPJQDJA67Ypn7win7ArVl9SsdVoJs+GvcqtBra567sEqbgUug6wB5b6jeTgOgEBb
         YjRsQLUhjxkxKZdqOktrI1j1PzoTFW50RNmb+57v4SdB759DsmFXSGklgIY88azxJhAi
         XhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaEGbSLhLy8dkqbxyiBUsY6qyrBTinsKb0TTrw2WZI9RWST0YHAd7BvG15ht2Eo7uKHZl/aMXcnxYeRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9rB8KKLg14Oi3ftlBFGcFQFZetn5glm46Y9tm8zPtKUkm9/ko
	zqwDxxjrv/19AuCr94+XMWNerS2tXqjKt+ZhCIfGSKmG1lxEje/p
X-Gm-Gg: ASbGncv4zz1WFLY2U1hjtZcC+vfoFaJseY9SZCF7inVcsDd32MTINVDME6mTnooogxs
	PNRM2qQRlNIKmgt5eQLcUC7QE9W7rikU7aIsYrBOeQXdEirQ+o4EMJdS4+ZoQsIShorwUW+nGPz
	MHv13ge3vrHP3iOkAD7GHTQ5/G+BVAVpbjXfjO4WdqewgrzUCiZS17ybuGY0yKe0EmKDMDKiiSA
	a1pl7va8m8s0dP1BbGEv2H2OCauoNX2+gWojWKvLavGCbZEhpJpjSdMHUTU7UCmNV9cBospoUwB
	7z+dK9fqUJjaImCu6s/mqtl4XRc231I3Nn/A7LgEdSgDbbkYPBA9/YaY6XEWXA==
X-Google-Smtp-Source: AGHT+IEgrVFOdypoOBVAMxwlOnLPkbYHeoHYasqV83pZ+UnCn0yDJEUQeCHcUM3a8aVsJoIDGwdHoA==
X-Received: by 2002:a17:903:22c9:b0:215:9bc2:42ec with SMTP id d9443c01a7336-21f4e763b64mr259520485ad.47.1739257870313;
        Mon, 10 Feb 2025 23:11:10 -0800 (PST)
Received: from stone-arch-VM.localdomain ([103.233.162.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cee57sm88429055ad.245.2025.02.10.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 23:11:09 -0800 (PST)
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
To: ebiggers@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ardb@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: [PATCH v4] riscv: Optimize crct10dif with zbc extension
Date: Tue, 11 Feb 2025 15:11:01 +0800
Message-ID: <20250211071101.181652-1-zhihang.shao.iscas@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_231111_655205_D189BF8B 
X-CRM114-Status: GOOD (  16.55  )
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
