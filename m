Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4246CC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mmni1fUZZML0ROkOTby/m5MqqlpkL2puYXkapi8Uqm4=; b=NUqlItKNFFCToG
	s+iEX50CNOsXx/HaSgwUI7yvBUNAFKX9YFsm3nqLMATrzjdhgf26KlamoYlc1ygvzlZ9b6KajebqZ
	ScvaQFXZRub9QJto4BMprn2TwN8TUYUbUkZcAQUq+mUUDsfv6dZwVpBv3fuvAyv/H7oKjKlFw0oLL
	HKQEQ8eUr36vNvw4n+Z8T6EalFB6gKzi5WSslxMTp9pmkJR51emIRkuM6IuDVUwE0m70Zdzk2MZbS
	27L155Oe65WZIO0Y0a3WdVP50YDG+byyLzXQIYdsAIWuG8c4isroKohvU4Ifap2qGW4+/MlROtYN4
	a7lVG1hm0TIxD+PKfKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ36-009fjM-4o; Tue, 21 Feb 2023 20:15:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY12-009UuZ-8A
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:30 +0000
Received: by mail-ed1-x535.google.com with SMTP id ck15so22612993edb.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S+XYy12JZsXVFfKIyUi1nIupPzXfiQ+NXxg+VU2ykw=;
        b=NcjwsDPzCzzl7IU7KmAT3C0cHSa9dnBMwfvf/ePCglGQwgK299eBEIKILm/428uQya
         OZ51tMuy7wOQ1p2QZt3gOpMAcNjddAxUqKYEjDNLjo9xMwt8TigPZ+esVX0TCEssAocl
         p+mn5qDAzPt75Vtokuc9DGn0Hu2TI+VIAFE2xockIH1Zw/q/ueBq6TQcbqG6N8W0Jf8J
         tS4pSdSrr6tsvMJkr7FRyqCvDu/HPJIpbO6+IRa3aBcBT4582wSYtoUrSFT0PYF3EiHB
         2k2AytcwUEu/iYxTsCPQ5YbLjJu6aj2N+1i5Fuqy4xJWBiTKjTgRxYWUOxCJOuUVc6w4
         iFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S+XYy12JZsXVFfKIyUi1nIupPzXfiQ+NXxg+VU2ykw=;
        b=LRkwY6/GMLY+Xzs0XTmMcgSVbanHN2ajEaBnfbpXwhnDP+a09dpL/yFLD6tDebDwCZ
         qJlE6BKhVWhGUCB7xOcAJsUeLzD69mZUIYmDkydp3KMRPYy66qct96j4x0gnmkMWmNqX
         HWg2SsxUiYu98J88BgoDjyIZQjWV5yoGpL13vpcZNGewag9bKA0bfLLFiy11OgFQn/HE
         GPLeQTYM+kUyGWxxqYJEOoxtc/V4BnQwQzZZwil1Re+klPYf9CFUp6nwBL/c4pMpyuAG
         7mDFxZrx47VrPwt5DY4tmR4RPgGCtAj8xGGUtQyLNMVTPD/m61Ea8YN0ETMYHhsnYiTD
         ZOWQ==
X-Gm-Message-State: AO0yUKVaGjSv775eYSIJsaNXwys5YvjLXN+kvRQXSyQC7AgxEfNYFgvi
	6lhMRfA3aSi7yBcbfmg7V4b9E2qG/y1MwOH2
X-Google-Smtp-Source: AK7set8lywRDYYj/sCGuAccQ8jI4g1DwGbTEkkC3GMmLISPTXn6PeXZU4cGsZ34cUgJdVmXau3tCbg==
X-Received: by 2002:a17:906:37cb:b0:879:ab3:93cd with SMTP id o11-20020a17090637cb00b008790ab393cdmr13401168ejc.46.1677006566798;
        Tue, 21 Feb 2023 11:09:26 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lf13-20020a170906ae4d00b008b12c318622sm7502111ejb.29.2023.02.21.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:26 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
Date: Tue, 21 Feb 2023 20:09:14 +0100
Message-Id: <20230221190916.572454-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110928_315043_E990B301 
X-CRM114-Status: GOOD (  20.51  )
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
calculations. This is achieved by using the alternatives' cpufeature
value (the upper 16 bits of patch_id). The value used is the maximum
zicboz block size order accepted at the patch site. This enables us
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
 arch/riscv/lib/clear_page.S       | 73 +++++++++++++++++++++++++++++++
 6 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/clear_page.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c494c36e911..c9006bcf912d 100644
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
index 0594989ead63..4a496552b812 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -292,6 +292,17 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
 	if (!value)
 		return true;
 
+	switch (id) {
+	case RISCV_ISA_EXT_ZICBOZ:
+		/*
+		 * Zicboz alternative applications provide the maximum
+		 * supported block size order, or zero when it doesn't
+		 * matter. If the current block size exceeds the maximum,
+		 * then the alternative cannot be applied.
+		 */
+		return riscv_cboz_block_size <= (1U << value);
+	}
+
 	return false;
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
index 000000000000..7c7fa45b5ab5
--- /dev/null
+++ b/arch/riscv/lib/clear_page.S
@@ -0,0 +1,73 @@
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
+#define CBOZ_ALT(order, old, new)				\
+	ALTERNATIVE(old, new, 0,				\
+		    ((order) << 16) | RISCV_ISA_EXT_ZICBOZ,	\
+		    CONFIG_RISCV_ISA_ZICBOZ)
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
