Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AC9C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhLLn0LTVdtiGaICtTatGPv7Xgd2fh8y6AR9GhKP2Ss=; b=fjNXceNU+TLXkL
	5OYDcN2D8Uy2lUzM52+GJU9255Bx7wFmqXQDzDblvCMErp2dEALa6Bd4qjEhofe5k81d/MkbjsvBM
	v6ARSZmAhyI3XlDLwx2bkmym+WqjZLX6wlHNBMe2GsCIkRW1/yt42J6IkW9ZMgKTzBan+B180WHjk
	2poqVUdwBNwtTJB2spciCOBer6FoWxO8RCnIU4oVa9AEMj/rzz8GQUkBw3NICYNvTPT2y/EnxZtWi
	Oi5TPgMPd+sWedm/9HQxrUq69PcxHz8zkIO6MYZu5j4Izrel0UJPSl42yWJkA1C12McOD4MZt+WaF
	aiPc4DjYEENcXfg8Ggiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUm-00H6uu-8R; Mon, 14 Nov 2022 09:11:12 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPw-00H3h3-RW
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:06:14 +0000
Received: by mail-oi1-x234.google.com with SMTP id v81so10780480oie.5
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoWw75G040ie7NtRU1t+qmFKMYccQlQoZxH65ktuUwc=;
        b=iw9Zn5wy3+2CheYk+HVFSGRBQPMEZOzZdXThvNA5wyIVOJtvxvOTQ2Di46U4JtsTht
         05BGqmPk7xhqxM5lMFWPJFdT5j3kWYNpuQa1womt+KcVO4WC9osXK7+IkZl5OH7VAOxd
         4bDH4oJvu4vVDT5aTyrn+FeQ79E+/PLS50EkGAWgqiXo2Oh70O24CxX4ljF3Vf+E/GNp
         Gq5pA4bbJ4wMqrr8dUGIDyGV6oZK32en879tDPV3UPAfuDdsrL9lNS5ehqBSakIVmYe1
         gcHvYbnQZSdtrqOt3z3BXSic/bL5gCQ67z8CqVvnFbMJb9PjRASxShXBN7Fkwn75e9T3
         Ux4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoWw75G040ie7NtRU1t+qmFKMYccQlQoZxH65ktuUwc=;
        b=Fw0k+Ft2T9HgQSvDWNBGahchOemJT2/A+WoRCcSySEuvqcFLK2z1IXlJO3CDQhnxyz
         NXQv+J/URKdo1n+2dezewZ6kAg1jRyD6XP9mkPHjFaJhptlyW71npYc+F0lGakmuDDgq
         G049VXNhc5FLkeH/xX1Wh13VFS9kuNGgkP5OiQV3Pw5E1EMa9ZS9XUYBD+INBIgbi5bq
         4S+eHxRrQDb4+1q17aJ1oDjakvqRPXBNcZ2h3LnTFgkeU8R/x/kdrpumtTjeY1RgI1Q7
         q7TInQIF3KoMc9pS2b6W0gWAh3wo1Ur2ggf3tlc3Ec3rbzlxAv+VPsB5BMcJX+6lMuBQ
         zZgA==
X-Gm-Message-State: ANoB5plbWCYsAv4yTKkQU62ZWkbvm/yhiLWqv46GCejmELztMrI6whDT
	XxkgCYqymM8+crxXUB6ty820XQ==
X-Google-Smtp-Source: AA0mqf7m8kcUu9r7qqVEnPOsTVHBFEw7ibiEt7s/gaYqgSEg0zIa+JeX1KtG63NZnHWjukxkKfep0Q==
X-Received: by 2002:aca:110a:0:b0:35a:c54:3ad2 with SMTP id 10-20020aca110a000000b0035a0c543ad2mr5146218oir.89.1668416771563;
        Mon, 14 Nov 2022 01:06:11 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020aca2402000000b00354948e04e4sm3432939oic.2.2022.11.14.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:06:11 -0800 (PST)
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
Subject: [PATCH v6 2/3] RISC-V: Implement arch specific PMEM APIs
Date: Mon, 14 Nov 2022 14:35:35 +0530
Message-Id: <20221114090536.1662624-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010612_946263_C7B4F127 
X-CRM114-Status: GOOD (  13.69  )
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
index fa78595a6089..c0e22648bd16 100644
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
index d76aabf4b94d..b4f35da889bf 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,6 +13,7 @@ obj-y += extable.o
 obj-$(CONFIG_MMU) += fault.o pageattr.o
 obj-y += cacheflush.o
 obj-y += context.o
+obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
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
