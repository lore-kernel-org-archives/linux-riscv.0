Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DFDC88E73
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:To:References:Mime-Version:
	Message-Id:Subject:Cc:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1sBI7EX+lW8U+5wCBJWlTwD3tUf6dv7Z49nRn6+dWU=; b=aYGbfKJC4fe2Fg
	402SYqYebDOVFy/PAAphMY0JR1BCKKWv9qHb7Vi2CMNMhHqtcc52vFLIxPQ8TmjkGxSOZqT8E72Ic
	ggmOBWG4CXMBQ218mmkd4VrqlAHZy49ShNyig32GNuaVxgCbSXdMobsOCRy6fHJcf5vDGdqabJnvi
	N3rHeztLHv7R1nPCZj7HasnPxjZd0JAv/ozTPhDuX0ateFvBCI6GDX/Y9/4CrsH0F07Qt4MiJz8Ee
	oi1OVbXzW38LqnX+yN7KDwPpNduZiC/sFoQAkLWgeu5OVGVW9r+pkvjZtgRlMX7bkS2XtnxwcZ0Rt
	tSoHkkIxlJx9uccgQxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OdM-00000005dK2-06de;
	Tue, 15 Sep 2026 08:35:20 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OdI-00000005dJD-3vGr
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 08:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1789461208; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4Wjx1mLKTmH9Bq0WDa6czirGaRvt1TVbO0E3hVvpQHQ=;
 b=HiQGFslWT056RG5m5SREO+UbABkKm62IRdn+XN3OI6LkzpeTTO7hxpluo5JKToBF4gU6MF
 2ymnA4dMYXcEvSaFQ6bMDXbqb089sUgfJOAF4tSJmnhBHouSgWsHIyina5f0Rp3BWMTWDj
 fKtbmlFkALv1Jp6gR2VZWv2QehHPgGBBPWoodhOuibUuEnkebfQW8h5ssw6ahpSs4RUZ2J
 Uqn/w87L86rXzDTqu8j+RqrPgVUFLS1TNPKCAkdGUFsUrw7riy1a4Uni6EOaIY5AGTRi1s
 aZB3Wvgg8ONOta+Ad3sJ7wNok5LOh48RogvihzQKPN6m79FefR8yPJks7uO5yA==
In-Reply-To: <20260915083305.81913-1-yang.yicong@picoheart.com>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Subject: [PATCH v4 5/5] riscv: errata: picoheart: Add workaround for AMOCASQ errata
X-Lms-Return-Path: <lba+26aa902d3+c2fab7+lists.infradead.org+yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.120]) by smtp.feishu.cn with ESMTPS; Tue, 15 Sep 2026 16:33:22 +0800
Message-Id: <20260915083305.81913-6-yang.yicong@picoheart.com>
Mime-Version: 1.0
References: <20260915083305.81913-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Tue, 15 Sep 2026 16:33:05 +0800
X-Mailer: git-send-email 2.50.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_013517_664528_44B853F9 
X-CRM114-Status: GOOD (  12.51  )
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

Some Picoheart CPUs implement Zacas extension but lack support
for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
facto unavailable. Since currently no ways to retrieve the PMA
information and the riscv kernel will declare cmpxchg128 support
if platform declare support of Zacas, the use of cmpxchg128 will
lead to PMA violation and crash the kernel. Add the errata
workaround to disable the use of cmpxchg128 on the affected CPUs.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig.errata                    | 12 +++++++++
 arch/riscv/errata/picoheart/errata.c         | 28 +++++++++++++++++++-
 arch/riscv/include/asm/cmpxchg.h             | 21 ++++++++++++++-
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 4 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 8ce5c0314321..16e37391d596 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -176,4 +176,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
 
 	   If you don't know what to do here, say "Y".
 
+config ERRATA_PICOHEART_AMOCASQ
+	bool "Apply Picoheart AMOCASQ errata"
+	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
+	default y
+	help
+	  Some Picoheart CPUs implement the Zacas extension but lack support
+	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
+	  unavailable. Enable this errata workaround to disable the use of
+	  CASQ in the kernel (cmpxchg128).
+
+	  If you don't know what to do here, say "Y".
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
index 21480d19c084..bb0e0ce5c0c9 100644
--- a/arch/riscv/errata/picoheart/errata.c
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -174,11 +174,37 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
 	static_branch_enable(&has_picoheart_cbo_clean_errata);
 }
 
+static bool picoheart_errata_probe_amocasq(unsigned int stage,
+					   unsigned long archid,
+					   unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
+	    !riscv_isa_extension_available(NULL, ZACAS))
+		return false;
+
+	if (archid != 0x804a555049544552 || impid != 0x100)
+		return false;
+
+	return true;
+}
+
 static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
 				  unsigned long impid)
 {
+	u32 cpu_req_errata = 0;
+
 	picoheart_errata_probe_cbo_clean(stage, archid, impid);
-	return 0;
+
+	if (picoheart_errata_probe_amocasq(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_PICOHEART_AMOCASQ);
+
+	return cpu_req_errata;
 }
 
 void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 662e160b0522..7e7a642e8729 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -329,7 +329,26 @@
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
 
-#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+#define system_has_cmpxchg128 system_has_cmpxchg128
+static __always_inline bool system_has_cmpxchg128(void)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return riscv_isa_extension_available(NULL, ZACAS);
+
+	/* The vendor erratum overrides the standard Zacas alternative. */
+	asm goto(ALTERNATIVE_2(
+			"nop",
+			"j %l[l_yes]",
+			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
+			"nop",
+			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
+			CONFIG_ERRATA_PICOHEART_AMOCASQ)
+		: : : : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
 
 union __u128_halves {
 	u128 full;
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index 958e4f4624f7..dd7d01e2d117 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -27,7 +27,8 @@
 #endif
 
 #ifdef CONFIG_ERRATA_PICOHEART
-#define ERRATA_PICOHEART_NUMBER	0
+#define ERRATA_PICOHEART_AMOCASQ	0
+#define ERRATA_PICOHEART_NUMBER		1
 #endif
 
 #endif /* ASM_ERRATA_LIST_VENDORS_H */
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
