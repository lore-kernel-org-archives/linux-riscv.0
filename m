Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06983CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YA6Be14jEB386c5FCFu0t+bDlULydZZtIg3dfKPZDE=; b=KyJMeUtkrl1U2/
	OD3D+qo22j35fHHXaB1yy1/g4Kgdts/3MZitlOoevy+2+si15B9fyWqMCjyZG73FExm1PUqZS+OOk
	zDCL1YrNIwDSwRlHOQTb1yCrdH2zwpHJVfAO7u/T1sivwOk2EaVYBNS6rCeUTXxXETTjWwkH6HGtL
	tMQYgOx2DFI9+8upb/bi7X65NohvmQbllgiIHKU3PUuJOBILa0NnoSFcJO5KMx4HEzBKPHKFOxXAn
	Kz1yUxNYxLnQKXm9qagNH90DkybxXW6hbTmAPjMGgKoZeyzO27cx/BQJwkBH9nd8cMI0Y0970MB5L
	HTykoDnncCDNUW4uG+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUu-00000009hJR-1wLM;
	Thu, 02 Oct 2025 06:09:00 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUr-00000009hGp-1iqh
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:08:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so488327b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385336; x=1759990136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpifXrkDvDh1xYGpNX5UKxh32Xx9f0TyTyPM+srBPqY=;
        b=OD5WpdkJJa/kjoqeRo6vFu+5iWnfkopMeer/p6lN70w3Luo+xeWOKqK+YosevTT+k9
         RF0kI54xLyEsbNyAsKYWU9wbDxY2xsufN7NYd/s7s+QH0MsRSKj2FkJ7vPxP9SpgY8ZT
         Y71N9HTvXjenX7rcysyPYmWsIvuYhT9qSwDLDks+K3O3gQAlFhlz/YOv5mAGq0uDxxFu
         opucN4/GsaO5yJMgp+WpwB1L/4bKNjAJeibwE/fHtShdzT9lQHCxD2M+KXZYCIzIh/fi
         BlzCNdGKg2sC4U+L/EiYujPpRyeZLdtptBUG42YoJCr7TVkYOL1o3C2wJheSuOTyC/B2
         uIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385336; x=1759990136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpifXrkDvDh1xYGpNX5UKxh32Xx9f0TyTyPM+srBPqY=;
        b=g4QpdxP/5I1kFTDldgcnaIbZoj1kNf0cDZcYnACjkMobLJnnVYjQx8/gOAGyFcBSLc
         Ds/J1PetrhcK1Eodf8HG0ncRQ4neh/f1F7YsvV4eLaSXBQQC83mgPA2uVnLHzGieeXdJ
         4IVqZ3YLlX9zIJbdokYE1zKmWdG/KlMd4cJxMzyrYW+Ul4+ONv+gYRxP7UAglFPkWKfq
         CxnOoraLpAzDxfzTyg8eeW527ZsrQAlDgq2ldync+50g6Vq6FKSffogxFsmXDFzCQB1h
         hdwWVIHuAHpXCeyZ/DaT9VO+qz/X9wo8/8dgTtDavr/5m3kpXD7cXcynXDN/CsRAdcnX
         v2pg==
X-Forwarded-Encrypted: i=1; AJvYcCVaSgB9O7zGWKF6xMcN19i1+op2cWUbl4neDFjftNs1ntbdfyO9Hty0tZqvZlg4rQuOXecQEe15C64jtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaAOkvipFfWec1ScDmK/9zq/bZ4tH92s6I1/2NHgfuxTl+uF4A
	DzlEzxxil4ZF/hBrYK9UNmGqQxwrB0blBIBD5KsWCEkJ/zxQfbf6QtKjFyf7fJT1jQU=
X-Gm-Gg: ASbGnct6jIRbjp0Ofjuexl8Z6W6ZVoAeOSCsMbn/fKK3fKDHxfY8hskOU8G1AS3yfag
	WC/jLAIkcZW5fH2hKFUuFGOiYIZ5Gyvop/WVeYakLENl+widTY5FXaNct9DymEdMVgW9jGinNH6
	wTmh4o7OT5ImLl90XcmYWOlt4vV8Knu6HyXQlJcYoDXzSSiikSyxpIgcNese4mPcOLKGCBTSB46
	ohLNp7kvveAiV/P8njm81TIKllmkQqy3PAxfs6NRuk2DshfYPGvNQ8mSNY13iykZMMziOu0lfMZ
	vZfCgC45qJ/2NrnOq/Y43CeUSwAbG1cJW/yxlN/0UYu5wc7/0YM2fLL4yP2UVe1S5O6MWGaUL1g
	vI2aAYJuQs4BUsYjCIqtPKItQbHC6uLiJ1CI8ayYf9kVYTW+mTeeKdtwrwS15j1wmT/7Z+112EA
	Od/UZ5OKEa3bEr4Q==
X-Google-Smtp-Source: AGHT+IGsK5zmN/1TMI8l5ShAU1WG5heF+BcYOUnln5ovyw9K+EhBee4z4X9UbHLvM+t1E8NyUqH7Qw==
X-Received: by 2002:a05:6a21:6da8:b0:2be:8ead:1bec with SMTP id adf61e73a8af0-32a261f1677mr2900159637.24.1759385336405;
        Wed, 01 Oct 2025 23:08:56 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:08:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 05/11] rvtrace: Add trace encoder driver
Date: Thu,  2 Oct 2025 11:37:26 +0530
Message-ID: <20251002060732.100213-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230857_501070_F7C4E1FC 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Add initial implementation of RISC-V trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/Kconfig           |   7 ++
 drivers/hwtracing/rvtrace/Makefile          |   1 +
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 107 ++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index f8f6feea1953..ba35c05f3f54 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -14,3 +14,10 @@ menuconfig RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for RISC-V Trace Encoder component.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 988525a379cf..f320693a1fc5 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..45d1c5b12c51
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+
+static int rvtrace_encoder_start(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+				comp->pdata->control_poll_timeout_usecs);
+}
+
+static int rvtrace_encoder_stop(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+				comp->pdata->control_poll_timeout_usecs);
+}
+
+static void rvtrace_encoder_setmode(struct rvtrace_component *comp, u32 mode)
+{
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (mode << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+static int rvtrace_encoder_probe(struct rvtrace_component *comp)
+{
+	int ret;
+
+	rvtrace_encoder_setmode(comp, 0x6);
+	ret = rvtrace_enable_component(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
+
+	return 0;
+}
+
+static void rvtrace_encoder_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+}
+
+static struct rvtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
