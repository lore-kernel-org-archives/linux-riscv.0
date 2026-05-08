Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC685CD37AA
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7IGgye8v5VFYO3+q5yqaGSa3MFf6asOPIWWKYba6pY=; b=DQiSoN/AE+ohZm
	Rmp8itmsb2GDxdfa9s3/Hz1Twa0hDz3ijgg6iMvWwrwduq8AiXJ5wxT3LACKU0k322I9O48FKrrpx
	6gf+Nao4EIj+LUPbkxdx3gVgz/HCh9UDoImi959RoqtaBTbwnU8/zuOHO2iaK7hjxRFQUNh2z5rmj
	rswAlt2vlTZnuu2m2VxwrwyXF/t9D4TcYv65EVuG327vDHlv5yJpJhGpdiIIkQY1j1DyF8t5iFTcm
	FGJBtTQ49KQ7WY1QF8mgl+bJAI3L9ubEn7ICHaRJd5fz0IIlq1pfFdLVE7JCo6i3oSrTgypTq7rmi
	SHOh1scptHgNKfERZNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRv-00000005yiL-3sEV;
	Fri, 08 May 2026 08:20:43 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGRs-00000005yfH-39WB
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 08:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778228435; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=DJjZjMBaJYjkF31HlOdl7z3vyeK8rjsgXy5CRpGf2GE=;
	b=rdJW3dwhjv7GZs8+ZuV63RDeJlShiFAgYY8PSr3LB7kCIcSyGpI235JaLYCA+G99uj6O0rBM3DJnlu5OUEIpB2ou32tSIb36RMK6AUVTMMkDYJpVK/CkE7aCf5NiJAd/7OabjLlCj6585RRZedlt/WGP8S/evOsFGjwuTACUhXk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X2WlMBj_1778228429;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2WlMBj_1778228429 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 16:20:31 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	lenb@kernel.org,
	saket.dumbre@intel.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH 2/3] riscv: Introduce HEST HEE notification handlers for APEI
Date: Fri,  8 May 2026 16:20:19 +0800
Message-ID: <20260508082020.3368109-3-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
References: <20260508082020.3368109-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012041_177529_A1EAB1AF 
X-CRM114-Status: GOOD (  15.77  )
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
 arch/riscv/include/asm/fixmap.h |  3 ++
 drivers/acpi/apei/Kconfig       | 12 ++++++
 drivers/acpi/apei/ghes.c        | 68 ++++++++++++++++++++++++++++++++-
 include/acpi/ghes.h             |  6 +++
 4 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index e874fd952286..9b3d5bbfda24 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -45,6 +45,9 @@ enum fixed_addresses {
 	FIX_APEI_GHES_SSE_LOW_PRIORITY,
 	FIX_APEI_GHES_SSE_HIGH_PRIORITY,
 #endif /* CONFIG_RISCV_SBI_SSE */
+#ifdef CONFIG_ACPI_APEI_HEE
+	FIX_APEI_GHES_HEE,
+#endif /* CONFIG_ACPI_APEI_HEE */
 #endif /* CONFIG_ACPI_APEI_GHES */
 	__end_of_permanent_fixed_addresses,
 	/*
diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 895a843d0e36..ff487ab28a65 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -51,6 +51,18 @@ config ACPI_APEI_SSE
 	depends on RISCV && RISCV_SBI_SSE && ACPI_APEI_GHES
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
index f228640d3f25..e0a5db80e554 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -125,7 +125,8 @@ static inline bool is_hest_sync_notify(struct ghes *ghes)
 {
 	u8 notify_type = ghes->generic->notify.type;
 
-	return notify_type == ACPI_HEST_NOTIFY_SEA;
+	return notify_type == ACPI_HEST_NOTIFY_SEA ||
+		   notify_type == ACPI_HEST_NOTIFY_HEE;
 }
 
 /*
@@ -1404,7 +1405,8 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
-#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA)
+#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA) || \
+	defined(CONFIG_ACPI_APEI_HEE)
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 				       enum fixed_addresses fixmap_idx)
 {
@@ -1540,6 +1542,53 @@ static inline int ghes_sea_add(struct ghes *ghes) { return -EINVAL; }
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
+static int ghes_hee_add(struct ghes *ghes)
+{
+	int rc;
+
+	rc = ghes_map_error_status(ghes);
+	if (rc)
+		return rc;
+
+	mutex_lock(&ghes_list_mutex);
+	list_add_rcu(&ghes->list, &ghes_hee);
+	mutex_unlock(&ghes_list_mutex);
+
+	return 0;
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
@@ -1754,6 +1803,13 @@ static int ghes_probe(struct platform_device *ghes_dev)
 			goto err;
 		}
 		break;
+	case ACPI_HEST_NOTIFY_HEE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_HEE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d notified via HEE is not supported\n",
+				generic->header.source_id);
+			goto err;
+		}
+		break;
 	case ACPI_HEST_NOTIFY_NMI:
 		if (!IS_ENABLED(CONFIG_HAVE_ACPI_APEI_NMI)) {
 			pr_warn(GHES_PFX "Generic hardware error source: %d notified via NMI interrupt is not supported!\n",
@@ -1837,6 +1893,11 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		if (rc)
 			goto err;
 		break;
+	case ACPI_HEST_NOTIFY_HEE:
+		rc = ghes_hee_add(ghes);
+		if (rc)
+			goto err;
+		break;
 	case ACPI_HEST_NOTIFY_NMI:
 		rc = ghes_nmi_add(ghes);
 		if (rc)
@@ -1917,6 +1978,9 @@ static void ghes_remove(struct platform_device *ghes_dev)
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
index 8d7e5caef3f1..bf4f6077ca39 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -140,6 +140,12 @@ int ghes_notify_sea(void);
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
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
