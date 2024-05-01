Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A6C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/4vnhtrrIk57/5MUhPN9aqd/mINdtQO3OeieYXGqtc=; b=xYiqncMnmCyq+d
	TZ+JCbU2DGTRMgke7tig4YCDHMDar0jA9BYEdQnyUo8IOiM3ekK2ZkbE0cEFrZyxOJnOchkbwp2km
	lfCHkmfI4avVYtVV8brccgFMSDRyckWZB8chEETobPp05dEbluA4lVRGs4Q41Yy1tNDrKD/7gqumC
	0ZGjAoT4UbtEasAVYktgdX+MJbwHnMoo0FgNGUgorCmlNajmjTfSuJdxJRl79B0Hb6wfZVIaQaOUH
	1IOXfyQuaDPscIJigxD7GCIFzzWQaQYVAcqoulEFNtmuw0CERfvdepiSw4bLEk3SxCMx9u2rTjaj8
	n8UEdruEDZf/zj9nWWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29DI-00000009Ucy-33xW;
	Wed, 01 May 2024 12:37:32 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28uq-00000009MYv-3B7I
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:18:30 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-613a6bb2947so2188872a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565907; x=1715170707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcwxR1GQk9U2hRbWPBz3q9MYCED3shcxZKp1VHv0hAo=;
        b=Gn98wY+ZK6vGcw+1aVAeFU9v/u130x+fRyS8IN5FszQ4u9LYtQ67fxStmcu6VgQvyl
         SPt1MCnWMF3NiCWGcxecmhiwOVFAhhrOAFXiaY8leyOV0QLlsy/N//3FZAEo9v/9MP4c
         s4FxUgI7bGWHfH1R2SAT4Ojfflogu983CrZsFrKtqapyKqyFl0il8Kh3IHZFgAPtUjzR
         sDkB/3FMyveRqoh/XalvHGcGCeWJVteE5qxkU/kvDB1sOpg0SFhlKZaDX1pT2IofHkNA
         84bAcAmaOyWaKA3io0mMB8vhYFqvuGWhwCYOk4yukjUyRQFiKCqk30Io3JP7ABVt5a0k
         Lbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565907; x=1715170707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcwxR1GQk9U2hRbWPBz3q9MYCED3shcxZKp1VHv0hAo=;
        b=MukXvyg6nQw70FJgKQ5yW6lX5G8DbvRpOnyybC00bIEQdyB28P927fyDdDzSj5uNbV
         QP9rgTIkBZ5Fiw7dOKBYqzlg84+kEC1W4HshQNM02qXGkEmYDzK3QV5/XlQSPuTv7rW/
         Fcydtz/dN8Ozt2i205YposDJhXrcoX0czogrR1lek/xmrNGa0abyrtCvR1jifqtMxMC7
         9vTNzhAfjoX5o9jC9WCmqK9D79IEVo2njqnBv/9qRs89RGIcwuWs+HO+LCV+GkYN3jPI
         ZR+lHDpjT9u5LMVtNZxVqJXbRbHRpYWi0NTW11UF9jga0vLrGwO5vc2FMD6Cn+1GcwPG
         xvCA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LeEjKY8FnyU297btPsmMdGxTDU0rIHQFK9ES4y1ziU4aJ/6H1AJesxhYrg/CXUCKKqQa8r1Mr02WiJKcW/eJDlJ1muo8LT9LRodMk0Mv
X-Gm-Message-State: AOJu0YybxR1mdJiwccw8SQZVqlIkp6YTXSZtJP94QgqcEeDsjXkMV2PY
	EfIXbEJ7Z9mcxaWBimH15zI72pai2DUkXs9BoIfmhsP6A8ohTJ/l0UiDTwXm3leUISzWVgYWnbi
	cP38=
X-Google-Smtp-Source: AGHT+IEeK1bdY+NiF6yJem6nH8XOZPBP0PcZb/eHB80G50De8R+NdOj9l68iFqCiSXYmU0FqhQ9LGA==
X-Received: by 2002:a17:903:188:b0:1e5:5bd7:87a4 with SMTP id z8-20020a170903018800b001e55bd787a4mr2316455plg.16.1714565907491;
        Wed, 01 May 2024 05:18:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:18:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Date: Wed,  1 May 2024 17:47:28 +0530
Message-Id: <20240501121742.1215792-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051828_850592_4C15FA0A 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
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
index 844c46447914..17ee483c3bf4 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1446,6 +1446,7 @@ static int __init acpi_init(void)
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
index 1afa289f1f4e..846a4001b5e0 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1527,6 +1527,12 @@ void acpi_arm_init(void);
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
