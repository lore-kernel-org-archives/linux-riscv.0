Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C60C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:Subject:Cc:
	Mime-Version:In-Reply-To:From:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdUopYSYSVy8QB21ldQZM8NrOzsa25jndz1ZR0yuePs=; b=Gq/cSbdS2P+ohk
	/M4MBAzftI+6Wu3laEyg1hKH+x0M/0Fel8WNtsaUsBxpsOB3pza3bXf9dU931gD5aZlP1QWgcO+cd
	zeAj0IK/qSXg+9BSMUjsWxhoQXG+gcSKCSujVYxl+nu5uRUc8pkCTd6hPETBAuo+ZtAfVWEg2nJq8
	lI1NEv1ACBBBKfV+iOGhx29zodjKl/MEhIYsyblrWEr5w1BJCiuG4X0QtieHQPJU6PM/NdZGQ/RiL
	yx032ShFi+uphIRQab17jpdynpz4wBqjfcV4wRgYLN2ik2pyKoBcKoOZjrz6t2gl12wkE4ozp4wTc
	SdudNYRxIpW15whzq0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOl-00000004s8H-37lx;
	Tue, 28 Jul 2026 09:46:55 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOh-00000004s3x-0dT6
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785232006; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=LDAzfaeamhoaMxk1DOTqYWZXw5cSkGHsmLfWRZlHpvI=;
 b=jiXWn/+4hSXzFHcUK5I0+BALjNk3moLoJAQ+Ajb65sPF8vjmBmB+dkyOs7K8GI9WLd3pKN
 s/Wb9D7LC80y1/1xoVL/wHNl3M+MKAdxMoDclasxeJR4qz0++3qUKH3/3O9mdk8KMh+Z6+
 v4kqnRvsKdZjbmrh2hp48J1zMZ3WGAmpARGerXFzLJwE4cEGqlzzeSslvVjYsgkcG65JP0
 63KJONMocreOO1jsFbauE4tUmqp2wbiqsnm9pwTgalrpSvB6INXmff1XTyMEsgtqk/ve7Z
 N0xCpEDAlJYQeCrj4WXWmmTVdRzSmiP7OLGrDSsARdJ3+Rw5tn3rz5F8wsNx1Q==
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
In-Reply-To: <20260728094627.94975-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 17:46:43 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1
X-Lms-Return-Path: <lba+26a687a84+ea3811+lists.infradead.org+yang.yicong@picoheart.com>
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Subject: [PATCH v2 6/6] riscv: errata: picoheart: Add workaround for AMOCASQ errata
Date: Tue, 28 Jul 2026 17:46:27 +0800
Message-Id: <20260728094627.94975-7-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
References: <20260728094627.94975-1-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024651_290838_60592590 
X-CRM114-Status: GOOD (  14.39  )
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
 arch/riscv/Kconfig.errata            | 12 ++++++++++++
 arch/riscv/errata/picoheart/errata.c | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h     |  2 +-
 arch/riscv/include/asm/cpufeature.h  |  8 ++++++++
 arch/riscv/kernel/cpufeature.c       | 13 ++++++++++++-
 5 files changed, 55 insertions(+), 2 deletions(-)

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
index 21480d19c084..0fb4cb41ab03 100644
--- a/arch/riscv/errata/picoheart/errata.c
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -174,10 +174,32 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
 	static_branch_enable(&has_picoheart_cbo_clean_errata);
 }
 
+static void picoheart_errata_probe_amocasq(unsigned int stage,
+					   unsigned long archid,
+					   unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
+		return;
+
+	if (stage != RISCV_ALTERNATIVES_BOOT)
+		return;
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
+	    !riscv_isa_extension_available(NULL, ZACAS))
+		return;
+
+	if (archid != 0x804a555049544552 || impid != 0x100)
+		return;
+
+	static_branch_disable(&cpus_support_cmpxchg128);
+}
+
 static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
 				  unsigned long impid)
 {
 	picoheart_errata_probe_cbo_clean(stage, archid, impid);
+	picoheart_errata_probe_amocasq(stage, archid, impid);
+
 	return 0;
 }
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 8712cf9c69dc..5d51948116e6 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -320,7 +320,7 @@
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
 
-#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+#define system_has_cmpxchg128	system_has_cmpxchg128
 
 union __u128_halves {
 	u128 full;
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..f9d95cbf5abd 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -164,4 +164,12 @@ static inline bool cpu_supports_indirect_br_lp_instr(void)
 		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
 }
 
+DECLARE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
+
+static inline bool system_has_cmpxchg128(void)
+{
+	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS) &&
+	       static_branch_likely(&cpus_support_cmpxchg128);
+}
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 160809d7268d..45b00100d476 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -46,6 +46,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
 
 u32 thead_vlenb_of;
 
+/* All the CPUs supports cmpxchg128 (CASQ*). */
+DEFINE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -317,6 +320,14 @@ static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zacas_validate(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	static_branch_enable(&cpus_support_cmpxchg128);
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -538,7 +549,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
-	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zacas, RISCV_ISA_EXT_ZACAS, riscv_ext_zacas_validate),
 	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
