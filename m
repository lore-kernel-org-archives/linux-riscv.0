Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D608BC43217
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R0n0GPtEX0PNmePzPYFBQOKR/X+TTGgyZNOfkcDrzU=; b=NjmVFbcUphPO3f
	nRSP7IukkPtaozAnmM+L/GoPviad7CHWfT9zMBhnDuvt1bqKodnMoTUfD2UeziVYRe+ne4HP1PJb9
	nnHg0bNki7XovM/zTHbIMmFWUNTn+8tHREXbVfYnilE0f6/RYr7Uq/V0Zopfg5HCDej0vgxfcHhyR
	6OjsUeAyr9SO/ngo6sWj1bc4Xcl4GB3EfqUbEfv4robLQYFOQLjkXNc5SWH+O+p3L8ZDho2HS/ybj
	Vq/TAM2CjmCuKkgUZP063EjC/vtIbHz33DIwbJGOT7YmYtc/8sY6b0godrV5DVhTwV8QUiEGVpzny
	bLthkV8MVGg3z9G41mBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rR-0023pj-Or; Wed, 19 Oct 2022 13:11:53 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rP-0023nG-3I
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:11:52 +0000
Received: by mail-pg1-x52f.google.com with SMTP id r18so16190615pgr.12
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=HOkyp3/fLEtCt1yCpma/EVhFQK4FgiHrDx/1YMPDwT9KQrXtZ0+DK7VA6GhN48oRWA
         4sG0ELlR4Xx5kFHMLD3IcKQgSiGxSCIYHNPRD6e781OBC4699iRbnlkAlAhprF0gqYki
         acC7BoHMX02nQX6Pt26dFyxXVI1LBAdKELJ09Ghl43yGZrR73a3ii+p3UpqdhnFHmDS3
         0XiS8j+aXMQi6uBmUu0KnVCdN4N4RavsAQEqNU8PGVb2bh7fmWtfDPDtsrXzpGkESvGd
         aZAwD7ULTmeuMDJfShrg4v3kG6qvCUAGwnSOXlqQ+x8M/tR8DDnBRCjDLrLCFOns0lYR
         HzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDJV4ZwRVQLzE0DQMb9i2tBKWni84XeHMbgigRoQK/0=;
        b=M4DyANgnFbC/4gA1UNVl/Hv9qNMpMa+CGjLZYpOzBTXEodLMrc+VUbGilC/bjmt7/O
         /4z75DOc42MOmGw1V66vDXNucyuGMFMAwb9p+DmR/G4xu66hDaXj2nfGUeL0vhOGUDf7
         vvWl2Mb+8klObzTq5gLailpChYFMd3aluzpxg++2N9kHwGhS7NpydQ6g3eRuAstgicb3
         6JMbJQ+4vGvwPbtVitRA5q02vnRI/Jm3sDc8nYONozmsqDaI9TJ8XA75lP0n3EJRocfO
         5LHjHWgkPk3WLIo3qPj2hu5Ln4zThWclOHbDC8nUI3QrsaYPg7WmyIOcI+kKHI3Hf/17
         R7Zg==
X-Gm-Message-State: ACrzQf3h+E+Gmh2Cp3hFfNy/8fSoicv6coFnNQD8J0BbCPdNo4M7rYhR
	7fBS14pKqFzU7gDjW5RIyARQUQ==
X-Google-Smtp-Source: AMsMyM798d6sCpUdCwQ/ecSIilfJZ6v86SVZw+SrASHeVBqUCbXn5DWhzpkIIEZcuJRhURHhRtRArA==
X-Received: by 2002:a65:6b81:0:b0:461:4049:7df7 with SMTP id d1-20020a656b81000000b0046140497df7mr7235376pgw.593.1666185109034;
        Wed, 19 Oct 2022 06:11:49 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b00172897952a0sm10934478plc.283.2022.10.19.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:11:48 -0700 (PDT)
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
Subject: [PATCH v4 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Wed, 19 Oct 2022 18:41:27 +0530
Message-Id: <20221019131128.237026-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019131128.237026-1-apatel@ventanamicro.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061151_149785_A3EC7CA7 
X-CRM114-Status: GOOD (  13.91  )
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
