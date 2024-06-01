Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4680CC25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0SrgCWjOYxh1kudrw/KfLlywkoEeCzh6QrrrElGr64=; b=CiyNtRe5NVP/OZ
	5mg3ZG2asQF60W3E1kkNTEXsJ6DEyUQiz9R+t2wrlAS+6z6KwwAt6OlSHl6mpGAcY3SoVonlBQ2ni
	j4+8YXUT/TniRXJWfQrntbYcn+MU9Edr/nR8koP0+7BXQSrgNQXGVLORD/kQFpXi1Hrpq0lW5W7N5
	buir8awMHQAtDGNyy8qIIrbqEJ/adc9KwYJTwHVGXzsECSM9fm+ENirgcKpnF3ypJW7OY+TSz8iM8
	dVyI5jhKN8eBMdjH3yzTiTW3gU+QK1iE+7UJrXliNIqi8xncpxDlxOOt1e0x622XnEEFJMsL5YfF3
	t9zmwISwbiFxCpoqYX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJn-0000000CqOg-18fF;
	Sat, 01 Jun 2024 15:06:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQJ0-0000000CpgL-07lD
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:06:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7024494f7daso1614791b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254360; x=1717859160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PWsEZjmDFCls294wVt5rkIwO83PA99zSOvcBamPy6U=;
        b=Lo0AWaW8/Z2YIqyfoX1wGiC49tEtVeWB3KB9DtU/cEOQ9SA/T7iFdAwJW6luBO0VvA
         TG4e/cvkpHX3BVi9e/y2jr9DNQ1vSlKZQd7lG82MZ6AFikqb7TP6Z2w5FyGWsLQJANfG
         t3Oy/3/OKldIS1rBadbdaXUMT8Rb1+kqcb9BvneWVesVTpQRYi9XvaBTpgfwJZq/jyUI
         pwuSvib3UMuTvSo0hOTNLNCrZ0unouz4PgLcWNMGbB+KCJHSbaPcSYdWe340uUHBfmII
         3ZBi730FPkj/ZT4Ps4SRpjaRXthz0fMJwPTz03PJMcbV9gytGNmPnHR3osr2oqjKvDDw
         EWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254360; x=1717859160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PWsEZjmDFCls294wVt5rkIwO83PA99zSOvcBamPy6U=;
        b=pxW7h8kcT9ww4Oft6NHCRiy0mSo8gB7m0MT0B6b8u0tF7SRKoG2HLD/NI8/HyGc5MB
         JyTMgqLBIaJfmYQuTtTKDib+QD9aVaes/gscPdBER86mNMv1LAq+spc2hwU20UHfbdMi
         NL2ua+ArDm+7zB7moYeCwvwt9lvhJqIwnWoqvHWasDAEIKRf/epW9a6mAaxew9JgIVEV
         aArDRJ3ZTg8VNAit0Z9nsuBXRCb5uzutCpPqq60Lftnc4/smQCGsSyFwy9PM5Ix+Hm/V
         4KYGOshADfH0HA4nsT6OOqs4OBkoWnWfq9SqRu2t3jHWs7NiBhWL84ljD0i/NZeFFy4T
         voXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfKZl6qX4c//Sdkp4hQPgN1D1OkO4dmEtWpJIgGI5XS3BX/pF5wnDOvYCs50GHSOfrtpqA2rp0jzQYj7BTtdsl8W6wEn/kcXzpcrtrqst0
X-Gm-Message-State: AOJu0Yzj1A0nkwAfHEK79VA4zgC3NFRQ+Nf1Okl+zQHKZa8cEmrTjFJk
	8lai1b7/qDcG0y4eOVD5cyxNQPSEmeU9FARfN0oz4VUz4HajJl2WKbrHf6iq1d8=
