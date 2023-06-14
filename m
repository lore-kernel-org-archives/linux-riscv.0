Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767B8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1Nc6io9egKCyGBRNLb0AKhBDymtjexLRt++7sRQgdk=; b=qbj7dZ2oFynolK
	CF+oz685AEARcyicQ8vTCH5Mu488CoZMztYGMFGHBFXs2R6ORq1f4+ZVnmamf0JSyobRrGcctaU64
	pSyE/dYrRrNRqWs5VUf2qoDcVE+bMN1iMluWduAUedot1iUgQs4B24hwqkQa9WzQaz5nVUl6OFBSA
	j2Lna+YcAcCAoAz3Dw/xxMAPYqyfr8vZnFpXc5dLm2F0YBYJVaz2A843ogAetjhFBWSjrIcjot9n9
	yS7yyc+MAfWP2C11GcHIzso1/Vly/0ZF5wQpAKfPlXPFPRaS3DGZ9M9551Bv36oex0H2am8jQY1cG
	tOwmIX1SUU9REkoe9d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O2y-00BHCm-2F;
	Wed, 14 Jun 2023 10:48:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9O2q-00BH3a-1z
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 10:48:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f8d2bfec9bso6339585e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686739687; x=1689331687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf6nJ5pAtpCEejIto1ITkT/Ujs7hVgaDq6Jw0ySs/Fs=;
        b=OVqgxbAQxQ6n2d54LD5i9knesgTF9kB3aDN+qc3mKg2gFwt42EUxN7rADNMY8TUTYG
         4zDqwj4DkPMbbE998bYC4XwtpMISVnyufEkL42Fud8l71wAaBym+V2OvMlQ4D4I3jq8n
         jHkJulaLSZ5mSiMGquv1RBDixwxF1V6VB9LIkoWuVZb8lPRnNpVLGbwRqIyE/u4LYMGa
         ixxdZ9lHoDpKtwGxzrh4eSWPX9e2Q0kBlpTqiRKC4NtCwq2Qjbq+jzPRz5nQJfk1E+ly
         53Q3lr6xPkVRRWsYc/Air1QwZ7wBAAVGQGoyGwXh+q3mjfivSVN4rGnwdjhAAYjiOvhz
         UinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686739687; x=1689331687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf6nJ5pAtpCEejIto1ITkT/Ujs7hVgaDq6Jw0ySs/Fs=;
        b=Hakp92t7u0PWjWGLDuEFkskGoClI+c4zXt2E/R0MUROc5BNfNyNRCJU2NV9OYmO2+A
         TZj8E4J3J4Q5/1Xlsg59LoQfui3v74bOHgSgmmXlSTxfiBtsTi40vA6kTS2x5MwY996J
         MRKVTIg9s48cHxhrSUmVSmhUovW+r5ZQkcVaobLF9tOEJG5b2GNpMWSqfYO58GV9xmtH
         JRkWmHToxa+lMo+DCxn+m0Lra05HBxSgitzUekPWuj6cyVEW7KC1k7LhK8yBn9TRZ+Yt
         k/psEA7YdtCSEPCpmzJ3wu2rzYxuQcWM5bDj9KzhRzuEbcVEhASMqqTyC8uqvdUaGv87
         VaZg==
X-Gm-Message-State: AC+VfDxmbNoLjP3J+c/w8do6sbnsVR/TYPNufAMPagMwyCUXt/uN5moh
	G85zPmmVcMBqHeSnEyddxmY=
X-Google-Smtp-Source: ACHHUZ7sfO48zdwHafN4Xi4UzwNxtWyPcbcTaVkcwtCMOVWP+cXyUZh6/nN2CV3GOP87H/nYevZcGg==
X-Received: by 2002:a05:600c:aca:b0:3f6:2ae:230e with SMTP id c10-20020a05600c0aca00b003f602ae230emr11964075wmr.3.1686739686561;
        Wed, 14 Jun 2023 03:48:06 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:64d6:8737:b80d:a298])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003f5ffba9ae1sm17154904wma.24.2023.06.14.03.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:48:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 2/6] riscv: errata: Add Andes alternative ports
