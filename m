Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B286C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFbHauLpPwdoNvcChxkc1GObu0479eyLIXYOpL+P90Y=; b=wwxtiaXbk/VKKd
	gmF1DEI4hiquR8diqwjlwBcF5MowUeczmBYZDHvOqWnCCK2bcFW5I43oyGq62zkH+lAQvqA/2xGtC
	w2Uz0FxgPllYryJndEIeubK9MIyIGz14HHrGb6bFQiksRQYRn941qr0mLuRjo7meKkDUE9WJr/lgW
	aeda2OmzRWPrLKDznGsJQXv2agZRpDVc8cOGDDClK7WMHefTLg6hH37Tevn00XbXzQDK+4J+O1tZC
	PLktkpVL4N9yEvQTs/AyTKewwooEjsjFWcTnxaIxwTvreoye90G2xg98WQ3Hu4PAHHw7davJ4XROH
	5eo85ENazEsjSSSHbjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSist-00BTgI-9F; Thu, 16 Feb 2023 18:21:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisr-00BTd1-Ft
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id be8so2926210plb.7
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcT4AtxywBaHPbxQbaGHDpYZBRDu3wCeHMqaXv1EYt0=;
        b=DBvjTCZIk+vcPUW8htmerk0xAsi1O8tw5BcDSym3jNNFaZhhj3sFESEoaQ0Yhv+703
         j8AYTC/u7Z/JO44B/X+ZAXpYgAeZo6CliuHuUiaI2SCgIHy08Vso71L7TFcQ5jrXVdXU
         +8DDEuVrWcKm2wX9Z65//j6ETTkMzUIUCeacXa28ze6Z91EQ+V9RcPVlcirQdwLHMQ7L
         Tb3icHXPx7r/fuy+GHWyv6oMBMJ0RbQNMBQT1CGYvHYJA9xXnvOHefF7BG38Ka/VjJj6
         dzyVpCKn22c8RKIuz91QYGwKHayKz4n9RlwrYMCMj1lzUiRCr7SMicUmQQmj7eXcCd2B
         6kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcT4AtxywBaHPbxQbaGHDpYZBRDu3wCeHMqaXv1EYt0=;
        b=ZC5YRzlJP5EjXx28sqCE3FRpYHxJXs7UZRP6/zavFom7M0UVB3jW3ySpORw1ZX4fjS
         WkhTAfcWSeo2+42eZWCxDzyhH7FEOUetrNjAhNxfMsxYTssu3b14d9/rB6WiI3XRwBi+
         L+lhvvMzp66Mn4VDa+p1Tq1smOE60hm4bkLGwvqm7lT4nYUVHQgh6FDgcKl+zt2dCt+k
         rTTVcD09Elx5jjR4bcjmxqUFljZ8mBqU3/u58oHGizsV5QALcR4E3P2CjzSGQ7a0y7f7
         kxrL26POPCfcPMBXCrGIyyTIVxzkwlxBTqXYKS4vQTIkt214usZnJ+oHHXt6BbuL6dSB
         l5zg==
X-Gm-Message-State: AO0yUKWGDmkXfITM5RQM9Se7r2uSuXSuwNG/+koSkxC24EU/t9TokM3A
	4sj+dxQFXcR6E8//eyLYdO3KBg==
X-Google-Smtp-Source: AK7set/AV2KvpGFqrQGHQJmsjVHVKIBcpK63WtqcfvUGKzjHaIsSSBk+G/PwqwPeXhCn+qXzFNe57w==
X-Received: by 2002:a17:902:f312:b0:19a:a647:1880 with SMTP id c18-20020a170902f31200b0019aa6471880mr5075210ple.24.1676571686430;
        Thu, 16 Feb 2023 10:21:26 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:26 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 07/21] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Thu, 16 Feb 2023 23:50:29 +0530
Message-Id: <20230216182043.1946553-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102129_551294_9D054475 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

processor_core needs arch-specific functions to map the ACPI ID
to the physical ID. In RISC-V platforms, hartid is the physical id
and RINTC structure in MADT provides this mapping. Add arch-specific
function to get this mapping from RINTC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  3 +++
 drivers/acpi/processor_core.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 7f9dce3c39d0..4a3622b38159 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -15,6 +15,9 @@
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
 
+typedef u64 phys_cpuid_t;
+#define PHYS_CPUID_INVALID INVALID_HARTID
+
 /* ACPI table mapping after acpi_permanent_mmap is set */
 void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
index 2ac48cda5b20..d6606a9f2da6 100644
--- a/drivers/acpi/processor_core.c
+++ b/drivers/acpi/processor_core.c
@@ -106,6 +106,32 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
 	return -EINVAL;
 }
 
+/*
+ * Retrieve the RISC-V hartid for the processor
+ */
+static int map_rintc_hartid(struct acpi_subtable_header *entry,
+			    int device_declaration, u32 acpi_id,
+			    phys_cpuid_t *hartid)
+{
+	struct acpi_madt_rintc *rintc =
+	    container_of(entry, struct acpi_madt_rintc, header);
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return -ENODEV;
+
+	/* device_declaration means Device object in DSDT, in the
+	 * RISC-V, logical processors are required to
+	 * have a Processor Device object in the DSDT, so we should
+	 * check device_declaration here
+	 */
+	if (device_declaration && rintc->uid == acpi_id) {
+		*hartid = rintc->hart_id;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 				   int type, u32 acpi_id)
 {
@@ -136,6 +162,9 @@ static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 		} else if (header->type == ACPI_MADT_TYPE_GENERIC_INTERRUPT) {
 			if (!map_gicc_mpidr(header, type, acpi_id, &phys_id))
 				break;
+		} else if (header->type == ACPI_MADT_TYPE_RINTC) {
+			if (!map_rintc_hartid(header, type, acpi_id, &phys_id))
+				break;
 		}
 		entry += header->length;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
