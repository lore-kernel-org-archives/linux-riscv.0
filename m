Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D5C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R0n0GPtEX0PNmePzPYFBQOKR/X+TTGgyZNOfkcDrzU=; b=w28OUILu0rhBOM
	IUsak1zDNlQr+cVOo9fgq6/IXd4tPnjqKqHt7mCKBrAp0XGaql88RQVSq1AcNj4U30F+m20EG+Gfs
	tUoxovhjlduSyrVA9X6c2CBOOg5KxiDkAUIVBjX3vZFl/984DkSVNrK7NOpTSkQ2utRSUuLOKhPwk
	Cb4hFr4xecY6FmqL1qiU2iJS8wADxjp+VBYVcw4k3m23s8xwA83vrSDl0vrjG/S7iIoExuZIx/QHe
	GsCTFJQGWIe7YgVZsFiHWX7yenSdmR+byCzq4sjkzhZAazZSIiT9HeQs6wfrlsDz0FMwLaBwoI58t
	33GZ2OOzG9UqpehXemFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSP-00C0wW-6r; Thu, 20 Oct 2022 07:59:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSM-00C0tJ-5q
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:59:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id i3so19539827pfc.11
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=RtIs+Fo57m4OyjqREQ+GmkLa1gtB+nd1wI1cynGPWeyR4VuzuTZWYwxJp3qb38jND+
         jXzllqItnzM8dXynZdtd4gBtlQcrTFv3q3wLdb9aYmU1re7J1CS7QNaEBpwC5Es4tMoP
         8fhXm+QGwvfvAnRFygQrEktJR97lrpRTNwcBmjOVjVyH0enR9liXz+TuLkEd3jbxNgtS
         0Q5pPUbWB2jqGj3mst8Fq1vF9FPWmupAtBR8zOnr4ZeSflblwpcDKp/m4D9umY0Ly4J6
         EgHMvrkLGNAoI6X8hUK3eiUWTy+WmHETYpx3tSzPJFfbAnLWn8XU2jYA24Eu1d6/08Ar
         W+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=lXjAJGJU7VDyGrwyjoD9qWu5hvIiBmPm5m9hLA3H+HYpG5K2ou4N2jzS6wcvv2XKjy
         RRmAPiMAQCIZaFWyg1QEsPA21G98Hh6c5mdKEDDFfSC+K2xNdf7WcLQGzZVjKDW3XuHF
         w+aaB1X+BflHFbDB1Ek0zxHP6BYQTLsnDPZ6XnCBT2TF5hiMc+LDj3NelOfGj0M+fIKx
         MJZpizKNK/YsytrzRJ0Vva1efjhvuCp9Jt6Un6KB8ocJ8t0g8gatGvk+ZR4+v6EtWpPw
         dCZipchOUrcN5D246grYVcwfJzqYTzRFvkH/48Ar/W/rdLgP9u+pnpa2NLkstDrq00sL
         r/Mg==
X-Gm-Message-State: ACrzQf1ZOdiZjpWr2Ojo4TiMOEqGH+1setLIOSwP6j9jtXQHNRGoTeau
	4NxJb30NEp30GubOFJ5aWdmkvQ==
X-Google-Smtp-Source: AMsMyM4+Y3j2NNCSyJHfzbf9XmZTArI3CBMgBB4JZwGFMWkS1y+U/PGzCotqjnP6BECxn5NkaxBZpA==
X-Received: by 2002:a63:2b4b:0:b0:440:2963:5863 with SMTP id r72-20020a632b4b000000b0044029635863mr10501248pgr.28.1666252748070;
        Thu, 20 Oct 2022 00:59:08 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.23])
        by smtp.gmail.com with ESMTPSA id h30-20020aa79f5e000000b0052dfe83e19csm13206438pfr.16.2022.10.20.00.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:59:07 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v5 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Thu, 20 Oct 2022 13:28:45 +0530
Message-Id: <20221020075846.305576-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020075846.305576-1-apatel@ventanamicro.com>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_005910_226501_31749CF9 
X-CRM114-Status: GOOD (  13.60  )
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

The NVDIMM PMEM driver expects arch specific APIs for cache maintenance
and if arch does not provide these APIs then NVDIMM PMEM driver will
always use MEMREMAP_WT to map persistent memory which in-turn maps as
UC memory type defined by the RISC-V Svpbmt specification.

Now that the Svpbmt and Zicbom support is available in RISC-V kernel,
we implement PMEM APIs using ALT_CMO_OP() macros so that the NVDIMM
PMEM driver can use MEMREMAP_WB to map persistent memory.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig     |  1 +
 arch/riscv/mm/Makefile |  1 +
 arch/riscv/mm/pmem.c   | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/riscv/mm/pmem.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..025e2a1b1c60 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
+	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index d76aabf4b94d..3b368e547f83 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -31,3 +31,4 @@ endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
 obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
+obj-$(CONFIG_ARCH_HAS_PMEM_API) += pmem.o
diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
new file mode 100644
index 000000000000..089df92ae876
--- /dev/null
+++ b/arch/riscv/mm/pmem.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/libnvdimm.h>
+
+#include <asm/cacheflush.h>
+
+void arch_wb_cache_pmem(void *addr, size_t size)
+{
+	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+}
+EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
+
+void arch_invalidate_pmem(void *addr, size_t size)
+{
+	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+}
+EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