X-Google-Smtp-Source: AGHT+IFCMwJXYdknheI4VS/aPP1tbqbAGPqO3DadWwdo/Evl6cETwOaxePiXpISSwiqztkqdIn5wYA==
X-Received: by 2002:a05:6a20:a115:b0:1b1:e7de:4d36 with SMTP id adf61e73a8af0-1b26f0f1b28mr5381872637.2.1717254360532;
        Sat, 01 Jun 2024 08:06:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:06:00 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 14/17] irqchip/riscv-imsic-state: Create separate function for DT
Date: Sat,  1 Jun 2024 20:34:08 +0530
Message-Id: <20240601150411.1929783-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080602_724237_D3424E2C 
X-CRM114-Status: GOOD (  15.52  )
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

While populating IMSIC global structure, many fields are initialized
using DT properties. Make the code which uses DT properties as separate
function so that it is easier to add ACPI support later. No
functionality added/changed.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 97 ++++++++++++++-----------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 5479f872e62b..f9e70832863a 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -510,6 +510,60 @@ static int __init imsic_matrix_init(void)
 	return 0;
 }
 
+static int __init imsic_populate_global_dt(struct fwnode_handle *fwnode,
+					   struct imsic_global_config *global,
+					   u32 *nr_parent_irqs)
+{
+	int rc;
+
+	/* Find number of guest index bits in MSI address */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,guest-index-bits",
+				  &global->guest_index_bits);
+	if (rc)
+		global->guest_index_bits = 0;
+
+	/* Find number of HART index bits */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,hart-index-bits",
+				  &global->hart_index_bits);
+	if (rc) {
+		/* Assume default value */
+		global->hart_index_bits = __fls(*nr_parent_irqs);
+		if (BIT(global->hart_index_bits) < *nr_parent_irqs)
+			global->hart_index_bits++;
+	}
+
+	/* Find number of group index bits */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-bits",
+				  &global->group_index_bits);
+	if (rc)
+		global->group_index_bits = 0;
+
+	/*
+	 * Find first bit position of group index.
+	 * If not specified assumed the default APLIC-IMSIC configuration.
+	 */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-shift",
+				  &global->group_index_shift);
+	if (rc)
+		global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
+
+	/* Find number of interrupt identities */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
+				  &global->nr_ids);
+	if (rc) {
+		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
+		return rc;
+	}
+
+	/* Find number of guest interrupt identities */
+	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
+				  &global->nr_guest_ids);
+	if (rc)
+		global->nr_guest_ids = global->nr_ids;
+
+	return 0;
+}
+
 static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
 					  u32 index, unsigned long *hartid)
 {
@@ -578,50 +632,9 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	/* Find number of guest index bits in MSI address */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,guest-index-bits",
-				  &global->guest_index_bits);
+	rc = imsic_populate_global_dt(fwnode, global, nr_parent_irqs);
 	if (rc)
-		global->guest_index_bits = 0;
-
-	/* Find number of HART index bits */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,hart-index-bits",
-				  &global->hart_index_bits);
-	if (rc) {
-		/* Assume default value */
-		global->hart_index_bits = __fls(*nr_parent_irqs);
-		if (BIT(global->hart_index_bits) < *nr_parent_irqs)
-			global->hart_index_bits++;
-	}
-
-	/* Find number of group index bits */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-bits",
-				  &global->group_index_bits);
-	if (rc)
-		global->group_index_bits = 0;
-
-	/*
-	 * Find first bit position of group index.
-	 * If not specified assumed the default APLIC-IMSIC configuration.
-	 */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-shift",
-				  &global->group_index_shift);
-	if (rc)
-		global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
-
-	/* Find number of interrupt identities */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
-				  &global->nr_ids);
-	if (rc) {
-		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
 		return rc;
-	}
-
-	/* Find number of guest interrupt identities */
-	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-guest-ids",
-				  &global->nr_guest_ids);
-	if (rc)
-		global->nr_guest_ids = global->nr_ids;
 
 	/* Sanity check guest index bits */
 	i = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
