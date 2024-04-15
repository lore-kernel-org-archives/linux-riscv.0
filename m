Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA46C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INCAuSZmdz01BdowwBvJJj/K19yVp/nBcORK8pj6svU=; b=Leu9FQjAnMTudt
	K27M1Vj/FUVG7RSlwJtSnuSjak6lswtHkZGrCmlQXnE+nhjG1OUoK339lrs8xLxv7mp6d1ZeWyGHI
	jCKj1ytbFoAK6j2+n1siUCluS+2qd6dgUvcKquscpjeFJQQVT1zzvOtYQGbKhDX12Pgv+bT6YhRti
	P1w5tGeHFxySL0KEngVOggSWp5xDYikSAjkPyDmYqrSlI5Y9fMONdtp5AQ3aJ/Mx3HG/P0RpFLKnS
	mCDDtBIBxlXARVnoGF9/TwOAweOuA+XEXWqktmFmUQdrsNLK7q9BzqhhiGkGvZePB6Xcn0aVAopa8
	MMmUq067gi4Nq/T74R5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjl-00000009CUt-2iCb;
	Mon, 15 Apr 2024 17:03:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiY-00000009Bfm-1Mpk
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed11782727so2926957b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200523; x=1713805323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teU93TtwDbXbcibIb7AXZv+o/BW+BbmtaOdYSVoKyTI=;
        b=m8N6nuJl4IJO/5kvRUFw/h08UjATT7PJd6pkzq+vV8QPwhXlyfJgQDfVmK7TJH7f/8
         fBjsdBbu0v1Y+bTPWv8riIYo/JQmkttXXVTHDs5EsDE/rXfXKfqnqSg8beH/km6IO6i7
         nTHWqZQrev6lXtHZHonWM+w3Y/SkWXVhxOYXW3uNkBQrVxEW1X3TEoxG2Ii6Cs65kyta
         hFwF1BZc5Dz3fm3QnXudssPDm2cazdQoAOlEYGs21YFcLuxDa1zcFSd+MVEOk5niX1BG
         QrNbwbtXTr8XiJZaWmr560L0zkPH5B3RiDjorfQ4rQ6jazBqMCQybDpro23vRDO6yhuj
         buAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200524; x=1713805324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teU93TtwDbXbcibIb7AXZv+o/BW+BbmtaOdYSVoKyTI=;
        b=agrvldBnw3GORxtHiDh34xgnljPk57KgWBMnJ6IZAQqiC/FO13sAndFTZ6EMvWd3I+
         A15pEkS2ZHW0P7vhUqfyBGQxvw9jsDAcFjXxbmtIkaOPI3N2mgukFEwmtuyK/OxmKIeO
         5RNKvTZClmpdWb117e53CITjAUeR59hFA50+CBPY0QlxMbtcUh8O0PDbVrXN6FgnpqEo
         lg5Gev2lZicV+tckofskqak1ufMvdj19tRRLPT1cIbZuqKE7cgt3QfmcgvRUejTVr3fk
         OyQxWo6YaSwyDVOGI2uQZty16gIpWc/IoY68+VqTRUQ9Mm1FQMeF5mGJAfkeE/qZVaRk
         +f/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbaqEu4nZqmcRXau/mXqHBgKO/crLv2HXrvj7fftPZevnMq01n7m8Rgy1JMOES4s/jlxWkpqtjG1VgjJsj7ZEj2B5hDmNlxx5ga4jQ1leC
X-Gm-Message-State: AOJu0YzVE7NkJxZqmZS+0qcQUA4HekyXKEo//v/zyt5tzfwoS4RHxhny
	I+UdvBqjdwG6sKGzfns/ZB8qiiQnMsxtvP/SSCbVLfsNjUk7SmaxQDlsPkW/N6E=
X-Google-Smtp-Source: AGHT+IHIdjpEtA26gjeeDnuLKQpBt+rlByzg0zdHDQS2GYQedk9D3DuzAQNVqthcjh2+Xm9tW86rPQ==
X-Received: by 2002:a05:6a00:3985:b0:6ea:e31e:dc75 with SMTP id fi5-20020a056a00398500b006eae31edc75mr12713019pfb.5.1713200523442;
        Mon, 15 Apr 2024 10:02:03 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 06/20] ACPI: bus: Add acpi_riscv_init function
Date: Mon, 15 Apr 2024 22:30:59 +0530
Message-Id: <20240415170113.662318-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100206_645864_C7A7D688 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index dceec808cfab..42d351859aeb 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o irq.o
+obj-y					+= rhct.o irq.o init.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
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
index 914ecd22ba64..f8f92aaf97ad 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1525,6 +1525,12 @@ void acpi_arm_init(void);
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
