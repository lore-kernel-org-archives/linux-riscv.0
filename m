Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4257EE82CB3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luwc0SWxIU/+JMA3US9ktbehTJHD6CVLVvV/jS3AS2c=; b=Pu21cyeHAeFEcr
	yMN32ejgnQ1Lrv3q1cfnBGsyX535LJGq4L1QiEBJYOqUECmGdl7Xa5IMFUloFd1FZ9C2wecYLvqXG
	I3uJ+caxZDnRyHFMCfmHT4D+aOu80KokhMtHTOmaQV+IVjZyh2+qmUfsOWxNa+1bMMscUFCSH25w7
	4Vrlb+udTvwoUwmqKSGMGVxF9UCvRt4wB4dV0v1+Grg+oa4uMQDk4opga4rV/PYng40MDPOGmWjWO
	UEyLrqaG5aHD5hXv8dg1UAWPtALEqT+Mgl30LlYLxGEjTCOpTuleqvohx4GI6uZ5e2NViJB8H27Bf
	WETmGQv7Ee5xbRBgQTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtw-001TDy-15;
	Wed, 27 Sep 2023 17:00:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtt-001TCU-1R
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 17:00:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so8328894a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695834033; x=1696438833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sLv+V8gGTdOjGyr5tjbv9gRJE2ViFoNFxWNgg6Hz8=;
        b=CzUmCI0QdOFeGuGmULUdN3aTBBE+8+FSdiaZpk6sHcmes+8UF/lLKsGW3VsWzZJala
         EkLo594T7gIzZNZX/idgLCRUMBVmGOUys70rEBCj4edGqrvcChbvZ081Pfjp+zfz++yi
         cjKAsXx+TpT7161JGY/m+6N7/pHOU84QC64Fy9JGdgz0kWNpiP5KU0PLpcgVMzP7foK4
         IV4TZYlLcjAsRbVdma9tOzstzwvZusbziR8kVxFukL6ozru4XOQ2Dx0Pg4LSjU+J/IwT
         fFV6rvwX/ew2OCXxZzpzKf7YGN5rUQMVVxgQ0k0fdCh2as3Sis2XdZHH/SqThOvdn03y
         HLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695834033; x=1696438833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sLv+V8gGTdOjGyr5tjbv9gRJE2ViFoNFxWNgg6Hz8=;
        b=GAAYNl2Zm98r2BcksHoOdnxWAfQsRzYC25JwUIZJuwJSY+JkL8xpuE2JEO9Pmw0hZ8
         ieoV17deaf0waWaZP1A8xJbKKSeHeJ7LwAbx/+1S7bCKniFoFNvDO9OQw6eplM2iIjBk
         zyEybWgiDUa8sq+0plb7XkeMbkKBSC9f38KzVmV40gj1kZqWEgoV+AH6nYuVNtphxUqs
         Z8ZihZXwXK0TwoAUU0NG0FdZ1f4DLy0uTErDEViW7xhSB1FZQgpUn/0EJrndAAUYaf0m
         tNWVf9OODxUwPaNNk82j2DMZYDa19whf1pMmolRs7ITKCrooiAMp3zJMDK6C/FWrPZ9/
         1mBQ==
X-Gm-Message-State: AOJu0YyFZuUZvimQ9GJcHMqB3sadWYYVeVSe1cBYK/BeVuXZVPV9Zz2/
	EJcc306tXWsg7QZXYR0a2rW1oC5VOPDsYKAFS2A=
X-Google-Smtp-Source: AGHT+IEa6asAbG8e1D9Wtlofxs/aqoo7qS7D0/bHcFiviEGPFGXQU+G/6kse8wYhSvo9I9okP5V4Sw==
X-Received: by 2002:a05:6a20:7d95:b0:14c:daa9:5e22 with SMTP id v21-20020a056a207d9500b0014cdaa95e22mr2978244pzj.45.1695834033151;
        Wed, 27 Sep 2023 10:00:33 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm3279396pgc.80.2023.09.27.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:00:32 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 -next 2/4] RISC-V: ACPI: RHCT: Add function to get CBO block sizes
Date: Wed, 27 Sep 2023 22:30:13 +0530
Message-Id: <20230927170015.295232-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927170015.295232-1-sunilvl@ventanamicro.com>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_100037_485812_F3522764 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
Add support to read the CMO node in RHCT to get this information.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  9 +++++
 drivers/acpi/riscv/rhct.c     | 72 ++++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index d5604d2073bc..0c4e8b35103e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
 
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+int acpi_get_cbo_block_size(struct acpi_table_header *table, unsigned int cpu, u32 *cbom_size,
+			    u32 *cboz_size, u32 *cbop_size);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
@@ -79,6 +81,13 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 	return -EINVAL;
 }
 
+static inline int acpi_get_cbo_block_size(struct acpi_table_header *table,
+					  unsigned int cpu, u32 *cbom_size,
+					  u32 *cboz_size, u32 *cbop_size)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index b280b3e9c7d9..9042949277f8 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 
 static struct acpi_table_header *acpi_get_rhct(void)
 {
@@ -56,7 +57,6 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 	}
 
 	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
-
 	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
 	     node < end;
 	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
@@ -81,3 +81,73 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 
 	return -1;
 }
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+int acpi_get_cbo_block_size(struct acpi_table_header *table, unsigned int cpu,
+			    u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_cmo_node *cmo_node;
+	struct acpi_table_rhct *rhct;
+	u32 *hart_info_node_offset;
+	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+
+	BUG_ON(acpi_disabled);
+
+	if (table) {
+		rhct = (struct acpi_table_rhct *)table;
+	} else {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	}
+
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (acpi_cpu_id != hart_info->uid)
+				continue;
+
+			for (int i = 0; i < hart_info->num_offsets; i++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+							rhct, hart_info_node_offset[i]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
+					cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
+								ref_node, size_hdr);
+					if (cbom_size && cmo_node->cbom_size <= 30)
+						*cbom_size = BIT(cmo_node->cbom_size);
+
+					if (cboz_size && cmo_node->cboz_size <= 30)
+						*cboz_size = BIT(cmo_node->cboz_size);
+
+					if (cbop_size && cmo_node->cbop_size <= 30)
+						*cbop_size = BIT(cmo_node->cbop_size);
+
+					return 0;
+				}
+			}
+		}
+	}
+
+	if (cbom_size)
+		*cbom_size = 0;
+
+	if (cboz_size)
+		*cboz_size = 0;
+
+	if (cbop_size)
+		*cbop_size = 0;
+
+	return -ENOENT;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
