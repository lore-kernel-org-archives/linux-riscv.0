Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A85BC001DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK1W5Ick03jUIN3UtTwKV4S1DfbViod1i3XU255VwZo=; b=fEUoCN8LsB8g0v
	ZPCgoXDjAkzOtrlf+zuxDtHsiVialnEBFdmxs9SpdfBCNsaUGaNhwb+bri+QQLVtgylk5ctxzMq71
	MD/1FHULmHNs9ifP93dBxX14l4OAa+t6HuzC9jNiNXKCUxexiE4f9QsslLXBKhZ+LZs3Y6tdvzQRR
	KRgf4cgDHFZXsoCM+VHO4XzgKJ6AlVdxwrQVbkH4py8g64PCkimzHbO/2+gKtSqRrgnreLKZpzX4Y
	aCMtv8JO/1UPaWzhyLy1G57brG7v40d6S4GcE1X0mwwKKcFCPpkrS1a8SJlDHNeR9yxBDKz2l+5zH
	VaMejNKgrHc2Iu1hXWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPy-00GwRx-2G;
	Wed, 12 Jul 2023 08:41:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPv-00GwP8-2T
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:41:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so2778115e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689151306; x=1691743306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f9QGzip5+pACFq28gF27wBxnLW2cvXWZAANuTU4vJY=;
        b=RyybzuawSrIwX935H9lZcY7MHvabwPZqAhDMhz8FSxnVZ89twHobBelMctHy5lqgVT
         KH86wRZCxTlNAdMkFkAfjnJXtEHHqHYRWxEAtQql9nFgKiOpIdpYH72hKUh/QkYZtVQP
         pSIlWo3lCuXrO7GDDe7dHzGpVEd6+g0B/kOS+lK/v6N36XMxNOejef8ITqBB76Nj1Th8
         m1Xka4EHzAcl/dHa+HPdqUChKntZq7JSB4wrq/PbwEF9dDsIhZi1vPUX6ipzI2SoeyM6
         8pvlsD3BvhEQ7bgb8idT36+yz/EckqWKRP1A4GtK1+fwo1EDIPKw6P5F2hPBGHsfRcpM
         n9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151306; x=1691743306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2f9QGzip5+pACFq28gF27wBxnLW2cvXWZAANuTU4vJY=;
        b=HXKq2uLNwvEvXkpGknYObe9QhkgNCcBgPVrsmvptS9bk9BKO/K6GzbFJHTuSB00nl9
         2MQ3QZiM96fqhTjxwgJDrHXfrsfHc6JFzD9WthK3xZ0AOfQhnyg+ga6S1dNUzQtiwVxj
         rVKrv/HLtk3ahSGAbtvj2YGA3OFDxzzp4rbIZgmnJ9S1u2Bnq0ux6iMwSbt45Ct12xVH
         IYELqIeMp+EkOs8EH/elC/zeMnFmBSy+1QkKIcDnGOkhOq9qaTFRKiV6kmHBZI6rsxhh
         5jc+xH1U6bWbvjCvVoCHu05dU2Epusf9FfOA+jUr2hAWgIP8gp9PkuzrSEKkBLQMZTzn
         bw/A==
X-Gm-Message-State: ABy/qLb/iO4huJcDDTnK4Ope2XlXIGCXocgFITJSQvVEnOibPYDj2bTX
	NMpR5f5HnhbIm7MyId+1+IS4GQ==
X-Google-Smtp-Source: APBJJlEU3NK50Kh9pXt7iHmTfe78cJtw+t/ezgEo2hT3zj1sTNwb/NkencXzliamXXiXHbb2a6jaUQ==
X-Received: by 2002:a7b:cbc7:0:b0:3f7:a20a:561d with SMTP id n7-20020a7bcbc7000000b003f7a20a561dmr1121551wmi.8.1689151306617;
        Wed, 12 Jul 2023 01:41:46 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm4496122wrm.1.2023.07.12.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:41:46 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	devicetree@vger.kernel.org,
	sorear@fastmail.com
