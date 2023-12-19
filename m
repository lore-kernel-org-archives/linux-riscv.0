Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE0C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fAfEL5vyfFiCuVPsAknRbGkX89VN9YxNEcWITa7J/0=; b=B/swkzsMcOLmAs
	B/k2/vbVVvJJqXqKT4+Kqk7uJMYMZSlrtlcFTMWe0JO521yQ7P9dKw4ROcdEDh4M07mbOZerNIXFO
	XrPvN4qDuUX7+ox0xJIogA2FzFaYl80tOEcjkUr8MFxwYg/x4joSYmaKPsu2PrFcjLKdUsCUAcIu5
	pO0iHKYO0DxQ7Sy2MGwOYCrC9dpBkApMXZpW3uxRMOt/LKEU1vqJRtm93W5cz0mEAYkpZLeh80eah
	NkJQsFculj7y4yFWcn8muykpy/+vGh5dbazta//kDdT+RwUSPnK+5iwI7n80+mNVgcXPXL6JuN+RN
	y13Vg0OM1UadGZXe1asA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFfLf-00FGtD-30;
	Tue, 19 Dec 2023 19:01:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeBC-00F1OE-1P
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3ce28ac3cso15520785ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703008014; x=1703612814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0uCfTOZnl72LckIuFeuzwRvzQWn6/C5y85H0bronQc=;
        b=F7adu5ows4kFbPsmdJdLmpJey0FgPW3wGSdkuw5aVVZHD7St7aXYGVjyPEwtMMxJDC
         d83mAf86nsaPKKuC8tDeDYWRiVR67JZMNyjA7vCyOgIaZ2Qk+G6K2VuEUl3BW8czGLwk
         4jp8Pg+q38VilIfHe470qb6eMQGgZTKsP4To7m8K3ZAamDKyoglwxxINUceDF/M+6vbE
         tCcMtBFxji/LRS1VNpmnB8Arm/6TDhS5k8NGGtbZ08unUacgiHd2LUrSrREAUp/uFF2o
         HfpyjbtVMbT16fXdwfNN8sxWPhz/HY7xw6Ih5MJ4WhzcxwJXREt1gP89A/dVuLsX3hFo
         ReIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008014; x=1703612814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0uCfTOZnl72LckIuFeuzwRvzQWn6/C5y85H0bronQc=;
        b=ww5LysBQHqg7LZzDfRoanzzGK9+qS0YAKMxZBK2T9gh1nGGN9EM06WcfyVVzIpWEyp
         1Zx516vbYW3VT+noC2CP8iwUBSNvY8wyxVT8f6VxYxDQAJskPRS7UK/gSjOuqiSKLG1Q
         G6DycvZUhBwdHWjuED3S7MI9ZQ/qO9bPa5owh+dEBG8X40a/1MKWl3grSB4FHuJHIP1q
         aCheMPhIJPGVZ181J23ElHyyoYSr8kqqETnZaQAcrvkCzDbI+oItMULaq8hUF4A6BKR7
         q/qXSPgAjPcYcp0pvaMth4qbIFSrDGb0gWBVUY0UdQGZT5dfpcsUx7kK/rEu+63R0G6k
         U24A==
X-Gm-Message-State: AOJu0YyLCk3azZ9ZuH95Iu67vJLgCTh6X9NHBXwMK/OTX7H18RQemI/V
	ir2QcYGlaVd6iiqTjY37CYZpoQ==
X-Google-Smtp-Source: AGHT+IHZcNfZ6die569wXMawkOkuZhvwuWzaoZMFwyoh6VY7ifl9VotSBnjv3TBcYle+Wo3ta+ExQg==
X-Received: by 2002:a17:902:e5d2:b0:1d0:7c28:f806 with SMTP id u18-20020a170902e5d200b001d07c28f806mr9507684plf.3.1703008013802;
        Tue, 19 Dec 2023 09:46:53 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:53 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 14/17] ACPI: bus: Add acpi_riscv_init function
Date: Tue, 19 Dec 2023 23:15:23 +0530
Message-Id: <20231219174526.2235150-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094654_488738_6F72D400 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a new function for RISC-V to do any architecture specific
initialization. This function will be used to create platform devices
like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c          |  1 +
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/init.c   | 12 ++++++++++++
 include/linux/acpi.h        |  6 ++++++
 4 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/init.c

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 9eace6c7042e..f7ac0caf04cf 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1417,6 +1417,7 @@ static int __init acpi_init(void)
 	acpi_hest_init();
 	acpi_ghes_init();
 	acpi_arm_init();
+	acpi_riscv_init();
 	acpi_scan_init();
 	acpi_ec_init();
 	acpi_debugfs_init();
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index f80b3da230e9..c4d679b1359e 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y 	+= rhct.o irq.o
+obj-y 	+= rhct.o irq.o init.o
diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
new file mode 100644
index 000000000000..b5807bbdb171
--- /dev/null
+++ b/drivers/acpi/riscv/init.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#include <linux/acpi.h>
+
+void __init acpi_riscv_init(void)
+{
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index b6766bded765..60dc1f1e9351 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1536,6 +1536,12 @@ void acpi_arm_init(void);
 static inline void acpi_arm_init(void) { }
 #endif
 
+#ifdef CONFIG_RISCV
+void acpi_riscv_init(void);
+#else
+static inline void acpi_riscv_init(void) { }
+#endif
+
 #ifdef CONFIG_ACPI_PCC
 void acpi_init_pcc(void);
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
