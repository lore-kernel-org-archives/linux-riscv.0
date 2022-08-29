Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D69DECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c43z824X5Aw5kJyCZx9SL+jFgN/nw3+yrsuF2xqbi0=; b=TLQt67Ar8cpAa2
	qCwwIrypMFwpiNKM+r8j+b/mZchjewJb9YVdrL3K6Wcp7egrQSvtQfRGulByG2O8ss1NqcXE9+Scf
	IAjmmjaYzQw9XFb8iNe5u1V5xmWxXd4XVOwfdDd+pLvZurDdNYfeyRLtYZVhfnZmPudg+K8TrEbtZ
	5AJ7mdcz+d5WbVqleWZD2C8+nPT56ZjjKdcGo1EfdnEZiifigHdDhYpHzPPI0yudXFjD7IGQzfqqW
	3KWcI1+Ow90zPdmOmdCCtgllGMlBfqVrtHwlt4dEHXB3eNhEf6kOg8+wHXEqlIPMuH1ykdCJZ4hcj
	ism8Dqoj8UPVcAjn1uLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGJ-009xO1-Nl; Mon, 29 Aug 2022 12:53:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGF-009xC0-Cq
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 12:53:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id l5so4027851pjy.5
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XMoCsdNUCfWhBPID8WfmwBdQlNlnjab95bfwWj1Kd10=;
        b=DY53GI5TAnAd0CsPwNi0mXXEFLioz8RUCQWfclNsemmIEoXDit4q8fe226V5e9n66T
         ymNgRpgtzoZ67kEOIRa3hxXmfD+fTl7OEJKhylMwqu6tmaSUeKNIO/GDq6fOX4zn/AaT
         yNPIV4K2SYBVbgHjH1vpuoOquPUSxJp7gnQZWKEim5K7/8UBrQYuAp5Nzj7iCi4wENRe
         9a1c5135iN0Crz5jFUAGAKPa5kPn75dCP06cCG7Si0znL0Tax5+WlC2U42B1RXs4Xm8u
         u0lM+CSOnLgcdAglCnrcAROqawX9s98jp/sQDsEbBA049PWUylpLPSHmeftcoAA4ttA3
         C8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XMoCsdNUCfWhBPID8WfmwBdQlNlnjab95bfwWj1Kd10=;
        b=6tDnm3aEy/WV61i/A9NBDgWf9WpVaPbIB9uwvYhJunGeTEqsYdcrGMA+IvswJLRFrN
         v0ZvSZGD7ZRfuc7G0Lt4qUmjEE3oqcw294hrNK5b1GMC4xAI1pEoQyi0aFj7DZprXN2u
         IQi47ySaGAB2jEt9l1hdGT/ILb9SdRUlptvVZTgUC1xWHdZEGhw2SJ9tt4R7S7vj3WfU
         ivP6NAyIQizQ0MsdIQrwlIfsWhDu/hBBN3C6HP4t/29P/XZpTn7cvrICRqFQq5Td4qTX
         Qik8VvsBdLBYFRuIeuNGx8KRG5USnQ0eUZl6cv1RtAJozknT6XrQkS7QigshvjDFPVUZ
         BsVw==
X-Gm-Message-State: ACgBeo2PYy+ZIftZjtuGSo2POub7NG6hNegXvDSzFLu06WDyogCCPKdm
	mBwFtp3/H3ktLU9nIDZu4eLCWQ==
X-Google-Smtp-Source: AA6agR4bk82OZLIjKGxv61LXR9fE7Iqmvmc3giXZ2CUodzY2JdWIgqar/F3YzowFSpuFFbgRQ0T4tQ==
X-Received: by 2002:a17:90b:35c8:b0:1fd:aef7:1ef6 with SMTP id nb8-20020a17090b35c800b001fdaef71ef6mr7851082pjb.60.1661777582743;
        Mon, 29 Aug 2022 05:53:02 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.110])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm7517607plh.170.2022.08.29.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:53:02 -0700 (PDT)
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
Subject: [PATCH 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Mon, 29 Aug 2022 18:22:25 +0530
Message-Id: <20220829125226.511564-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829125226.511564-1-apatel@ventanamicro.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_055303_583457_5F284BFD 
X-CRM114-Status: GOOD (  13.68  )
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
index 0ebd8da388d8..37d6370d29c3 100644
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
