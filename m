Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2477BC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rqe1X76bn54u3ImgP9uK3yHF0CqnVTHb/zyqPml17JE=; b=katBJb+2Bzp/lZ
	nEiSNdRQ0+UfPRtva9WULEamsBLJuAxeCKs7sgbveCO2PnwYwQ6JIqqvszCT5cCYmHFDu43Dy19co
	GNrNwnGRYueajmmBSL2f+CfcMy6qakWidVAXmPY/mZc1jFCUrMTN0+J0J5C6IfYKtlBEtbI/tT84a
	wLA5ACttWHbJ/lL4+LQKaARdUQklcImnNTvBGy6ho6xFDADPDKBNKfz7kJz0Pqisi4a3aUk83/aI2
	hNI2vQvlZCEQIYmhNBCLT88kjwp3PHl6oD5wav302JRWDj8YvRPIWbw642JaAs4ZgkXDfu9jc5oCD
	KEQmgM/dk944gt6kkk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6J-000zsa-1t;
	Mon, 15 May 2023 05:50:27 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6G-000zkt-2H
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:26 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-52867360efcso8659515a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129824; x=1686721824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=Q4t00pT4ZWzwlaux3rA/dO5uvJj95jGbFN41gz6rgArxZ5h/XZ9tyOePsHbJ3Rkesc
         FLedojP0taJ50To+Akrsw9VkWHGyH6MUVr6aKKY98ZxTlY/jIL46s85d4wD1X+R3YG6g
         3T2wnihVKr5jk9y53f0UCcyh6RbOhxCfIQRXHNA91KXsHtP89ASXn3lI5+2GSUO2C6aj
         Rn9nazjcJ38ZNkQQ8+/t3qwUQenK3qNgGFvus1IHKGS3lSz8xIAfmbQeSkTGgkrhip9/
         W5lLT/wLeFvrviSoVpcbW+OozGXGAnQtqLonpkMBum8HBBGL244pQPb74LiLIZljtdGr
         m1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129824; x=1686721824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvg+GJpfRbLLmDkZ0StW7roD1sWqDLKd1ZxLgpiB2U8=;
        b=epe4zVwgd77H0MAGDFy3Gu7YhpmDAwpIXji8gLp1KaCKRP1hqzsbxI/MOa7fD+xEuD
         IKmp/NJd7ye+JWIq1QOUyke3Rh8/zo5yF4PbxiJyfeQkIGhjT+5rbcwMCQwKhXozQZhL
         JcKN53pSqIGbfhL5d8ayV2ISfkcjUXrlPHoRNR6FfdrTRBnc2oAdR6TRLWHsjCWZbiSl
         dQFsCoclkXUMWDts7/jXmBsj8PhfNApDL/ypBSkGcG7e5RfNxFsGgVLdGNu8lPYI8eCZ
         titr/PTUclKygrNgCx51IuDnwN2gSNIsBtne8TVZ12NNsNKAfFdymFLlduU00Va/qlsN
         i69w==
X-Gm-Message-State: AC+VfDxAmw8KnW3gImyXBLtkt7wRmctH6kSI9gXTIWwgaeNl5ltAuUFY
	Qk6NEsvxSGjY6T1UFMxadqUEzg==
X-Google-Smtp-Source: ACHHUZ7xz/6Qsd1dRQfSsQkL104oUqFv86xYEJzP/eDAKJ1EDSsQ0zeVEE6vjHTQLIdZflWGHacgng==
X-Received: by 2002:a17:902:d38c:b0:1ab:675:3e31 with SMTP id e12-20020a170902d38c00b001ab06753e31mr38877950pld.37.1684129824381;
        Sun, 14 May 2023 22:50:24 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 07/21] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date: Mon, 15 May 2023 11:19:14 +0530
Message-Id: <20230515054928.2079268-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225024_743544_26D95D21 
X-CRM114-Status: GOOD (  14.60  )
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
