Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E6C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:Mime-Version:Date:
	To:Message-Id:References:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puP+VsvsLbgWqfSWOEmEdE0jbxlr2SH7uPxlqIEFQuk=; b=2tRxoPycbJVmSQ
	4UHTbyq0d1VMbv93Y237yUTEFfyww/BGXqpyV/nStwNHNHYdYk1ldJ21b+IGzZpafLE4MqKuJam2S
	GaaGoChjOdXQXC6t5qbu31/VkgePnGnDg6p0rGKkMmzgAnH/KEy0Jrki02JXvSyneG0/M4A/3tSFK
	KSSf8Rh8z9/ZEb8Cii+dAZ2vzoy03t6z4ID18QWUqlEvQ6nCtMYNT8pzZiilkUbQjCP0ardJmZqRM
	/mrcURq6NfF33gBNANEO7/7nmKwM8eFCDyDxJ7Mcgv8e+eB3gYeQ7jeWaK18l+skAXt2z77FkDNMS
	cY3fkQeozAh3FBktKjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHN-0000000ECBR-1a08;
	Wed, 15 Jul 2026 08:47:45 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHI-0000000EC9P-3Vth
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 08:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784105252; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=hLRBZM7tc2CgwhQ8AHI6U2yjOGZ4LFB+3E24X3fezuU=;
 b=Y6+/rlV5NO1WVJi7JF/CrH0AUnRnh1Mpgy4N8gdVjDYe/KK91KCHL4ogNdSuvFvk6Yxx5h
 chANIyymL3BraK6RnAh6vYOOCEzHARucbRmF4jXWkz01FA23pHLc0A4PHuSz49TkWsjFrI
 gLzIo0EazvGkiReMmHdSaJwNbufRQfV6Zt7eyiFbWp7qCiPyapl3dlCX8ev2rxD39FeaCm
 82wvz8h2JBWW0271EaXhVBJiEqBeLa99cCxEMIWlFYLaAfbQ0AgAGDybHvMWeQgUd3womu
 K+dZu6DjYpBFBt6cqFI+Rx2rgj/ywLevWp1h/B6o/jBfNtwnlAre3WYUbmh4Gw==
Cc: <geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<yang.yicong@picoheart.com>, <cuiyunhui@bytedance.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
References: <20260715084724.26578-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26a574922+61d88b+lists.infradead.org+yang.yicong@picoheart.com>
Message-Id: <20260715084724.26578-2-yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Date: Wed, 15 Jul 2026 16:47:22 +0800
Mime-Version: 1.0
Subject: [PATCH v1 1/3] riscv: errata: Add init framework for picoheart errata
In-Reply-To: <20260715084724.26578-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.112]) by smtp.feishu.cn with ESMTPS; Wed, 15 Jul 2026 16:47:29 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014740_966095_39D038D1 
X-CRM114-Status: GOOD (  16.21  )
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
 arch/riscv/errata/picoheart/errata.c         | 57 ++++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |  3 ++
 arch/riscv/include/asm/errata_list_vendors.h |  4 ++
 arch/riscv/include/asm/vendorid_list.h       |  1 +
 arch/riscv/kernel/alternative.c              |  5 ++
 8 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..374d7fcf7936 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -154,4 +154,14 @@ config ERRATA_THEAD_GHOSTWRITE
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_PICOHEART
+	bool "Picoheart errata"
+	depends on RISCV_ALTERNATIVE
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
index 000000000000..53b690878f78
--- /dev/null
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -0,0 +1,57 @@
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
+			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT) {
+				memcpy(oldptr, altptr, alt->alt_len);
+			} else {
+				guard(mutex)(&text_mutex);
+				patch_text_nosync(oldptr, altptr, alt->alt_len);
+			}
+		}
+	}
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		local_flush_icache_all();
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
index ec7eba373437..958e4f4624f7 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -26,4 +26,8 @@
 #define	ERRATA_MIPS_NUMBER 1
 #endif
 
+#ifdef CONFIG_ERRATA_PICOHEART
+#define ERRATA_PICOHEART_NUMBER	0
+#endif
+
 #endif /* ASM_ERRATA_LIST_VENDORS_H */
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index beaf9236dba7..dba770b8503c 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -10,6 +10,7 @@
 #define MIPS_VENDOR_ID		0x127
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
+#define PICOHEART_VENDOR_ID     0x77d
 
 #define QEMU_VIRT_VENDOR_ID		0x000
 #define QEMU_VIRT_IMPL_ID		0x000
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 104dc0862c5c..88639918ee7d 100644
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
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
