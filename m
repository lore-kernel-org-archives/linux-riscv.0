Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BD2C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffZY8g/EMKNizf0wAI7oXdy3xJUiOSKweKj7cMoQKvA=; b=wVR672uDPX6Mli
	fTYW/9pq5XnUsGnt/iQHwe2Ac1sm5447b30+W2dFt3ffO13N84UrlW6vYtETPG1X2oGcTSGJrQkaJ
	zsfbll5ikeSCq9RNWjDOcSaL7nAhfAHQ44wyq0mYL5p8BY+pkhQEQO7cHg1yA7BIWyByVKJkOd6po
	YYAludXruzZNYzLA1z2cuL8pV17wEqA8f6YzmUNAhBCuKurxQHihC5ANHPY8rd/tg28GUNtJUoDHN
	DzuKFzyvA7mQ8KDzymy6mMtMq9sYo7i1Ttv37rORjnGIXgmHVXL6h7WHIcYeZ4AX5eAJlzxPf40tb
	oozrBwA0w3f7cJUUZB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruY-00EVAa-T2; Fri, 06 Jan 2023 18:57:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruV-00EV8w-7o
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:57:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1722528wms.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PA5qs7IiZFpuKUQ8u8MawwJdX1cKSabc1XhM5idhWw=;
        b=mVYTKNt7zLsCBRtLC/TAmynaLs5asFmw4QHT6wfkdKMpskw5fQ0nv3zGQ1OTxRBgs2
         /MQBtUp+RiuYqtkZoxhYaCT3lWwGlQCm6eYb8CB/TeJT9qPoXC2Zv8iqBZ7GGC78deNa
         hyUJcCxC07YJDnHljeXNyk7yG0K/OBppwOytc0V1H3qxuEjaaXpZOR+YSQwKbexhuQIl
         5uB7zTK6b1vIr4HQXyKz5DvGbs+zAuTzaI9NUWRhXwnTMkSkeCx3MAq7DVstfiifVDwu
         VAAUqeCNc/pABySQPD3XcXOzOd2KFdP9riCoBsjeGuUnQ4yyAx9d2zu1J7PaLJFwpww/
         zawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PA5qs7IiZFpuKUQ8u8MawwJdX1cKSabc1XhM5idhWw=;
        b=LLS+bY5spbarfv/cTdNVXFJWGAb2WuSO/ZetvPYICylaiBMCMFCbTD/f0Sexf3Iwp7
         tWEedsDrCycXVj/jYKbpbz6Zn/zR7v2Lv4DGaN/vKd28xujlaHyWr7+qTKRcKOYBcM1x
         jmR+RdQX5J7F+p13OdFAtdTgYbm9uIdnSC9xvVZPKbqm23tbCLRKhOMmzM8WJ+D53iVE
         qiPTZXHaBcjjw3vSKhlUys+lj7+gyxMxNiy0ijvyt46kbm20pEd+AjImhCrpIkUmmlRr
         7fi+pZTvNIDW2lqn5DKj2Z5mcreh7o6evEa/9NBKRnaoj2snn5lG+fPzwj7wDfTJK+CP
         VcMw==
X-Gm-Message-State: AFqh2kq9Am2zCZglSLjqizazk+bhckSrfY6EdZ9xMBkiQcBiB+Uh0yh3
	zsnVuPaAJyVAw/8J/WBo5wI=
X-Google-Smtp-Source: AMrXdXucWVNdIq5ZAXn65xBh2EWwHCQ+TJlYw7nIePD/pKvnN/3oKqsYnrEm2737xBkQaY/LOGeBww==
X-Received: by 2002:a05:600c:18a3:b0:3d1:fcac:3c95 with SMTP id x35-20020a05600c18a300b003d1fcac3c95mr40704599wmp.34.1673031466022;
        Fri, 06 Jan 2023 10:57:46 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:57:45 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v6 3/6] riscv: errata: Add Andes alternative ports
Date: Fri,  6 Jan 2023 18:55:23 +0000
Message-Id: <20230106185526.260163-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105747_307710_315119EA 
X-CRM114-Status: GOOD (  22.56  )
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
 arch/riscv/Kconfig.erratas           | 22 +++++++++
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/andes/Makefile     |  1 +
 arch/riscv/errata/andes/errata.c     | 71 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 ++
 arch/riscv/kernel/alternative.c      |  5 ++
 6 files changed, 103 insertions(+)
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
index 000000000000..d893c0aabd23
--- /dev/null
+++ b/arch/riscv/errata/andes/errata.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Erratas to be applied for Andes CPU cores
+ *
+ *  Copyright (C) 2022 Renesas Electronics Corporation.
+ *
+ * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ */
+
+#include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
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
+	/*
+	 * RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missing and
+	 * cache is controllable only then CMO will be applied to the platform.
+	 */
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
+static void andes_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
+{
+	/*
+	 * In the absence of the I/O Coherency Port, access to certain peripherals
+	 * requires vendor specific DMA handling.
+	 */
+	errata_probe_iocp(stage, archid, impid);
+}
+
+void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+					      unsigned long archid, unsigned long impid,
+					      unsigned int stage)
+{
+	andes_errata_probe(stage, archid, impid);
+
+	/* we have nothing to patch here ATM so just return back */
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
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 6212ea0eed72..d7027a977ee6 100644
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
