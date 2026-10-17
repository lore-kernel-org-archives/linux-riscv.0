Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83966CCF2C3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Mime-Version:From:Date:Subject:
	In-Reply-To:References:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2TRWwrP7d3k24YAmrF30PmcYAiuoZ18I+d9nB0ay1A=; b=ObqePbhvPuBGB0
	y8XQLGjqwiodxwl4o1e0dNOUQ7tAWsy8PYc5hyXPdPGjzWvPQgrdB4BMU8/jhUwS2Il9zYjFqNrUf
	ISQDOWUNssiZtnL9/VgG5zt4fZJ2pFf+wTNSO3DdO4RuiJN88/3+Ibv33duq2SaXdrfvAgYuxtrlg
	QCKlrV3Lc/ifXaUjOGtfFQyxbRBQW14HFoK41fn53/B4Ysxh7F+DPoa2od5QEbbQ+jE58oDkiQ2Ov
	83ZkD8Gv37zm6zHKcbndy1qYxWD9HLktRMzR2BdI75MVBBqoaVVS0yYSW5IBOe6wPzr644JXJf21T
	vqjeMd0WJqG+8AMSF1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp9-00000004ZgI-1uEm;
	Sat, 17 Oct 2026 08:31:27 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzoz-00000004ZdO-3kZg
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225872; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JHCPvt05SYRCP6T4InNe5T1Y6n0IiHKnFzQeKq0BIDg=;
 b=Y/i/MH8gRwsfdRl5RT+TjvFumgHUXYJRXvPSMlCw6Ws1IQG7QQiHQ9jV+4Br9EP+T7TYkr
 LXnTpaA/hSuZt2XiHceyVcIbi4jPXADBCcVGjno9uZn6xiQPXcVb0rBB8QUpxFdKdJZN0V
 uOFKVuB3kqGBerQwI4cC+usLnZW97Tl5JCUDZ4Ot0uin5jG4x3Z1NI6KgDMykLcXstqEqA
 I1ZqZc6aGzCfxP0T8Bd0J46g7ugg3+EKA2MZYwSnHlwdvyUewi+9Om4sAwmqW3lbPA6BSf
 slDC95oAB1OQJ8WssWTgIE4h0yUDZffsHjGwEr7oXLQHMpB2kSiQCsqCuAkTqA==
Message-Id: <20261017083100.40157-4-yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.54.0
References: <20261017083100.40157-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
Subject: [PATCH v5 3/5] riscv: errata: Add init framework for picoheart errata
Date: Sat, 17 Oct 2026 16:30:58 +0800
From: "Yicong Yang" <yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad3324f+7470fd+lists.infradead.org+yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:10 +0800
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013120_430597_30E5A296 
X-CRM114-Status: GOOD (  15.21  )
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

Add init framework for handling upcoming picoheart erratas.

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
index 622ade116a2d..d532f0d4e426 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -169,4 +169,14 @@ config ERRATA_THEAD_GHOSTWRITE
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_PICOHEART
+	bool "Picoheart errata"
+	depends on RISCV_ALTERNATIVE && 64BIT
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
index 8407d1d535b8..57298f21bb70 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -57,6 +57,9 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			     unsigned long archid, unsigned long impid,
 			     unsigned int stage);
+void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				 unsigned long archid, unsigned long impid,
+				 unsigned int stage);
 
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index c62a82f60468..f67df1ffcc56 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -27,4 +27,8 @@
 #define	ERRATA_MIPS_NUMBER 1
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
index c0c9306022c5..44c62932fb27 100644
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