Date: Wed, 14 Jun 2023 11:47:55 +0100
Message-Id: <20230614104759.228372-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_034808_676496_8DE2F710 
X-CRM114-Status: GOOD (  25.34  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v8 -> v9
* Rebased to code on Palmer's for/next
* Dropped calling patch_text_nosync() as dont use
  patch_text_nosync() call

v7 -> v8
* Now patching the code using patch_text_nosync() and riscv_alternative_fix_offsets()

v6 -> v7
* Renamed RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND -> ANDES_SBI_EXT_IOCP_SW_WORKAROUND
* Dropped "depends on !XIP_KERNEL" for ERRATA_ANDES config

v5 -> v6
* Dropped patching alternative and now just probing IOCP

v4 -> v5
* Sorted the Kconfig/Makefile/Switch based on Core name
* Added a comments
* Introduced RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT ID to check if
  CMO needs to be applied. Is there a way we can access the DTB while patching
  as we can drop this SBI EXT ID and add a DT property instead for cmo?

RFC v3 -> v4
* New patch
---
 arch/riscv/Kconfig.errata            | 21 +++++++++
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/andes/Makefile     |  1 +
 arch/riscv/errata/andes/errata.c     | 66 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 ++
 arch/riscv/include/asm/errata_list.h |  5 +++
 arch/riscv/kernel/alternative.c      |  5 +++
 7 files changed, 102 insertions(+)
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 0c8f4652cd82..92c779764b27 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -1,5 +1,26 @@
 menu "CPU errata selection"
 
+config ERRATA_ANDES
+	bool "Andes AX45MP errata"
+	depends on RISCV_ALTERNATIVE
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
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 7b2637c8c332..8a2739485123 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -2,5 +2,6 @@ ifdef CONFIG_RELOCATABLE
 KBUILD_CFLAGS += -fno-pie
 endif
 
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
index 000000000000..197db68cc8da
--- /dev/null
+++ b/arch/riscv/errata/andes/errata.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Erratas to be applied for Andes CPU cores
+ *
+ *  Copyright (C) 2023 Renesas Electronics Corporation.
+ *
+ * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ */
+
+#include <linux/memory.h>
+#include <linux/module.h>
+
+#include <asm/alternative.h>
+#include <asm/cacheflush.h>
+#include <asm/errata_list.h>
+#include <asm/patch.h>
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vendorid_list.h>
+
+#define ANDESTECH_AX45MP_MARCHID	0x8000000000008a45UL
+#define ANDESTECH_AX45MP_MIMPID		0x500UL
+#define ANDESTECH_SBI_EXT_ANDES		0x0900031E
+
+#define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
+
+static long ax45mp_iocp_sw_workaround(void)
+{
+	struct sbiret ret;
+
+	/*
+	 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missing and
+	 * cache is controllable only then CMO will be applied to the platform.
+	 */
+	ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
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
+void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+					      unsigned long archid, unsigned long impid,
+					      unsigned int stage)
+{
+	errata_probe_iocp(stage, archid, impid);
+
+	/* we have nothing to patch here ATM so just return back */
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6a41537826a7..f6cfca939c92 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -46,6 +46,9 @@ struct alt_entry {
 	u32 patch_id;		/* The patch ID (erratum ID or cpufeature ID) */
 };
 
+void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			     unsigned long archid, unsigned long impid,
+			     unsigned int stage);
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index fb1a810f3d8c..e2ecd01bfac7 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -11,6 +11,11 @@
 #include <asm/hwcap.h>
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
index 6b75788c18e6..b0345992a35e 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -45,6 +45,11 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 
 	cpu_mfr_info->feature_probe_func = NULL;
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
