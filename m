Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B8C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcKbNpxdiEkp/EiXLwtGyn9XuZPQnTNglt7+223TYT0=; b=XbMa85pyujopNP
	jwa9uHVXkoGC6Bru5WcV/iHHkbcGXtcy4OI7Aa+4gcAj3baA9MB5d17cFYEpskU7E/RyW0LYF8VXD
	jkU3tEwj2dr99PM5i0qr2bfyxMlr8CaxZD+T7t0/FJ9//yYbjIwh/7ScEAYNOvvLHil9LidM0C4mb
	DAtRvTZFRY4DoL6usgCDJ5uq+acPbGPo03TDqmZe4ibaSQJdw24PbZabXQ3p6UifEi5W/6e4j46B/
	u0+YXE6lwmM+XY92Chq/2QIdam9BiuUNVuNiFYXgypYiVvYQxkUgr7cEuS6RQ0AWjIf2j+9i0M2Vf
	ia/4Uag9YtQbVvZ8aJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YK-007MbL-2X;
	Sun, 27 Aug 2023 01:26:56 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YF-007MZM-0G
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 01:26:52 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5733d431209so1380198eaf.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 18:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693099608; x=1693704408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfTS8tqhuCXvlRMkmz2PkepwLOiLzUz1oIVWEI6AmSg=;
        b=2uClxYn/559ZVUpa1YquW1FFWcG7vzRXkQRMoM5j2FLcrHWGTjCAKRd75m/5gdiqPh
         yM+9URcFsOcw0EQelDYFTuuZjZCoosRnNu79MJR79CKVohEkJwd6gRsL/eeobALPxFFg
         cQP6lkg8MltZCwzgfnmU0HspEgv5zpW/R1cgqxW3zzvjxYxixve7rX286VuKEZXZjWfa
         iHo1icydIYbrJ+qDmejDKV3LjvPKKECqFybgQlr4t5WJg70btYWsiKcwyHJjXEriRDiE
         ZBrdt7bfW73bkbWVNSu8uViudvT87B7nA3+sVIklrRrX7hUeKCGoS/qzG7wnSeXbMPtk
         mn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693099608; x=1693704408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfTS8tqhuCXvlRMkmz2PkepwLOiLzUz1oIVWEI6AmSg=;
        b=iTer80JRysyui0TMZPYDIWEtFPqW2a2qdMeD5RECGvjeScx93MrzgSNxyZ1sx4SyA9
         51DskWoWoLLJfegvEyYnjbw4fFV3aWZCiIjwtiHCwCU4GD8Z1SvqctwJ/AJzq2jc6qnK
         7unWm+yUmo9fpO5RnjZ7pqFFAY5N1hCSQ5tqK41yU0kUaQ3i3/se3lO8NkCThEDtfwdA
         XJ+4XCca/ax8PULQYrs+8F92i9czqG5hcit9hLFgSleHBzdadasNOUWnF4Q66RBYZxty
         dXM1vydE0RgmRO/VLfgUGwov0rfDuVj159jfdxuULl3UDNPb2cZDbMD+MoHfpfuI2b6R
         9CMQ==
X-Gm-Message-State: AOJu0YzYA1BrLmT3kqxBiEaknzVe50yKkfjdzhz8uheYOJKsqXP7g0Sd
	07WPRddattDtoBn9ARsW6MDugw==
X-Google-Smtp-Source: AGHT+IFLXaIwbb2H3mZ5Q6cj8cOqVl+jK5FQkosINRTZl886s4rzQbb1kPqE57ixOM1lSRn0MVvJpA==
X-Received: by 2002:a05:6358:880a:b0:12b:e45b:3fac with SMTP id hv10-20020a056358880a00b0012be45b3facmr17843078rwb.32.1693099607875;
        Sat, 26 Aug 2023 18:26:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jf6-20020a170903268600b001b869410ed2sm4357404plb.72.2023.08.26.18.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:26:46 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 26 Aug 2023 18:26:06 -0700
Subject: [PATCH 1/5] riscv: Checksum header
MIME-Version: 1.0
Message-Id: <20230826-optimize_checksum-v1-1-937501b4522a@rivosinc.com>
References: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
In-Reply-To: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_182651_123020_B99B8379 
X-CRM114-Status: GOOD (  16.97  )
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

Provide checksum algorithms that have been designed to leverage riscv
instructions such as rotate. In 64-bit, can take advantage of the larger
register to avoid some overflow checking.

Add configuration for Zba extension and add march for Zba and Zbb.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                | 23 +++++++++++
 arch/riscv/Makefile               |  2 +
 arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..8d7e475ca28d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBA
+	bool "Zba extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBA
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBA
+	   extension (basic bit manipulation) and enable its usage.
+
+	   The Zba extension provides instructions to accelerate a number
+	   of bit-specific address creation operations.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6ec6d52a4180..51fa3f67fc9a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
+riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:= $(riscv-march-y)_zba
+riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:= $(riscv-march-y)_zbb
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
new file mode 100644
index 000000000000..cd98f8cde888
--- /dev/null
+++ b/arch/riscv/include/asm/checksum.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IP checksum routines
+ *
+ * Copyright (C) 2023 Rivos Inc.
+ */
+#ifndef __ASM_RISCV_CHECKSUM_H
+#define __ASM_RISCV_CHECKSUM_H
+
+#include <linux/in6.h>
+#include <linux/uaccess.h>
+
+/* Default version is sufficient for 32 bit */
+#ifdef CONFIG_64BIT
+#define _HAVE_ARCH_IPV6_CSUM
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum sum);
+#endif
+
+/*
+ *	Fold a partial checksum without adding pseudo headers
+ */
+static inline __sum16 csum_fold(__wsum sum)
+{
+	sum += (sum >> 16) | (sum << 16);
+	return (__force __sum16)(~(sum >> 16));
+}
+
+#define csum_fold csum_fold
+
+/*
+ *	This is a version of ip_compute_csum() optimized for IP headers,
+ *	which always checksum on 4 octet boundaries.
+ *	Optimized for 32 and 64 bit platforms, with and without vector, with and
+ *	without the bitmanip extensions zba/zbb.
+ */
+#ifdef CONFIG_32BIT
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	__wsum csum = 0;
+	int pos = 0;
+
+	do {
+		csum += ((const __wsum *)iph)[pos];
+		csum += csum < ((const __wsum *)iph)[pos];
+	} while (++pos < ihl);
+	return csum_fold(csum);
+}
+#else
+
+/*
+ * Quickly compute an IP checksum with the assumption that IPv4 headers will
+ * always be in multiples of 32-bits, and have an ihl of at least 5.
+ * @ihl is the number of 32 bit segments and must be greater than or equal to 5.
+ * @iph is also assumed to be word aligned.
+ */
+static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
+{
+	unsigned long beginning;
+	unsigned long csum = 0;
+
+	beginning = ((const unsigned long *)iph)[0];
+	beginning += ((const unsigned long *)iph)[1];
+	beginning += beginning < ((const unsigned long *)iph)[1];
+	int pos = 4;
+
+	do {
+		csum += ((const unsigned int *)iph)[pos];
+	} while (++pos < ihl);
+	csum += beginning;
+	csum += csum < beginning;
+	csum += (csum >> 32) | (csum << 32); // Calculate overflow
+	return csum_fold((__force __wsum)(csum >> 32));
+}
+#endif
+#define ip_fast_csum ip_fast_csum
+
+#ifdef CONFIG_64BIT
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
+#endif
+
+#include <asm-generic/checksum.h>
+
+#endif

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
