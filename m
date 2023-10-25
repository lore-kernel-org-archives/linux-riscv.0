Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD8CC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgb+zNV2WpAMTokbJC7x8vC+avydHunn248CGDnU4N8=; b=0KczDPcwTbh5Sn
	y8YF2lC4aX6UzzvzAyPjVQ5vdgr/KjWAsUku2QsoRYVz6O0wR/ETdbm4NY+PD6oFvYojOmEIoqxyX
	cn266A5LJZN+Blj5yCZc/En5bLxJsbLAFEip/CGEGHqfgG8mGcoNmaTCRxm9XQekOZCh97sLu8rsh
	zufPUOr9jlnkauHQ7ZSXJX85GEnQWL1ULASnC7YM+3OcXtN8AY//gC0eVtvYiQZXbtkStWZvzmtjO
	GrtKXAwP7tvI8j1fimv2Ks2uo6P9BZAxsZ80kvo43/+b7CC840ZpYgTyDTtwK4LX/ooaNhR86umWn
	OHbBUVhTJgVo5NxGJ9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkSp-00D4UU-1p;
	Wed, 25 Oct 2023 20:26:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkS0-00D3jp-0c
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:26:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso140054b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265559; x=1698870359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iZbx/IhbkeIBI8+FFzeu8yqPtMDZXtB3E1NSIPmMj8=;
        b=RpBPwgn2FDo9mi6VQ0r/dK0O0Lj6xF99UZmWdapXXZvz1i3rXbaQlpXogx1FM9Rmft
         RXAnUE/qYWspiSSnrJb83aW3F95KfhX71hy5YVyMmCBcJ2IdGqhhIa6UMG1lZO7ycjHt
         B0ckpqy1XK9rgS3dP5dfEpTvGTxEV4CeTfMzzbri/9wcclTY8ciPg2kz7sEExEybfrJs
         Zaxr04K8gjtT9ug/l6VmEhC1lLdUAihZ7W23QNmo6hDdh+ganjE8ZTA1upcEzxYeGPZz
         jjfp7l6Vv+J1hVG6Qsgh29r/QsxLo7chaT4E9aHc193gzzpuYN/CHDmGuw/E49E6ogjH
         hZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265559; x=1698870359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iZbx/IhbkeIBI8+FFzeu8yqPtMDZXtB3E1NSIPmMj8=;
        b=PBrmqg8d5xPJ7rLxopi3iP5ttOvGKpKGOM0baF4QeY5ccJBwhs6sJGLuomtx5ZFfMw
         E/TA64/blUq4UaTVp9qMr6ZzrxclmdZkOhj5cdwFRh+ZxUZapB0e5sO6Xl5eA6i3z+i5
         fHRQJN3fJwyBaWhJ6vwbnK6GRFVmAcZJB3aHZOsw2g/ZeLHo6wo3dUMrptloJoWfKio7
         U1eRMUybwgA/lqM4TQMtVBBUMpefZzqxz1L7Ked83Ii0VBpudFfm8sIkl82iseX9jJ27
         ThjosMPe2xketq+kzF13stW7WtGqxxqHepxYGwx4sspxLXnyCHyyvSJE2urKdRw6wjuG
         7AJg==
X-Gm-Message-State: AOJu0YzpNxmSq9Aa1vjfm+NrxqAVFJF8WgDMF7BDxSuuID/+MFhWRloR
	HxbZBG//T8+W83VBV9z1Znzzzg==
X-Google-Smtp-Source: AGHT+IFsNPal98bQ9F5MiljlxhKf86YWd9QVm8kQWxT7ZeiK3cahwXFdqVcGHEG00PzdPooHKx2sEg==
X-Received: by 2002:a05:6a00:1798:b0:6ad:535e:6ed9 with SMTP id s24-20020a056a00179800b006ad535e6ed9mr16898802pfg.16.1698265559236;
        Wed, 25 Oct 2023 13:25:59 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 19/21] ACPI: bus: Add acpi_riscv_init function
Date: Thu, 26 Oct 2023 01:53:42 +0530
Message-Id: <20231025202344.581132-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132600_265269_99325766 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index 19c3dda9c2ed..c408070ac52e 100644
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
