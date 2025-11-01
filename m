Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCFCCFA03
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Qoo3QEg7LVgXnbZzeMEqJQo+B+I/9pHiR6KlwwB4Yg=; b=yfx9Q5NPC9t1ND
	SiMzX2PlJ/ZDgyVF2OHp1qcbGigTKmHeoRw/t0Zcy8OCZwu4DCIHvBf0EHaEhfL87XygHh1KNb59x
	0s3N+nE6YL30wPcjEr/TTiM93tznYgeAw9nx22qBO79+ty7abTaTTfIbU63K+NyFqFXVddziObP7G
	wNNW0KTTP1cN06rrc5VbHV9zgGpy7ThgfpXunq9FC8FqFAmwBKAZkyypO9VeqjaT3DUKxd+p8psPW
	x5xG/TCHVGHS+al6N+VpLvzbz+Ng8Ku7DHU0aVWKiH0Z6IM4ivugo1YnXkzMy0Chs2jwDB6UToeic
	Nkf0+9lelQhxRZNFSnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlr-00000007t7V-28Y5;
	Sat, 01 Nov 2025 15:44:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlp-00000007t5q-0X2m
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:44:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2953ad5517dso14123145ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011840; x=1762616640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ae2lirZMEyfHKsluDGqvTk55hOG0uMkmu2dMvKUo7Mg=;
        b=WqHq5p/8usbvViB8csaqpHTMxIP4jmDEYKPX/H4E8VcaZG3st7ibvbaa8ZbGehdxBL
         iFLCpWJzKa1okyojl55u06kg9RzvymEZybxxdFUCmYWi7TvqBmrpbBBIN/s1zl1E9e7N
         vdgmeTjzMiom43Mj0rcLEaHifRw1d+h+z0MHuMSQh0I8gWm4SjboCZKtqUX6nrTWI1cH
         CoS01ktPzkRFlxIqY194D0Ee6Q1KGQ+34AcYfMEJYfK+kvxgIhy5dRcO6mBkaf6NA3rR
         tBgRvVJKC07i4QGfoJ1Ik7bGDkuywVF7hWu+PaJKT2x/QKpjdbKFR6bDP0Xp7fAUWuqZ
         kSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011840; x=1762616640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae2lirZMEyfHKsluDGqvTk55hOG0uMkmu2dMvKUo7Mg=;
        b=ukH038AIHUcyO+KI4bKoODTUg5pHcmvb5rL7hLOrCBNefFAhy96htQv67c7wcSWRy7
         GFiG+QldshqrSmPkcje4iXyToYeQRkm6oPEuWYSzERCYSmsI53bKAEukJ/7lonxWuNLP
         DtVk87J5ek1TF+mKNiGjr2FcWlMutqSjjhwyBg5Fioe6BMZGiNNmT+B3M5PZkMhwavDL
         wwxRDsDTP910Kll38uysqApaACIv14ZWAbxtzAQYkLfohBfDBw4U/qVACv1Bd6lxNHbf
         UFxhSrPlO0esUr0g4CQb2QSS7JZX0hPeV0xTejnuCeGkTSzux/57k2jwwgwr3G77Rt+q
         r1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDhqDg+RP1Mkv7EEmM3M/zqgr/7usHl2siNNIsgecEOzP7XtNbRKM6jX/ZcWax7Jysxlm2Et7235rLGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQHWhMhcSHWyl3YOIQlPnP7BnqYVpgDVE6IHiFvOW1t2ZJDyKl
	cWR//Gvg1UCJ11CClFNoi8NY3q8XZfGYdY4H6YbnI+Ry61r+PDGU/lWiYLn0+30cGX4=
