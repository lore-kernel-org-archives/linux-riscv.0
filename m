Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70141C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+OSK0aiU4gkRd+uXhFUZ0CTFOCPi89KVVOwliAGhCM=; b=4gGUxJG0ryS0+e
	McNfwwxTXxnR905V8y1VoukckSoalsWyhFLL+3I0tRquhtNsVxL+gmm1OY50Qfalc+qEhCfU6OV6b
	Fo8XgPDK7YavblMQ9ubLXCEMH0DuXILCvs1Tl6d3oKhy04KCXut1Kps3BVyzxY/49FsP69BNUglaX
	1FqILId5aIeiXqhOfGurLYAMBB6Svdb32pmpdD7rxdOy1Phth9QktS25x/elIxx6RrFLmz82zxtAm
	uk6hCzAFAndQDlP34inNbPGIefTj5elPL73F9BeqwogikqljyLhdovuSE04EaY435lSvKPTMWp/l8
	N2or7xto+r05xQ4R7/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI9n-00000009Xxy-17B4;
	Wed, 11 Jun 2025 09:54:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtB-00000008zUW-0ygx
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S3JyeV8G49CASlX9Q3aBRXU8M3xdluRAzP3zJpwMH4Y=; b=W5rkUYGyX9BbUE+07Jt0c+qoWC
	nppWMUVuRP8t5u3/06YDWo9d5aD6Gju9UK4Wf88QLOHh9TN5Z5TQA1yTz20q7xRLeOX6W26FpRUrF
	S0GOJ2wfQcTFMzaiQCWJ58JJC65uml2jJYf5PzktXIZhMF3fuRBTkP59zCYk5JBNBSGOc5cybQAbA
	xX8OnLTiRCn2ALxgYfEGyWbCdHzntvR4uhYI1hmEDLKs79UgflHRl9tcEoRqtgOgQ3ZgUQWwFPs7K
	eID9qh7ZRfvNi1tVQW8cAW7VeEacUGQkj67/OLuxx/o21jcHE/7M5EAPfpHl4rdNu2DX9qH0c+J9O
	cemrf82Q==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEt9-000000028C7-19en
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:24:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so467354a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623080; x=1750227880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3JyeV8G49CASlX9Q3aBRXU8M3xdluRAzP3zJpwMH4Y=;
        b=bjKv5lwHPgSIXusWd43df5vxE8AwkbeNN2/iyLa9agdQxIAmIim6uLevHMHfYd6R7f
         Q596fxRIQlgdnvu/QE6fAbPFjJKH3oKJr2bW13HrPZ1CjuE90gFs+xPfJPhrXwwV/jcA
         0T/53hLYtWY6uk9KfLXY3nOZUd/JQIzU4Gf/7t+QrTBoDb9OMKTlj6GzlLct95U49yTi
         AVEU0vhRss2OwF6IFSVPt8QJIGoB9z+sQ2QeiATcHfCALeToIOOVH/SeGsKe1O0ujaLe
         uncqnBckra8twgpytsT7PF10d8qSxEMRmeXEBgspQUjSYkKtGTNKDy9GGbymS8ctQxlh
         nM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623080; x=1750227880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3JyeV8G49CASlX9Q3aBRXU8M3xdluRAzP3zJpwMH4Y=;
        b=PdEgUtN7kmrqKEIHF+nfZK1BfRCtsDwakXmNRkxFCyyZ2TicYy4+32OcKww92d03k7
         W2si6KUz91xzo98WlqLEBx54qkA0DGRVfkZ8iwxUyYu4G/fU2Pnm+ql4uGa1UzM91LTy
         goeB+fdsq0vku/spdGbUu5aaHruPaGkr6CJnQvI2XwvrhKkjmH0sZqF44C8a04zPRuK0
         2RsLZ3BwB7ui8M2itleok9UqVdpfKQhTqp6F1/gg0apTyu7zascRso3M4yhb2ntRvQMs
         Nme6vQeAhheq8NAYBVnWEVgyd8pfvhDMfMlJPMWsg3kH5uDw9DOqU8S02lttwwgr7fGS
         q3xg==
