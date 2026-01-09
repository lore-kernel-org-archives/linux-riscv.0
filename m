Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90FED232FC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoommZLhWumnYL8mdvNBXEWXMQJgPs10Pc0WMJi9RVg=; b=Y35VNRLQ/YM084
	Obxdf18FCxzoCbFeg9m5QhYrz8SL74n6+HiOansaTJh1cNg04S8NbrBCKKOl5/M6rfNewvTeu2tGN
	+X4896/8d1d1DKrWilYWjZn+cvgcGeD2JREScpCtGXuU4vKN8/3x+WtMExEDEG4/Nzdno81KLUmzR
	9uQAHQvYfyK/a9mzQvmd7LaoPhFehQIi5//mfZGfGRhbYlr+BbZgJhLJ7Ye/xsVZVsiYpxt4TQ6br
	PacO1u2ida5GBvD4FwqzKLYMqnQWWO72AUaG/PSda+PLKgjE9XcrDZsjJO2tsXzXGEzPDMMY5OaaX
	8YF782NaQsDgis39dBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Oo-00000001xVV-49uF;
	Fri, 09 Jan 2026 09:03:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ol-00000001xS7-3leE
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:03:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098Vr9Q3629791
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ibs2WMFWf8i
	sMVsnKj6F0MrAqbp9ptOr31qv7TtrWfQ=; b=CxJMFgeANbWA3+z1HjSB5VWDvYz
	fs9vDLWnzwlRty/+fHxvtipcPY+7ocykV1+5nStYHGcju7tubY89qejydect3Vz8
	xC7fQbhjlGWG49ikob2QQ9CZRhqLIxSlM7M3vDIIe9VZm3HjJH06uYWeFxMS8Az5
	8rM0PA21E1nuEUhWLrHYCESYFj3jmRFS3jtLViYMx3g9PSyY7wJkNk8SY8ci0RYk
	U/yPK7KHyqbNIokW2W/61mWLrZVgsw3rJpzRjaZX8Oze9s0G8hwhMHywGhDMMLdc
	/uS1i8wDj9d+Jm6OekWqJlg0ubtPv58TlF53k33DUz4V6B5nR2S2yMNeF8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j21ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:03:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so7056548b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949389; x=1768554189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ibs2WMFWf8isMVsnKj6F0MrAqbp9ptOr31qv7TtrWfQ=;
        b=G7MTSjShv5LvkfcnT2JkcZJJ8CWirR7sOnjLTZ9XdwZ25oggPMZEa6h5mywwd9LUAx
         5tUtOM8qalZRrCfJgy7nd4HdpPRo5/FC4jtakv+n/D6kSJY2tlXL48plIrVntK2ZztIU
         dLRFIDIYWgw6RevIep6d1junL/+DKSk5vn81EE0R2HHKw/jGRfbqWulrIWb13yHlmVJZ
         7zo9trKR/H2zMORkCprtuDOJcC0N5aaU+XCc/5ThfqbypoFnDRenkVJ6c70kpj8rysf0
         I+Bi5KXzB6aWF22ngOkQrUWC3PGz6EmfLdX5wfsxlARpUiJdJP8pKB9qWt4a1sULzdRi
         85jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949389; x=1768554189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ibs2WMFWf8isMVsnKj6F0MrAqbp9ptOr31qv7TtrWfQ=;
        b=JqdEsz/YC7oM0hfRiHl9BkK2FjvtozUm0rGNjbUFtmfAGNr0gTWFkHKrfiy/xPbUb+
         iiUT2bQSwRsayaB/KitfdI1koB1dIN+PxoVowx/HAYGz6Dy5vUP75P2OPIfq6E7UBVXl
         cxy8rKoZWXiEYnI0CMrJAN4QM1OKTCxB3vBbMkzeV/IvF8on1O7vzsiNYgyfjmABwRbz
         fn4kWZM9bTfNegaajQA0QBaqU88Vp48QxaGPpnS/Ejj9RGSxmXSgy5Xnuy2lGOTj5cXP
         x/ZDgVeQVT3jBhIxJdR3K9yzyDxL+2qxpYSkADJ8Sa4qX3Pzd8O88cidnKe4i0cc0BE5
         6GHw==
