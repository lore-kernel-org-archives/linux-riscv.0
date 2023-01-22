Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FFEC54E94
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6etOo/R/pJC3ZVSfLkqbZ7Kn6SNFKv/pVlUh3Vbjljo=; b=1pMcJM4gl4JEam
	+kBzmppAq1BVnNnB6wDFQaqnR2eV09dlm/idHK+otDuNhOI5t1lHf39Kaj1aeAP3TRyb8IHaHAGc3
	vpzKredgi8ZtdvLNGWd/1CRsM1QhxKr6mQ5GbLSdbbF9hUbFwL/9o0LxcV0Qlg+PVj9dgacwxWDyc
	O83+ThXCTZqavCK/EApQDg8L/KznjjSBbWRFbiL3JWfhK7bZ+ExuQFUXiu39SxJQitQXeQdyhXZ9C
	6B8ddSzplgiN+Nhfj0sDIRSG5CR4oaWayr9URuZhTVFYmPkgCkYxoIA63LDEhfw5X7oOuPGk4kjuc
	mMqRNQnTcasXTRdAZZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmj-00FiGy-PP; Sun, 22 Jan 2023 19:13:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfma-00FiA0-2n
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id v6so25605954ejg.6
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJgr7/ZFCNM0Zz3UBCXP3gKQREBrA/7y6me/q9fFffM=;
        b=dmUVRmmDyMWucKlZKg3/vGnXUfVQawmOJksWzsO4FmH5ZEUctmWu57f4/LR3N9PGvw
         Q+2DGzgn0/kNPOJlD2jU8c1lGawQcmj1TdxtKp87l+dRu6RbAn4lZaeud7jAM9dvs1Gr
         zesRgeqz0QzWsM3IbYsxSnqZhBeiWLUqbPWLYOvzJ0sb7Q1qVpA8GFq+AngZ9DeLdBRO
         2vPaIDHfb0WkmujQMSXF6+skMQHb3vPlfHRuNS02HQyRNjFZunK1zFjVy9wG52/a106T
         za5+ftMkGiKEcTQjvIDlxDaPbZ5WxJ3ynoH0YEYAWM8vDIRat/p2jLBFM1LQ9/mQ1w1K
         UbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJgr7/ZFCNM0Zz3UBCXP3gKQREBrA/7y6me/q9fFffM=;
        b=xJt922y5NdZkDjwWaceRCIXztPtcbNsh+AH1F1PEF+9+j+gSvB16DubAL2Y5aA+wS4
         7ybotC9ZLT0ZnukR4XASaoV5ps9bNO3nHdCqAXt+9rJgbHgA37DpZ9EBMCP8MtgBSa/u
         2EyVFIycEy3G0uoPBWQJ/wES6HnaHvw4vMMEh530NjXnr30XHHqUEx2pGskdbFOW3AW9
         ctNGTYbr8whB/LMFJuAx9a0jImvGEInu1UfpU6GiOLjNUmat3uAzMEh0VWK2alYvYm5o
         xWCviilYyRUEvlFvXoEwPRQWUqFqcgvssl5rBfacs5/zK/+3yX2Hqi3vF/rul+pKPCcM
         TYfQ==
X-Gm-Message-State: AFqh2krMoMlQJMERau+mUvsZygSkn00i+eUU12UafKsKQAy2sdLZ2Yoo
	s1oUVV6NC4P1SQ6bVpYLhpx6tyH5MN9/+k6R
X-Google-Smtp-Source: AMrXdXvhMNwa5aJsX2iFxErEMxJE7sAALXj7MfKzjxeJdQhwJLEyLK/i29gx7mOAmtDNNfwoDBlIbw==
X-Received: by 2002:a17:906:af8f:b0:7c1:5098:9074 with SMTP id mj15-20020a170906af8f00b007c150989074mr19107813ejb.0.1674414815485;
        Sun, 22 Jan 2023 11:13:35 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id mb9-20020a170906eb0900b0084d34eec68esm20084912ejb.213.2023.01.22.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:35 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: [PATCH v2 4/6] RISC-V: Use Zicboz in clear_page when available
Date: Sun, 22 Jan 2023 20:13:26 +0100
Message-Id: <20230122191328.1193885-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122191328.1193885-1-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111336_176513_22E974F1 
X-CRM114-Status: GOOD (  16.95  )
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
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