Subject: [PATCH v4 4/4] RISC-V: Implement archrandom when Zkr is available
Date: Wed, 12 Jul 2023 10:41:20 +0200
Message-ID: <20230712084134.1648008-5-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712084134.1648008-1-sameo@rivosinc.com>
References: <20230712084134.1648008-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_014147_848684_7F0B2FCA 
X-CRM114-Status: GOOD (  17.83  )
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

The Zkr extension is ratified and provides 16 bits of entropy seed when
reading the SEED CSR.

We can implement arch_get_random_seed_longs() by doing multiple csrrw to
that CSR and filling an unsigned long with valid entropy bits.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 arch/riscv/include/asm/archrandom.h | 70 +++++++++++++++++++++++++++++
 arch/riscv/include/asm/csr.h        |  9 ++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/riscv/include/asm/archrandom.h

diff --git a/arch/riscv/include/asm/archrandom.h b/arch/riscv/include/asm/archrandom.h
new file mode 100644
index 000000000000..38f3cced0fd0
--- /dev/null
+++ b/arch/riscv/include/asm/archrandom.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Kernel interface for the RISCV arch_random_* functions
+ *
+ * Copyright (c) 2023 by Rivos Inc.
+ *
+ */
+
+#ifndef ASM_RISCV_ARCHRANDOM_H
+#define ASM_RISCV_ARCHRANDOM_H
+
+#include <asm/csr.h>
+
+#define SEED_RETRY_LOOPS 100
+
+static inline bool __must_check csr_seed_long(unsigned long *v)
+{
+	unsigned int retry = SEED_RETRY_LOOPS, valid_seeds = 0;
+	const int needed_seeds = sizeof(long) / sizeof(u16);
+	u16 *entropy = (u16 *)v;
+
+	do {
+		/*
+		 * The SEED CSR (0x015) must be accessed with a read-write
+		 * instruction.
+		 */
+		unsigned long csr_seed = csr_swap(CSR_SEED, 0);
+
+		switch (csr_seed & SEED_OPST_MASK) {
+		case SEED_OPST_ES16:
+			entropy[valid_seeds++] = csr_seed & SEED_ENTROPY_MASK;
+			if (valid_seeds == needed_seeds)
+				return true;
+			break;
+
+		case SEED_OPST_DEAD:
+			pr_err_once("archrandom: Unrecoverable error\n");
+			return false;
+
+		case SEED_OPST_BIST:
+		case SEED_OPST_WAIT:
+		default:
+			continue;
+		}
+	} while (--retry);
+
+	return false;
+}
+
+static inline size_t __must_check arch_get_random_longs(unsigned long *v, size_t max_longs)
+{
+	return 0;
+}
+
+static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, size_t max_longs)
+{
+	if (!max_longs)
+		return 0;
+
+	/*
+	 * If Zkr is supported and csr_seed_long succeeds, we return one long
+	 * worth of entropy.
+	 */
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZKR) && csr_seed_long(v))
+		return 1;
+
+	return 0;
+}
+
+#endif /* ASM_RISCV_ARCHRANDOM_H */
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7bac43a3176e..ff6f570487b9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -391,6 +391,15 @@
 #define CSR_VTYPE		0xc21
 #define CSR_VLENB		0xc22
 
+/* Scalar Crypto Extension - Entropy */
+#define CSR_SEED		0x015
+#define SEED_OPST_MASK		_AC(0xC0000000, UL)
+#define SEED_OPST_BIST		_AC(0x00000000, UL)
+#define SEED_OPST_WAIT		_AC(0x40000000, UL)
+#define SEED_OPST_ES16		_AC(0x80000000, UL)
+#define SEED_OPST_DEAD		_AC(0xC0000000, UL)
+#define SEED_ENTROPY_MASK	_AC(0xFFFF, UL)
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
