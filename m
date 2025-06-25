Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11957C83026
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRJDNYGPD/i3bVGifA0EAGUsdkbxivcz39TbnMe5QJ0=; b=mRNOJqfsXAFv6y
	/FWanTRsh+bdkpEYExHq1SY1QkLDUeQrBv0JywbHhEAkoHrotG4JsUQObppCJhxkTVy+G/JDg1jst
	mF+nDM2/IGD6C7MP+CjIlxYVhTCnTZ43S8US6duPoHBkEn0yYFVlN7AV8yBF/p9YRvH+kA6j8jhuD
	QKNxPoBq/X2KgNKqDhFgQlyOub/Z8ykIDdsT5bnaAo5EZxN51zOlH7ZBUBt8matbP1/yewx1KjeNs
	cdIqJXQQqLXyhzLwYqJ5DqUNoKM/UC3AdT7KJI0PqkcFmqJU2e/3F4XxBQ1GuZTlOaQYzreSIkfYB
	6gHgp30qEH3bnBCgY6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrl-00000009ZKI-1PmM;
	Wed, 25 Jun 2025 18:29:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQzl-00000008wX3-0lUT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61ABDA52AC3;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 992DCC4CEF5;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=9/w0s/AcGaLZDmP6rWTTjg/6zkeEgbPdsIflpQ6oanA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e7aZOUARc1frPkmKfagHGLCYTy3tPMQdQQDI+w/lAp9DynbrZw3Zu5uemFrsY6Esr
	 CrNaBA72KxpGpWLkOmVdYVtbgOBj2IGiH2BnSwk0/GKVv/2kqK5+3G/OmeO7Pf8+/u
	 ai0Fdwe88avpsX+x9Ln2m3ItJAFwylGtJfTgNq4PPQ7MC6AYXisIrQBOiGvnzMFfI5
	 Nk27QuGKaBNxM01loTxWBcu9OVxrVu81qhbwWMfS4JFsg3fi5+fk18HT7HLNNrOL+S
	 2MbckYw2CKVR6/sHz2lLAXp71VYY2+oR8gQTypAUhdBl36arkOtcXXyknCUdqoSWIY
	 QOWWtlRGSoOVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B96C7EE33;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:57 +0200
Subject: [PATCH v4 2/7] riscv: Add xmipsexectl as a vendor extension
MIME-Version: 1.0
Message-Id: <20250625-p8700-pause-v4-2-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=5238;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=idU65tzeIlPrlIohcZNq9ktJdzyHclYmJbVJ2jCsPDc=;
 b=kO8mk5hvK45YHZ9X0kMzHOWgOPjhwHEqgpLRpKkIBTkcoqrd7zNTg6y6OhQE5GZL2eta/yfJ3
 OztvXZ7CAAoBNl8EU1u+SK5GUzcENCVAIkFvVXUwFyZyaIx3FeXY9hj
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072101_411404_FF53BD9A 
X-CRM114-Status: GOOD (  15.95  )
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
---
 arch/riscv/Kconfig.vendor                       | 13 +++++++++++++
 arch/riscv/include/asm/vendor_extensions/mips.h | 16 ++++++++++++++++
 arch/riscv/kernel/vendor_extensions.c           | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile    |  1 +
 arch/riscv/kernel/vendor_extensions/mips.c      | 22 ++++++++++++++++++++++
 5 files changed, 62 insertions(+)

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
index 0000000000000000000000000000000000000000..757c941cfd86e9fced6169b1a82200e6bb5c6132
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/mips.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
+
+#include <asm/vendor_extensions.h>
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XMIPSEXECTL	0
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
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
