Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06FBEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bm1saFI24CTuoTvAXikAwifetOalPJre6PQ63JrtofQ=; b=XdJPXmw2jW9Yso
	teeuUqNRkSH4QnO+LqlR2H2azjXkS5JltHv7+edtSQsgIav/+hi2fXS/cEmGwidr7Wl68nq8rKvcn
	FpMhh3kj+BOAfTd2Lg6MHo2p0F8gx4TlwI51UNHmmeMR/AAFNT7kTv6pZ6tpVvrklLEETj5qAbbiu
	9TauNWFm8tLm5KB5qZByxVR6RiKToOwvrXIT4HXGoIRRmYFRg+rrcU+VEygqnCg4fDq3bz82JFFr2
	yH1CLxkUMfkEo5KD9hGhFAHetQeYS8djeDGQ8zFl8PN87TJfXODVyR7YFKF69X3PnYWC0y8zL7Jkb
	H0qBdOepZ+SK2R2Df4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdb-00AVda-2I;
	Thu, 03 Aug 2023 18:01:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdT-00AVWP-2M
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68706b39c4cso873876b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085679; x=1691690479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SWdbLlCMTnsfDgjj0hJXL2JTXfe1aLJEQPkrac/1+s=;
        b=D2G3HiLpmiaQgiit5Uw5A+KyEHMgDrbX4OUobJfTY5xZLp+QrgoNkT2MrhFFEyepif
         NGS8bIEgxHx46b2qZaLXX0Y0SmZd7FsXd1pRwMLzsoEhtQ8pcPTRJawrVIj/nWamed2p
         c8Ow5XHa5oDci6OFZ2uyC29mSIkYFExo2ugvnfWshx5bUl5bbLWflApdPwz7r/8MPdiM
         lWTXRBs2gyD03CeRJIWHuRF1YcIOZcbbXk5w4VPmjVHxhOze/aVypsDeH0+qQb104tHd
         EPWaTU8ZA96yj8ruCaOH+vJ45kbEIP06MY4/8eq+kYWiPKbchSKHc0XwVBcVevJ8/Xa6
         Exvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085679; x=1691690479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SWdbLlCMTnsfDgjj0hJXL2JTXfe1aLJEQPkrac/1+s=;
        b=PNRjqxGaMrz+Zur3kRV7LkZaQMmZfhPmvvaUIZNFNEysn8C/2Sbt/adAF1ZdE0Rj6D
         xx4fEXurrxAGfLmg7d8jh/MXQGRmnC4TeIRF0wbQjRH1s7DuiYdd28zB4wClXYvtLEDF
         1FjhihnQJ81W/gtjJ2qmWtW6T9h56J9IWGygRCmd7cSjleSAoa4yRe6ig2WF1g3M74yo
         G0JVLuH0iwzTZZPOlm+2KCycJlvL8XP1UaxoTyYg4/W0Kof8GxVonzEeW1EulM6/TNNb
         GeywPGfs1D4iqQTc6d8hYGVJ/BnYOWBwTDbOv0+Y7cC757ggokPJLLyloEK2DOBHBAlo
         3kOw==
X-Gm-Message-State: AOJu0YwYYNcmFYKGCWdA4bzPwXVnc4nv4QCPUKLT0nJDVE0LqEPJ5G3T
	spMj7MGFW2oYUmaca0yvw034Jg==
X-Google-Smtp-Source: AGHT+IFGyUpuHPIut+tVQuZEcz6NanuBhvrn3iSa68PTIe5J1FDlay1VOOe28UUCGaj1xOLlQOJYFA==
X-Received: by 2002:a05:6a20:72a0:b0:13f:8a5f:ad8e with SMTP id o32-20020a056a2072a000b0013f8a5fad8emr1930770pzk.58.1691085678868;
        Thu, 03 Aug 2023 11:01:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 14/21] ACPI: bus: Add acpi_riscv_init function
Date: Thu,  3 Aug 2023 23:29:09 +0530
Message-Id: <20230803175916.3174453-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110119_844064_99490CAA 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a new function for RISC-V to do any architecture
specific initialization. This function will be used
to create platform devices like APLIC, IMSIC MSI controller,
RISC-V IOMMU etc.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c          |  1 +
 drivers/acpi/riscv/Makefile |  2 +-
 drivers/acpi/riscv/init.c   | 12 ++++++++++++
 include/linux/acpi.h        |  6 ++++++
 4 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/init.c

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2fc2b43a4ed3..9a8c16170a4b 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1388,6 +1388,7 @@ static int __init acpi_init(void)
 
 	pci_mmcfg_late_init();
 	acpi_arm_init();
+	acpi_riscv_init();
 	acpi_viot_early_init();
 	acpi_hest_init();
 	acpi_ghes_init();
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 8b664190d172..3433a19c421d 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y 	+= rhct.o irqchip.o
+obj-y 	+= rhct.o irqchip.o init.o
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
index 641dc4843987..d16739928888 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1511,6 +1511,12 @@ void acpi_arm_init(void);
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
