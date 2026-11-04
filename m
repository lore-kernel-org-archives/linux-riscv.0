Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3B606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jbkh/1T1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=J/KPIoap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:Cc:In-Reply-To:Mime-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=sCMHhitXnWG71YGbT8oMiR2Q0SgvxpiefW1mmIhX2m0=; b=Jbkh/1T1D1UouAqpB8NptovacD
	9dQMmasm2cKFDLI361wm/NCocnfFWAXlRav0DOQqbNIQCH9s7vWY2uJiZLw0bgHC0nIWeqhngqQA/
	4omX93S5F+b4v/7NXkvC6JazDHHpiAUa4txDoa6cv0FnOzPgq88NrBxO8xTE8EZoawkChhIEass+d
	ZBDA72S3+ZRHxet/cBVT2eQZ7vocWyJKQogyuNwoLpiQjafYBU0LxkJSswneF51ezi2O/OwzcwEuX
	aZkJ2cZTsAvHBvAX7esxG0Cd3jrmNA8MNBO8vzvfSBVslhkwXfleIh7X2mvRlqCcoFFUn3GHJajjV
	yKHC6rmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVsF-00000004cgu-3NxI;
	Wed, 04 Nov 2026 07:57:35 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVsC-00000004cf7-0lb2
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779046; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=A5s9seOm8RDxpahgqLuwrvstI6MmFOug3w6IEiWSP9g=;
 b=J/KPIoapnw189509e/nasbTFI5zS/aOyQS+O6uTleRCsxAWws6vMGJ+pfoRoBd6632F9oj
 u/yc0nh4+DITMBlMbK8+HZrPLsfVooMPlhkn5NY5xC0xCK44YqeuZK2HAT+mhm8rAA07S0
 WNxzI+puc3j6qdKVwi2jvvVg5bPA4olcxfDa+bslHz2cS3V1CMzNIjBlXuHqX9WlZBvFzz
 VltWYikBsiG08/OzSjHC6Wj/uVKmX6fhJZtQiM3zdkq1dAr6EWwpkhZAv9WWQYaaWjA2h4
 4hARH+JzGzsKS7Ku6bu0Ezko3YmTfSGwAAgaulv77UsVzRpXToMF7rzIom3a1g==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aeae564+e74832+lists.infradead.org+yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.113]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 15:57:22 +0800
In-Reply-To: <20261104075706.73657-1-yang.yicong@picoheart.com>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>, <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v6 5/5] riscv: errata: picoheart: Add workaround for AMOCASQ errata
Date: Wed,  4 Nov 2026 15:57:06 +0800
Message-Id: <20261104075706.73657-6-yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.54.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235732_298285_D8961A6B 
X-CRM114-Status: GOOD (  12.86  )
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some Picoheart CPUs implement Zacas extension but lack support
for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
facto unavailable. Since currently no ways to retrieve the PMA
information and the riscv kernel will declare cmpxchg128 support
if platform declare support of Zacas, the use of cmpxchg128 will
lead to PMA violation and crash the kernel. Add the errata
workaround to disable the use of cmpxchg128 on the affected CPUs.

Tested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig.errata                    | 12 ++++++++++
 arch/riscv/errata/picoheart/errata.c         | 25 +++++++++++++++++++-
 arch/riscv/include/asm/cmpxchg.h             | 18 +++++++++++++-
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index c75dec4b0ba7..4e6516ba3a42 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -202,4 +202,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
 
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
index c945ae694396..a658f38cf4de 100644
--- a/arch/riscv/errata/picoheart/errata.c
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -174,11 +174,34 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
 	static_branch_enable(&has_picoheart_cbo_clean_errata);
 }
 
+static bool picoheart_errata_probe_amocasq(unsigned int stage,
+					   unsigned long archid,
+					   unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
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
index 662e160b0522..0488b9314c13 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -329,7 +329,23 @@
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
 
-#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+#define system_has_cmpxchg128 system_has_cmpxchg128
+static __always_inline bool system_has_cmpxchg128(void)
+{
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
index 8160afed8d21..97b7bbdc4984 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -29,7 +29,8 @@
 #endif
 
 #ifdef CONFIG_ERRATA_PICOHEART
-#define ERRATA_PICOHEART_NUMBER	0
+#define ERRATA_PICOHEART_AMOCASQ	0
+#define ERRATA_PICOHEART_NUMBER		1
 #endif
 
 #endif /* ASM_ERRATA_LIST_VENDORS_H */
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
