Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A462D41C33
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jy8KNU70kOy4osju14rImsRuJVWkU4OdyJ3wzFfAK1M=; b=0yhTKSNPyYBlc9
	ckW1+zeftIdEboQ8dSCL1VSUihnOXlTcF6/gYSDHNrOsyXZJCtNpi49ktXIreKPcCT1v7hc6NgOFT
	wNQ6qSZmmpZ9NoxeJKm4ErHA95KBFhu0GBfVb2mUgl6vHIYHcYzD+TEPIdf4s/4Np9tAtYKQxFNx/
	IKjtujzxB8H2x4G3W5HEdhzwxT7jNHbOtgSb3zCzOqhSzQHtag99Rq0UfeJJcCHlIilzsT6/RjFeD
	7//E1UY6Rk5Qs9EAZkum6xneZZGYspSR7YA3CWChSs2uIoEKUproyV3nlTYMe9svCm5CfwWp8pbVE
	iJ//uvPAP0jH5AnrVieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBpK-00000006dF0-0eGk;
	Wed, 13 Nov 2024 11:46:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAq5-00000006U5F-1nk7
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Nov 2024 10:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5jlFYl+F/SXidKxj2SQXgSrqD6j03dI4yP5H+XqCGaQ=; b=VIEqelK1MkZxbDmY4lI9HA4CEd
	+6dS6TvGbO5nX53f1bdmJk9S4Q7cqRs7GKzppwdFIHA9EPTJhZ1FdMcQzgjqOFbT4DRz/JMxXpRbW
	s5FK03JuOpjAM8LuNIaBI/IcNdP2Qsj22jq/Y677vZUJZ8aXvGkm0LbQljs3FiL2aUVEhTzBuJ7VT
	4XYtMYQe8izX0haEKhCkaZzMYpGNnBJGOTg3yiVRk0g1YMXU2g6RDXDgHBDUY3kqb5IQaDDLPhM7Y
	2WncevleFP3XKyApg1WO+scvnKJiHbUliEZDyUKmFLWkTL6G2jqVHNkkbJYG/+0qJs0cP8Naf+f0t
	o9QUSzFg==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAq2-0000000DFh8-0OI2
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:43:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso4933386a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 02:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731494583; x=1732099383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jlFYl+F/SXidKxj2SQXgSrqD6j03dI4yP5H+XqCGaQ=;
        b=I0v7Wx0o8j8gujbMI0wOPIJMX/zoobevQAS8zPDbnKCSILxK4HAxGRHBWuBA13eqXm
         wC/Utvcs+gOKAKg2MSS2TVCYo6sxxDBzSjSNlk2t0k9GCAkfKhiH311zLA7CpvIiy6FM
         i3D35/02fasg3POA9oBPHw/Sy5+l8lQ9Sddi/m3mb+qzgi+5yxAyTDPtCPVXvxSSASP7
         0K7jDDV4A/GADXKmJ56ychnOr0U6mnP4PXkfpC3wqG74XLU0JfEIysmXV8nJmRS+kuCN
         V1KFYtkAa0P9Qx35Gi445rjmqrdZfKRImiIHswpkR7caCXQ/IH64hUn+b5TgOAyKHvjm
         4fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494583; x=1732099383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jlFYl+F/SXidKxj2SQXgSrqD6j03dI4yP5H+XqCGaQ=;
        b=HYMHQdRflVTNaYrBEAO90VGxD6MZ3iUvGpxmsVkkne2MNWQcGQMUsHBPQqeoa/ECm9
         PJUwBdR5hmCfScVjDOs7btwQ8G1LPG5xSeB7iW+HNLyKWYrmmdIQ+tpA9EQwoeVhVaiW
         t0g88Xy0dULqcZSnLwAy4Z1/zzOJtBx/X/9Tcm6VODqIGhJbbxRwFaTrLAmg3v22ERJ2
         Top99WRrGkH3HjR1Hsen8sAZmw9JI+Gx19XHsDw0egwaJcibeRbtwfW9fc4Kjk6GiaxQ
         P2qcupBxppZZkZ+pcnSH2oX46UxmE9MvUZRPFKZuPxzzzcUncGSuVWzN9wweguqnbRvF
         7YKA==
X-Forwarded-Encrypted: i=1; AJvYcCVuZu8Wa2Las8nvRKUs7YwX7Z7V0fQi96Wzwb6/a2PTUxF1AneM19LXA+2bUAR6xZ/BiryZYD/lHFjueA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6GyufhZ0jODOVZ8aBv+U2KWXw5XKVFXy8movmeETPiqFgILP
	W+NHMjXBsoMvMk0dWppQcYM7jdNiwQCd1M/JRKTBqOB0K1BNJj/d
X-Google-Smtp-Source: AGHT+IFAzPvsm4MOUGF/CkevnLPD5N1Wc/o0wr9hTH0ob5+B/WVQm5z04bNdJg3/qr7zImOjGCqrMA==
X-Received: by 2002:a17:90b:3847:b0:2e2:e136:a931 with SMTP id 98e67ed59e1d1-2e9b16ea3e7mr26146379a91.6.1731494583051;
        Wed, 13 Nov 2024 02:43:03 -0800 (PST)
