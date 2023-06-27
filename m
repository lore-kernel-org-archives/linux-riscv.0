Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E87BEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcBJs2B5F9hqUb08UxS7SKCit3RYzs6B9yuxFocffoE=; b=UITZflsMouuveO
	k06tT63zmh5vpyMzbkeObmI7kJbN/MWgWyc9C2P7Ttr+SWLt/J2rFQS6rrh/Grt/9ODrLzbuVVOfw
	EKiKZukoBxbNpdZ0BvGsnl9OJZ9zSU6qb+WwvXJerFSNBTOLOn1klh+CpswueNT3nutRhQX30YqON
	MR/N8Skj0xsA01KAlb/fVSqYRo5OvTgJ/DSpLBzZq1TZf4e70qszKvuRUVQT1HPi7GIkCyltyEs0a
	KrGSlxo/A6ShO0VulYpHUXiUV9R+Q8gTjMYCHthHXllhkJ76Iammhg1aQbsuyFTGcHB1YSe07jP/K
	f9QE2KstX0/xeV90v8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9q0-00DOXt-1d;
	Tue, 27 Jun 2023 14:38:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9pw-00DOVf-1T
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 14:38:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f96d680399so6377677e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687876707; x=1690468707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEVMNWZBLS5DhwYM44VfQcdvAzGjTI9zLgPIzTOkT24=;
        b=v9B9fq/vnNw5vf4/XMj+DEzij4XdCJ6Qu3k6rdu3hoknkqAcbiibMohh2vV1/Xvhlm
         PVaQZZfTbieNjPjrodFPdFF6p6fpJKmmnsJQx91yFtgkyLi0YcnJSBLXQh4oYYljL26q
         IGt46axPduHixlBtVb/5lQePN3POydzxHqBhIZFUqEjbKyyaTtHxN8xOgSenCmW4HRqU
         TLC4AhqDMkMlYe2TP6NJOJpaqjrNqF/guZWbSEh+/mYnMkAfhdVrabcJI5aZwTcCn4Ki
         CI+2GPpo2kDgHTQ+TxX6K4o0XuQtjUcASMJnhRuvVXQVHTtf7qPEnvwiHK41v+237soc
         aO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876707; x=1690468707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEVMNWZBLS5DhwYM44VfQcdvAzGjTI9zLgPIzTOkT24=;
        b=YWBlQB/QnlMvvZWI7mNhCYsdLBq6P7NssoMVUT+xo6ClmrruDc06zETFI8V+WyWceX
         NmhbIIH4li558tsKhNEpz3uz7x3rcjbGuNxiegAaabgvdVS0fDKXD8KFAfq7lIfuFrZz
         HmO+NONMo2RutL45TPnXzkjMt7sAwpvNszcWm8a8NZ3GYhQMjHU9oslqRaIb1T9ElIFj
         6npZAO4EgQ9WcMuZvK3I/A7h3yEomXZlgq9zUDpdZjnqTpjNFlAYSv0NwCceUVOneTUv
         lORN06LqDzZml9ZG+89yz81bNlIbOT/6KPnGsXQYG4ePFT5TlUmDV/WZPIDr6zIEMWBQ
         WUfA==
X-Gm-Message-State: AC+VfDz5MrZnPrDXIRJ7Fl5QchLY/ZdYKwxgpmE/wXBZfuRQt/nnD2EI
	sAYp/rK3ImnduKbF6bAJ5Ixs+A==
X-Google-Smtp-Source: ACHHUZ5gRueMgICNs3RdPFGz2gRhMpqeYApnug8Cx+udx1fIHBUDvYkXd9ZgIOxCf+aCf1+CRY+/zA==
X-Received: by 2002:a05:6512:2512:b0:4fb:52f1:9aab with SMTP id be18-20020a056512251200b004fb52f19aabmr5533732lfb.66.1687876706673;
        Tue, 27 Jun 2023 07:38:26 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm10894793wml.17.2023.06.27.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:38:26 -0700 (PDT)
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
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 3/3] RISC-V: Implement archrandom when Zkr is available
Date: Tue, 27 Jun 2023 16:37:44 +0200
Message-ID: <20230627143747.1599218-4-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627143747.1599218-1-sameo@rivosinc.com>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_073832_492431_28C8B74B 
X-CRM114-Status: GOOD (  16.48  )
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

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 arch/riscv/include/asm/archrandom.h | 66 +++++++++++++++++++++++++++++
 arch/riscv/include/asm/csr.h        |  9 ++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/riscv/include/asm/archrandom.h

diff --git a/arch/riscv/include/asm/archrandom.h b/arch/riscv/include/asm/archrandom.h
new file mode 100644
index 000000000000..3d01aab2800a
--- /dev/null
+++ b/arch/riscv/include/asm/archrandom.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Kernel interface for the RISCV arch_random_* functions
+ *
+ * Copyright (c) 2022 by Rivos Inc.
+ *
+ */
+
+#ifndef ASM_RISCV_ARCHRANDOM_H
+#define ASM_RISCV_ARCHRANDOM_H
+
+#include <asm/csr.h>
+
+#define PR_PREFIX "Zkr Extension: "
+#define SEED_RETRY_LOOPS 10
+
+static inline bool __must_check csr_seed_long(unsigned long *v)
+{
+	unsigned int retry = SEED_RETRY_LOOPS;
+	unsigned int needed_seeds = sizeof(unsigned long) / 2, valid_seeds = 0;
+	u16 *entropy = (u16 *)v;
+
+	do {
+		/*
+		 * The SEED CSR (0x015) must be accessed with a read-write
+		 * instruction. Moreover, implementations must ignore the write
+		 * value, its purpose is to signal polling for new seed.
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
+			pr_err_once(PR_PREFIX "Unrecoverable error\n");
+			return false;
+
+		case SEED_OPST_BIST:
+			pr_info(PR_PREFIX "On going Built-in Self Test\n");
+			fallthrough;
+
+		case SEED_OPST_WAIT:
+		default:
+			continue;
+		}
+
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
+	return max_longs && riscv_isa_extension_available(NULL, ZKR) && csr_seed_long(v) ? 1 : 0;
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
