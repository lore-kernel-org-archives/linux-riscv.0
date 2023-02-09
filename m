Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7678AC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ5DdS+0rRyEz+SzS98PEDFKopilaDl9tAezi1cp+L8=; b=XPaEoJoBtvjzW7
	VU5SdCtB5UOwifQi6jQZTmvEXpHtbpe2M1WrF+8+P679sLSfUQYEgk5cc8AAwOfrk75d7hIMAhgs1
	sRygKDrO9mshWpjNrEDtyfEPQ/IkK+BxxPxOofU07yfHj7B6MzMZtcfGspL0Cxcawn8mD0OXHXlOL
	+oszobZ4VNGe9eHGCFPvJ9eMPyZplMvU43VmbptcXM8JGz4M9uMNyii2GKVETGrkRVgbnZARRj1G9
	5w2vgf8RRzZX08mJKeyOkF4lP8X7u0ULBMV5niQlqTmvTOVsKmTTjrU3GBJJ9ufIYs27t+/x12AI7
	BctxjH/ucgh0yHDEbzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8p6-002CtI-JC; Thu, 09 Feb 2023 15:26:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8p0-002Ckp-9h
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 15:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1oHufzTgPc+PiE00xt5wrFDwXqQ2Os+gU6/z1IuTgSA=; b=rMO7OU5rWR+xRElriEtb1Gwcol
	8H1ssT9cjD7yPaqgKmCCsrBEwOqN7l4ieIHS+NnDI8Exs0frXQ9o9rE1qIVwPrmfTfCreuRknnCbz
	ot7J1mVehCjKWMUk6fQwRDQONzZaZ2Xpru5AtjpfARntDB50JWFxcABjEuWbZUGHqjkxztU/Rl0Z/
	RiuTbQssaETrxY5BQlgYeJm4ilvuIZi1EQcXNPTfKeeZywcq0Q/mbCwicu8ozi5p4Rr3KKggh9KNn
	kRgEnOV0IMaCWodqF8WvOul43+Xk+FlDD2NhGFJn+0RXfFV7ShcwiLReaBbQkkk93/5jflff7RT+V
	YGoxlIOA==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pQ8oG-007wyV-2E
	for linux-riscv@lists.infradead.org;
	Thu, 09 Feb 2023 15:26:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id hx15so7366500ejc.11
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oHufzTgPc+PiE00xt5wrFDwXqQ2Os+gU6/z1IuTgSA=;
        b=lXqDySttBEhS4jkmRUgQgZvu3JfLD3cArXdtDCAVgpeJEqV1PaIr2DDhCXwg1MKQai
         7b1x2BLy7bknpjrCvgVltZpUiUZntUK13XvYK5MLPmEvG8Yyzd8rGT27t25JKtT0OhGm
         1vUw3DXKoNs4k30U+x1X/h3Uudy8PCLyQyK19hnqTj0RpmfejEEIb7Gw19Za7jIudPK6
         J9SSU/WyDHsI4FLnDWV7+UhXp19qQFCZu3v2vfMdMHUk1H9YQjxq9rl1XLfXD4hsfDYQ
         eeQ182HPBBefF5zJB+a6/TsLDnrUQaYmmcyu1lMrlpZZLICNqG3cew7XTJK4BHgAnPNY
         HzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oHufzTgPc+PiE00xt5wrFDwXqQ2Os+gU6/z1IuTgSA=;
        b=EfmXZg13nEsXv23hp051GWLR9G3/gZ3bpKhHc5X5OCIDCI7AdFcHeLv4CojOY0Y4fU
         FHDxzlPZ9SZB+XBlQMMtdUeG9qRRR2D451wjE4nDUpe0CEAlExIUHsLUIfK1lqZdpUlh
         9/qirshc6Vyz6s9mUxFzMyKcGHZzqS8FNmwey08Su/A54GtDurUcrmHHAU1YaiZnNaf1
         5enN+i49AofcSzrd6PkrS4g4mn0czzs4M5/SQBHaJg5yBoRJ1tp5ZfQjqALyqnrRapbP
         zTxPI28G9wcf/ZxNru3dTppwJH1R1aOJlrf23zgMO1NPNGxDP0oSa4y8efmhGUq3Mcrn
         X4lg==
