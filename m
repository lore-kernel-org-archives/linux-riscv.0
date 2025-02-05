Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB66C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4nZCbb3ri+iVD0RgmwoIo9xIUGf2Nr2hboVf3HoAPdE=; b=QC2fo9cPwl2DMm
	B1zn01hBsAxzmpOQkgNDxhaRNpew1GE2sW+VTxwvJwADUenrP3eoZ+uE2Ypj50MuulOWmG+HxYqDH
	8SgxT9b9BoSmeobklByTeRIPL2AaDVOm0t7EKua6QPUwLKu4Brap5ZoHeD42M7+NH02lTnIPrbjin
	A6XnkOUXGB9gdTcnzG9xHWzmW1yDfRmdFxnF8sR96ZdmDHuZUiWrCFE3J48pFTa72YL88m1DS5MUK
	8NYtSTEHGbOdPXkt5k9UerqaSmSlun7Vhve0m7Es6VzB/744TrOhmoWqzSP7aDpCL5Yba9L8oApE/
	aqM2R0sl/qAzKuIdIPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZMu-00000002Sdt-16JV;
	Wed, 05 Feb 2025 06:58:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZMs-00000002Scu-0VF8
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 06:58:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21ddb406f32so23499415ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 22:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738738716; x=1739343516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kd7vO1mBpQG2GAzZAeXH5DIUcIHEuC0PONU4wK72z0=;
        b=maWGeEGi4F6YDlq90jP+X9NJPeCaqgqg8NOvn9nLZF8SYEd8VptIlA/vspuZAw2Fed
         zVclHK3d4XuJDxgib6g9mFi80Ac5q4v6qWJNq2W4SZoY4pr3fyjLp7mKoJTHftC9rHn5
         W5VwBd0yw1Tdy3+SCuHl8543LhQfbiRfKhklSZnPcry9BSpf1jE+z5IKoHUoJcUf2AEG
         b0gbxOSFI2CZo+qfAsk8erXiB1RRRJ/jrtbIIaAOMkvUzCftEtV16ZoIyyjPLTU9cs2W
         TvMiGZ0t83rlMWy+12KQIMOPD8oYiCEq/Fs+bX3c4I3cIvvFOpm1TUNpJuwZS1ztmr6e
         1u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738716; x=1739343516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kd7vO1mBpQG2GAzZAeXH5DIUcIHEuC0PONU4wK72z0=;
        b=vMyC2+S24fbwf5s0pSlq1AwMq4khA74aaPtNDslbIIBlLXl+8ffWZRev+NRbgSBN/y
         qJp5RVN2bAiwtYbXCGJ4a6GhSsg40wxeY0UH7O+Plvmio4Ym7yTkRi9ID6+4vkA+NM+p
         QQ4eS/EyYGb3j4vV9UpXoEX+ZBxCbexoJHJa65bxWS7EW+HOx4adbr5WVRB1xjAuHjUV
         1cTENmUOy0PWqF4lA81z0wtKPGzWwfJ0EWkFEBK9Vo+N6rq5Dwv60wEwvUyLvXt/YAbi
         x4+Sn2dQtPi6t5Wez5/0VSFoodC91MM2sjyjfueOF5fzASwThYbQNFHacxpaDCxvZOA9
         KNBg==
X-Forwarded-Encrypted: i=1; AJvYcCURiwyj/cvFgQLLOfwHgYZuoLJbI+JlskGQkpHMEr3ZgsVxvnEzYOt7WmmjB/u5mK/adS11qGFPSm3KKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9yVf/cOhnb3QXPmsorZOOpz5egirhEbD68eDHt7YOkVSCsNF+
	vNFSQzUk+NsW5FxfuXOvtEyenwt1jhODWWZhLN59GXZw/oiQ2f88
