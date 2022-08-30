Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23A0C0502A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c43z824X5Aw5kJyCZx9SL+jFgN/nw3+yrsuF2xqbi0=; b=U5IECdhRCSvSpG
	sQLo9khQ/lLdfNTywiyfmO8A4/k/Km6EpYVgZ7VA4OCvmsMS1fi4RcSc4XBhZzb7a8rAQ5zIHeJy5
	OLatYtbMiDospDl3X+5/Y6Dv5lv3x6MfYDzcZPu/OFSibIXD7FcxfWLA/rSkSanscamSOCL6sIhc+
	upSk4hfUNCFlbl6HQhIOHJty2jGOjO6Fo6+Or93ovXe/WfAICOD5fVI+AVqsNCr/Unc66ux986tfC
	jKP9g7GWoN/vH5o68NPo/SLMHsKgOpeEeBKz9cFoQlSRpiqNWhlVLpV9TlF8fv4KrQh7cKP3zlglM
	j3sztZjoQrexFToP8v7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStAB-00E3qV-CC; Tue, 30 Aug 2022 04:47:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStA8-00E3mA-D1
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:47:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id j5so6099435plj.5
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XMoCsdNUCfWhBPID8WfmwBdQlNlnjab95bfwWj1Kd10=;
        b=KyY6qemGdAkaKRbxVYdAz3bVkbn3V5vCqclhXgThxlPctC0qN1uzOeIZ5vS6FTD0GR
         RWzYhB7OVcdM4eCrhsKp6+DpAxlzpq0XIiGM6RHJ2Dib3h3tvpsF8gT7bAFdnT0V/K56
         Ft8aKk0KTa80X1JCkYDt0XUsujMjVvlgNpe0N5KhfgEwwRBdS+qhIELWu7PUP3DLhrIV
         fOW8V9hRRaRG2W98qspPi5sNCJfJipHToEpOG7U9qUWQ/eP26nGgtziHJDuHcrj1m+2Y
         EsecMzXMLGxtVS561ACyh+HMQvh4HuaP8HmJ++cYpcNd6kxzT0aDLPMxoIMkdBghnaEv
         6JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XMoCsdNUCfWhBPID8WfmwBdQlNlnjab95bfwWj1Kd10=;
        b=SslOehlNAPUp0KzaYbWyDIXLum+uBtWOm6RDr+5j+VNEETCl610owuPBtbhb9mkTkK
         WJmYUJtzs5iUCdYlZotiFrtNiArwkDnj4c2eFEJppJPv0o9sHRSn5rJm8o1JL34Z54Zy
         yHQFLwejAUXTgDZiy3d2nWlQEh+GQTiw7vgVJ7yUUhEolR/a4RkbOjLet8An/eFrKWqs
         MySVu9ygKd73xtit6s5ypUA75p14GpMY/DHMLuJkcrBlmiUXLu9BQdDrQpzVMAw5kBc4
         XlWWj8cxFqn2s+bcqeV0tvKiGUAiJdL6AJsryOCOEHkc/QZE5XPMnbv7gkp+H17dcEL4
         Yr7Q==
X-Gm-Message-State: ACgBeo3i+uBRoVlMdN58HEnS2g7v9W2s6+njPASIXuCwkyzJQY9cazwm
	WB9mrH3tEMdwPARaxz0bRnY3Zw==
X-Google-Smtp-Source: AA6agR7SXnyqGd3PJVXZX31upuIkPNkqX09rWCJO72YV0QlNaewtvScGi6RvN5v6HKr8LRd4oNC6Ng==
X-Received: by 2002:a17:90a:cb94:b0:1fd:86fe:ba3e with SMTP id a20-20020a17090acb9400b001fd86feba3emr15789321pju.240.1661834861316;
        Mon, 29 Aug 2022 21:47:41 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.23])
        by smtp.gmail.com with ESMTPSA id y27-20020a634b1b000000b0041cd5ddde6fsm592240pga.76.2022.08.29.21.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:47:40 -0700 (PDT)
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
Subject: [PATCH v2 3/4] RISC-V: Implement arch specific PMEM APIs
Date: Tue, 30 Aug 2022 10:16:41 +0530
Message-Id: <20220830044642.566769-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830044642.566769-1-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214744_521021_A44E8404 
X-CRM114-Status: GOOD (  13.25  )
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