X-Forwarded-Encrypted: i=1; AJvYcCWcnrv1ZvIrpADuFXkD+e9xudowMjJioryYRJKF8U/Ahw7uo58C9YQcw/qZm//PAS+3g5rd0WqJa5kPcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqBNXF9kBeffYWH40sATGUvi4eFrin7NH3aAuL75yOMNZZq9JX
	jEGwimcv+NdWP/Y++KUM4Zwo84QrcSdZEaFPV6YkH4uVY1+P9W/MDWPrG7E1vhLnY6g=
X-Gm-Gg: ASbGnctsnsKo+Cil2JkJNZTZiYhk2ARu0ARGPre9nAwELgvND4mKsUIaLitf5yxPqu3
	GdYvcyhjTDhzBgEy/tK+rCYaV9B2YbsiqYQpodJ2GBBBJB+9+H4GOnXzAivMj6pvWujlhEc/kuQ
	P5Cr6paG+GqimD3uJmeex8KGr3TXGhutmUYit78wsQ6DinFyuN5KU9qur5pV6uWv9pwr93r0qVw
	cbyf63MAUDzOSFS62kSOyxbuWduvNTz0KzeMdyaLCHa3qU8evQpWL9ZMtUVTatJrdnbJ313fjUf
	qQyu9nTtDlwdyxXXI07YUQ6jQ+oEexlk5gBvHhaP/WpOv4kXznpjKttirBeZmQ2fEUrQH/KIt2C
	vQjl5d+3u2VnxobSlmjIsT/FsbA==
X-Google-Smtp-Source: AGHT+IFU2Om0xJWrBw9LyeL4gGNh8fh1PAt+0haWsZIS+6rWc7/q4ECZDWUUrQpSpgIpJR0rYtGlRw==
X-Received: by 2002:a17:90b:2692:b0:311:be43:f09a with SMTP id 98e67ed59e1d1-313af92562amr2619250a91.9.1749623079449;
        Tue, 10 Jun 2025 23:24:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:38 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI service group
