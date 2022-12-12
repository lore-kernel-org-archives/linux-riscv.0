Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50D5C10F1E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdZDl5ZILFTncB2BnckPJCwqBlfZfAogeFNeCXN6OQ8=; b=VCN84Sg5CU3QFR
	z5f8aW/dx4kuWv5aN7G/69mReBdTyoyMvVvx+eWceheRrqthG/iN+GcA5WRQ8m3HlCJvqHkYngoDr
	aHtW5vIDDgzBUwTvxRFo1azazN3TqSVbrvF1l/KV/0q8M9HfbxsRpu3kQ6KQDRrR4327I/cbp0xVN
	MT+LsTNiJl9v1bQ9kJ/AFvNapzB5pW7K00uHZv9dTZdAjESVl1lrBdHMuFV9hogxHmbN3f3PELEvm
	eRc9FGVlJJ6T/xIY5HY9TLGDtNuRiG8YKno5J/wwFwJ+BCnGMveqLRPhJmUcSB6Aev11AAjya0NJT
	WBEY/jlitwjQf8NkM88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPJ-00ExNm-Fj; Mon, 12 Dec 2022 11:55:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPD-00ExGm-Qx
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:55:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id v7so5097033wmn.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzK92tWlo0pusm8Rw6p7QHx68Jw5ykZXn4KLaddI3ZE=;
        b=krBiDdeetWdwtcsBmVLwU2MY0wi5figLBbsF9p+q8zi6BF9QjMQ1rUr6k8xV//wT9y
         yuHhVuNDNv0Cc2h8cGNtPi59nu9oHo6H4+3q3YoY41Xwg/ZIoxqxKzPmjcVAlbWl54yp
         rFe+LDZ9YC6pY3vcfYmEo9atC+2UmaMxtkTLLTpdnYkOXJm0RhtPMuZ/5qZAPiHJ3QRX
         /y/58wO/5BVUMhAj3tfeXNGeYRxV2kSckReoRhzqGcAs6D7fKgfvyPR8fANd3OGu6QbN
         Pce2wWSS5cktEBrN/tbQq0rhrmoHyiZitPVArIDj/NqnYyUBFsxHXhyvBpSelHrxlSOl
         ahwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzK92tWlo0pusm8Rw6p7QHx68Jw5ykZXn4KLaddI3ZE=;
        b=6bry0oYyjZ5+lOEJEq2TIY+s1AJJ5W9jGUD3NaOf6B+dy8yF0lv+YR7/+x1WG9Z46j
         Y64muotVi5Hxk2iJX0rgQuy3vFdtu+bWj+DPW8puqbVuVCQYxIRHepq5l7iHNpTkSbW6
         VElnvtwaBi7RZeQMvOXbFtuH4RiUB+DH3GP8zMEugbBszGapOS2/zntINV+dvwzPoeJr
         lW3wUbP4iUtUUN/ZowQ8hcHmgsCV+vCNW3SwKBAlGhn9ejTlk6jOvUdwMicv+HXTk3XC
         eyngvn9nHi+pVfl24unBYEg0T986AT2101iISSGN43nvasnwwFo+AERhfKOwv6rg8Sbq
         Ht0Q==
X-Gm-Message-State: ANoB5pkKslHofk2snHN6JxzrvXwc+xLSdPMKA47hAV+6zipiz7PHluzz
	ecnElZA5pOGd0dwN8Ef0L9A=
X-Google-Smtp-Source: AA0mqf6T2XtyjVABYtFI0MWv0kXe1yDT9o5/ln3xNVmfl2O1eK/VzLKhVzt4einKdZ1MVC11GlFHKA==
X-Received: by 2002:a7b:c315:0:b0:3cf:6ab2:e14 with SMTP id k21-20020a7bc315000000b003cf6ab20e14mr12203565wmj.23.1670846133181;
        Mon, 12 Dec 2022 03:55:33 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:1484:ef11:b25c:4612])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm9793820wmq.41.2022.12.12.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:55:32 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/6] riscv: errata: Add Andes alternative ports
