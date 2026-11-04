Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67913606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUfJ2OUJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=T7ebiKZu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:References:Mime-Version:Cc
	:To:In-Reply-To:Message-Id:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eQoRaS69MT7Q+09CMvh4D9TXjQgpJsp+26qAvH6aJy4=; b=IUfJ2OUJO6GRqdLEQ0BGaIM31H
	ZxI7Dv7uqSGEFQbR5KcLpmR6o3vxvzqhkpLuVnAm0eHT3e4Cik0XVyL4Wpd3oIC7O2WGJWOvH+qPM
	JKTkcLEqqj11zQOnaaDpT3/ekhD71ahS4jVcVPexQM8BIcvVP9oNjG+oYAdiRQlkGMnP2wQ/lCj5D
	G4buE2mgAM4+Zp25wCTFMrvhYDyJTQ3SrzvQNk5qs4Iclt6FurINyMaf2q8RmVdcHR2d8geKOpmyD
	1t+UqlQGL2by6WRDMDRI2eLcBfDNsDs0qCxE7VPa4bPtuQejBEBjvE372YHgrIPubqYQQcy1pde9R
	PEJSEiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVs7-00000004cdi-20cz;
	Wed, 04 Nov 2026 07:57:27 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVs4-00000004ccP-2ute
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779040; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=08e8lRo8FSI6l64l9cZpmwvRGaHfKexZD/s3Qb8aXqg=;
 b=T7ebiKZu1CGBefB8ZoTkomUJ4nb1qztNfIt4cTkInQ5uZIioSWmrgsaDB7NfMXLNtDp3N0
 fIUerUyTtLG1Oxk8K/GgLWubrxswiiByeyNmxgqM3ufE0QeE0ERsCgMhr1epQUU18Ogj/b
 NOyZ3SIn2sbpuPZv/zL+iGuG3IKHlLsi8Sceub+jCJ89cUoHE4uQaiXNZXdLMuk/iHiBae
 zl76/Jgm+GM66eGFKtS7eApdxhgooxqP8z0bAsw3uJMqDuL/6QEny4swskqa5iSul+nkGk
 +btFTW4C1mzy+9ZOqmgVOcNbBRwSoLliMlfIylAySYQUlQ53h24z4G8h8VcBxw==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <20261104075706.73657-4-yang.yicong@picoheart.com>
In-Reply-To: <20261104075706.73657-1-yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>, <yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.113]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 15:57:17 +0800
X-Lms-Return-Path: <lba+26aeae55e+d51b20+lists.infradead.org+yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.54.0
Subject: [PATCH v6 3/5] riscv: errata: Add init framework for picoheart errata
Date: Wed,  4 Nov 2026 15:57:04 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235724_809140_39A49DCD 
X-CRM114-Status: GOOD (  16.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add init framework for handling upcoming picoheart erratas.

Tested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig.errata                    | 10 ++++
 arch/riscv/errata/Makefile                   |  1 +
 arch/riscv/errata/picoheart/Makefile         |  5 ++
 arch/riscv/errata/picoheart/errata.c         | 53 ++++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |  3 ++
 arch/riscv/include/asm/errata_list_vendors.h |  4 ++
 arch/riscv/include/asm/vendorid_list.h       |  1 +
 arch/riscv/kernel/alternative.c              |  5 ++
 8 files changed, 82 insertions(+)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..3713e88bb446 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -179,4 +179,14 @@ config ERRATA_THEAD_GHOSTWRITE
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_PICOHEART
+	bool "Picoheart errata"
+	depends on 64BIT
+	help
+	  All Picoheart errata Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all Picoheart errata. Please say "Y"
+	  here if your platform uses Picoheart CPU cores.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 02a7a3335b1d..a36c5ce1ce7b 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_ERRATA_ANDES) += andes/
 obj-$(CONFIG_ERRATA_MIPS) += mips/
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
+obj-$(CONFIG_ERRATA_PICOHEART) += picoheart/
diff --git a/arch/riscv/errata/picoheart/Makefile b/arch/riscv/errata/picoheart/Makefile
new file mode 100644
index 000000000000..6278c389b801
--- /dev/null
+++ b/arch/riscv/errata/picoheart/Makefile
@@ -0,0 +1,5 @@
+ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
+CFLAGS_errata.o := -mcmodel=medany
+endif
+
+obj-y += errata.o
diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
new file mode 100644
index 000000000000..aad0bf5ed7d2
--- /dev/null
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Picoheart (SG) Pte. Ltd.
+ *
+ * Author: Yicong Yang <yang.yicong@picoheart.com>
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/cleanup.h>
+#include <linux/kernel.h>
+#include <linux/memory.h>
+#include <linux/string.h>
+#include <asm/alternative.h>
+#include <asm/errata_list.h>
+#include <asm/text-patching.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendorid_list.h>
+
+static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
+				  unsigned long impid)
+{
+	return 0;
+}
+
+void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				 unsigned long archid, unsigned long impid,
+				 unsigned int stage)
+{
+	u32 cpu_req_errata = picoheart_errata_probe(stage, archid, impid);
+	struct alt_entry *alt;
+	void *oldptr, *altptr;
+	u32 tmp;
+
+	BUILD_BUG_ON(ERRATA_PICOHEART_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != PICOHEART_VENDOR_ID ||
+		    alt->patch_id >= ERRATA_PICOHEART_NUMBER)
+			continue;
+
+		tmp = (1U << alt->patch_id);
+		if (cpu_req_errata & tmp) {
+			oldptr = ALT_OLD_PTR(alt);
+			altptr = ALT_ALT_PTR(alt);
+
+			guard(mutex)(&text_mutex);
+			patch_text_nosync(oldptr, altptr, alt->alt_len);
+		}
+	}
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6be7b2b6ade9..b727e74606bf 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -55,6 +55,9 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			     unsigned long archid, unsigned long impid,
 			     unsigned int stage);
+void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				 unsigned long archid, unsigned long impid,
+				 unsigned int stage);
 
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index 02b5ab0d23a8..8160afed8d21 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -28,4 +28,8 @@
 #define ERRATA_MIPS_NUMBER 2
 #endif
 
+#ifdef CONFIG_ERRATA_PICOHEART
+#define ERRATA_PICOHEART_NUMBER	0
+#endif
+
 #endif /* ASM_ERRATA_LIST_VENDORS_H */
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 7f5030ee1fcf..1ea6d00eb61a 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -10,5 +10,6 @@
 #define MIPS_VENDOR_ID		0x127
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
+#define PICOHEART_VENDOR_ID     0x77d
 
 #endif
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index bbb215349452..d9e0e963237c 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -61,6 +61,11 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
 		break;
+#endif
+#ifdef CONFIG_ERRATA_PICOHEART
+	case PICOHEART_VENDOR_ID:
+		cpu_mfr_info->patch_func = picoheart_errata_patch_func;
+		break;
 #endif
 	default:
 		cpu_mfr_info->patch_func = NULL;
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
