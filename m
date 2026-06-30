Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E22C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW2Y2AMOQjhg58cQIGJkOAh6wiPFZ8rEXfehVCZdSgI=; b=DNGcWJpPghkOX/
	vpxz+g0gZJSOn9MhwBazZpUKwYG6WbqWfpS/lMQCk0vxb1BnGyMJzATe+/0bAAR7QdXxaRYmIRUF4
	UiBL6KKt8G/TkgUFkZDwHSSQ8WId0sn7NH/PRDsHNvB1CV6OLzdWeMLaKDWCwCVlU5lvHsfY6seVW
	lKPMnXr2KB6TqxS127sOHGffOQnDIrclEGpEyj09mPNTr5Cy98IDckhFGGtxKnj8yl71Tt/JBVN/k
	BHdu3U2QKRkQMhbYZeXvQqsxUeTbXL5pUBtqMMhIsFRgmmnC9P/Fzse+J7fQd/jX+vub/+th1zsgP
	GhJaLUefoEhyHFID0nBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV46-0000000GVr8-06zD;
	Tue, 30 Jun 2026 09:47:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV44-0000000GVpM-49cW
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oSjESf/pgUI8Z+M6V8l9I2o1pCuGSvuAv9qT40udMcg=; b=cMDdyfvUxhT/rPq7sTiTZD88ds
	xSYkYqlEdJBguxeRcYzlRljoO4TzXSAg/H93Mi+2W1de2iE4je4WWfu+hBCnamPC48jLTlpviBgH3
	yuFEq09QLYWsjSbz5lWz0EViEi5CXiK7K814CTLBK/G8WumcNRUxVGEKMxNcTymsCwWZ9SnwDMS1u
	ON9JQwN97Qe6G+q8tyOQnLh7tsDqLZ8UytYyLQh9aSGo4MgAA+SkRvz4DP/jXGBpDahOlXK+hCDQR
	zMv2vZG7wBMoBVFGI/3aOsAU/4fMip6ub0x0qZBZU/MEDwykUm5eazYFy5+NT0NzYN4tZl/iDnrdF
	+AXT1rvQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weV40-00000001jTx-2OjF
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c9e9a8af98so11181955ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812850; x=1783417650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSjESf/pgUI8Z+M6V8l9I2o1pCuGSvuAv9qT40udMcg=;
        b=bBtodWBmkC8Gnwy693eZXSNsrrQskTxoOKOjMqJ93AWwyPEP/I7bOO+FmwCXU0bPRY
         mWruivVPGVXr94O2FhZqGd4BO75GI9I5U/E7siqxx28z4Fn5x/XRZ1ySw2a0HWBNQ39s
         /7kTtNXzQa2sK0bIS04Q4yYib8W+6QUeiDf4lKxqH/zWOUS4NhfsYTRbcSQHRCmzJqpU
         P0haNXYu98ts/IJ5biNBMHDTzlFbJk472SuHqymfd3Mdth6NwcBeDmwSbmFfnKboA/o2
         ZH0bGwYqxZVZZAvBQLJnxmADoScgojUJJchAJPjITQC50wueRCWhuG3YwOggibyrInVg
         rJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812850; x=1783417650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSjESf/pgUI8Z+M6V8l9I2o1pCuGSvuAv9qT40udMcg=;
        b=b29ApQfr5rsT/N6CCX7ZJwB+dVznx+gs/yKh0M19PYY8V+ruJMabIe1DdJ55lVmsxE
         AaiW2EsDBRxq9pwXwUD+a48Q6w3jvaz8Jz2QzhqcuR/eA0cdIgk1rIiaf26UaQHFJ4w1
         auWsqAyn620oT0txZjs0lNlqVAoHyCcjywOnliU6wNozpoWCI3FbvZ8/gv4BU05FEs+H
         j2xunQoW+JRFUHgK6r72RiecpSQbUKexcSnvXRP1z3wPAng1QX0zBmUY43zjBeYrE62c
         j+JpVGBigKZEHAkqnQWliieO1QLeLn2pj3MScghHMV35tPAInZnYMUyExE5JEDK9ibY1
         Uj9A==
X-Gm-Message-State: AOJu0YxFm7UzLxz1C2eRlrxXUvqwfabbe2tXKdJ1l2hSW5YZpBSdCm24
	o1UUzCp7WEpJn60nxC4WNcAiWGsfZEnDtLjTWhwOM/ELHxvCi/vWn+2cLClLyQTJwiU=
