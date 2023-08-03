Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5328C04E69
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rl0/xTJ8wdjh7/F7+Kgvqs7I4IzoecIiVBBt7AtmlM=; b=BazlfQ0PwiFcSt
	mYs/Zu2JLjpfSil9Nu4nImazF3OoP2s6sSTQtBW5Jq4/60+V7i/oVsVHRDhQiwwxr77WJT8v+MziO
	+Ukg8TYc5ohbkS1ZlJ+XBariucjGXO1wRwtGF/+3ki4MdswPcaKVrwMYcqRidY2ODKSfpDBFa9CnR
	UgFzI/FnJN2MOYOuMyBdb5zhylZNfhxb5TSDfD0MWz6cl08mFrE0XLZhf+7vVak1kZ1a7iBH64ssl
	ufehpoNlPdS6G0H9kLvtTRHtq49SU1MC8P3GFMjqySI6X8RdqxBsy0dP7klp7X23MNoq3y4DRERLn
	cgM0WlYXPcc8rrHK8FLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdf-00AVh9-1X;
	Thu, 03 Aug 2023 18:01:31 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcda-00AVcO-2p
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:28 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68783004143so891520b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085686; x=1691690486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aQz/o5NvlReZUl/stpeRs4o5FY0c8qnUYDCfHqNmJI=;
        b=Yv3oRH7T1TZNQw/AeEOc/wdAwvfBHh5qCQDTqqhRRIWLN2RT7duj6j3Mlz5B+tyUjx
         DwzXxTjoAWH+iw6CkKfwMxF9xCniQjo3B09L5BaQ+m3yDEsvvlfRGxAUpVXc7dZmfqkz
         PN5+8DYtk9mthHfXcWzvd40WNmLxpaQLT+X3GYJHhIU0xy+P4PfNU1GlwdTTN0c2vXWS
         N5M/tFDrDNAY9aGtxjAy1r+U43wKUASBkf3zWtuZ0PK/OlWurnWRvhkcieTUH/K57kZ9
         QHExlMok+1N1kt3iHzoySeHMoWERDl2+R1ayM9E29ohmdQ7YVT4UT939xn3e7d7QWGc0
         3iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085686; x=1691690486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aQz/o5NvlReZUl/stpeRs4o5FY0c8qnUYDCfHqNmJI=;
        b=Qq2Q0IqEzlawFVjhS7UYQKoDoiJ3n1Pa+JstjCUl+kSUy8EuFMzN1McVlJvvxRN66X
         xuV+QpAhp7VVP3wntuG6cvg/hQgRjknx8Z86taYglXJhA24o2CLZrCs2vArkieRxNhot
         wFbUd46qBzKJQmV5BiRFSZlqDFtPbjG/KZpu6ZtUq43DEzQEje2lwpK4NZObvdCKc35/
         uAp60nVOLG+1zRZ/qvlcXJpQYJ8ejhP22zL1d5rJdwDZte5CHAWJ1W6HTSGtuDXuoMDK
         7/L60Ykzz/Na+8pfUICcr+WgBlPDJSS0x2S8lhgAfgZvRuVkK9zKe/ihrQ6wl/4z3hRJ
         zOjA==
X-Gm-Message-State: ABy/qLY3ehi5Kh0wnxaIV7aGfl6O9ktaaGUPB7Hy1Bsc4YyaB03pV6O8
	pg2xX6uXzGg9x4PNe6AimG7JEg==
X-Google-Smtp-Source: APBJJlGAchtJBdt5IHqdaCzjHt1kkOK9wPe4WveHGvpGtfcTQHQdjS3NSncu/qTOIgVracHNUgSdbg==
X-Received: by 2002:a05:6a20:3d91:b0:132:c07c:f042 with SMTP id s17-20020a056a203d9100b00132c07cf042mr22166693pzi.15.1691085686344;
        Thu, 03 Aug 2023 11:01:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 15/21] ACPI: RISC-V: Create IMSIC platform device
Date: Thu,  3 Aug 2023 23:29:10 +0530
Message-Id: <20230803175916.3174453-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110126_918512_A4ACEC01 
X-CRM114-Status: GOOD (  16.51  )
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

The MSI controller functionality of the RISC-V IMSIC is
probed as a platform device by the driver. So, create the
IMSIC platform device if the IMSIC was discovered in MADT
during early IMSIC driver probe.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/init.c    |  2 ++
 drivers/acpi/riscv/init.h    |  4 ++++
 drivers/acpi/riscv/irqchip.c | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 drivers/acpi/riscv/init.h

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index b5807bbdb171..be61c08ea385 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/acpi.h>
+#include "init.h"
 
 void __init acpi_riscv_init(void)
 {
+	riscv_acpi_imsic_platform_init();
 }
diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
new file mode 100644
index 000000000000..a2f72bb294d3
--- /dev/null
+++ b/drivers/acpi/riscv/init.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/init.h>
+
+void __init riscv_acpi_imsic_platform_init(void);
diff --git a/drivers/acpi/riscv/irqchip.c b/drivers/acpi/riscv/irqchip.c
index 6e15d45cb229..ca96bf109cf7 100644
--- a/drivers/acpi/riscv/irqchip.c
+++ b/drivers/acpi/riscv/irqchip.c
@@ -9,7 +9,10 @@
 #include <linux/fwnode.h>
 #include <linux/irqdomain.h>
 #include <linux/list.h>
+#include <linux/msi.h>
+#include <linux/platform_device.h>
 #include <linux/property.h>
+#include "../../../drivers/pci/pci.h"
 
 struct riscv_irqchip_list {
 	struct fwnode_handle *fwnode;
@@ -101,3 +104,23 @@ struct fwnode_handle *acpi_riscv_get_msi_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+
+void __init riscv_acpi_imsic_platform_init(void)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	if (!acpi_riscv_get_msi_fwnode(NULL)) {
+		pci_no_msi();
+		return;
+	}
+
+	pdev = platform_device_alloc("riscv-imsic", 0);
+	if (!pdev)
+		return;
+
+	pdev->dev.fwnode = acpi_riscv_get_msi_fwnode(NULL);
+	ret = platform_device_add(pdev);
+	if (ret)
+		platform_device_put(pdev);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
