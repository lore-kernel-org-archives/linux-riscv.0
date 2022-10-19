Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R0n0GPtEX0PNmePzPYFBQOKR/X+TTGgyZNOfkcDrzU=; b=c52s9jhnUbRaye
	O2XWnjDcxZwrBWD9sTwexoh0c+X7eSPWtKtkkMy/LCbxIGIdOARO9PJnfr4Qs+ANHTEgMSehU5HPm
	xmqS8pTmSJzeJ7fTAPTtp2L0sDkrJNk2zx2PmgxNkxplN+Lz5Aq178bLAdcfC4km3tdYhkkQmzdo0
	Zqlpq2/+pYsbTYLfTeKuXwcaromoculsqkRxs3Zpyyl0Br6uffWtqQrj2MjSOtROu8HFmb7J0I+pL
	CWW2Lt5qWzTyyTg/uGA7agxNBZ4+o3vX5Ox1DLIFv3j7Zsr3/FP2KPXxp+Ghvc/NbNIbtONGW2qw5
	MVRGWsJ5D8iCIdKgxzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80M-001MI3-S4; Wed, 19 Oct 2022 12:17:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80J-001MEN-Hu
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:17:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id l4so17061315plb.8
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=i5xDygA39ZiL6V5jYRwye8A2LIvzetB63vHUYOWr2BWrbkVbpO3pkBYH3R4AefnCMx
         ZNbUX/VDSAHFyP+aJFUhp8kECTdCKL05yrdADc5Ot3y93ZCkWLi6bUz897yCaExJx4Bw
         GajHfhrg155GES2wMaGWRDyc7m7ypTIovOPmMj54xOBMiXif0M/CdtpVVIQUvLy/fn08
         sPTvrps9V+qBJWKON+saGrBa1E6W9gfWpnCme7jlICvN4pZt1r5D2/f11wkyaTBxjgSt
         JMW+2bKAdpbDrP7biq9KESues6HlMcwwOi9yTdA+K09/XvqaJMkHNQDM7av9zvcdDaap
         HhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=6Z4pi9Hf9Y/2I/NHOdyMMksVGKXjWpEZzlZssy63Z4DhylKXS3CMBlJO2yS9AFq9NS
         EaimPj01si5ro8s25zvZqHYtGLuv30yEemtVJK9B15Z1aR4yAdLnMBgQFNwyeYbfEuTe
         rKTmtn2gVFUWl9w0Uy2RJRV0RM9iXmFzVpZH/Z+coMl7SzLfH0UK391rJsU+X2Z9KqMU
         QOxJEBiCdMvUo/SGLk8vXzjOSdxouEF6F0aEgJxgSLZefFuyhmpOKgu58Fy4XpTlkG7V
         uJMd8n9q0FsNe4hpjxk7IZ6DnqLNC0SVCTGrC7CvQAcein7/S5p6hVDH72aUeYIfD0JA
         XmlA==
X-Gm-Message-State: ACrzQf0vcB+g8aUHJ0pKFKwT8JSZP6u00jq0Rzrm/iMtBZpRh4bhKGko
	zWmTnD0kwbyY8XcXoWIVovJbnA==
X-Google-Smtp-Source: AMsMyM4J8nzaBdE8C2ChfGOR2OJ3RrEACtnbjmCGk51hwkIx/IkUkT5/o01BqStj/3R+/fS/YYogqA==
X-Received: by 2002:a17:902:f78b:b0:17f:9c94:b247 with SMTP id q11-20020a170902f78b00b0017f9c94b247mr7851355pln.137.1666181817710;
        Wed, 19 Oct 2022 05:16:57 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017e93c158d7sm10529824pla.214.2022.10.19.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:16:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v3 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Wed, 19 Oct 2022 17:46:21 +0530
Message-Id: <20221019121622.179024-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121622.179024-1-apatel@ventanamicro.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_051659_620850_5E076A90 
X-CRM114-Status: GOOD (  13.93  )
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