X-Gm-Message-State: AO0yUKVHl5xVOCVYeKT3AxZ8aftAEAfr2jR0V2Y3wIvbaEbq8qS6oor1
	L2A1dbF3akxzVnNDGhS1zfiL/cyxYBi7a74p
X-Google-Smtp-Source: AK7set9ukORH6S/OSZPqgidF6u8flLrDmpCIkksKewApJPaQfMxbHZDi4p3KT9goGlR7obUpf7iWUw==
X-Received: by 2002:a17:906:1249:b0:88b:4962:b72f with SMTP id u9-20020a170906124900b0088b4962b72fmr11437787eja.20.1675956400920;
        Thu, 09 Feb 2023 07:26:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709064e0f00b008af424d4d75sm614058eju.194.2023.02.09.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:40 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Date: Thu,  9 Feb 2023 16:26:26 +0100
Message-Id: <20230209152628.129914-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_152604_951296_0F437F05 
X-CRM114-Status: GOOD (  19.07  )
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

Using memset() to zero a 4K page takes 563 total instructions, where
20 are branches. clear_page(), with Zicboz and a 64 byte block size,
takes 169 total instructions, where 4 are branches and 33 are nops.
Even though the block size is a variable, thanks to alternatives, we
can still implement a Duff device without having to do any preliminary
calculations. This is achieved by taking advantage of 'vendor_id'
being used as application-specific data for alternatives, enabling us
to stop patching / unrolling when 4K bytes have been zeroed (we would
loop and continue after 4K if the page size would be larger)

For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
only loop a few times and larger block sizes to not loop at all. Since
cbo.zero doesn't take an offset, we also need an 'add' after each
instruction, making the loop body 112 to 160 bytes. Hopefully this
is small enough to not cause icache misses.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig                | 13 ++++++
 arch/riscv/include/asm/insn-def.h |  4 ++
 arch/riscv/include/asm/page.h     |  6 ++-
 arch/riscv/kernel/cpufeature.c    | 11 +++++
 arch/riscv/lib/Makefile           |  1 +
 arch/riscv/lib/clear_page.S       | 71 +++++++++++++++++++++++++++++++
 6 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/clear_page.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 029d1d3b40bd..9590a1661caf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -456,6 +456,19 @@ config RISCV_ISA_ZICBOM
 
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
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 74736b4f0624..42246bbfa532 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
 #ifdef CONFIG_RISCV_ALTERNATIVE
 static bool riscv_cpufeature_application_check(u32 feature, u16 data)
 {
+	switch (feature) {
+	case RISCV_ISA_EXT_ZICBOZ:
+		/*
+		 * Zicboz alternative applications provide the maximum
+		 * supported block size order, or zero when it doesn't
+		 * matter. If the current block size exceeds the maximum,
+		 * then the alternative cannot be applied.
+		 */
+		return data == 0 || riscv_cboz_block_size <= (1U << data);
+	}
+
 	return data == 0;
 }
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6c74b0bedd60..26cb2502ecf8 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -8,5 +8,6 @@ lib-y			+= strlen.o
 lib-y			+= strncmp.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
new file mode 100644
index 000000000000..5b851e727f7c
--- /dev/null
+++ b/arch/riscv/lib/clear_page.S
@@ -0,0 +1,71 @@
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
+#define CBOZ_ALT(order, old, new)	\
+	ALTERNATIVE(old, new, order, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
+
+/* void clear_page(void *page) */
+ENTRY(__clear_page)
+WEAK(clear_page)
+	li	a2, PAGE_SIZE
+
+	/*
+	 * If Zicboz isn't present, or somehow has a block
+	 * size larger than 4K, then fallback to memset.
+	 */
+	CBOZ_ALT(12, "j .Lno_zicboz", "nop")
+
+	lw	a1, riscv_cboz_block_size
+	add	a2, a0, a2
+.Lzero_loop:
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBOZ_ALT(11, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBOZ_ALT(10, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBOZ_ALT(9, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBOZ_ALT(8, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
+	CBO_zero(a0)
+	add	a0, a0, a1
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
