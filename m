Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D1C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0Qde9q1H9mwubdsAlyAp+ZxmsU+VqJ9x38BrCpnDcQ=; b=X0NlVjiwurJWHY
	MAeBFhUIDoqY+JZSuf5zx7qmNhh293VbpDvNpqnvG4GlUNz2GpQ25KBHknuupYB29D/H52sXprqX6
	p0PCvGeCnmKSO/D6/Q9ZD3c7R+ECIz939xFKUTT4i6jvXrWipsDVTgg0YL2iqaDTmY5OZLiIvXaY/
	prdrf5J1rrGUTlZLsfo4uAwvKVArfeJKYSusQeHeCnpwYMd6VYmP9qw9HwNb7+hQZJwCATJ30e62d
	65uc7dK1FexOqoPMghU+ZRbMHdpF3+R3VwPk+qNAYxnZgZ5kNxzH5tBmucA9Jb3PpfzUUjmPSfRfA
	lnV0IuKyGXeu0Majhhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwpc-00000006byV-1CA4;
	Tue, 10 Jun 2025 11:07:52 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwVT-00000006Wv1-15Zq
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:47:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-747fba9f962so4478737b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552422; x=1750157222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOPKLQETC23awiI7CT9ZOjIxOZ+G4ZqvM0do3bqdxho=;
        b=g6VSU49+RoNKLo4RhDSgmnEQmz0QSghpxUts6q3vWNzg3Ue75XGjtRzY/h9nsavxcf
         wUk4DFJHZAzANQaahm5/GPW0l1cG9SVys8Rx/ZVGFGBdBY945OCZdHSgjCMFGO93YlF6
         r5gUAuqVbU88eQPK2nhxTWzoaxhu1EGmp+WYHvuLQjQjoXxK1IdANL/9F7FQLIruSZkm
         +tJX3F1/P0xe2VQLwowV8EKqHqdA5s4Fm6z+T/reZ1fncI8rGalEuAvicltXRWB7aX2L
         qyAum+7e3+NAno2v+ob3fdaxlIjuFc2SPMePJ8j2ei6C0szTx4s2Qp79izf4J6m9HQoC
         LchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552422; x=1750157222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOPKLQETC23awiI7CT9ZOjIxOZ+G4ZqvM0do3bqdxho=;
        b=ObDKQvSq/eHbXxpoLrmXFoPH+J+/QPqtTXgXVJge9lFXx5XvfdjpE2gfee3IjzLtGQ
         mGGX5latlMqNwP/JJASWSuV/m0bicmBlbf4TM3bSzn0g8ecYAyz5vrXOR0KkDdNLrLXE
         PK+OjINqtiZEpHQnIrjVVFGJCqzWV5UHS6QMy66a0s8OihfXq2SWAktEGonnv0y8DGcH
         ZtpTq/Kov/gNO1/XkURCJWWCPzi7XXMwbb2jglOTkvVzyVmGGG4cQ4gd6O3aCs9M4ymm
         ysbRjWpcVuzZ/DFFyPu98dCB2/jU1X/j40bKaA2ZX9FgivN4m0xQEDbY4PzZr6OpoeXg
         3Hnw==
X-Forwarded-Encrypted: i=1; AJvYcCUvHf2uyhI7NSzrNznACyPeiccpuaGhzDIYkH0cwA5nDo8j6NLDmqGpA/4yEuHHX0jaXlbSTS+ESZZYCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr86MVfutiQq7mcpg59cL1MjgUwxVRru+eu4lP1ZThAbc6gbuL
	Vis1ku3aCxASjtm99RI/gqOummHsTWr+XWjf4IjRIWCCbeqi55DrFihfRV9eJ77n9AY=
X-Gm-Gg: ASbGncu3tC0jY98gHeZzVvtvZletC+59PQf9mD1jIFz5YapZ58RJqW/PX3tk4kdeaIo
	3YEM4cxoPaySyw/EvCOitE0Z+n0+AuD+JPSw76lbMEvSGRUkn9bugNigDlLB00ZuhRAjzyKthU+
	uHSmbeDUT5zHc3NERUN0voiRYY281f12WHSYJW6ehfcp/QOAQ31YDAhtTW0t+qIqYe4u7NZm0h2
	LurZxqXU4mcgYXX5NgBhDHOIcVVXfgLNBbEkzNg7/LvsWzxMxFtd4tJ/k+QH7H/4B/ygi9pWfZn
	3zW04CmpTxk66kOI2KoYnvT0LqzEC7G4t3y0IZg0WVp9n5mjbm9BokJNRQZVJ0jT1OhUQ6P+
X-Google-Smtp-Source: AGHT+IEY8u8v01mFisc/TL0W6gCvBjvkLcKdurAn91xGLMr57xfYjH/zVaAAA3K7rATTcPpWb32wlw==
X-Received: by 2002:a05:6a00:9292:b0:746:2ae9:fc49 with SMTP id d2e1a72fcca58-7485ea78f73mr3883622b3a.9.1749552422541;
        Tue, 10 Jun 2025 03:47:02 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:47:02 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v2 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Tue, 10 Jun 2025 16:16:40 +0530
Message-ID: <20250610104641.700940-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610104641.700940-1-sunilvl@ventanamicro.com>
References: <20250610104641.700940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_034703_302898_307429FA 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Link: https://lore.kernel.org/r/20250514055723.1328557-4-sunilvl@ventanamicro.com
Signed-off-by: Anup Patel <anup@brainfault.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..70f57d58fd61 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
-	if (err && err != -EPROBE_DEFER)
-		err = viot_iommu_configure(dev);
+	if (err && err != -EPROBE_DEFER) {
+		err = rimt_iommu_configure_id(dev, id_in);
+		if (err && err != -EPROBE_DEFER)
+			err = viot_iommu_configure(dev);
+	}
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
