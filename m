Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B7CC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To:
	Mime-Version:Message-Id:Subject:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fjZM0AU/vUg9nIIDH6fzAI3TYBnr57fwJXZeL/OSyys=; b=hSGYzdRkT9fzNy2Lh3cwP+MGxF
	uSmmYy5qsO9427Kiknr0/gKNkS62sOwfKE7WgJaNbvi8Q+brRL/RQ17qqMf8hOq+c2UpsafL81Pni
	uwm87Yh3zm+EbDHf4oq6QMH24gXaBiXJfdWDDpd7KGwa5vabZBjLLy9oDaikpsTtr64G9AyfRw9Pu
	OH9vJykzTM3VlhgDryFn8TbThTG2+PwY34PWYLyGmvmVi0wsZCFw3rRuPke7Diq0Ymb4wS5Dq9Ugp
	UsFMk8gYsphX8HsCn6+Pd6AMdnmoK1iInMvyQUfH81t30nP6I/X8ud2Jnt/WUSOQjhjl0r6IAurwR
	Ib+hCnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp9-00000004ZgR-3zxB;
	Sat, 17 Oct 2026 08:31:27 +0000
Received: from va-2-40.ptr.blmpb.com ([209.127.231.40])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp3-00000004ZeN-2eAB
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225877; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=qohcw7+Uax0UiVi9RrrrxWJLpa9atuev4bGq2oXaoUk=;
 b=i+AA5Nepm8KhNAGeQHhAz7N6MzZLgm5646ZLHk5/A571KNs6qHATv/qDSX72SKyB3Ey0gW
 YAFgBmT2giTTl/KCSx18iOXIIaU6efW1+9HUgWItHwU2I3BlUx0UEu7NMmWA4OCYrKuiVO
 4pxhM4xjX6TjxjX3Akpsr5CjXMhLRCVzs8uILgkaGRY+zZtcreaMHo+J0WgdGtbARjutyy
 YhPoKyHFOtIDNX1ugw3vG3+ZK5RBIW7DMBIEglTW05AZqJtZCAVdWHtkX7BhfN9QaZxlxI
 W75yD5uGgZ07GxwPx9k1cKUiXDaryIYejAK37vinW4NU+Hglyu8Wm5rbzqdfjQ==
X-Mailer: git-send-email 2.54.0
Date: Sat, 17 Oct 2026 16:31:00 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v5 5/5] riscv: errata: picoheart: Add workaround for AMOCASQ errata
Message-Id: <20261017083100.40157-6-yang.yicong@picoheart.com>
Mime-Version: 1.0
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
References: <20261017083100.40157-1-yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
X-Lms-Return-Path: <lba+26ad33253+fdb888+lists.infradead.org+yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:14 +0800
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013121_834912_BA65E6DA 
X-CRM114-Status: GOOD (  12.55  )
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
 arch/riscv/Kconfig.errata                    | 12 ++++++++++
 arch/riscv/errata/picoheart/errata.c         | 25 +++++++++++++++++++-
 arch/riscv/include/asm/cmpxchg.h             | 21 +++++++++++++++-
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 4 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 76b2301e87e3..836cc174accf 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -192,4 +192,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
 
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
index f67df1ffcc56..b94b27b0e205 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -28,7 +28,8 @@
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