X-Gm-Gg: ASbGnctYmzQMBhJA0Y1HY8vyPAvMg5l2ERYvCgiS26VI8RHY4qGS/N7M4zUYiqaDHHc
	6XhgkrM51xhEoeinT/KgjKIEZDOwofQC33cDnxlBuzZy/eCJ+vK+xj2mmOi7qahChBWkEerBRFl
	UcLkt8lrAqOoeQOSR/0TSTfo+7nT7ckQKThgYDw4xz+4LJpYRcDbdTwc2sIq6uhe4NDtX3SMNEe
	axcwQHY03jH9QwRBUjXdpZmSK8igRXjWi6UHw4Fnh4HJqNPZ/d6d+5ZzJLJm2kAnsP0YvxZ3E9w
	gCE++I0X46UttHU8tMQZwvEKTShKNKgj0PUQPz/4RLS5IEC2plFvwIWXLuXorfJoNF+ymUNmYYJ
	4cBJhZ8Q7aOy7/AfExGM9c0QYJ/6QSxyU9B0sg9TixZaP4IjUhc9FhY7cfN3hr56Aaq8FKPlcJQ
	slSMcyi3Js0tUNL+E/x5Ervi2wvQX1U+Q=
X-Google-Smtp-Source: AGHT+IHnu/LkNJmWubjJ09gAWYh0sS09HDl6f2CIH0+AtetQ53djcWevN3kIT2bI6ucVlf4vDM7MeQ==
X-Received: by 2002:a17:902:ea04:b0:295:511d:537 with SMTP id d9443c01a7336-295511d12femr48219465ad.44.1762011840123;
        Sat, 01 Nov 2025 08:44:00 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 07/12] rvtrace: Add trace ramsink driver
Date: Sat,  1 Nov 2025 21:12:40 +0530
Message-ID: <20251101154245.162492-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084401_183614_70F73A1E 
X-CRM114-Status: GOOD (  23.71  )
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
 drivers/hwtracing/rvtrace/Kconfig           |   9 +
 drivers/hwtracing/rvtrace/Makefile          |   1 +
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 262 ++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index ba35c05f3f54..0577f9acb858 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -21,3 +21,12 @@ config RVTRACE_ENCODER
 	default y
 	help
 	  This driver provides support for RISC-V Trace Encoder component.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	select DMA_SHARED_BUFFER
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
index 000000000000..676344c9387c
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/device.h>
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
+#define   RVTRACE_RAMSINK_WPLOW_WRAP		0x1
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
+	long cur;
+	size_t len;
+};
+
+static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
+{
+	return rvtrace_comp_is_empty(comp);
+}
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
+	buf_cur_head = (u64)(wp_high) << 32 | (wp_low & ~RVTRACE_RAMSINK_WPLOW_WRAP);
+
+	if (buf_cur_head == priv->prev_head)
+		return 0;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
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
+static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	u64 start_min, limit_max, end;
+	u32 low, high;
+
+	/* Probe min and max values for start and limit registers */
+	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
+	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
+	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	start_min = (u64)(high) << 32 | low;
+
+	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	limit_max = (u64)(high) << 32 | low;
+
+	if (priv->end < start_min) {
+		dev_err(&comp->dev, "DMA memory not addressable by device\n");
+		return -EINVAL;
+	}
+
+	/* Setup ram sink start addresses */
+	if (priv->start < start_min) {
+		dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
+			 priv->start, start_min);
+		priv->va += start_min - priv->start;
+		priv->start = start_min;
+	}
+
+	priv->prev_head = priv->start;
+	priv->end = priv->start + priv->size;
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
+	/* Setup ram sink limit addresses */
+	if (priv->end > limit_max) {
+		dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
+			 limit_max);
+		priv->end = limit_max;
+		priv->size = priv->end - priv->start;
+	}
+
+	/* Limit address needs to be set to end - 4 to avoid overflow */
+	end = priv->end - 4;
+	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	end = (u64)(high) << 32 | low;
+	if (end != (priv->end - 4)) {
+		dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
+			 end);
+		priv->end = end;
+		priv->size = priv->end - priv->start;
+	}
+
+	return 0;
+}
+
+static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
+{
+	struct device *pdev = comp->pdata->dev;
+	struct rvtrace_ramsink_priv *priv;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&comp->dev, priv);
+
+	/* Derive RAM sink memory size based on component implementation ID */
+	switch (comp->pdata->impid) {
+	default:
+		priv->size = SZ_1M;
+		break;
+	}
+
+	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
+	if (!priv->va)
+		return -ENOMEM;
+
+	return rvtrace_ramsink_setup_buf(comp);
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
+	.stop = rvtrace_ramsink_stop,
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
