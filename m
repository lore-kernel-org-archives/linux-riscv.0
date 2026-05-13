Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD1CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RYT6YWAG2ID3YOXZcLIwknh3/zGlaTla3iI1CJvUw4=; b=Bl1j3jjv1CSNA1
	a1GRZMK2ok6McHEmp9QAmByElzEhQog2f5k9q7miO6u8+UWu1u+JeNm++Zl5kf/qGfFlZPAgMW6qE
	wfTh03NXf/w9V1GZstLHW5oFdt4gL0a8uz4lDy/H8M2SIppwkdoFQUqVHMdMVOKXkTJ0Xy7BYpa5x
	FVpFwvLrOmVTgK/WTFwRKGY5a345/GgvGrLIAyLQRykiWTqcNycHs93mOmfgohxDdcb4tW+exAjsL
	Hll31alNKjPRbqvAtde+7DPVbJVGn0juvXbJYcRmTEmJHT9fB1r1RWlulGuqzPCBjHVs9e67OdF0f
	ist+ZNL1E62rNJANMZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ch-00000001mRq-33j0;
	Wed, 13 May 2026 08:44:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cf-00000001mPT-00Dq
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D5JbTH1393169
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ewmAIgvqude
	m6foGMLA49zaPAzwEB58f49bB7peXZKM=; b=X4lVN1xqk/XVZG6sjDtsXx+B7o3
	twyEsZHNiIcE7JF9szlfsVRR6JAi9PbmO8mWej86qGUuRhvWz24HdzbGYIxxZKhY
	QuJ9tJDQALJHlZZgI0srhIs++H/l6egzv5uMI7Kjtk+G7/xQtt8teZ+KFBEwPTEJ
	h5bpHetYGdEsOuW2CwP57c9//ICdHsTetDMObbP9wxU14EO+btpQEOuq/cJRFVhS
	fsIPQDr6fYjKz35ExXF4avNBSv4R3jmrFXYK4+oRn5uwod964E7NS8ZKoGZluGxF
	+6UUCxf/LxBQ/22TL4q2MN8DclT1Op3RoN04ULivBvq1NFOSHaDpU+uUnHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k260sru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so69567395ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661868; x=1779266668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewmAIgvqudem6foGMLA49zaPAzwEB58f49bB7peXZKM=;
        b=W6rj46EulfRs/V12Uz5/4QVaPlztLipdjSJ9zt4iUt7Q42SNfm6h6VNA32j3/ZAwjR
         +uVHANlKiM2x248Ai7pCAN3bh+FXNVshXebvo1uM+UuUmgpE8n2di8ZBdcE/CK/P4946
         Nmht2lN4HE56RsE5b42LRU0whUxsPv9CDZyy93N46gt+zX+NEhrR2Jtxb/wTf+L9+1PA
         F8WCWLNlJLgcITVhu033UfuSDlRNrrudqlnke4Wb7Aq8sObnWNiIkqg1E5ybhIWo1FJR
         w6gikeIneQC3kpSac6BzscZkDeVgrBR7+blMO+jKEXkYqAiOpaoJMQFC7f6JMYgPHInE
         Iu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661868; x=1779266668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewmAIgvqudem6foGMLA49zaPAzwEB58f49bB7peXZKM=;
        b=MfeqsGX0EpOQou5HMI6CcJzdJzhXmj/SCcVxkbf4KovhDt2aZDx3MP1e7Vs+nJr7Ja
         ic/YA4g9Xfez9K21ggGGs7dpCH3/jCiCIQb9VkFGKllHsVNFiXv7amutzTAKuf16Kceo
         GxjU/HLiqOGPaFprntdQ/yuBOMyy6pXkOinntxWQC6BzDebjQK24UOTgGEUFKeh2RV5E
         aEuhKqhIlg60EyfOrPemw/WQYhmKyNUdZveBxlVWt8NmYNzO7VKY+SnGhDQ83/MVyWFZ
         n5u/C3pF2NCIKypcIczAyC7kb2TMP3YhNEy71kHo/mli1DYcJFUKvnrAPhM38ffXmjI7
         RWjA==
X-Gm-Message-State: AOJu0YxHmE6FKm+x28161PT/lerV9J5H/zRsh6IcAC6xuVNdx7MSjg3p
	fhx587j+aRgCg7G5NGPddQ1NSa+DS+iAfZB3zjtFfAcQBvVpDuk9dO2Z7terfflPg6RJxDK8RGI
	CC2aqwAHYv9O5/pB1wT5K00y68JA7NMxFExscEsXdIpkZpp3i0QZfpe676msg8vX/zFBEb9NwRJ
	/LVUw=