X-Gm-Message-State: AOJu0YwSq+GnJmMl1Crk0sui/f/x74hjbwA45F+qndJ5LmwN3RnYeeU7
	aWMwWiK0Yb87StZvnbolWuIL8gwzFYaEoLigs9iuFZpF9LSZ28y0efiW1RV7GBY3IcNt6cff4j3
	E9N3R2cJjXtqUC0aTJwb3g0BujeWzsyC6plCekPYsqKYlXSsBWPEp1PmRDCZknUivFIhlOU9uBL
	Ol1SU=
X-Gm-Gg: AY/fxX40oQ2SOUB91NSJS0rp4U5AuZQZQsf3PU6uDkUZgph5jSrMHGXV64QZ2iDfSee
	HjyX9GoFwOZ4JCxQtGhEmfYLk4BHvQaWJaiXxIfOBgITrIJ1QY9btnyhS9EXEOPb0uwSyWEeYpw
	gx9RfQ9IMLtSZB9o47s+Ip/anbf2XfYhrTTqnhYIKdloSnpWqakFKfB/x+PS5RhhrNpSWbbH8+h
	92SoQJDhLOXoRuOrcDJxWUmq1nu+0KAnCs9Gzw510+3ltxJfRZxhipFN3suR7jr+Hczm9UWSJJ8
	C29LBxhx8YwNXIXatERtZtO/JR6HeGC7BBhf71/zN+XzJ+RgUJs10DyWlsTeBVgYVTXVGZAt5U5
	8LGT9MJw3RVPMoaSprMwn7hmskiJwvG/p+bxpPvojVrPszhzfQ3XqWsPbe4blnbfa56ElzDCf/W
	WoC3e9F/4fx5Hj0p3LM5IObObXxqHM3D6yTA==
X-Received: by 2002:a05:6a00:4c81:b0:81e:b2ba:5b36 with SMTP id d2e1a72fcca58-81eb2ba5c17mr419406b3a.63.1767949389455;
        Fri, 09 Jan 2026 01:03:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGejI7LmUB/luJhLPwMThP7DUoDGFXiiyakN6fBlGBN6FOHT6qVL/iPto6pXgjtHv9gY8I9Vw==
X-Received: by 2002:a05:6a00:4c81:b0:81e:b2ba:5b36 with SMTP id d2e1a72fcca58-81eb2ba5c17mr419361b3a.63.1767949388939;
        Fri, 09 Jan 2026 01:03:08 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:03:08 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 08/10] riscv: Introduce HEST SSE notification handlers
Date: Fri,  9 Jan 2026 14:32:22 +0530
Message-ID: <20260109090224.3105465-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX49m4nrzPZ68P
 laQDXYlWvF0BYZzLrpd7Dts2QXGgE3Ksivv/QbGE4GXg0qh5aiN+iNYBA19fMRG59Ascq3jGho1
 q7LvkQteFr0LSdHXXbsxe3Yy9R8EqYErXVhzdusaRVutD0WauHjlCurUkKpOzHXEspslrACXl+1
 z9YLY/wtUbxfeRy6Y2HATbLkexlVXjnDL6WpCM4qG8s61W+JWb3VYX4pPX9c8w6BbbutNVZCTR5
 NTsuDF/zNnkUgXf5sq7UA7gTHuSyI7ynfQM3eskBcSvi2Pt+kL7fPmHjigc7NkfOoXug6PPH7zJ
 3Al5hl0dLaSBsFyqKdozHfV6dga9y1VjpGsGoRGY7vxhFQE9W/dKuYKUtdmBmlVZE0zHO44jwft
 JsQ34/fcE81rdT5waOflNyMDJNkSaYGNNOGmTYPnN+ymF43z0o2mTaBHk7S7j+GOe4PS/DyvYPh
 y7sFHx4mH4m6mLuUn3A==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960c44e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=Eu4eB5ymJzOrEwSPfFIA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ejA4NvQrC39t0KN_9RMlAPNErs44EqMe
X-Proofpoint-ORIG-GUID: ejA4NvQrC39t0KN_9RMlAPNErs44EqMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010312_337961_F0B42B75 
X-CRM114-Status: GOOD (  18.02  )
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

