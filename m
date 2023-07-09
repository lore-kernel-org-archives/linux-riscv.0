Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE9EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTFhQdac5/iqD00k7UlsaNm/t7GsjVKbdQ132EbRyPQ=; b=lSXBjY5GYkXHpp
	1IDWJodEsb4V64+CTcebIN9VRdc7TKISIv+sAw+0M2/e1RIG7zgIbxNR1LHdDGqpkLHaVbhURVWTM
	rRWHF+C0Fm5D6/qKj12OAjTPK7OLLgMmzklh8SWcdPIEqposnip0qSUwkl7LE37d4YZiKXxjMcgOM
	Tn1njS4r0KAy9v17gC52A+Vq+7WBVWsdYE3cwauosHjeiXqAVf+fZ8Y+Xkt343w9CO4jfhgQe9w2n
	E/MDAKVnU8YBjRMK0y6/UdmQrJ7eW7dXR6KBLO4/c+byESqofhYhsPWdXTQCIGZFmVMu/8218gfMo
	HJw4gJrs59Pc47iGeXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1R-0093iU-2n;
	Sun, 09 Jul 2023 11:56:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1O-0093gR-13
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:56:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so41047515e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jul 2023 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688903768; x=1691495768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHYLymmcuaoqqfmNSUbFnocPVHqWILXfzwDmQ0dJduU=;
        b=kdkPUVVoTrKfrnbi2rIqcPrI38H252mgEq9dWEtC8wIXWp/VM4EmS3G2xyRNogbD0w
         1zsqpg11vQ+j+xqL6N73cAOK7kffGusm/lsT6yXFoZ6Gz0LX2p5kB9VYaLRbuyEb7PwU
         MIoISkGP1Vnty/4hlrMogwzyouRfOhzQsLg3r0WNzfrFHyQ5LJdYA1FZ8o4okCnoR6Sz
         osxGoKcA6sJ3jzMT1gTM+9V5xsM0z0ct1lzC6CtJ3JFLE43blMvHn9gNtWL2eUsDlano
         I9Yu39kJMlGymCtKB6yZdRfiHvBhOOvP3eHTTZop4Zi6i+FdhVLWMsfnwmM3POtt2ZUr
         Ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688903768; x=1691495768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHYLymmcuaoqqfmNSUbFnocPVHqWILXfzwDmQ0dJduU=;
        b=aYrK6ntiv2NceBMaQOP0iKvvQhB8nkhb72fSIg6fPkBg0R4p+9xutlSIzXAjpp0y5S
         FoTyMkK5Jurn4+mBPuk6WedDAO76I9VlDErtV6bZ/7iBqn1BeV1ZNgXodBQ7ZRb00/TG
         GW7P+weKUkFcKAdRvdKLY1cK+emgTGoCXeHHp2oSskUl/lH9XCafd2mDpmW5cRVw0P/6
         meTiOSO8Qbsy1/M3Q2sdhTFDY4BIiQTE0ln6Yrt3/1YTid83ooGkhdH1+aKSGDqfJYn/
         XLCChUm6k5Akwpir2+yrvu5bVGe9RVCR6wcKZUu/upGWGdenN6lBOpieAruTJ39lHx8q
         KGag==
X-Gm-Message-State: ABy/qLbAUpFIkcBcy7lZ6tP8Ja15qiidfSU9ME1RfTxRMOShX2UoDlrC
	Br2MQmcfJV2BZRayv527CoKkdw==
X-Google-Smtp-Source: APBJJlGBayCeXEMwCggP+P7xtLc4lMgQ3SnaG9W7VfCF1g79e5queiWB9ETcSEiGaocbDuQB9CDUZw==
X-Received: by 2002:a7b:ca5a:0:b0:3fb:ff34:a846 with SMTP id m26-20020a7bca5a000000b003fbff34a846mr6403473wml.22.1688903768196;
        Sun, 09 Jul 2023 04:56:08 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c02c200b003fc007d8a92sm6194101wmn.45.2023.07.09.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 04:56:07 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/4] RISC-V: Implement archrandom when Zkr is available
Date: Sun,  9 Jul 2023 13:55:46 +0200
Message-ID: <20230709115549.2666557-5-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230709115549.2666557-1-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_045610_362302_F7B4983F 
X-CRM114-Status: GOOD (  17.73  )
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
index b98b3b6c9da2..7d0ca9082c66 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -389,6 +389,15 @@
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