X-Gm-Gg: AfdE7ck5kZlj5L5hzXaFaSIPDtJGs5RW2YdWpMrtLy6m3sP6isuwK8FGlq6rqo82k+p
	4FLRKjlK6AGvINFirMHzi9ZCHE5/g8l7CmeM5NZlrT7SfolL3VHTpK8Ho6NOeWIawaRgw47/vxV
	mC6PCYKZsAeIkDZfiC9ciPX/0lcDk8FdFuNaeV3DGuJK7gHOqgOeHWq2hJu9hu1zgg0XLgarvXr
	v39vS4CDv2RNMvWVfv8z61eCSUpiPMEzVQXXYpNtv7TqyuvamRSlOoAAGrZQItrXKvjnJGJJpvW
	v+IVrv1px/hePx10+MNZRk8VIxLmK7jntGHqrCkjlbSW6ebhbNtdTL0ccXxbhOrHj9kzBLrzKaT
	nELdrlflDfBLPjSqPDtFZTLnhlQP1/wP42Cs6STIRxV9a1+LmSkwKjyvo5OUzN8AGLX80YkjYqc
	JwTB+FRxajPaUjx07bvlmKshqFj6iaRRs=
X-Received: by 2002:a17:902:da85:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2ca2d564e9bmr22246645ad.20.1782812850271;
        Tue, 30 Jun 2026 02:47:30 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:29 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:32 +0800
Subject: [PATCH RFC 09/12] rvtrace: Add pre-ratified ramsink setup
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-9-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=9720;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=+2Y4ncc4aI5sWezwK/PpKOafCsJa4Xl+vxw29ypurXQ=;
 b=rZ5GS88HqnJFH+r0zqXCtsYQyD2e7mw+cqZDw6hrCCpdYFMmLpeGXKVubZeaiIy6QR86hDENR
 8zT0XS7aNRNBvhoZpLyN3HfUWG6wykAMVt/ZUXeS9eIJD7ZhBq/HNvR
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104733_162263_FEDBDEA0 
X-CRM114-Status: GOOD (  23.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers and utilize a different register layout.

Define the pre-ratified ramsink register layout using 'struct
rvtrace_ramsink_regs' and hook the pre-ratified initialization into the
encoder and funnel driver probe sequences. Depending on the component's
major version, rvtrace_ramsink_setup() dynamically selects between the
standard and pre-ratified register maps.

Additionally, handle a hardware constraint where the pre-ratified
ramsink's sink limit and write pointer registers share their upper
32 bits with the sink base address register. This restricts the trace
buffer from crossing a 4GB memory boundary. To satisfy this, invoke
of_reserved_mem_device_init() during setup to allow the device to utilize
a suitably aligned reserved memory region defined in the Device Tree.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  9 ++++++
 drivers/hwtracing/rvtrace/rvtrace-funnel.c  |  9 ++++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 44 +++++++++++++++++++++++------
 drivers/hwtracing/rvtrace/rvtrace-ramsink.h | 11 ++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.c      | 43 ++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h      | 13 +++++++++
 6 files changed, 120 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index 47740bbdc206..b187731ff855 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -79,6 +79,15 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
 	int ret;
+	u32 comp_maj;
+
+	/* Pre-ratified ramsink setup */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_ramsink_setup(comp);
+		if (ret)
+			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+	}
 
 	ret = rvtrace_enable_component(comp->pdata);
 	if (ret)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
index 2bf553a88d98..21f58001d569 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -54,6 +54,15 @@ static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
 	int ret;
+	u32 comp_maj;
+
+	/* Pre-ratified ramsink setup */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_ramsink_setup(comp);
+		if (ret)
+			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+	}
 
 	ret = rvtrace_enable_component(comp->pdata);
 	if (ret)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e569e875568b..e794b01e19d0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -10,6 +10,8 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
+#include "rvtrace-ramsink.h"
+#include "rvtrace-v0.h"
 
 #define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
 #define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
@@ -83,6 +85,20 @@ struct trace_buf {
 	size_t len;
 };
 
+/*
+ * Register offset for SiFive trace encoder/funnel system memory sink.
+ * Note: SiFive uses RVTRACE_V0_SINK_BASE_HIGH_OFF for start_high, limit_high,
+ * and wp_high (shared register).
+ */
+static const struct rvtrace_ramsink_regs rvtrace_v0_sink_regs = {
+	.start_low    = RVTRACE_V0_SINK_BASE_OFF,
+	.start_high   = RVTRACE_V0_SINK_BASE_HIGH_OFF,
+	.limit_low    = RVTRACE_V0_SINK_LIMIT_OFF,
+	.limit_high   = RVTRACE_V0_SINK_BASE_HIGH_OFF,  /* Shared with start_high */
+	.wp_low       = RVTRACE_V0_SINK_WP_OFF,
+	.wp_high      = RVTRACE_V0_SINK_BASE_HIGH_OFF,  /* Shared with start_high */
+};
+
 /* Register offsets for the standard RISC-V trace ramsink */
 static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
 	.start_low    = RVTRACE_RAMSINK_STARTLOW_OFF,
