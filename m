Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23A0C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9HPoqN6al49QxWyv1fE8sC3WlgphejTQqiS6hPESzU=; b=Z6rzk4bc3H/4n3
	5KMmTRm+82xZFBBsy3zCk0jncMeEDYEheRJtdB+K+xpsCU1wj3Zp+UqK+I1hnkAwFb6N55pud4vUN
	GzTUR5G/46oO9IA2CI/vpmTuPn3VAF+BtzEE21ijHK5LGcTtxCdMYF2CbkmSheGGOzKMr/rEDamJx
	RiESHq09yqucgOEozO4BM75priB1C0WLzUDv4Hbg54RxU6Xgh4NvVaEYVttgohQ1g148frOqQbRhY
	Yg9wR1ykEmuM0UGZ8JuOdFDMwwp+TKhkzW9WXPStMNnj2tgiRXak3kbUjdgiZNPYd/Wk0I/a4Puvu
	i/0JrE4VPA5N3TlSVkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYrj-004z44-B0; Mon, 30 Jan 2023 18:26:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYor-004xJ5-V9
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b10so11892783pjo.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj1LIEiLCoH05jrvnS3NlcMWxNoKVbL+lD4xO5ixkXk=;
        b=Fif22sd+vUzBxEdZTO7ggfqnbyFrI2PJ8YxpRqjkwlowbQ/NkixyrA983sr/7ZeVmd
         leFJfBj9Lx9vkhEST6x3PRoEM1u4f/SDf5gomtoKWkZpW1oBzl5+xvoK5OnXzzfaHKVI
         BzyrTkNWdmsDKPjNYL26bqS6U5FnoB3dQumvpCbEptNphWmtp8/MHGkOiv8t2pyJRJ8f
         sC0JWzH38GqYdhkv+KzYl67hIKWkV6j9JgKyR1s9jMx7B/NQgHRyQm2kErlHlyXY5jiT
         XKrKUqiWGTQF2nv6LwhdJW/qcn9V9rZdhfVrADahWNvR/mfBgmqrheiz+ZYUrEImnzIQ
         pJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj1LIEiLCoH05jrvnS3NlcMWxNoKVbL+lD4xO5ixkXk=;
        b=Z7c+wgGB4Sq8O2eDv/abZAf7q29zEA9FeHd55BJR0lIc+1qu15WgVm0LSLl0Vy+K/N
         /vJd+j/GI1M13bOwjIbRApCKgaTPJIk5m6v9EdD5NhXPjhJxOKOlwkJZfGuFRTe66Xho
         Wd8XWIVuTX9aa0yRTPUx1wiXCjbeERpSQgtbBVOFU1rV7z7zO8X+vQrK3lI9indAF+Ht
         XFe8wKQfg6n66WJbWh/zATVMWUsjN+l67NrVdGUjVRLVhNm22/Jjhi9Ma4BaV3tGzVMa
         fJbg677j3NISMBnsAm3H35hYQM3fI/sGB7ySyKjaiBXgFWgIph/wN2AnY2OIl8zaZEAj
         Zb8w==
X-Gm-Message-State: AO0yUKUIT9qqaFjYS8mcn6s86NGY4BaVqjqSXkD3xMMMUODBeJC0mkin
	OxodHpMZRbVPh8q8F7QCU/VMcQ==
X-Google-Smtp-Source: AK7set+puhVa9cJ8iCwi92Dm20DUxJcSdv4a3WaLuK30pYTL5oETRGKnE0e7xLE+vt4N2Zob+KA6/g==
X-Received: by 2002:a17:90b:4a10:b0:22b:f608:2aa6 with SMTP id kk16-20020a17090b4a1000b0022bf6082aa6mr24859836pjb.18.1675103031096;
        Mon, 30 Jan 2023 10:23:51 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:50 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 17/24] ACPI: RISC-V: drivers/acpi: Add RHCT related code
Date: Mon, 30 Jan 2023 23:52:18 +0530
Message-Id: <20230130182225.2471414-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102354_046017_27B6427A 
X-CRM114-Status: GOOD (  21.56  )
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

RHCT is a new table defined for RISC-V to communicate the
features of the CPU to the OS. Create a new architecture folder
in drivers/acpi and add RHCT parsing code.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  5 ++
 drivers/acpi/Makefile         |  2 +
 drivers/acpi/riscv/Makefile   |  2 +
 drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 69a880b7257a..4fec9ea3b874 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -71,11 +71,16 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return	acpi_cpu_get_madt_rintc(cpu)->uid;
 }
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa);
 #else
 static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return -1;
 }
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
+{
+	return -1;
+}
 
 #endif /* CONFIG_ACPI */
 
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index feb36c0b9446..3fc5a0d54f6e 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -131,3 +131,5 @@ obj-y				+= dptf/
 obj-$(CONFIG_ARM64)		+= arm64/
 
 obj-$(CONFIG_ACPI_VIOT)		+= viot.o
+
+obj-$(CONFIG_RISCV)		+= riscv/
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
new file mode 100644
index 000000000000..8b3b126e0b94
--- /dev/null
+++ b/drivers/acpi/riscv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y 	+= rhct.o
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
new file mode 100644
index 000000000000..7c64be64d9d9
--- /dev/null
+++ b/drivers/acpi/riscv/rhct.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022-2023, Ventana Micro Systems Inc
+ *	Author: Sunil V L <sunilvl@ventanamicro.com>
+ *
+ */
+
+#define pr_fmt(fmt)	"ACPI: RHCT: " fmt
+
+#include <linux/acpi.h>
+
+static void acpi_rhct_warn_missing(void)
+{
+	pr_warn_once("No RHCT table found\n");
+}
+
+static struct acpi_table_header *acpi_get_rhct(void)
+{
+	static struct acpi_table_header *rhct;
+	acpi_status status;
+
+	/*
+	 * RHCT will be used at runtime on every CPU, so we
+	 * don't need to call acpi_put_table() to release the table mapping.
+	 */
+	if (!rhct) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			acpi_rhct_warn_missing();
+	}
+
+	return rhct;
+}
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int acpi_cpu_id, const char **isa)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	struct acpi_table_rhct *rhct;
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_isa_string *isa_node;
+	u32 *hart_info_node_offset;
+	int i, j;
+
+	if (acpi_disabled) {
+		pr_debug("%s: acpi is disabled\n", __func__);
+		return -1;
+	}
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (i = 0; i < rhct->node_count; i++) {
+		if (node >= end)
+			break;
+		switch (node->type) {
+		case ACPI_RHCT_NODE_TYPE_HART_INFO:
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node,
+					sizeof(struct acpi_rhct_node_header));
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info,
+					sizeof(struct acpi_rhct_hart_info));
+			if (acpi_cpu_id != hart_info->uid)
+				break;
+			for (j = 0; j < hart_info->num_offsets; j++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+						rhct, hart_info_node_offset[j]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
+							ref_node,
+							sizeof(struct acpi_rhct_node_header));
+					*isa = isa_node->isa;
+					return 0;
+				}
+			}
+			break;
+		}
+		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length);
+	}
+
+	return -1;
+}
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
