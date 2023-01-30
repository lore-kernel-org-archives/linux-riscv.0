Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A41C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph1A9LIK3OscDrUalg1ltVezx+f2yGzqichcfUKhH4k=; b=gg91rpLgqGVK1v
	upvwCSwkoy9Dow+IDVFsTR5ahtYy4Ax7GmhtJH/amiYnTl76C3trPNejOs9Kb8PSLV6p6PXeumy/W
	rkXM7CqwCB49QzSAjAtF0dhg0Aj4VhQVir+XZrNoPiJ1pnjMq3+yugjJ+qob1vMNDRppnq9cwZ1vW
	0LDOxM6/gzmY2Wf1vkJmzn7kLLhsC6EuUJ4iiDbVXnrsAyQzBuv/Vo/WaVXWl0fXJJq0d1ISNDVR5
	H4YK3UXU9ugFma5bytITz6itSxvfAjORTAHhZi2lQp3KR1bqukjAzYSPqAQLbClHzP9mlQXQ2qtML
	Xms8qkkQg5mmi5Vzas1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqh-004yIp-OS; Mon, 30 Jan 2023 18:25:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoM-004x1s-68
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id e6so4317849plg.12
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USVS3mywTvdLvSTJeGXikExLlXPpzcs14a2ZRggZ7wY=;
        b=AdzPUrbp24xrj0FAMDk5+9RcVSjZCso58BavKvUv8Y2Jv3EBQs5Tt0/nPExBhQxEPI
         j1Ik71BoJYr9yc3WpMmfgQ24R7V4dmBuWpXBIo3eGXjF4q7GziPZ/dui+mh0CyZyuHvm
         eppGpPrLfUiliaq4Tkv0jgfObfdOkbx9KN4jdMMYleuS3fqZS1d61qS2s25o6BIth0Sh
         cmtfpu8dJcz8pmxvK+S5DqQKX/c9I0Hayd5E7TlqjRKz2eIdmONgZbi5uObiinByYY2S
         FGXOHytfliaegYVhWjoHeGGIm+SJdYaXtUrnp5p8EdDnHKzCdKJG66bYpTCn93ACKM9n
         QA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USVS3mywTvdLvSTJeGXikExLlXPpzcs14a2ZRggZ7wY=;
        b=k2nsFPFYp/ITPAFQMQkA0F/KZGU/4gYXdO+DmqnohwTp7R4DfYPQU/ua+oOWSiHrzD
         9de5ECztfRFfWPUH4epOXMPTFuzhGJUd7wmTqS3JqZMTneL+T52fTFUJat8/akSbnz2N
         WbDQQkjk7BVRvjy49nhOhgzQlrVKaregyKtz0BmbYUPDlcHu8hJvFceNZw25REiqfW/0
         I+K2zwD8kaXDWl8Gtp1m280yk93dGQyO/NVcDTW7UtO4hGYJjmz6zilfukC787PqSkFq
         2LjrRVRlB5jeNktoqM+pFVCtOjPCbK8CarO2bySwKcM78K7Ty/GLgKVZJFaXXl7bbcMv
         bT6A==
X-Gm-Message-State: AO0yUKVjqmjoaagHcjerPgD3ZSA69rrHonDq6kbipj49BqCl8tQR3hvF
	mApYnvfipdfKnFimota3A/axSQ==
X-Google-Smtp-Source: AK7set/iIY4N9lMJIQuuLqIcFatEy8RspvzQ7ycNCuigstyEk6Y9hWi2TzCwIFuNa78QmQWe8UUyAQ==
X-Received: by 2002:a17:902:d4c3:b0:196:49a9:bf26 with SMTP id o3-20020a170902d4c300b0019649a9bf26mr20839616plg.15.1675103000228;
        Mon, 30 Jan 2023 10:23:20 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:19 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 10/24] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Mon, 30 Jan 2023 23:52:11 +0530
Message-Id: <20230130182225.2471414-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102322_268368_A9BE5118 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

processor_core needs arch specific functions to map the ACPI ID
to the physical ID. In RISC-V platforms, hartid is the physical id
and RINTC structure in MADT provides this mapping. Add arch specific
function to get this mapping from RINTC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  3 +++
 drivers/acpi/processor_core.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 8b9babaf3f25..c5cb9f96d404 100644
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
index 2ac48cda5b20..889f495b3481 100644
--- a/drivers/acpi/processor_core.c
+++ b/drivers/acpi/processor_core.c
@@ -106,6 +106,31 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
 	return -EINVAL;
 }
 
+/*
+ * Retrieve the RISC-V hartid for the processor
+ */
+static int map_rintc_hartid(struct acpi_subtable_header *entry,
+		int device_declaration, u32 acpi_id, phys_cpuid_t *hartid)
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
+	if (device_declaration && (rintc->uid == acpi_id)) {
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
@@ -136,6 +161,9 @@ static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
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
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
