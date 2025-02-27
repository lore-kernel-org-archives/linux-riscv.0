Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3BAC282C4
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sncZMDf7jEBT3PmFbSXTWpGZcGa3fodtsynxaMTQm+U=; b=kmj2BgqPfuHICE
	Qss9+Tx1hENyYPquSHZsCbHWs3lHS9hkiXG52MkmNEkdNZcuG7bxPObWDjxwLwXqUplY89EHzuWHN
	KalQ4hxmQWfpXZWLRKcn+9Ick1i+G1mHEbFssVGZkfUUCIKGzeKU6bqTlM42S7p9z9JEte2OI3sSR
	xszbv2+IAWTnkj97VzGS1tWTJ4FZyX1hIvX5e0ALfIOb5NrGidHXmWhY/wx6nTBOXNRqdKgS12QNs
	PbhnCZRUJjwL57aUUUYmYjZIhzc6a30aJ+7IpF6JrdDJkWQBfnG/BkmsaQd0HtgdF7y8QKM3joQPr
	xTZL9O3B0gI+8L/BQZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndom-00000007VBl-3vvA;
	Thu, 27 Feb 2025 13:20:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8i-00000007OAs-2tV7
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22334203781so26538765ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659840; x=1741264640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXVhLjcRoeCf2V/5WVQuQKEAR2qmhhl0hOLkmr0AsUA=;
        b=h3RYIyrOqfSj3oGhJDUltx55Yr1rUEYEej8DBBmnZd7TcMb2KHE+LpY9eO7TaQt+0D
         w2s2He1Y0QZY3W3VLBQC7iPIbRBgTyine2IRVo6vOFxBWXDGP1qX9XUoeWdgJPDCsaia
         Jq6Zd1ht5/rFn2cIWYkdIXHCl0v8kjaLji3lQOU2MRkZk5WjWpDMgpxJ5kbM8/ywWh0+
         eoBdV1/z16nOHCnBWHkAhgyliOzdgXXsIGuKjgYrCL2E4QGMH3QiMbWihMtrfo6P9C3O
         b/8L81gDtaM5HYPYxK3LRQu5Vkpk45eYDui7djVHYSyCV5uunyEhYBJjZ16/+h16JIRc
         coBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659840; x=1741264640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXVhLjcRoeCf2V/5WVQuQKEAR2qmhhl0hOLkmr0AsUA=;
        b=iTYWTTmh8e6b2uFo/u2vBvlj8wyPMF4x3gAUN6ua6y1fyoDi8uLlgK2gocOIQz/yaY
         mBEmmrS57WgiosZemSdHt1Lh9w5/oAz5DxntzCajLdU9Yobk1wn6OkmBuEZ++eFjnDUd
         2jzXVeWZZorfRL3WtC146+IloKtV5z8eRnp4zyDeEZyRg32HkGiMw2bqW4f/TP86lqFw
         xOcFy3JS33kuVsJzKJFSXEKW9I9LxpDg6HAp2q+S3QQ1P9yAIhoEzjcNv+72y5GL9mIA
         S4Gw4//xV/JxBjeW1Hy/M52NXsDA8+vB6i9ysiPJgJfwrTrfvxOW+UqWyRBNs1pG66AV
         j9Nw==
X-Gm-Message-State: AOJu0Yw9GuM88ZNPFOggl128SZ3QJcTFpj8yT+MBZn/Si17Ex1ehTQtG
	lOq8y0Ll/soFSW+tY80a/b/mpkh4tiDASX62+gfK4xzpeziq/i6AFf2DZaZUJO3gaMbpD58IL4h
	6Tp8=
X-Gm-Gg: ASbGnctfFLNwBt9seeT0m/JDxEzhFqi9ZwhrpAKnLTnmUq0Yo1vOuYll9e4A8WRJshc
	9k/uPECbooXnWHT646bWjysyCcDqYFXUQTDcLLzxbGvHEGRQkHg2yok+LaPKBy0Dozu/BG8BSic
	HyumY1ehK+B81u0i7DtStrYHAc0n9t5N24G0xqfS1pSPS5Kn4przKCjw2MYC9u8ZJ4QLYftenwg
	gfZTLj1t7Nanvd5JTo8njecYsls1J1d5/E4kIxDQ3GNmLrhrjb0r3xqSO/RATJpzodUGf5viOCe
	SGlnDHaRhn4mlem1xA84IBYpcws3fP7kSnyn
X-Google-Smtp-Source: AGHT+IE/pZ3e6JonJxeQe62tq8o12LGMwm5f6Ts5InGRCEUeYVZmSfCnd9ZWVdPIH36ibrRnGp55zA==
X-Received: by 2002:a17:902:d507:b0:21f:1348:10e6 with SMTP id d9443c01a7336-2234a57fd4fmr60713595ad.13.1740659839830;
        Thu, 27 Feb 2025 04:37:19 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:19 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 08/10] riscv: Introduce HEST SSE notification handlers
Date: Thu, 27 Feb 2025 18:06:26 +0530
Message-ID: <20250227123628.2931490-9-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043720_728023_6212B911 
X-CRM114-Status: GOOD (  14.30  )
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

- Functions to register a ghes entry with SSE
- Add Handlers for low/high priority events
- Call ghes common handler to handle an error event

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/acpi/apei/ghes.c | 100 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 89 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 8a1029163799..59abb89d3547 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -17,6 +17,7 @@
  *   Author: Huang Ying <ying.huang@intel.com>
  */
 
+#include <linux/riscv_sse.h>
 #include <linux/arm_sdei.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -97,6 +98,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1405,6 +1411,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
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
@@ -1451,6 +1514,15 @@ static int ghes_probe(struct platform_device *ghes_dev)
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
@@ -1514,6 +1586,18 @@ static int ghes_probe(struct platform_device *ghes_dev)
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
@@ -1543,7 +1627,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1577,16 +1660,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
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
