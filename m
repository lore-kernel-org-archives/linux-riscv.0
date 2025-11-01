Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE4CCCFA03
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjDaifDWQcBHWxonUkqScpC9bR9Zn3qjBg2wje9tYpw=; b=LvEzpyxTB/fqxK
	09qMx8LHIzANxtKmxnDjh6Rb4QOIi/F1+/ORfqfpva4RnFPxag977RWJB6HZYLiECu3alQJ1s7rA9
	wTlIEoceIOJku5xoi/4yVFYWt0TwWOIPM6zrsaEtUjJhAFHi8dd81ryX+mFUfV4rRX7wUm2FZEzP2
	T9Hg39Ja4KwHTzIuwhTTQ7pnVREUtOSL3nbb83jW2Ea6mshCSTalvHk6GhRuVx8i9YS8FqEf2s7k7
	IV+coy4sJMgrdz1tfbVOaPIyymDzjDnTUivGcVSZZ5EEIZCKZkODqIe8mfvn0592cCY/54Hdqug6Y
	ch7/CwL+x8koRgh/GAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDla-00000007syn-3k4z;
	Sat, 01 Nov 2025 15:43:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlY-00000007sxK-10aF
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:45 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso2260292a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011823; x=1762616623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKOoQPMUVsEmi6hMo7Uy8Fdi9yV1PxzBRenc/eHTo9c=;
        b=Zj2C1IMwnxvQPpcWnyGq22DVfXjIHtbyEBZvK5FRYWPtA/vRV+ujasnieI7hwoGGgy
         0WCkrYuZIJNyXbGsml/i8GJxJ2v/c95Xvb1Trfr9eFQIsUG4C4bAAbXvrdV+98uuJXM1
         R/mniZDRmmPn0YqBmL61Yh6pkwp69IE+In/YU6y7M69MlRByYR/77+4JDDZ/ZgOUV3ay
         oORAFoO9MUeucmHZ68+6gOefEQYHhSDaEXJocK+qC3e1PgexL1IDybpLY2FEl0FFplfw
         0Noy26FCRBMnRETtKsnfWUUECCO+BoYf0gwA+fmq1PgOMLoRXWUex8pbROKuP4Mx3XFG
         2TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011823; x=1762616623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKOoQPMUVsEmi6hMo7Uy8Fdi9yV1PxzBRenc/eHTo9c=;
        b=XiVUuF2jgugv4p0QFstwaJxGISo/rE5UA1GmHIOP+kFJ7rGGoTXJwWxmDXzYicMn8b
         nXC0UZp9ypuuZgsZWn5xujQjbjjnNCgx6H9WwA+CCFwjPTxtow8xkii5DuaPWZIkXjj7
         A21GHz/fUxAVYZ5OUFPT90DJ/i1Ln5CMbfZYFAu6cdbcmW+rc5s8kXwu3JVJKrR10tHH
         jkfowmQlLUWW9KuFEpQHCiRRvNUy8WCwn8rzpdTMR4GBD7SO36qol842VJE95x1V5LFr
         ITNCmIIjYjHSndHt9Y5WPG+akD3+nChi9D7SM0lJ1tGVw3UgaOeZ2sqi3tlD7PxbUl53
         /0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIi2ICKAXBYemfFPNwuEYJT6jDbVVYxqjLEh1vjcFlMxRhvvR05M9BKenA9FSTz9M0JAxjGGNRaudLdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqoZqsuaU3CbPC2Cg1Oan1UQvvvsYhMUw7VSxJSBU0VRb86nui
	SaUgwmbBYYUU7lqGl79b4omInYi/p3s/tRw+s5DwlFrPbXKEB9k6+ERNdyURgySfFt4=
X-Gm-Gg: ASbGncvYzn+yEtznXtsS0rsKyg2pTUn8vEh9Uc3HCtZk4QDNXs9Zb9JvHbHIt6sP4pa
	HacVH9xR1IdDLcAwARvxtqSB+2cIQwbpEwuPCxRYsLEht0a9YIyaJXY8NHK/2ZzETBSxD2A7YlQ
	a0hemD724ww3hLORzqilOYNIldqZ21avIp0HjXNxP28GlajdS1+rh68PwCKZIN2SzjNlh6ffr/O
	Pvnvpw/ATHvoSZCe77mZ/pPADf0PzEcDT2S5SCYfAlk58PMnFr0gkUE8Jstsn+uzBzJrM6n/ZAp
	y4feuMNDbWExHIj17SW+8L8oytAx0lDUUwvWaAY0XSoI4hC3HPKdk4xEJ99azNep9M9ymbA5p9E
	P6PAER9Iju9ctIEqo2bFOCJ8+BEJcFyULzNRAYVH7bnIASzGx5O5GjjCm8CCFZan9l/DiJCtGN8
	7UmbCjqrKd6qsK0DKLLPUuJU0EHhKvW/6/PylNxks6JLieXKkNCdtG
X-Google-Smtp-Source: AGHT+IFJbHT4F5pXbCNLO8qvOGYbikUZ+tUCbxIpYKWdYciUFwFGUUJMQoZvXRQKkQTGN7eTPXehmg==
X-Received: by 2002:a17:903:2441:b0:295:20c5:5453 with SMTP id d9443c01a7336-29520c5565dmr98352145ad.29.1762011823274;
        Sat, 01 Nov 2025 08:43:43 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 05/12] rvtrace: Add trace encoder driver
Date: Sat,  1 Nov 2025 21:12:38 +0530
Message-ID: <20251101154245.162492-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084344_303210_4B7666A4 
X-CRM114-Status: GOOD (  19.06  )
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
index 000000000000..69ceb5821709
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
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
+	int ret;
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_is_empty(comp);
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