Add config option to enable SSE in APEI. When it is enabled, functions
to register/unregister a ghes entry with SSE are avilable along with
low and high priority event handers. If a SSE notification type is
determined, a ghes common handler to handle an error event is registered.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/acpi/apei/Kconfig |   5 ++
 drivers/acpi/apei/ghes.c  | 100 +++++++++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb..ada95a50805f 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -46,6 +46,11 @@ config ACPI_APEI_SEA
 	depends on ARM64 && ACPI_APEI_GHES
 	default y
 
+config ACPI_APEI_SSE
+	bool
+	depends on RISCV && RISCV_SBI_SSE && ACPI_APEI_GHES
+	default y
+
 config ACPI_APEI_MEMORY_FAILURE
 	bool "APEI memory error recovering support"
 	depends on ACPI_APEI && MEMORY_FAILURE
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 6fd84a1772c6..aa7dcd4069f9 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -17,6 +17,8 @@
  *   Author: Huang Ying <ying.huang@intel.com>
  */
 
+#include <linux/err.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/arm_sdei.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -99,6 +101,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SBI_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1561,6 +1568,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
 	return sdei_unregister_ghes(ghes);
 }
 
+#if defined(CONFIG_ACPI_APEI_SSE)
+/* SSE Handlers */
+static int __ghes_sse_callback(struct ghes *ghes,
+			       enum fixed_addresses fixmap_idx)
+{
+	if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx)) {
+		irq_work_queue(&ghes_proc_irq_work);
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+/* Low priority */
+static int ghes_sse_lo_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_lo);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_lo);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_LOW_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_lo);
+
+	return err;
+}
+
+/* High priority */
+static int ghes_sse_hi_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_hi);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_hi);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_HIGH_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_hi);
+
+	return err;
+}
+
+static int apei_sse_register_ghes(struct ghes *ghes)
+{
+	return sse_register_ghes(ghes, ghes_sse_lo_callback,
+				 ghes_sse_hi_callback);
+}
+
+static int apei_sse_unregister_ghes(struct ghes *ghes)
+{
+	return sse_unregister_ghes(ghes);
+}
+#else /* CONFIG_ACPI_APEI_SSE */
+static int apei_sse_register_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+static int apei_sse_unregister_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+#endif
+
 static int ghes_probe(struct platform_device *ghes_dev)
 {
 	struct acpi_hest_generic *generic;
@@ -1607,6 +1671,14 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		pr_warn(GHES_PFX "Generic hardware error source: %d notified via local interrupt is not supported!\n",
 			generic->header.source_id);
 		goto err;
+	case ACPI_HEST_NOTIFY_SSE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_SSE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d notified via SSE is not supported\n",
+				generic->header.source_id);
+			rc = -EOPNOTSUPP;
+			goto err;
+		}
+		break;
 	default:
 		pr_warn(FW_WARN GHES_PFX "Unknown notification type: %u for generic hardware error source: %d\n",
 			generic->notify.type, generic->header.source_id);
@@ -1670,6 +1742,18 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		if (rc)
 			goto err;
 		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		rc = apei_sse_register_ghes(ghes);
+		if (rc) {
+			pr_err(GHES_PFX "Failed to register for SSE notification"
+			       " on vector %d\n",
+			       generic->notify.vector);
+			goto err;
+		}
+		pr_err(GHES_PFX "Registered SSE notification on vector %d\n",
+		       generic->notify.vector);
+		break;
 	default:
 		BUG();
 	}
@@ -1699,7 +1783,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1733,16 +1816,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
 		ghes_nmi_remove(ghes);
 		break;
 	case ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED:
-		rc = apei_sdei_unregister_ghes(ghes);
-		if (rc) {
-			/*
-			 * Returning early results in a resource leak, but we're
-			 * only here if stopping the hardware failed.
-			 */
-			dev_err(&ghes_dev->dev, "Failed to unregister ghes (%pe)\n",
-				ERR_PTR(rc));
-			return;
-		}
+		apei_sdei_unregister_ghes(ghes);
+		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		apei_sse_unregister_ghes(ghes);
 		break;
 	default:
 		BUG();
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