Received: from localhost.localdomain ([45.137.180.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e5a9ebsm108031105ad.198.2024.11.13.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 02:43:02 -0800 (PST)
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: Optimize crct10dif with zbc extension
Date: Wed, 13 Nov 2024 10:40:36 +0000
Message-Id: <20241113104036.254491-3-zhihang.shao.iscas@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113104036.254491-1-zhihang.shao.iscas@gmail.com>
References: <20241113104036.254491-1-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_104306_337666_7B99F49E 
X-CRM114-Status: GOOD (  20.56  )
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

The current CRC-T10DIF algorithm is based on table-lookup optimization.
Given the previous work on optimizing crc32 calculations with zbc
extension, it is believed that this will be equally effective for
accelerating crc-t10dif.
Therefore, this patch offers a implementation of crc-t10dif using zbc
extension. This can detect whether the current runtime environment
supports zbc feature and, if so, uses it to accelerate crc-t10dif
calculations.

This patch is tested on QEMU VM with the kernel CRC-T10DIF selftests.

Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
---
 arch/riscv/crypto/Kconfig               |  14 ++
 arch/riscv/crypto/Makefile              |   4 +
 arch/riscv/crypto/crct10dif-riscv-zbc.c | 182 ++++++++++++++++++++++++
 lib/crct10diftest.c                     |   4 +-
 4 files changed, 202 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/crypto/crct10dif-riscv-zbc.c

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index ad58dad9a580..69751ff5573e 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -29,6 +29,20 @@ config CRYPTO_CHACHA_RISCV64
 	  Architecture: riscv64 using:
 	  - Zvkb vector crypto extension
 
+config CRYPTO_CRCT10DIF_RISCV
+       tristate "Checksum: CRCT10DIF"
+       depends on TOOLCHAIN_HAS_ZBC
+       depends on MMU
+       depends on RISCV_ALTERNATIVE
+       default y
+       help
+         CRCT10DIF checksum with Zbc extension optimized
+	 To accelerate CRCT10DIF checksum, choose Y here.
+
+         Architecture: riscv using:
+          - Zbc extension
+
+
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index 247c7bc7288c..6f849f4dc4cc 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -7,6 +7,9 @@ aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
 obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
 chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
 
+obj-$(CONFIG_CRYPTO_CRCT10DIF_RISCV) += crct10dif-riscv.o
+crct10dif-riscv-y := crct10dif-riscv-zbc.o
+
 obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
 ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
 
@@ -21,3 +24,4 @@ sm3-riscv64-y := sm3-riscv64-glue.o sm3-riscv64-zvksh-zvkb.o
 
 obj-$(CONFIG_CRYPTO_SM4_RISCV64) += sm4-riscv64.o
 sm4-riscv64-y := sm4-riscv64-glue.o sm4-riscv64-zvksed-zvkb.o
+
diff --git a/arch/riscv/crypto/crct10dif-riscv-zbc.c b/arch/riscv/crypto/crct10dif-riscv-zbc.c
new file mode 100644
index 000000000000..01571b4286f1
--- /dev/null
+++ b/arch/riscv/crypto/crct10dif-riscv-zbc.c
@@ -0,0 +1,182 @@
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
+#include <crypto/internal/hash.h>
+
+#include <linux/byteorder/generic.h>
+#include <linux/crc-t10dif.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+static u16 crc_t10dif_generic_zbc(u16 crc, unsigned char const *p, size_t len);
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
+static inline u16 crct10dif_unaligned(u16 crc, unsigned char const *p, size_t len)
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
+static u16 crc_t10dif_generic_zbc(u16 crc, unsigned char const *p, size_t len)
+{
+	size_t offset, head_len, tail_len;
+	unsigned long const *p_ul;
+	unsigned long s;
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
+}
+
+static int crc_t10dif_init(struct shash_desc *desc)
+{
+	u16 *crc = shash_desc_ctx(desc);
+
+	*crc = 0;
+
+	return 0;
+}
+
+static int crc_t10dif_final(struct shash_desc *desc, u8 *out)
+{
+	u16 *crc = shash_desc_ctx(desc);
+
+	*(u16 *)out = *crc;
+
+	return 0;
+}
+
+static int crc_t10dif_update_zbc(struct shash_desc *desc, const u8 *data,
+				unsigned int length)
+{
+	u16 *crc = shash_desc_ctx(desc);
+
+	*crc = crc_t10dif_generic_zbc(*crc, data, length);
+
+	return 0;
+}
+
+static struct shash_alg crc_t10dif_alg = {
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= crc_t10dif_init,
+	.update			= crc_t10dif_update_zbc,
+	.final			= crc_t10dif_final,
+	.descsize		= CRC_T10DIF_DIGEST_SIZE,
+
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-riscv-zbc",
+	.base.cra_priority	= 150,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+};
+
+static int __init crc_t10dif_mod_init(void)
+{
+	if (riscv_isa_extension_available(NULL, ZBC))
+		return crypto_register_shash(&crc_t10dif_alg);
+
+	return -ENODEV;
+}
+
+static void __exit crc_t10dif_mod_exit(void)
+{
+	crypto_unregister_shash(&crc_t10dif_alg);
+}
+
+module_init(crc_t10dif_mod_init);
+module_exit(crc_t10dif_mod_exit);
+
+MODULE_DESCRIPTION("CRC-T10DIF using RISC-V ZBC Extension");
+MODULE_ALIAS_CRYPTO("crct10dif");
+MODULE_LICENSE("GPL");
diff --git a/lib/crct10diftest.c b/lib/crct10diftest.c
index 9541892eb12c..ac642191e6e8 100644
--- a/lib/crct10diftest.c
+++ b/lib/crct10diftest.c
@@ -666,9 +666,9 @@ static int __init crct10dif_test_init(void)
 
 	local_irq_restore(flags);
 
-	if (errors) 
+	if (errors)
 		pr_warn("crct10dif: %d self tests failed\n", errors);
-	else 
+	else
 		pr_info("crct10dif: self tests passed, processed %d bytes in %lld nsec\n",
 		bytes, nsec);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
