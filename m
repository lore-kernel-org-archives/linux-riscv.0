Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ECEC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rqe1X76bn54u3ImgP9uK3yHF0CqnVTHb/zyqPml17JE=; b=WbQOyDR9eGE5U4
	WbN4a6w7NEUt09eT8G+2CovXpgy08KNqHiuibZbvobeZ97P/HahhSB5yybs1PnNP7XWR/bZrCe1Qu
	p7X0WiX4wK1STSk31TeWVQZ2HrN48J57zDte/VZYTYtWPUTPRreijQsSktIIW/vTkECc8GGNS+oPS
	//JpJUzEe+AO7uRfyIBvaAwkMsIl1tKmc1cbyqKTxmAKSlTehDKdAAoYAbzXpPruis2xKBn13D6hm
	S+LuWRo2Uygalyw0kzeOlMc3u5XcVcpZIu+ZSpo6mw6Stv337BU/V/UngvC1fxzseR8jrPXb4qh2I
	5+8NTIRd/K6d2UGCI86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRG-000SAO-11;
	Mon, 08 May 2023 11:53:58 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRD-000S9F-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:53:56 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115eef620so33795970b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546833; x=1686138833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=JiQARQ4bGK+5crktw+7cwuQmByROt6U3e6Ck6CkUSKgq+vqqGrp7mRQkU3K4gb/AF/
         6cxIoSse+C4MjTlJVBg3QYSR7p7G6jCn/p44wxSYx9PQGwB6ZmnkIUPnpdgRvo6wMWqy
         0L9UwtLh0lVesJVxEre1vDBtMHsou9/GN5Ik4Z0P6ry7rbfpq2Q2HaUlgMOYNF9QcwRK
         nAFdRlV2btCkQ0lEpoY0F7zVlss+e2rWgZqK9aKWX9zQpBqYxXfOEryFswqrQKMNMbto
         4XSSp5d0l4YLXXnQgnJzURNzut2UPTZ2o1aQZ2v6QK7NmTkPtfXc7SmaUBiaVAwtQMy0
         s+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546833; x=1686138833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=hDYpGtB8bziFbBTZojBBoMEgAKhwgqCnxql6N8ajLIHDAnEqBmz15SUCjbsCKak67A
         RGfxaWbi9t3YqCQeApBIPUbtPKfsJAsQFQNlzEdrHqddwylucALVpO7boruWD4uIkBw5
         t0h9a/ouahs1rOLnhAOn9U1AFLY1X1qOVOVK+DmPL9yIrbl6tXyCvg5JuBeip2lKOuYK
         AQ6gKmerRwoVCgR8gJq1hExDQkSUofQC5WokrqFKv0aD0hSlcYM49kIJBSizj8nP/nRK
         cdQW8fICc5PmNdAGSQOAJL4Y/g2qIVQguaUZi5UnOQaqSI4U6HgR4lqJyN+aXhLx5ICY
         Yn2Q==
X-Gm-Message-State: AC+VfDzI0WjRg7aE+zUW7S6aW8mKzsNqJl55fUH2NPBHb82KHWsrBSFM
	ZR67bZfQcqxU7po6NYXOwjWrbQ==
X-Google-Smtp-Source: ACHHUZ78mQRTxmDA8cJ1VBAYZeP/kutmyD+kv4sglD4jLeruz7kfJ7OgcH7foXykJ6aN3VTuav5H7Q==
X-Received: by 2002:a17:902:e550:b0:1a6:e564:6044 with SMTP id n16-20020a170902e55000b001a6e5646044mr12623756plf.7.1683546833102;
        Mon, 08 May 2023 04:53:53 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:52 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 07/21] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Mon,  8 May 2023 17:22:23 +0530
Message-Id: <20230508115237.216337-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045355_210184_92156B1C 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
index bcade255bd6e..9be52b6ffae1 100644
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
