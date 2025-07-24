Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098AEC87FCE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd9GZNhnvzGUNcbjE0uWlnfaKF7YS3W83nOPYo4LNqI=; b=u0FR+IaxFkDQsI
	gK/woa/sl9/VK82Pm4pV+edGvnOyCOQr1//aOxzGJ+A34bc/5/IV+Wj+JxoeeOckr2kU+MCDmJGR5
	yaADYdR+uus+xOzaU2SFCwf5f5yNlLwsRLvpl9I8DgXu8O0EeFCv+t2xuVSi2U60YUzu+7XwlctR5
	ZqUU0fmSiqCscKMMGVeCIvTaDWZRCnnxBR645Lby56GrnxtjDBaNYqcRtsH82RI4e10PbiGaLzTyA
	5GF35Kfr5SQVujnIc5/0hrsVYD3MhpddHweYiSVB7E/2As7oMu9WTiRa0LCU52LdAvUq+UGaB/PMV
	5OpBW4j9C5fQrTvz7AzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezVY-000000086Db-2ffy;
	Thu, 24 Jul 2025 17:13:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexnE-00000007pqN-02xl
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8B9FA56523;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55964C4CEF6;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370614;
	bh=SA8CE4M5Qa6UdlIRt+RpmjxjbOkMQl4k3cuHPidEo74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EyXl5iclKzqNdRCfrpy4bK6u4CYzItl/SKxA0Ssg6WgAGF9ZdvewnxtoueIf5BdUd
	 Ut5BbboWCYMP9pu44NzDt12EOEE4cnhZsUoIotX5U5bWr0N88L7u/JS7WI5CGtoeLd
	 RU/6Z7FXd9ioiSV+3aTXr0SmbT8GeXcxvhj17LRP2gn0FG4AZ6SVeR8gw9vXdLqate
	 5Ea3zq2huXzaSJJmdruXssHSBnfTY18vpdtHxbX8XIn454i96ZuXHz4Uwvvy2kwzF6
	 e/RU3Xtln2tOH4+W5I1jirxinz5JpcKBlBIjq9/uvV8Js4d2Ldgp4/pqmpAwBrAXuL
	 p9QpYzhqWHWKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46104C87FCA;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Thu, 24 Jul 2025 17:23:26 +0200
Subject: [PATCH v5 2/7] riscv: Add xmipsexectl as a vendor extension
MIME-Version: 1.0
Message-Id: <20250724-p8700-pause-v5-2-a6cbbe1c3412@htecgroup.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370612; l=5332;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=RxFj25XrnJLQOzustfdJ86PI6vDuIP115iXStW8uyYM=;
 b=QvK85mZsi5D1m7U3zwqGO+C/+3+ktThhG/OxVQ0N8b3RmGHAGKEcFy9PQ4fQCFxtZJQJBfHog
 5zwIkfMb9RfB26/Vp+wDPj7lDDeweR7a1+U+RG7FdILYTpebJ2aJlR7
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082336_214688_E61D2FF6 
X-CRM114-Status: GOOD (  15.64  )
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add support for MIPS vendor extensions. Add support for the xmipsexectl
vendor extension.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig.vendor                       | 13 +++++++++++++
 arch/riscv/include/asm/vendor_extensions/mips.h | 18 ++++++++++++++++++
 arch/riscv/kernel/vendor_extensions.c           | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile    |  1 +
 arch/riscv/kernel/vendor_extensions/mips.c      | 22 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index e14f26368963c178e3271e0f716b27fff7671e78..3c1f92e406c3f21481b56e61229716fd02ab81b2 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "MIPS"
+config RISCV_ISA_VENDOR_EXT_MIPS
+	bool "MIPS vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here to disable detection of and support for all MIPS vendor
+	  extensions. Without this option enabled, MIPS vendor extensions will
+	  not be detected at boot and their presence not reported to userspace.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "SiFive"
 config RISCV_ISA_VENDOR_EXT_SIFIVE
 	bool "SiFive vendor extension support"
diff --git a/arch/riscv/include/asm/vendor_extensions/mips.h b/arch/riscv/include/asm/vendor_extensions/mips.h
new file mode 100644
index 0000000000000000000000000000000000000000..133e55985d827ce7d6057004b590bdcbbdb1ec8c
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/mips.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XMIPSEXECTL	0
+
+#ifndef __ASSEMBLER__
+struct riscv_isa_vendor_ext_data_list;
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
+#endif
+
+#endif // _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 92d8ff81f42c9ceba63bef0170ab134564a24a4e..bb4a7592368560ebacbcd8a5ce335eea6312ea5c 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/mips.h>
 #include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
 
@@ -16,6 +17,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
+	&riscv_isa_vendor_ext_list_mips,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
 	&riscv_isa_vendor_ext_list_sifive,
 #endif
@@ -49,6 +53,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
+	case MIPS_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_mips.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_mips.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
 	case SIFIVE_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_sifive.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index a4eca96d1c8a2fd165220f6439a3884cf90a9593..ccad4ebafb43412e72e654da3bdb9face53b80c6 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
diff --git a/arch/riscv/kernel/vendor_extensions/mips.c b/arch/riscv/kernel/vendor_extensions/mips.c
new file mode 100644
index 0000000000000000000000000000000000000000..f691129f96c21f2ef089124f4b64a6f0a8e6d4aa
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/mips.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/mips.h>
+
+#include <linux/array_size.h>
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+/* All MIPS vendor extensions supported in Linux */
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_mips[] = {
+	__RISCV_ISA_EXT_DATA(xmipsexectl, RISCV_ISA_VENDOR_EXT_XMIPSEXECTL),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_mips),
+	.ext_data = riscv_isa_vendor_ext_mips,
+};

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
