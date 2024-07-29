Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BC0C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aj1IeIADVgRX/KL11N5/T76js/v/dO453VnaPoDB2Dc=; b=F5jHIldC0zKCD/
	aZ5d7xfWmmnL77UTlaPG1QQpe2oggfE4xI9wTvAG00bFZPygj3n3YwaxD1TllxDRps7TsrvfYwgB9
	8MX7HmRKl8ppCaiRM/wq6ui+7ksslkbM6P4LyDEHrbLLiJydkjpNgeMOAMSFFS9x22bcRmXCm3uZi
	mwxzuxwe2MqydNP/WHXpGkapoDMDgMPACpiyT1UCGjw/OWWDcCd148dM22/iiCC7+pQJ8r3lKqHQ0
	/fCv/Hnj2c4OvG8Qrtn2MjpgWxazr8huD3Yk5uPkz6ey2uab2wBDt9l61r5Q+AubLlbpwKbSw7iGn
	gbTww0N+Rrnqw5+jEDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRXX-0000000BfuY-0Hgr;
	Mon, 29 Jul 2024 14:39:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHd-0000000BYjA-3ht8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fd6ed7688cso21056225ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263009; x=1722867809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivFx7Eb2KNlJll+d2W+eJ7NSuljATLtswxxJxue4OO4=;
        b=L1aZ2ElKlKULsCwMek1A2Q1ZQ7mCoeE2sV1nfx7hmxXbI1zRd1t5+GEGP6KI7jKCm/
         RAZwD7X4W9143cjGnhqTONVKHXXR49FE8grOee27NYcbQlSC/GQxOHU8XvHP72Xf4kWK
         l0XlbZ+K7d8LKnwj1otNEaSUtTw0yncbAJ1Vv8dvEcWD/X5y9zZz7V9usAOAewhDPNW+
         BVNg3azE4ZyxqPj3t4wvkVOXRxO2RVLybSWQBOE7/qntwx5Zq3SNYXBFQyNRfunGL1Y/
         Kxnd9yIVtMTB8y5zwf3x5HboUy1NRdoClGmLeShgpKlInckIZmTQHGxVOKSf7BNiaeUM
         eGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263009; x=1722867809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivFx7Eb2KNlJll+d2W+eJ7NSuljATLtswxxJxue4OO4=;
        b=iGA3I6SDibK/PNYrf4RXGdUKR1JqE/dczJYOhEYjV6o+bYmtiExt4rsBmXsQeWd4ZY
         Faa5lluw1bBT5vQOgWj3wobmL+DXBBs4OkNHicjPlO00sVFU0rtO0//lw06zBLDhInWU
         MSnhkD48ATx8x743V9my/nsEau/uDb38KbAm0n56VSeV7T6Lc58HOJH+e+1hJNQvwFbU
         uTuHYL38brpTCKx3ku4sXii6xR+ny+dWVINiLrjEtsnfdcWLrHUg1aCXud5KiAqPCMko
         ushCnisyKFKwm4m+DVayQ/Whc5dL5iQzTbiI4JP7zyiYpYQAu2BngZvRaAeE2dG7ic+o
         PcCw==
X-Forwarded-Encrypted: i=1; AJvYcCW+BcjMnDBNLbLZPP/JBOC9oVQ0pAW/XXC9dyjuBO9Xw4WEj2QX1q1in+2A2j6ds0OcqKV608kaw2kqTrCAg8lRdnMK22Axcfl7535n4vYa
X-Gm-Message-State: AOJu0YwwywpUco3HB1lk/KiLddgaobYBK1INFJE/RVW8b1K8MQeL9Q58
	fMsXw0gP+xmT22HkwDsDvAGFO7txshfUsm8GES0uoA9G922v2zsdNqAtJPYXdeE=
X-Google-Smtp-Source: AGHT+IE8RqsmNLGZwn4UKGI9HbMHE+3KC0OV1lt+Ckv1MptlwMQ/WvrHjQX+XujtO97bjUDIb+rzyA==
X-Received: by 2002:a17:903:234a:b0:1fc:369b:c1de with SMTP id d9443c01a7336-1ff04805ab4mr61618075ad.5.1722263009198;
        Mon, 29 Jul 2024 07:23:29 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 06/17] ACPI: scan: Define weak function to populate dependencies
Date: Mon, 29 Jul 2024 19:52:28 +0530
Message-ID: <20240729142241.733357-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072329_947624_9929A984 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some architectures like RISC-V need to add dependencies without explicit
_DEP. Define a weak function which can be implemented by the architecture.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c     | 11 +++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 39b3ccae9f79..28a221f956d7 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2077,11 +2077,22 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
 	}
 }
 
+u32 __weak arch_acpi_add_auto_dep(acpi_handle handle) { return 0; }
+
 static u32 acpi_scan_check_dep(acpi_handle handle)
 {
 	struct acpi_handle_list dep_devices;
 	u32 count = 0;
 
+	/*
+	 * Some architectures like RISC-V need to add dependencies for
+	 * all devices which use GSI to the interrupt controller so that
+	 * interrupt controller is probed before any of those devices.
+	 * Instead of mandating _DEP on all the devices, detect the
+	 * dependency and add automatically.
+	 */
+	count += arch_acpi_add_auto_dep(handle);
+
 	/*
 	 * Check for _HID here to avoid deferring the enumeration of:
 	 * 1. PCI devices.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index d6a4dd58e36f..af72a5d9de99 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -994,6 +994,7 @@ static inline void acpi_put_acpi_dev(struct acpi_device *adev)
 int acpi_wait_for_acpi_ipmi(void);
 
 int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
+u32 arch_acpi_add_auto_dep(acpi_handle handle);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
