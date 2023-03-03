Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3120C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulp9W6NhsV5evMoLmpHA5Ibyj5lqBHUCrRFTc6HBt34=; b=TtOwNRO48rxE7I
	OiM7ReXfu8+jA9imjh9Bj9dyBL9/jmIFzFHUPnJZ/NiHCiXyUm885+AC8Fq5SN36ENecg2PafIIxx
	s47JRVsUapYk5EOQ43D2Iyxlj7zTx4gPgPRLFIldvCq2iB+Xyn/3YRxARWXociiJFv23HqmDpV1bm
	KQzViEWn9tUjRO1tUhnm/Y+Timbxe572o99XH1clmWnfcqaHhaR3BFXFgtDVh3S58HHRB2NUAI/nH
	0LbdSZ2IweDYjNe/gf4cNvGeSp7PhX8jncNDSlV09fPc73fiZ6jMvbU9AVTVUPz7lju/H2iWn/I9u
	+HZA79xd0fogIb4Sai6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bI-006TEZ-Pq; Fri, 03 Mar 2023 13:37:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bG-006TCJ-1T
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id p20so2627725plw.13
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBemuZ+2YkCjmi93Yb84bL6oYK/bVtvUR58SW7DcwbA=;
        b=eYfH8EfFgcshApQyiD3xCOf6+OIvUW8qg/k65nzJniZ/k9eVqQDqG4PbYKxUTWA/9W
         Auo7twOv5LJOHiXqBtC8Ig76Sh/WrEIqXL0PV4G2LCXte845FsmbU+aJK9gn2RTneuw+
         3KmPv1uXHl3IhytdLToTKGF6DqkpUKH8RpMVMn5FWXldGuUrRVv8mJ4+W4rPVlgs4ymw
         C6GwEmhJsRMjpGxHk29vSP72+mRzMZhTomILvoRtKDfsOQarwqiewo3PZ2m5s3njvp6w
         P1v+7XeYAu8kBDoikWbO3+jIBxxJrYOzyGCCBkA+AroMdTv3B2FvCRGth7xpdO+A0/ca
         YN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBemuZ+2YkCjmi93Yb84bL6oYK/bVtvUR58SW7DcwbA=;
        b=CM/pIIn1mVDQQNCaPftMxnRzCGvcS2DkLyliZjQ9C9/bmf2S9Yh1jn5QMNc3sP8hcR
         Wvf27ITeonB0rD/33tUybyNz7DLcwLADILaxRcaaAGhHtJPNW2uBNn2VH3RY1BFWCpjt
         ufkK9mOA75F09lzF5qeixywOj7zX9GHisL8vRsb/bQgXy3TWOV9oY5AId5QnBvj45hHg
         uqQL6j1Of3PN8TG4zCVE7gYimBxPuLsJIAOED2XNHRsQMapUchGtu3OsFF7+mNNAhRyw
         idZ2uQD1solkJgILpPBVozEYwlBFbYlCZJZgiaz8YKjm4JRDqxXTZJzsTuUZu+9Wch1J
         1qZg==
X-Gm-Message-State: AO0yUKXjI7SMOJT4maWtXXx9cUXmDiVa2jW7RKJibnyZ7+oLwXI/h0rf
	NtM426djx0C/pyA9vOCfOFnErp59BjzdSBD8
X-Google-Smtp-Source: AK7set9oosEAFz5om7ghzkTjM/ikMsO16Y20aDm8j/67h0FEs1pP70F94+f/EPbTvvbSLSV8NQGNjQ==
X-Received: by 2002:a17:902:d2c9:b0:19a:7d0e:ceea with SMTP id n9-20020a170902d2c900b0019a7d0eceeamr1996033plc.25.1677850649367;
        Fri, 03 Mar 2023 05:37:29 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:29 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 07/20] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Fri,  3 Mar 2023 19:06:34 +0530
Message-Id: <20230303133647.845095-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053730_126015_09200626 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  3 +++
 drivers/acpi/processor_core.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 0b52a190f71a..7671c401f4ec 100644
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
