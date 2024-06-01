Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5047C25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8yLoIHOFSMbatAwumo5L9hyaWXIwQuujjN+VWOKSbk=; b=seyeb7GGyvp6oU
	3VmqhL8RCvOzZnfeoNL2oDlL+1bR6SnqTHm8DgjbLocJ0N6vxy86Bg8zegMK0k+2U/g+7nMpLSPO6
	0FHlNc7/TYOIo3r97FAUzR2b20MVoHxPfMOaKBvLWm7JzbzzGh7SHHjM8HXE7L7iG9n8FOLzl37i3
	prlECkaNvO1q53QIcyKAFOHZ5zE6tXMpSrFrkl/sbUbl5FIgpey+oDDn65hYsWUjNqXKXwFsinXHe
	X3cuBVW5zA+irtbxYXyoQjbXH3g6o/Zch0GfL9SX2k1DxQ4nIFjsHe0nHldJJhPDy3h3SNXezmcbO
	BfkJfAzdetoNMXCSwYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHn-0000000CodD-45Q9;
	Sat, 01 Jun 2024 15:04:47 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHj-0000000CoZt-45cK
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:04:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-702447766fdso1901444b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254283; x=1717859083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XPxdT6K3q9avtvxcOF9k8RyQ+CxCpXPedgopG0VTh8=;
        b=bdVVckZEfb1ZntETbpQOOZ32YouJwT6syQA98lbsmmSjDxXi99JX87Rq27uHcWFASZ
         C6tognisUbsDrWpHWpXcHsBc0t+wtfqjuUQV0ukDROmGlBHUsKThuJN6VLBjdjw5HTeX
         M4771V3BOLZkBUP4RkIjIBPygxFKTtxCle6vN1R9b3jTvw3RqiE4a8bnT2tL3prpn+1t
         CLRToVC1zoV9PVZnlEVxSEgOVYrg0GPDUAI9atZ8X8VxPkYKAJ+WuFt6ocRZD/omP7GN
         i968C3ZssB03zlRAbaxHXUcC9fCMdJPgnKti7pEroDvUJMm48JuaqtSnIcJrytK3ZNOa
         +HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254283; x=1717859083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XPxdT6K3q9avtvxcOF9k8RyQ+CxCpXPedgopG0VTh8=;
        b=Pk/lPmcOJd+GqfwlXZS5zuLi6tD6Nc/6/klx3MZiYOyEbSulPROqYI+/QaZxXDJWfe
         sXMZnd+H22Iiy+UrdyQGFapVCWqG4xA4pz5oXjStviyNFVPIsPlllw5gX9+iyXuppCGU
         GiNDO+/jWU8zkyzDHsbVK8KBaW65GBJU5xKjDupfiQwMo4KYLTdcJIPZxEEa8dpFEDRu
         TQOkHbYC88DQpxvp1oQfrMYnoOl7Rue8VAnn1vN3K4n28vruWEU35Hms132I+2tFuzBs
         0FxymZLKFlvUkdhz/uDA2WtFrj1T3upAFI7aUf0LYzia5K07GfMQBD/GmlqP3oYzcy2c
         BV4w==
X-Forwarded-Encrypted: i=1; AJvYcCUHTNMGPBkMonvSNem82M3BlWOSj6Os7HbdiuiTpt8IGfBtVTUU2pVKyQ8Y5hqh+8ryzHFLRin8QAWuqxswCNS1ErpSXZlghAUOPp6Qya0p
X-Gm-Message-State: AOJu0YyP8HXU5yaB2B18NipLgCYOK+gT8eQ62x6JsZLAo43gP9Xk/GxS
	ZCYeHM+fjHKBhaK4GuOxMBeEsrGGxJEfsG8PRPHWVsKj4s0E0/EZKwwHbQT8R8E=
X-Google-Smtp-Source: AGHT+IHSPHHuLlxYdhrhdQ1SLxLogYrmPMkhydYeNGjzqhZ539L1iLkZwGvrDzW2O9+TbFzfxEzXhQ==
X-Received: by 2002:a05:6a20:3946:b0:1af:e3f1:9af7 with SMTP id adf61e73a8af0-1b26f204cfemr5557418637.36.1717254282646;
        Sat, 01 Jun 2024 08:04:42 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:04:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 03/17] ACPI: bus: Add acpi_riscv_init function
Date: Sat,  1 Jun 2024 20:33:57 +0530
Message-Id: <20240601150411.1929783-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080444_190479_9620CC9E 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a new function for RISC-V to do architecture specific initialization
similar to acpi_arm_init(). Some of the ACPI tables are architecture
specific and there is no reason trying to find them on other
architectures.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c          |  1 +
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/init.c   | 12 ++++++++++++
 include/linux/acpi.h        |  6 ++++++
 4 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/init.c

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 787eca838410..8d0710ade8c6 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1457,6 +1457,7 @@ static int __init acpi_init(void)
 	acpi_hest_init();
 	acpi_ghes_init();
 	acpi_arm_init();
+	acpi_riscv_init();
 	acpi_scan_init();
 	acpi_ec_init();
 	acpi_debugfs_init();
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 86b0925f612d..877de00d1b50 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o
+obj-y					+= rhct.o init.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
new file mode 100644
index 000000000000..5f7571143245
--- /dev/null
+++ b/drivers/acpi/riscv/init.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023-2024, Ventana Micro Systems Inc
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
index ab3f2880d209..0c6d9539f737 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1520,6 +1520,12 @@ void acpi_arm_init(void);
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
