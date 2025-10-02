Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AFBCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ob9DqLAIVGmbKzlGRM3nvM4sIyb9K1er2osS6pOnSBA=; b=y+vp9qVPnTTKvx
	EiNCO8xzf8vN6z3kne2PUK80QXElFaOu0/kxgdEzZgbpldO6sk9wJGPt8WF8J4RbAIZfVzEuWD3Fn
	iHW6GyN40b4SeK0a60K+dVqG/lO6oYMiiDprZkbM3TAqptNpJWAa4YxZFK8Ws2NQ22d7OYyiKPPyA
	ysiYe2joVgkYG5W0DnWtnr1kCzJoWotrITIV0/iSu9RlOv6PVn02tpjj9Toe+osL6Hh1lRZ5wR153
	txDn+omXbnmzZPG9WU4ZHTVOA3iESb+TCEgVriLXiu2/it9KamLErdET7PTrpiYbs/uBiTHR04fU5
	Wr06JHU89doNjTC/HqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CV8-00000009hU9-0Ud1;
	Thu, 02 Oct 2025 06:09:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CV4-00000009hRk-3G9A
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:09:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so984339a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385350; x=1759990150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ftqbP+UQqSEu2f4CDXI8ip1QBHLXUd+nnX5oELppTk=;
        b=g6TPIPlydvwy8GFTCo8+ubGO7yBuqad3qQ80fHQ9IkLehWcbZ3e/VJje5+zy7wC8ck
         yzf66Zbyh6M8u/7rDglgei7GMQzI40Wt8VkLlYP/wOGSfNfLuMEuBVNFZTjDrfntrNkd
         CXF+004Udh9LcKtyJafM+SOh/teuq3KUEK85FFpbSF17y4LWMc6Kv9WlNtqUr13W88dl
         OZ/IYkzmjZan78p2A1xH5Z6uI4FU+2+1a4F5LQSVF5jts/L6gK2di88bl3ODYqAielDT
         hPUUtEzQuKml8FVUI0us1smq4uiIo+GsQ4BsCgiHDnNjta2/DxvvW9aCQgdmSanuVqFe
         5MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385350; x=1759990150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ftqbP+UQqSEu2f4CDXI8ip1QBHLXUd+nnX5oELppTk=;
        b=tYAr5d1fkMUVATwrSLhzur2eAuyuXtjLe4dI4xoTkg3jXXz5BHD8mu0M83oYlnFJZ/
         aji59LszuHssUweojzG3BoizYzGNUeOVGVeFOJ2MLZVoWlNSlOV6WCrpXPlGWE3WSP1H
         P3KG/GMR6auqw2+SW4rNVcukqP1GDDrZRcTPji7M1GQPoYwWgAVJ5fbwkMlGJ/4Vl2ng
         stqZCKdoDhv9ZRB3vtJorg5tYA6oH7Hq3iCS98B9gnULk1hIk3Ogti4yqeKPh5xl/gGI
         Quaj3xoqcJ6ISgvidG+d0qZGGqNtravbA4n57SETWfUQqj07cN5wO+rfeSf339ZA2CXV
         h4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUJp3jaJWADCcVWsVjZolwzbUd4SwlNQ/s8UBhfcPaSSFUWe0JRv0lbQjk8Z372YXArZHSkYy1LAZiQNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3dETuELSu0WZsYvSq1OuExMy39ZDLVAfrbHGVSfGMZ7WWz1PG
	/qhgi+CWlDI1FxC/vfO5tK+h/Hxw7IzQf9b6fGZ7t2Y+GbapYMvo5L/1uHQ472lQPdM=
X-Gm-Gg: ASbGnctWvF3oFuf9h0sCfszkG64HyeujLGsyUsfUe1LRUwZ+6A+Zdj37fLDofOs8VfH
	4tzn+imF9GYZrwvsKucguVsgCMWP1tCCfsBqf2XWNCcaHVRChuQ+3S+ijaL+djQLlh2F+0LVd8f
	4F/YAtKF9oJhHLEvEgWbZhx1pMcnyR0FYxGuyKKloWsqQsz5oRxg+tMyA3rjykEuAHBxe4AZ/w8
	/HhOLA8wEoGB3LiKfiq1VS24f9sWSD9XpnQ9swfelUgR85PNXiftmzbHhWebWp+eERYK6uZFhR+
	BY0BiLhzSN5DfClijD4LUnWTa0fZrj0W2N8Fp+f9XXHHct/EPvAB97q8y5m7VqgAKB83RZwl9cz
	sUe3utxJNhzrri513q/xzt6cV8r9yI4tKLhqae1MzHkx9sQiY71BlVmYqP02LxUY+Id7d7JnYrM
	9siXs=
