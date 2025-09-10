Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2334CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qd7iSvUADHAT7oxdzO+y1VDHSAlHTVOdEbmiYu5S2DA=; b=JOJt4X/L8EFZF1
	es+WB+BLB9Ud/5/lrPnExMSBQuUddhYD5emeixy8kYGHA5PYVKendYLq5UucUqCoGHN6zZzNnQFQZ
	KBFvTNdHv1QcuCGh0lrU9tjwpEVU4Q/DpVj5dfw61o23mygRpxSGTSdYbEZryg30GU0xnfFhvfL6S
	k0NqE/lyltfLvjeLg/frhyR6RSQcyNJU39JXo0C/U8yo1s2E7h/3xOTTpNvHZ7f+BhhBxKffCpAyh
	VxKloefOKS9lqlZSUOo1W07ocYGEivpWkzHO4Xq0xcCUiu0JzIh/q8nEMt6/GEdOQU8n7w07pRHQf
	dNGCQTzF49ep9pLXadnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDS-0000000DF2j-11sj;
	Wed, 10 Sep 2025 09:34:14 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHDP-0000000DF1K-2YXL
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 09:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757496849; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5iaWrlk2P/qazoj+ucrjuJcazBZzpbTMnF2UzUvRWzk=;
	b=s1mLUNjQEKb0C+FsdPPmUJA3TwCYPYTOVJ0mngZvImGogezH51/Y12IL7vRL2AsIcKP5v8GdNgFn5R4jMRjCmLrlVCTjkmFj1But8SiivrUWUHiwT6swjK03MBVB1OkDsID3Qn06i2QmrkX4Mb3RB7wYGWQXIhIyH2nvNpZ96B4=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WnhXsbO_1757496846 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 17:34:08 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: xueshuai@linux.alibaba.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: james.morse@arm.com,
	tony.luck@intel.com,
	cleger@rivosinc.com,
	hchauhan@ventanamicro.com,
	tianruidong@linux.alibaba.com
Subject: [RFC PATCH 4/5] riscv: Introduce HEST HEE notification handlers for APEI
Date: Wed, 10 Sep 2025 17:33:46 +0800
Message-Id: <20250910093347.75822-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
References: <20250910093347.75822-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_023411_962197_DBA000E5 
X-CRM114-Status: GOOD (  14.61  )
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

