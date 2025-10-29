Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746D5CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqRUeas5ewGAHmUNIyOJ6uO56BcLW4qt+DMFgn1OB9I=; b=hw8wofNxI+mcNu
	N4DVPQbk/V0dOfnnYJUgKE/CPp8evSghj+VseM3Bs4UCJjL7DgLVvgJXHoK3sPSB1nxkIWwSOMmLB
	n1hFTIpk1q/mR2DQ4vdthnlWuR2y6dtE+X6iryy5HBgAI/b3iBYDHE1/jRH0C8Lm+zPhUQHFa73mH
	f4e3iXhyZbdaTe8M3DYDmN/TZLqHi81BLMaUCMWnEN4rz3FVSi0M5M25gFLi7bYKIyPOO/pHU0H7J
	iapE/hqW09IH5fCJ7C/kY9WgsNYdHshEI8qctz04NNZHrAEQRCzrU0WoyM4GMRJxqkoTkzM62mlnx
	TYZTWXXDLpkAs6HPTmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LD-00000000yIb-1Vli;
	Wed, 29 Oct 2025 11:27:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LB-00000000yGf-2Sc8
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-340299fe579so2387020a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737264; x=1762342064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp1nIH/UcUWGrGQTMqAlrnMpZhTNysKVdYoaQCQ6E6E=;
        b=SosD+JWzN3LYGRmHHvp3PqupV4wXa04mIP1OZcgA3m7tHjdg3kvVrIfp96GiJUxBdx
         ijMiHkq/FlpNoz0IZVEot9NhazTYXkB70OcMSPkIUvBMaTyavQIVt525HJ6DVUoZcsrR
         /h7L5E5AW9sSb0aKagGvJ99crrFXJuj5609NxwcsHiiYv4IuZdicI0hOVLxeKHiLlybr
         Tp5hL6i/AiGSN58yCptJSj2lI7dfEOvGbdYyP8Giwxs28bjDizHHI9eWBtD0qDzSUyZe
         xz6bhA0jRx4MoiaoAhvuaE/Zq4jD/3a+gg+dUoeSEKLhxBmu+ynBLpR5+LT/qBxxgBzE
         nkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737264; x=1762342064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp1nIH/UcUWGrGQTMqAlrnMpZhTNysKVdYoaQCQ6E6E=;
        b=NNphwKzuVZwC7P142WdnUGcORuIpyfbhwBVaMr8DJTYBUCGtWnxWRDA27CGPXhxfYZ
         27RBCtKJVkbKbVc7s+4UJCZLD+9UulPRmEvv5MGhEBm501sHinS4B20mWCMuH3epKCYc
         xzESIlzrmsjDHa3w/fXz+JxSjnISIXl/JgGsI9GBIdwQ68r5shJU9RJekBhtVKHLFRy5
         oMfHEIGCkpuyJvnVcjL4BIVhVnY18HfM6kaK2Sqe8GUyJpRRXr3edLUwC9qZum1apxN6
         G5iMTyJE57KpsHLnRTW8GEbt5l52Cvqoia0fbvN6QU3IEuCf5V67a9Kw+nhMEk6Hr1Qc
         E5cQ==
X-Gm-Message-State: AOJu0YxNtcuPk1gVa59qlkJDcGUjiuFS/eNuyzlFzZRBfAP43bQbbj8M
	sVKuVDz839xBnl/CU7f7HxF2YBwwfmHFMWrFMpZy+eNm96ssNKy0GMogADyhjKEpRIfco1xPqM1
	Sdz9qTW+CZQ==
X-Gm-Gg: ASbGncuSAhLavcsnE+ylHUlmi43+zL8E2sIu6c0nIjBEXZtho05nQ/RVuioxDPZ0J94
	alcoQZoS0WBCl98id5c+g75/Yo/tjsDv8PguXIvU0uHglWp45jrM9KaKT2HFrUj80PTVMz8+Zpk
	YjswxQe/ojaF6PjePsDIg2/+BddoRwZLwzZoSIguGDPxNKRkIWe7mhDg4Crabzwxpm5cQfyBUhX
	mqTnseCA0PhgccE2ZVo261QGrtwNRh1x/Yg3cGY/FBBtx3wALxcu6xrmoYT6+9VsG6kIn8OpchQ
	MnWMTSWVXa1HvDA4Id+rCGm6iCBV3uSrQDIazUHDqMzcErVDFJNvuBqsfuIbrUOvgM2f1LJRQ9Q
	vnwsOeZ9mnpvTYmj3VCgIsXQh19FNkM3FlsoEWrEPZzyBw58563vlHeWyKfyCMsIsbDtqoKfUCX
	rqceIkwPKesA8MzXJT4QMybsR2m11b
X-Google-Smtp-Source: AGHT+IFARlQT4wxU5rIAA9JBJXOgqU4ng9/zvGb3HdF6wqemjXQ0P2gKhLivhx1oGEPscd3xyn6Eow==
X-Received: by 2002:a17:90b:5188:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-3403a2fece5mr2816754a91.33.1761737264495;
        Wed, 29 Oct 2025 04:27:44 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:44 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 08/10] riscv: Introduce HEST SSE notification handlers
Date: Wed, 29 Oct 2025 16:56:46 +0530
Message-ID: <20251029112649.3811657-9-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042745_629632_A8EE0623 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add config option to enable SSE in APEI. When it is enabled, functions
to register/unregister a ghes entry with SSE are avilable along with
low and high priority event handers. If a SSE notification type is
determined, a ghes common handler to handle an error event is registered.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/acpi/apei/Kconfig |   5 ++
 drivers/acpi/apei/ghes.c  | 101 +++++++++++++++++++++++++++++++++-----
 2 files changed, 95 insertions(+), 11 deletions(-)

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
index f2cbd7414faf..3c47249245d1 100644
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
@@ -97,6 +99,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SBI_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1530,6 +1537,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
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
+static int apei_sse_register_ghes(struct ghes *ghes) { return -ENOTSUPP; }
+static int apei_sse_unregister_ghes(struct ghes *ghes) { return -ENOTSUPP; }
+#endif
+
 static int ghes_probe(struct platform_device *ghes_dev)
 {
 	struct acpi_hest_generic *generic;
@@ -1576,6 +1640,15 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		pr_warn(GHES_PFX "Generic hardware error source: %d notified via local interrupt is not supported!\n",
 			generic->header.source_id);
 		goto err;
+	case ACPI_HEST_NOTIFY_SSE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_SSE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d "
+				"notified via SSE is not supported\n",
+				generic->header.source_id);
+			rc = -ENOTSUPP;
+			goto err;
+		}
+		break;
 	default:
 		pr_warn(FW_WARN GHES_PFX "Unknown notification type: %u for generic hardware error source: %d\n",
 			generic->notify.type, generic->header.source_id);
@@ -1639,6 +1712,18 @@ static int ghes_probe(struct platform_device *ghes_dev)
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
@@ -1668,7 +1753,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1702,16 +1786,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
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