Date: Wed, 11 Jun 2025 11:52:27 +0530
Message-ID: <20250611062238.636753-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072443_416968_F8873651 
X-CRM114-Status: GOOD (  29.03  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RPMI specification defines a system MSI service group which
allows application processors to receive MSIs upon system events
such as graceful shutdown/reboot request, CPU hotplug event, memory
hotplug event, etc.

Add an irqchip driver for the RISC-V RPMI system MSI service group
to directly receive system MSIs in Linux kernel.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   7 +
 drivers/irqchip/Makefile                   |   1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c    | 285 +++++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h |  13 +
 4 files changed, 306 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e447142..96bf6aa55681 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -617,6 +617,13 @@ config RISCV_IMSIC
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
 
+config RISCV_RPMI_SYSMSI
+	bool
+	depends on MAILBOX
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_MSI_IRQ
+	default RISCV
+
 config SIFIVE_PLIC
 	bool
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 23ca4959e6ce..4fd966aa78ab 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
+obj-$(CONFIG_RISCV_RPMI_SYSMSI)		+= irq-riscv-rpmi-sysmsi.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
 obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
new file mode 100644
index 000000000000..06f64936802a
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct rpmi_sysmsi_get_attrs_rx {
+	__le32 status;
+	__le32 sys_num_msi;
+	__le32 flag0;
+	__le32 flag1;
+};
+
+#define RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV	BIT(0)
+
+struct rpmi_sysmsi_set_msi_state_tx {
+	__le32 sys_msi_index;
+	__le32 sys_msi_state;
+};
+
+struct rpmi_sysmsi_set_msi_state_rx {
+	__le32 status;
+};
+
+#define RPMI_SYSMSI_MSI_STATE_ENABLE			BIT(0)
+#define RPMI_SYSMSI_MSI_STATE_PENDING			BIT(1)
+
+struct rpmi_sysmsi_set_msi_target_tx {
+	__le32 sys_msi_index;
+	__le32 sys_msi_address_low;
+	__le32 sys_msi_address_high;
+	__le32 sys_msi_data;
+};
+
+struct rpmi_sysmsi_set_msi_target_rx {
+	__le32 status;
+};
+
+struct rpmi_sysmsi_priv {
+	struct device		*dev;
+	struct mbox_client	client;
+	struct mbox_chan	*chan;
+	u32			nr_irqs;
+	u32			gsi_base;
+};
+
+static int rpmi_sysmsi_get_num_msi(struct rpmi_sysmsi_priv *priv)
+{
+	struct rpmi_sysmsi_get_attrs_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
+					  NULL, 0, &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	return le32_to_cpu(rx.sys_num_msi);
+}
+
+static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
+				     u32 sys_msi_index, u32 sys_msi_state)
+{
+	struct rpmi_sysmsi_set_msi_state_tx tx;
+	struct rpmi_sysmsi_set_msi_state_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	tx.sys_msi_index = cpu_to_le32(sys_msi_index);
+	tx.sys_msi_state = cpu_to_le32(sys_msi_state);
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_STATE,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	return 0;
+}
+
+static int rpmi_sysmsi_set_msi_target(struct rpmi_sysmsi_priv *priv,
+				      u32 sys_msi_index, struct msi_msg *m)
+{
+	struct rpmi_sysmsi_set_msi_target_tx tx;
+	struct rpmi_sysmsi_set_msi_target_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	tx.sys_msi_index = cpu_to_le32(sys_msi_index);
+	tx.sys_msi_address_low = cpu_to_le32(m->address_lo);
+	tx.sys_msi_address_high = cpu_to_le32(m->address_hi);
+	tx.sys_msi_data = cpu_to_le32(m->data);
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_TARGET,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	return 0;
+}
+
+static void rpmi_sysmsi_irq_mask(struct irq_data *d)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int ret;
+
+	ret = rpmi_sysmsi_set_msi_state(priv, hwirq, 0);
+	if (ret)
+		dev_warn(priv->dev, "Failed to mask hwirq %lu (error %d)\n", hwirq, ret);
+	irq_chip_mask_parent(d);
+}
+
+static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int ret;
+
+	irq_chip_unmask_parent(d);
+	ret = rpmi_sysmsi_set_msi_state(priv, hwirq, RPMI_SYSMSI_MSI_STATE_ENABLE);
+	if (ret)
+		dev_warn(priv->dev, "Failed to unmask hwirq %lu (error %d)\n", hwirq, ret);
+}
+
+static void rpmi_sysmsi_write_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int ret;
+
+	/* For zeroed MSI, do nothing as of now */
+	if (!msg->address_hi && !msg->address_lo && !msg->data)
+		return;
+
+	ret = rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
+	if (ret) {
+		dev_warn(priv->dev, "Failed to set target for hwirq %lu (error %d)\n",
+			 hwirq, ret);
+	}
+}
+
+static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
+{
+	arg->desc = desc;
+	arg->hwirq = desc->data.icookie.value;
+}
+
+static int rpmi_sysmsi_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *hwirq, unsigned int *type)
+{
+	struct msi_domain_info *info = d->host_data;
+	struct rpmi_sysmsi_priv *priv = info->data;
+
+	if (WARN_ON(fwspec->param_count < 1))
+		return -EINVAL;
+
+	/* For DT, gsi_base is always zero. */
+	*hwirq = fwspec->param[0] - priv->gsi_base;
+	*type = IRQ_TYPE_NONE;
+	return 0;
+}
+
+static const struct msi_domain_template rpmi_sysmsi_template = {
+	.chip = {
+		.name			= "RPMI-SYSMSI",
+		.irq_mask		= rpmi_sysmsi_irq_mask,
+		.irq_unmask		= rpmi_sysmsi_irq_unmask,
+#ifdef CONFIG_SMP
+		.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+		.irq_write_msi_msg	= rpmi_sysmsi_write_msg,
+		.flags			= IRQCHIP_SET_TYPE_MASKED |
+					  IRQCHIP_SKIP_SET_WAKE |
+					  IRQCHIP_MASK_ON_SUSPEND,
+	},
+
+	.ops = {
+		.set_desc		= rpmi_sysmsi_set_desc,
+		.msi_translate		= rpmi_sysmsi_translate,
+	},
+
+	.info = {
+		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
+		.flags			= MSI_FLAG_USE_DEV_FWNODE,
+		.handler		= handle_simple_irq,
+		.handler_name		= "simple",
+	},
+};
+
+static int rpmi_sysmsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpmi_sysmsi_priv *priv;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+
+	/* Setup mailbox client */
+	priv->client.dev		= priv->dev;
+	priv->client.rx_callback	= NULL;
+	priv->client.tx_block		= false;
+	priv->client.knows_txdone	= true;
+	priv->client.tx_tout		= 0;
+
+	/* Request mailbox channel */
+	priv->chan = mbox_request_channel(&priv->client, 0);
+	if (IS_ERR(priv->chan))
+		return PTR_ERR(priv->chan);
+
+	/* Get number of system MSIs */
+	rc = rpmi_sysmsi_get_num_msi(priv);
+	if (rc < 1) {
+		mbox_free_channel(priv->chan);
+		if (rc)
+			return dev_err_probe(dev, rc, "Failed to get number of system MSIs\n");
+		else
+			return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
+	}
+	priv->nr_irqs = rc;
+
+	/* Set the device MSI domain if not available */
+	if (!dev_get_msi_domain(dev)) {
+		/*
+		 * The device MSI domain for OF devices is only set at the
+		 * time of populating/creating OF device. If the device MSI
+		 * domain is discovered later after the OF device is created
+		 * then we need to set it explicitly before using any platform
+		 * MSI functions.
+		 */
+		if (dev_of_node(dev))
+			of_msi_configure(dev, dev_of_node(dev));
+
+		if (!dev_get_msi_domain(dev)) {
+			mbox_free_channel(priv->chan);
+			return -EPROBE_DEFER;
+		}
+	}
+
+	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
+					  &rpmi_sysmsi_template,
+					  priv->nr_irqs, priv, priv)) {
+		mbox_free_channel(priv->chan);
+		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
+	}
+
+	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
+	return 0;
+}
+
+static const struct of_device_id rpmi_sysmsi_match[] = {
+	{ .compatible = "riscv,rpmi-system-msi" },
+	{}
+};
+
+static struct platform_driver rpmi_sysmsi_driver = {
+	.driver = {
+		.name		= "rpmi-sysmsi",
+		.of_match_table	= rpmi_sysmsi_match,
+	},
+	.probe = rpmi_sysmsi_probe,
+};
+builtin_platform_driver(rpmi_sysmsi_driver);
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index 476a2d64d972..06d2f8b38969 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -91,6 +91,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
 }
 
 /* RPMI service group IDs */
+#define RPMI_SRVGRP_SYSTEM_MSI		0x00002
 #define RPMI_SRVGRP_CLOCK		0x00008
 
 /* RPMI clock service IDs */
@@ -106,6 +107,18 @@ enum rpmi_clock_service_id {
 	RPMI_CLK_SRV_ID_MAX_COUNT
 };
 
+/* RPMI system MSI service IDs */
+enum rpmi_sysmsi_service_id {
+	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x02,
+	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x03,
+	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x04,
+	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x05,
+	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x06,
+	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x07,
+	RPMI_SYSMSI_SRV_ID_MAX_COUNT
+};
+
 /* RPMI Linux mailbox attribute IDs */
 enum rpmi_mbox_attribute_id {
 	RPMI_MBOX_ATTR_SPEC_VERSION,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