Add functions to register a ghes entry with HEE, allowing the OS
to receive hardware error notifications from firmware through
standardized ACPI interfaces.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/fixmap.h |  6 ++++
 drivers/acpi/apei/Kconfig       | 12 +++++++
 drivers/acpi/apei/ghes.c        | 58 +++++++++++++++++++++++++++++++++
 include/acpi/ghes.h             |  6 ++++
 5 files changed, 83 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..b085e172b355 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -23,6 +23,7 @@ config RISCV
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+	select HAVE_ACPI_APEI if (ACPI && EFI)
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..07421edc9daa 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -38,6 +38,12 @@ enum fixed_addresses {
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
 
+#ifdef CONFIG_ACPI_APEI_HEE
+	/* Used for GHES mapping from assorted contexts */
+	FIX_APEI_GHES_IRQ,
+	FIX_APEI_GHES_HEE,
+#endif /* CONFIG_ACPI_APEI_GHES */
+
 	__end_of_permanent_fixed_addresses,
 	/*
 	 * Temporary boot-time mappings, used by early_ioremap(),
diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb..d54a295cfc8d 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -46,6 +46,18 @@ config ACPI_APEI_SEA
 	depends on ARM64 && ACPI_APEI_GHES
 	default y
 
+config ACPI_APEI_HEE
+	bool "APEI Hardware Error Exception support"
+	depends on RISCV && ACPI_APEI_GHES
+	default y
+	help
+	  Enable support for RISC-V Hardware Error Exception (HEE) notification
+	  in ACPI Platform Error Interface (APEI). This allows firmware
+	  to report hardware errors through RISC-V exception mechanism.
+
+	  Say Y if you want to support firmware-first error handling
+	  on RISC-V platforms with ACPI.
+
 config ACPI_APEI_MEMORY_FAILURE
 	bool "APEI memory error recovering support"
 	depends on ACPI_APEI && MEMORY_FAILURE
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index a0d54993edb3..1011e28091dc 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -97,6 +97,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#if !defined(CONFIG_X86) && !defined(CONFIG_ARM64)
+#define FIX_APEI_GHES_NMI		__end_of_fixed_addresses
+#define FIX_APEI_GHES_SEA		__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1415,6 +1420,45 @@ static inline void ghes_sea_add(struct ghes *ghes) { }
 static inline void ghes_sea_remove(struct ghes *ghes) { }
 #endif /* CONFIG_ACPI_APEI_SEA */
 
+#ifdef CONFIG_ACPI_APEI_HEE
+static LIST_HEAD(ghes_hee);
+
+/*
+ * Return 0 only if one of the HEE error sources successfully reported an error
+ * record sent from the firmware.
+ */
+int ghes_notify_hee(void)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_hee);
+	int rv;
+
+	raw_spin_lock(&ghes_notify_lock_hee);
+	rv = ghes_in_nmi_spool_from_list(&ghes_hee, FIX_APEI_GHES_HEE);
+	raw_spin_unlock(&ghes_notify_lock_hee);
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(ghes_notify_hee);
+
+static void ghes_hee_add(struct ghes *ghes)
+{
+	mutex_lock(&ghes_list_mutex);
+	list_add_rcu(&ghes->list, &ghes_hee);
+	mutex_unlock(&ghes_list_mutex);
+}
+
+static void ghes_hee_remove(struct ghes *ghes)
+{
+	mutex_lock(&ghes_list_mutex);
+	list_del_rcu(&ghes->list);
+	mutex_unlock(&ghes_list_mutex);
+	synchronize_rcu();
+}
+#else /* CONFIG_ACPI_APEI_HEE */
+static inline void ghes_hee_add(struct ghes *ghes) { }
+static inline void ghes_hee_remove(struct ghes *ghes) { }
+#endif /* CONFIG_ACPI_APEI_HEE */
+
 #ifdef CONFIG_HAVE_ACPI_APEI_NMI
 /*
  * NMI may be triggered on any CPU, so ghes_in_nmi is used for
@@ -1558,6 +1602,14 @@ static int ghes_probe(struct platform_device *ghes_dev)
 			goto err;
 		}
 		break;
+	case ACPI_HEST_NOTIFY_HEE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_HEE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d notified via HEE is not supported\n",
+				generic->header.source_id);
+			rc = -ENOTSUPP;
+			goto err;
+		}
+		break;
 	case ACPI_HEST_NOTIFY_NMI:
 		if (!IS_ENABLED(CONFIG_HAVE_ACPI_APEI_NMI)) {
 			pr_warn(GHES_PFX "Generic hardware error source: %d notified via NMI interrupt is not supported!\n",
@@ -1631,6 +1683,9 @@ static int ghes_probe(struct platform_device *ghes_dev)
 	case ACPI_HEST_NOTIFY_SEA:
 		ghes_sea_add(ghes);
 		break;
+	case ACPI_HEST_NOTIFY_HEE:
+		ghes_hee_add(ghes);
+		break;
 	case ACPI_HEST_NOTIFY_NMI:
 		ghes_nmi_add(ghes);
 		break;
@@ -1698,6 +1753,9 @@ static void ghes_remove(struct platform_device *ghes_dev)
 	case ACPI_HEST_NOTIFY_SEA:
 		ghes_sea_remove(ghes);
 		break;
+	case ACPI_HEST_NOTIFY_HEE:
+		ghes_hee_remove(ghes);
+		break;
 	case ACPI_HEST_NOTIFY_NMI:
 		ghes_nmi_remove(ghes);
 		break;
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index ebd21b05fe6e..8046e1b30c21 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -127,6 +127,12 @@ int ghes_notify_sea(void);
 static inline int ghes_notify_sea(void) { return -ENOENT; }
 #endif
 
+#ifdef CONFIG_ACPI_APEI_HEE
+int ghes_notify_hee(void);
+#else
+static inline int ghes_notify_hee(void) { return -ENOENT; }
+#endif
+
 struct notifier_block;
 extern void ghes_register_report_chain(struct notifier_block *nb);
 extern void ghes_unregister_report_chain(struct notifier_block *nb);
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