X-Gm-Gg: Acq92OG6OeCVVghMJivPBdr/s8kxHwUNBU32udMWT0yu95j0sOwC1JTNnhTYsIPUog4
	QQt2UX9zStapqsSOBn51Rj4RutrmQYNJdxM1UaQlVy3vK4W4gxlwndmvs4ovvv2+xv/u2h1QGZ4
	OtuIPzVZ5yWOFc6Rx2j9D8UPqbna8zPbeRRNZkvuAtaXgAEipxVG2CN8z/dnm9KSAZHtxDwRTnD
	oRW1nfHPPfIRPCDduoSSerO42S6tFyyZTqd2akIro/ZQsKH1htrzOyuxYVct/uzio02WEa7oH8N
	IaM6i0KkJQPCH39Th5U6oiZBqm2tkkIRLpGXptRLjzecuwKBRm56rEJZB4j/cIVVs4+/KCeIcZs
	ow0QEm4kURo5Vzbf8ysIYzscdtNfxLfnI9fmKbMgSNPAycT4z0A4Bi6+gCIaFTPZt14vbSQ5Pud
	ESDH/fB9bgfZYPgwfno8qXXVPiKhtl69pDTfoNQWDY+ypusw==
X-Received: by 2002:a17:903:906:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2bd27295b2amr28364145ad.23.1778661867640;
        Wed, 13 May 2026 01:44:27 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2bd27295b2amr28363715ad.23.1778661867179;
        Wed, 13 May 2026 01:44:27 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:26 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 08/10] riscv: Introduce HEST SSE notification handlers
Date: Wed, 13 May 2026 14:13:23 +0530
Message-ID: <20260513084325.2176952-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0439ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=Eu4eB5ymJzOrEwSPfFIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX8L4XdsmAv7Su
 TXL8WI4S7PMrvaXMsp+ncGAe87JpPhfpOevkc27d37Px4AdkkZXhLCIgZ/6NpcSmGGV+3H6oRZO
 k1cRYljyJdM1zbatIq9/F5K4CXtPwBZtA9IbPo/sjZVwS1P7aqA3rgnehlX+I9wH6aGmRzmeHt0
 W/7zTWwY1aDgBrtVgzNSIMj0vEpmRh8+TeeoSRTXGbrY/BBnDaG8+ZhQDWkF8SL8Rsff2do3fgd
 jdtuGNRL4f2YRcLaxnpES/Vd27er0vuirvcOWYYY7R5DO0vKrpVPImbs9LqcQJBvRvhJpWlwJXd
 SN+djm0YTPGPBJ7Q+t+PbJ8qw4Fb98VKi4phuQ5mzY2hclGhFc7uU/AwEzHiDe8NvPDrUX5+lJ2
 d/tq9GhukLmR4Qz6T/1hApgh3K35VIk0M8chG/FCGQJtEuSeOPWs0kPdDPKZOkTBhLUSrPZUNpY
 EyuYFkTTTAXr8DWGFdg==
X-Proofpoint-ORIG-GUID: AHLnpW7PM_p9DJqxwZBWMOMHcpo7ru0X
X-Proofpoint-GUID: AHLnpW7PM_p9DJqxwZBWMOMHcpo7ru0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014429_052997_F00A5806 
X-CRM114-Status: GOOD (  18.14  )
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
 drivers/acpi/apei/Kconfig |  5 ++
 drivers/acpi/apei/ghes.c  | 99 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 428458c623f0..895a843d0e36 100644
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
index 8edc2c8db1bb..1baa8ddd10ea 100644
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
@@ -100,6 +102,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SBI_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1662,6 +1669,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
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
@@ -1708,6 +1772,14 @@ static int ghes_probe(struct platform_device *ghes_dev)
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
@@ -1775,6 +1847,17 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		if (rc)
 			goto err;
 		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		rc = apei_sse_register_ghes(ghes);
+		if (rc) {
+			pr_err(GHES_PFX "Failed to register for SSE notification on vector %d\n",
+			       generic->notify.vector);
+			goto err;
+		}
+		pr_err(GHES_PFX "Registered SSE notification on vector %d\n",
+		       generic->notify.vector);
+		break;
 	default:
 		BUG();
 	}
@@ -1804,7 +1887,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1838,16 +1920,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
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
