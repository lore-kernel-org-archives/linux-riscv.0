Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB47C25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHQvORr9HtOVH98sMwQG0iq/4omNPD5XZl9Lg9A9jkQ=; b=YZqNK0roe5vVc4
	3CQhzAlviwGpQFIIq7okBkNvQYLpsCaNMQ7B1eQC9plYh+RkyQzalROWyCGHFo5q8KGQWpB4Pj0Jr
	UcboVJJSbbsZVJdWDzInQ9hYjgUh6mm4q8GDrQQTZvnrevWYg7RnLSo1bBARlc0VV2PlAHeqq6oWU
	VMrOWrz77H38WUc8PVXBOvr2+pYzN3ggDzpp0NUyxn/i+EnHTJ0bHrSq7q+EOe1RLQ0iAayG1KRX2
	sba7APlIkfJMfAuR10zUmAKXCpWcrF9LcFY8eFhS6nfVkgr8Wsr7ulRM4niQWp70ejRRz+zAreZcg
	x/Ep1BiZZ3gssviU32zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIG-0000000Cp1G-3rP1;
	Sat, 01 Jun 2024 15:05:16 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQI6-0000000Cor7-2EWt
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:12 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-37491216a53so3073205ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254304; x=1717859104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/CsLBy86VnyNo2isQPCT1WZPGBpvem+xh2ISHmLXVs=;
        b=KOOoMZxD4hXaZxIikTlth29RBu/2RWasdlHrhp2lii1+ml+8PgBDsJd1ejvLCRCcr8
         2QdE463biQ+6ES36h3FQGDtl7oKzV1Ac0Z3A+9J4kZGKmwkcu4JGglCebIbZZZXJVbHg
         PEnMPK0To1hx5Xv5aFpQC/VcUmxP+Hct0/vV7iOfHth3iTEOAnrCmGHThGrE5qHcEkl+
         RtI+GzxVE5+eZZs+he2Wt0VW38E12ZpPiurV4LXbnMcxexlcqQ4bJA3oOGQM6bl9S5hv
         W1BQbsboh1rRgodUhZh8piiCHdkrkqVMYh5TPd7+NUANCjtauu9/JcnDISXxSUDMg8F2
         VlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254304; x=1717859104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/CsLBy86VnyNo2isQPCT1WZPGBpvem+xh2ISHmLXVs=;
        b=qXqAvPe43ua6qvqDBgBzSx/DUFmRBo40PuoBywGRpxnO7L8UlbQ20W9+ZETOmjiFxe
         jfREiKnUQLDPDVQdYbyXzIlQMyMHKV3MWj5O9neeLjXyjLOWy6bZeucrb4FmZBpCgqQm
         1TDw4G/gpgY3+vfPNMUIIsNgIuWF3bXSlOZK3Btkubw1PcjGpaxe6tG98fRr2okOmTeB
         hGmUSH5r4FoFsDUdx4gLLMrHIQZ/eavLR4y2HI+3JwBl2kviO5sZpK+Y8GAVfTLUYfzG
         9/HR2bOlLVk3noumQQowZ2CXtPmG+XfRhOEFHxtrp1M1TPgXIv7I/kXjP7q86o/6PV+r
         PvnA==
X-Forwarded-Encrypted: i=1; AJvYcCWYpVJ5Dyzemev4P4alVQLYiMWgRi7cR1uwOMn2gwppnqC6qXXHr7o3IPBlTXUJ6YpJWhory9XfQ/Je4FS095mCQ1Kkrlq0mJvdk55JXpY+
X-Gm-Message-State: AOJu0YxUAz3IDvHusOkqrjTG2Ep5Sw4PCKNgrpb+9itWt4cV89pDNmR4
	ffSG/FQrKoGYbuFmRPIJQjxpvq2qKq57D/6nab7lTBIKHpeKUNSYEfNcts7LUgM=
X-Google-Smtp-Source: AGHT+IF3OVauvlGO1nxR3XDABScTnbIuW6VxwtguVbngDcxS9MthKKzwc9GQNZ47KhPfz+utEVmKGg==
X-Received: by 2002:a05:6e02:1a63:b0:374:5672:6791 with SMTP id e9e14a558f8ab-3748b97ee00mr54534805ab.8.1717254303897;
        Sat, 01 Jun 2024 08:05:03 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 06/17] ACPI: scan: Define weak function to populate dependencies
Date: Sat,  1 Jun 2024 20:34:00 +0530
Message-Id: <20240601150411.1929783-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080506_812343_6468C1CF 
X-CRM114-Status: GOOD (  12.80  )
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

Some architectures like RISC-V need to add dependencies without explicit
_DEP. Define a weak function which can be implemented by the architecture.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c     | 11 +++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 6f3152170084..918e71fc54cb 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2068,11 +2068,22 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
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
index 28a9b87c23fa..5fba4075d764 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -994,6 +994,7 @@ static inline void acpi_put_acpi_dev(struct acpi_device *adev)
 int acpi_wait_for_acpi_ipmi(void);
 
 int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
+u32 arch_acpi_add_auto_dep(acpi_handle handle);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