X-Gm-Gg: ASbGncvSjoJGtje+30oTlTxg4dBNxpaI69n62I7bcshqfijw5ACoWzwzKczOiz2IHi0
	/l9PblzelY80rpqnSs4eOQw16KhA7c0TRAH9lNpmOt4CzR4/0dV0dOxbBhjEierafG4X5/g6b+2
	V04iIWbQVz+Ggbc86VfZhAJJTzC42Aka+u8ufyVk/gshlzfqTHhe+0OXOSmWF6jpJLiDH0R3sfC
	mtWmoUTx3HTFOqPMHmCxQ+1mkdq6fgO+Hz9O2S0x4LZnKcstsf+2rZB71Gf9uGjMPMLq+FmXPF1
	nr8EUjipzPJINPejAtpbepTGOs7gIAfQ96BhXPl+eR46F5GDpb5HoObKIIBaKg==
X-Google-Smtp-Source: AGHT+IHfHQKhkBH6SnAi3ELRcLWQHwUP67+tCkKUBnDupDjD7giii5QzmxoANqH3MWy9/toD2fNc4Q==
X-Received: by 2002:a05:6a20:6f07:b0:1ed:9abe:c663 with SMTP id adf61e73a8af0-1ede88306c8mr2956025637.10.1738738716391;
        Tue, 04 Feb 2025 22:58:36 -0800 (PST)
Received: from stone-arch-VM.localdomain ([103.233.162.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794b1sm11174436a12.53.2025.02.04.22.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:58:35 -0800 (PST)
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
To: ebiggers@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ardb@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: [PATCH v3] riscv: Optimize crct10dif with zbc extension
Date: Wed,  5 Feb 2025 14:58:15 +0800
Message-ID: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_225838_160573_1AD91A87 
X-CRM114-Status: GOOD (  16.61  )
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
Also, I used crc_kunit.c to test the performance of crc-t10dif optimized
by crc extension.

Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
---
 arch/riscv/Kconfig                |   1 +
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/crc-t10dif-riscv.c | 132 ++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
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
index 000000000000..b1ff7309f0f5
--- /dev/null
+++ b/arch/riscv/lib/crc-t10dif-riscv.c
@@ -0,0 +1,132 @@
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
+#define STEP_ORDER 3
+
+#define CRCT10DIF_POLY_QT_BE 0xf65a57f81d33a48a
+
+static inline u64 crct10dif_prep(u16 crc, unsigned long const *ptr)
+{
+	return ((u64)crc << 48) ^ (__force u64)__cpu_to_be64(*ptr);
+}
+
+#elif __riscv_xlen == 32
+#define STEP_ORDER 2
+#define CRCT10DIF_POLY_QT_BE 0xf65a57f8
+
+static inline u32 crct10dif_prep(u16 crc, unsigned long const *ptr)
+{
+	return ((u32)crc << 16) ^ (__force u32)__cpu_to_be32(*ptr);
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
+#define STEP (1 << STEP_ORDER)
+#define OFFSET_MASK (STEP - 1)
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
+	unsigned long const *p_ul;
+	unsigned long s;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+			     RISCV_ISA_EXT_ZBC, 1)
+		 : : : : legacy);
+
+	offset = (unsigned long)p & OFFSET_MASK;
+	if (offset && len) {
+		head_len = min(STEP - offset, len);
+		crc = crct10dif_unaligned(crc, p, head_len);
+		p += head_len;
+		len -= head_len;
+	}
+
+	tail_len = len & OFFSET_MASK;
+	len = len >> STEP_ORDER;
+	p_ul = (unsigned long const *)p;
+
+	for (int i = 0; i < len; i++) {
+		s = crct10dif_prep(crc, p_ul);
+		crc = crct10dif_zbc(s);
+		p_ul++;
+	}
+
+	p = (unsigned char const *)p_ul;
+	if (tail_len)
+		crc = crct10dif_unaligned(crc, p, tail_len);
+
+	return crc;
+legacy:
+	return crc_t10dif_generic(crc, p, len);
+}
+EXPORT_SYMBOL(crc_t10dif_arch);
+
+bool crc_t10dif_is_optimized(void)
+{
+	return riscv_has_extension_likely(RISCV_ISA_EXT_ZBC);
+}
+EXPORT_SYMBOL(crc_t10dif_is_optimized);
+
+MODULE_DESCRIPTION("CRC-T10DIF using RISC-V ZBC Extension");
+MODULE_LICENSE("GPL");
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