Date: Mon, 12 Dec 2022 11:55:02 +0000
Message-Id: <20221212115505.36770-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_035535_903070_176771BA 
X-CRM114-Status: GOOD (  24.20  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add required ports of the Alternative scheme for Andes CPU cores.

I/O Coherence Port (IOCP) provides an AXI interface for connecting external
non-caching masters, such as DMA controllers. IOCP is a specification
option and is disabled on the Renesas RZ/Five SoC due to this reason cache
management needs a software workaround.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4 -> v5
* Sorted the Kconfig/Makefile/Switch based on Core name
* Added a comments
* Introduced RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT ID to check if
  CMO needs to be applied. Is there a way we can access the DTB while patching
  as we can drop this SBI EXT ID and add a DT property instead for cmo?

RFC v3 -> v4
* New patch
---
 arch/riscv/Kconfig.erratas           | 22 +++++++
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/andes/Makefile     |  1 +
 arch/riscv/errata/andes/errata.c     | 93 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 +
 arch/riscv/include/asm/errata_list.h |  5 ++
 arch/riscv/kernel/alternative.c      |  5 ++
 7 files changed, 130 insertions(+)
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 69621ae6d647..f0f0c1abd52b 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -1,5 +1,27 @@
 menu "CPU errata selection"
 
+config ERRATA_ANDES
+	bool "Andes AX45MP errata"
+	depends on !XIP_KERNEL
+	select RISCV_ALTERNATIVE
+	help
+	  All Andes errata Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all Andes errata. Please say "Y"
+	  here if your platform uses Andes CPU cores.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
+config ERRATA_ANDES_CMO
+	bool "Apply Andes cache management errata"
+	depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
+	select RISCV_DMA_NONCOHERENT
+	default y
+	help
+	  This will apply the cache management errata to handle the
+	  non-standard handling on non-coherent operations on Andes cores.
+
+	  If you don't know what to do here, say "Y".
+
 config ERRATA_SIFIVE
 	bool "SiFive errata"
 	depends on !XIP_KERNEL
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index a1055965fbee..6f1c693af92d 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_ERRATA_ANDES) += andes/
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
diff --git a/arch/riscv/errata/andes/Makefile b/arch/riscv/errata/andes/Makefile
new file mode 100644
index 000000000000..2d644e19caef
--- /dev/null
+++ b/arch/riscv/errata/andes/Makefile
@@ -0,0 +1 @@
+obj-y += errata.o
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
new file mode 100644
index 000000000000..3d04f15df8d5
--- /dev/null
+++ b/arch/riscv/errata/andes/errata.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Erratas to be applied for Andes CPU cores
+ *
+ *  Copyright (C) 2022 Renesas Electronics Corporation.
+ *
+ * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include <asm/alternative.h>
+#include <asm/cacheflush.h>
+#include <asm/errata_list.h>
+#include <asm/patch.h>
+#include <asm/sbi.h>
+#include <asm/vendorid_list.h>
+
+#define ANDESTECH_AX45MP_MARCHID	0x8000000000008a45UL
+#define ANDESTECH_AX45MP_MIMPID		0x500UL
+#define ANDESTECH_SBI_EXT_ANDES		0x0900031E
+
+#define RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND	0
+
+static long ax45mp_iocp_sw_workaround(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND,
+			0, 0, 0, 0, 0, 0);
+
+	return ret.error ? 0 : ret.value;
+}
+
+static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
+		return false;
+
+	if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
+		return false;
+
+	if (!ax45mp_iocp_sw_workaround())
+		return false;
+
+	/* Set this just to make core cbo code happy */
+	riscv_cbom_block_size = 1;
+	riscv_noncoherent_supported();
+
+	return true;
+}
+
+static u32 andes_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
+{
+	u32 cpu_req_errata = 0;
+
+	/*
+	 * In the absence of the I/O Coherency Port, access to certain peripherals
+	 * requires vendor specific DMA handling.
+	 */
+	if (errata_probe_iocp(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_ANDESTECH_NO_IOCP);
+
+	return cpu_req_errata;
+}
+
+void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+					      unsigned long archid, unsigned long impid,
+					      unsigned int stage)
+{
+	u32 cpu_req_errata = andes_errata_probe(stage, archid, impid);
+	struct alt_entry *alt;
+	u32 tmp;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != ANDESTECH_VENDOR_ID)
+			continue;
+		if (alt->errata_id >= ERRATA_ANDESTECH_NUMBER)
+			continue;
+
+		tmp = BIT(alt->errata_id);
+		if (cpu_req_errata & tmp) {
+			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+
+			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
+						      alt->old_ptr - alt->alt_ptr);
+		}
+	}
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 1bd4027d34ca..e3a8e603eb5a 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -43,6 +43,9 @@ struct errata_checkfunc_id {
 	bool (*func)(struct alt_entry *alt);
 };
 
+void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			     unsigned long archid, unsigned long impid,
+			     unsigned int stage);
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..2ba7e6e74540 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -9,6 +9,11 @@
 #include <asm/csr.h>
 #include <asm/vendorid_list.h>
 
+#ifdef CONFIG_ERRATA_ANDES
+#define ERRATA_ANDESTECH_NO_IOCP	0
+#define ERRATA_ANDESTECH_NUMBER		1
+#endif
+
 #ifdef CONFIG_ERRATA_SIFIVE
 #define	ERRATA_SIFIVE_CIP_453 0
 #define	ERRATA_SIFIVE_CIP_1200 1
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index e12b06940154..0a09cbbc2593 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -40,6 +40,11 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 #endif
 
 	switch (cpu_mfr_info->vendor_id) {
+#ifdef CONFIG_ERRATA_ANDES
+	case ANDESTECH_VENDOR_ID:
+		cpu_mfr_info->patch_func = andes_errata_patch_func;
+		break;
+#endif
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
 		cpu_mfr_info->patch_func = sifive_errata_patch_func;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