X-Google-Smtp-Source: AGHT+IEFL89FRAz70PFiXxdbB3Wjgy9mSV6Pk0dwPsKpmwVWnajTDyjSSOaPk9cpQlVIA3PETGEPeQ==
X-Received: by 2002:a17:90b:4a87:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-339a6f36e19mr6863672a91.27.1759385349850;
        Wed, 01 Oct 2025 23:09:09 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:09:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 07/11] rvtrace: Add trace ramsink driver
Date: Thu,  2 Oct 2025 11:37:28 +0530
Message-ID: <20251002060732.100213-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230910_826326_0FFF074E 
X-CRM114-Status: GOOD (  21.46  )
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

Add initial implementation of RISC-V trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/Kconfig           |   8 +
 drivers/hwtracing/rvtrace/Makefile          |   1 +
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 198 ++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index ba35c05f3f54..aef7e9989165 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -21,3 +21,11 @@ config RVTRACE_ENCODER
 	default y
 	help
 	  This driver provides support for RISC-V Trace Encoder component.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for Risc-V E-Trace Ramsink
+	  component.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index f320693a1fc5..122e575da9fb 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
new file mode 100644
index 000000000000..7bd0cf1e4dfd
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -0,0 +1,198 @@
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
+#include <linux/dma-mapping.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+#include <linux/sizes.h>
+
+#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
+#define RVTRACE_RAMSINK_RPLOW_OFF		0x028
+#define RVTRACE_RAMSINK_RPHIGH_OFF		0x02c
+
+struct rvtrace_ramsink_priv {
+	size_t size;
+	void *va;
+	dma_addr_t start;
+	dma_addr_t end;
+	/* WP from prev iteration */
+	dma_addr_t prev_head;
+};
+
+struct trace_buf {
+	void *base;
+	size_t size;
+	int cur, len;
+};
+
+static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst)
+{
+	int bytes_dst, bytes_src, bytes;
+	void *dst_addr, *src_addr;
+
+	while (src->size) {
+		src_addr = src->base + src->cur;
+		dst_addr = dst->base + dst->cur;
+
+		if (dst->len - dst->cur < src->size)
+			bytes_dst = dst->len - dst->cur;
+		else
+			bytes_dst = src->size;
+		if (src->len - src->cur < src->size)
+			bytes_src = src->len - src->cur;
+		else
+			bytes_src = src->size;
+		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
+		memcpy(dst_addr, src_addr, bytes);
+		dst->cur = (dst->cur + bytes) % dst->len;
+		src->cur = (src->cur + bytes) % src->len;
+		src->size -= bytes;
+	}
+}
+
+static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
+					    struct rvtrace_perf_auxbuf *buf)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	struct trace_buf src, dst;
+	u32 wp_low, wp_high;
+	u64 buf_cur_head;
+	size_t size;
+
+	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
+	buf_cur_head = (u64)(wp_high) << 32 | wp_low;
+
+	if (buf_cur_head == priv->prev_head)
+		return 0;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
+	dst.size = 0;
+
+	src.base = priv->va;
+	src.len = priv->end - priv->start;
+	if (buf_cur_head > priv->prev_head) {
+		src.size = buf_cur_head - priv->prev_head;
+	} else {
+		src.size = priv->end - priv->prev_head;
+		src.size += buf_cur_head - priv->start;
+	}
+
+	src.cur = buf_cur_head - priv->start;
+	size = src.size;
+	tbuf_to_pbuf_copy(&src, &dst);
+	buf->pos = dst.cur;
+	priv->prev_head = buf_cur_head;
+
+	return size;
+}
+
+static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	dev_set_drvdata(&comp->dev, priv);
+
+	priv->size = SZ_4M;
+	priv->va = dma_alloc_coherent(&comp->dev, priv->size, &priv->start, GFP_KERNEL);
+	if (!priv->va)
+		return -ENOMEM;
+	priv->end = priv->start + priv->size;
+	priv->prev_head = priv->start;
+
+	/* Setup ram sink addresses */
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
+	/* Limit address needs to be set to end - 4 so that HW doesn't cause an overflow. */
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->end - 0x4), RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
+
+	return 0;
+}
+
+static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+
+	dma_free_coherent(&comp->dev, priv->size, priv->va, priv->start);
+}
+
+static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_setup(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+	ret = rvtrace_enable_component(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
+
+	return ret;
+}
+
+static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable ramsink.\n");
+
+	rvtrace_ramsink_cleanup(comp);
+}
+
+static struct rvtrace_component_id rvtrace_ramsink_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_RAMSINK,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_ramsink_driver = {
+	.id_table = rvtrace_ramsink_ids,
+	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
+	.probe = rvtrace_ramsink_probe,
+	.remove = rvtrace_ramsink_remove,
+	.driver = {
+		.name = "rvtrace-ramsink",
+	},
+};
+
+static int __init rvtrace_ramsink_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_ramsink_driver);
+}
+
+static void __exit rvtrace_ramsink_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_ramsink_driver);
+}
+
+module_init(rvtrace_ramsink_init);
+module_exit(rvtrace_ramsink_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");
+MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