@@ -285,10 +301,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 	return 0;
 }
 
-static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
+int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 {
 	struct rvtrace_ramsink_priv *priv;
-	u32 trram_ctrl;
+	u32 trram_ctrl, comp_maj;
 	int ret;
 
 	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
@@ -305,16 +321,26 @@ static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 		break;
 	}
 
-	priv->regs = &rvtrace_std_ramsink_regs;
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	/* Pre-ratified ramsink regs */
+	if (comp_maj == 0)
+		priv->regs = &rvtrace_v0_sink_regs;
+	else
+		priv->regs = &rvtrace_std_ramsink_regs;
 
 	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
-	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
-	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
-		 "SMEM" : "SRAM");
 
-	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	if (comp_maj == 0) {
+		trram_ctrl |= priv->stop_on_wrap << RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT;
+	} else {
+		trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+		rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+		trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		dev_dbg(&comp->dev, "mode: %s\n",
+			(trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ? "SMEM" : "SRAM");
+		trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	}
+
 	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	ret = rvtrace_ramsink_setup_buf(comp, priv);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
new file mode 100644
index 000000000000..7e0391aeffd5
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 SiFive, Inc.
+ */
+
+#ifndef __RVTRACE_RAMSINK_H__
+#define __RVTRACE_RAMSINK_H__
+
+int rvtrace_ramsink_setup(struct rvtrace_component *comp);
+
+#endif /* __RVTRACE_RAMSINK_H__ */
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index ba87e1f7a839..9451d96024bc 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -3,8 +3,51 @@
  * Copyright (c) 2026 SiFive Inc.
  */
 
+#include <linux/of_reserved_mem.h>
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
+
+int rvtrace_v0_ramsink_setup(struct rvtrace_component *comp)
+{
+	struct rvtrace_v0_comp_features	*data = NULL;
+	int ret;
+	u32 val;
+
+	data = (struct rvtrace_v0_comp_features *)comp->id.data;
+	if (!data)
+		return -EINVAL;
+
+	if (comp->id.type > RVTRACE_COMPONENT_TYPE_FUNNEL)
+		return -EOPNOTSUPP;
+
+	if (data->has_sba_sink) {
+		/*
+		 * The pre-ratified ramsink's sink limit and write pointer registers share
+		 * their upper 32 bits with the sink base address register. This hardware
+		 * constraint prevents the trace buffer from crossing a 4GB memory boundary.
+		 *
+		 * Use of_reserved_mem_device_init() to associate the device with a
+		 * reserved memory region defined in the Device Tree. This ensures the
+		 * buffer allocation adheres to the necessary alignment and size constraints.
+		 */
+		ret = of_reserved_mem_device_init(comp->pdata->dev);
+		if (ret) {
+			dev_err(comp->pdata->dev, "Failed to get reserved memory region\n");
+			return ret;
+		}
+
+		/* Set comp sink to SBA (system memory) */
+		val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+		val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+		return rvtrace_ramsink_setup(comp);
+	}
+
+	return 0;
+}
 
 int rvtrace_v0_sink_config(struct rvtrace_path_node *node)
 {
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 48728fef24c0..2b4e63e3ead0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,6 +9,19 @@
 
 #include <linux/rvtrace.h>
 
+/* Register offsets */
+#define RVTRACE_V0_CTRL_OFF			0x000
+#define RVTRACE_V0_IMPL_OFF			0x004
+#define RVTRACE_V0_IMPL_EXTRA_OFF		0x008
+#define RVTRACE_V0_EV_CTRL_OFF			0x00c
+#define RVTRACE_V0_SINK_BASE_OFF		0x010
+#define RVTRACE_V0_SINK_BASE_HIGH_OFF		0x014
+#define RVTRACE_V0_SINK_LIMIT_OFF		0x018
+#define RVTRACE_V0_SINK_WP_OFF			0x01c
+#define RVTRACE_V0_SINK_RP_OFF			0x020
+#define RVTRACE_V0_SINK_DATA_OFF		0x024
+
+#define RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT	14
 #define RVTRACE_V0_CTRL_SINK_SHIFT		28
 #define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
