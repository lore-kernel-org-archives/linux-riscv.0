Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC5EC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrQ2qQAWmeqs3oAk5XOqxZOD3FXssKViRplJjDJksU4=; b=pJ7qG/dMHm8ryl
	R+PaikrbRBx0RHQALSdNh5FCjIXQuSAZ8qkV7jIEUuG7pqhbCM0NPQIvjnOAQ4wLos0tDsF/qNjZw
	B8FeLzaiiqMEOXmWopSOTXtNUi/apLTPrOYmR9QDjHLDFqpEii5UjdF55gtZ2XEPgnc2Z6I6wEPXE
	ZCOTY1brRwTNKARsn9l+xbd0XLLaxw72/n5mC3+vyzLYBSE4vIfjtLStg00CV9+S9Vwu8893uB1+p
	Vbki2fjvhcn4Bthq14eCgL/ztx4q3mNrIzkw12f2ZRyvhjk3Ud/3ppWIjI10oZ0lULzaxMoY0SETS
	2DhXOAJB+zxVHDrJeUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSr8-003PIM-2V; Mon, 30 Jan 2023 12:01:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqx-003P8X-Q8
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id l8so7810163wms.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7WajgJTyp6s8p17b2ocg3NsVY17UO9gaFgvhSkFOC0=;
        b=Wbwo3i3JcY1tS/49otQJmEIY7fqsrg11ZUW4q7MvAwS4DmaXaggS3mEBa4HX7YJH4C
         KdPyV91sLrnzjer5SUxqsyGzlt5L7waQdJ3ZrnYX+4ILG24BQZOOja0OwUDcGyeSgr0e
         FqN14cTOppGvVYpfxhC39U/1MEKd8uM4o7QSA7277Vj5eKkRH9h4MVE3LFk0yRzBRLDM
         taeynreiWr0Q1LLU4uO0Cd1YoXzuGEN6eFd825yX2G19nJy0JF+QO7M189V4CMb9Iztz
         qA3K805K9LrP39QvpqVuxki6icLKL1TR3Qo+oz+sl9txQF7YiUTZSanZDC+42/L2sG8/
         rdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7WajgJTyp6s8p17b2ocg3NsVY17UO9gaFgvhSkFOC0=;
        b=jefdSZvNYf13YeY8z13o2cTF8Ui9/UtTwvTmCPiCUYji0cPFcVLm/sGkrRzs8y//y+
         S5k9m9d8FNZkwADBGUn2fIjeIzxdBEYg7JKpRccqGvs0wGziEZmNpWyr3gc1c1uQqbeK
         he9qSsbdFgCCEw4D1xWES+lyyibMn7ISvHG6h0BAC4F1R/0/NBdQeUib4oh5+UlfUyT7
         PvNmSbvwPfEuVGvlQ6wuRA5FDrI7hx+HNIrEAL8qwgLdgTdOsPluqcwqpfQWPWm/8wTe
         OHk6ikbbt0jYsPB/kEoUWe2Q/LhMwbusCKtRyyA5zdmnZG7LTiHt/19ytBo6gwsaM1aA
         1cQA==
X-Gm-Message-State: AO0yUKXcT+5QTWYebE4SPeu81KBJdwVuNODLSavJKs6tDTO0SqYYbDZZ
	3idL6fdWiOHBAT0PAnPrp/g/Kw+hQ1vfzimv
X-Google-Smtp-Source: AK7set/2f+jRkKa/sCvrMWRE1bTC+tI84VI05n/zDsWil2rOn6uHMV8JmqkFKkrkC7Wch1PcKM+Vqw==
X-Received: by 2002:a05:600c:895:b0:3dc:4cb5:41c with SMTP id l21-20020a05600c089500b003dc4cb5041cmr7241371wmp.0.1675080095733;
        Mon, 30 Jan 2023 04:01:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c4d0900b003dc54eef495sm4217244wmp.24.2023.01.30.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:35 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>
Subject: [PATCH v3 4/6] RISC-V: Use Zicboz in clear_page when available
Date: Mon, 30 Jan 2023 13:01:26 +0100
Message-Id: <20230130120128.1349464-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040139_919585_B81AB230 
X-CRM114-Status: GOOD (  17.49  )
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

Using memset() to zero a 4K page takes 563 total instructions
where 20 are branches. clear_page() with Zicboz takes 150 total
instructions where 16 are branches. We could reduce the numbers
by further unrolling, but, since the cboz block size isn't fixed,
we'd need a Duff device to ensure we don't execute too many
unrolled steps. Also, cbo.zero doesn't take an offset, so each
unrolled step requires it and an add instruction. This increases
the chance for icache misses if we unroll many times. For these
reasons we only unroll four times. Unrolling four times should be
safe as it supports cboz block sizes up to 1K when used with 4K
pages and it's only 24 to 32 bytes of unrolled instructions.

Another note about the Duff device idea is that it would probably
be best to store the number of steps needed at boot time and then
load the value in clear_page(). Calculating it in clear_page(),
particularly without the Zbb extension, would not be efficient.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig                | 13 +++++++++++
 arch/riscv/include/asm/insn-def.h |  4 ++++
 arch/riscv/include/asm/page.h     |  6 +++++-
 arch/riscv/lib/Makefile           |  1 +
 arch/riscv/lib/clear_page.S       | 36 +++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/clear_page.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 33bbdc33cef8..3759a2f6edd5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -432,6 +432,19 @@ config RISCV_ISA_ZICBOM
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZICBOZ
+	bool "Zicboz extension support for faster zeroing of memory"
+	depends on !XIP_KERNEL && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
+	   when available.
+
+	   The Zicboz extension is used for faster zeroing of memory.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZIHINTPAUSE
 	bool
 	default y
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index e01ab51f50d2..6960beb75f32 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -192,4 +192,8 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(2))
 
+#define CBO_zero(base)						\
+	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
+	       RS1(base), SIMM12(4))
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 9f432c1b5289..ccd168fe29d2 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -49,10 +49,14 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_RISCV_ISA_ZICBOZ
+void clear_page(void *page);
+#else
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
+#endif
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
-#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
+#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
 #define copy_user_page(vto, vfrom, vaddr, topg) \
 			memcpy((vto), (vfrom), PAGE_SIZE)
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..9ee5e2ab5143 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -5,5 +5,6 @@ lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
new file mode 100644
index 000000000000..49f29139a5b6
--- /dev/null
+++ b/arch/riscv/lib/clear_page.S
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
+#include <asm/page.h>
+
+/* void clear_page(void *page) */
+ENTRY(__clear_page)
+WEAK(clear_page)
+	li	a2, PAGE_SIZE
+	ALTERNATIVE("j .Lno_zicboz", "nop",
+		    0, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
+	la	a1, riscv_cboz_block_size
+	lw	a1, 0(a1)
+	add	a2, a0, a2
+.Lzero_loop:
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	bltu	a0, a2, .Lzero_loop
+	ret
+.Lno_zicboz:
+	li	a1, 0
+	tail	__memset
+END(__clear_page)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
