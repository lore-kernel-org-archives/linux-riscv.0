Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A4C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKplseuUn0z9854BCJbeqL1wFdKXnTj4aMbgFuTLNkE=; b=IpH6KS/hjKBc9F
	CwzgN0Ect/eSqPwpvwlO0ab26u6dzDSh4ghhN5qfaSt062s5BZmsPwqtAaOD1zg3U51X8Uah2Vs9Z
	/GSyBcfDqF4epkROfLifrK2ufkq5WD6w7YS79VQ+qpi2nuAxVLCtTlz7UPdFmq9tlNiSZbsH+Itcd
	pv5kLrghSa46lZMGPldy5EXmfydMMx0sdsP7kQSw282EYxbTg3MU3jzb8OM4MuYQyCp1YNz2T2vOs
	vPzbaYJ4TAJTfbh8ysM/FKu2Mv/iY+TWdyAhVlE+wRV9UmvicFftrNwV5MEebhUcFOtuqWU5D6kYD
	vvJBKo6/4yxgkg3Krn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3y-0000000GVj4-3Jpt;
	Tue, 30 Jun 2026 09:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3w-0000000GVfU-29kv
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qj8pE/XpiQwCOFu8myquPJudJuFdNQxFRhQdwwBjWd8=; b=kqTzBfwUWID6JhwU34nLfG1SFu
	BH8q5dTW7aq53I7OpCahJoXcw1E49ePq5XYF8qmxFjvpg1zMe1lnpi2lMtNJxM9lU4xqgXlleGWkw
	CxT5l0R8pp1opKoMBA+ZRV2smO6xEA3eKY4vB5oefq2VSqegKEEWlj9DSDMbEjojkc8v8sHCOYtKd
	z3Z2W3RXZUVm8sccbp2kZ8caNrFAEs5RquqD3ovgJMlyjYGqf6C+GZbBXReFUavgwT6RMC3CRMCz4
	c4mbYQUYLzK3YwW/kRNwN4k83uP5ibaLL4ERmcrOH1TrXlqAtRNK+zoKKwTddf1bvKoqbML97iam2
	mf2oZc9g==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weV3q-00000001jPq-1w7y
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso2021437a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812840; x=1783417640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj8pE/XpiQwCOFu8myquPJudJuFdNQxFRhQdwwBjWd8=;
        b=DMxr7lf//eiGeqwRdMPrnAFuq5QMPLRxZu+LgdKsfPjYB0lVHGmV2p46hyw7+WFy6X
         P1fAe3Sc68pdMOKhaOI6EjLCMAA8Zao8BefelNprrcj7ZG+RxzkV5S3Y0X2bo/cZtdGO
         82N9KH3dYZzH6XBOV31QzpWSIvb0shNMdEet9DPSO0HIKvWkFVJuTuUzhWm1vYb7krh3
         Cmuuu4659NPJh9cZHTmjpb6tHAa6T7h9rUoyESolk6VvCZJVPPdksArxikzR+NNODW4Q
         xzvur4fUvqkHmt0APZ7FCpQ/MZGYTk0ujbRHcLbXt3VzlKBYVNu5iE2qrSISKqSxjFxt
         sTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812840; x=1783417640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qj8pE/XpiQwCOFu8myquPJudJuFdNQxFRhQdwwBjWd8=;
        b=crXnEz+DYY17gY06+Tr7SbNwQ5+n/2idq5913HLhK/m1E8O8xE2GfxvG+hZ55l324v
         NV2Ig8rV3GIfBWdGW4OmsfXnS2U/rNTYVvCq+Bj+RnACNMqWNcJOvXfpDqYtbJRD0thC
         ut1Y3/o3LS+tKYuNq7yaLffawA1RMzCrxPz5wQz8rxsld+bFbjTXOwFR03vOxUqz5Chk
         YFTXXQDDLh//CMpvyrP6JBaKz/dll2O44+9aV/gMddxWaY2If0ndXEg/cXX6Qh7xqY01
         usclDUW2rT3iRrC52jg5nIZvr9PN9SpiXo3nS4h3B2qSqf34iIgHdboSRgPRXoGgO8HQ
         231w==
X-Gm-Message-State: AOJu0Yy5W4b+nTrqdsb/LxuaS1b+IWqpEf7WbF17SLKSQONfin4heGBu
	DSkNqGvvVJ4/Gc3NgiYki2qE+Y3IXgbZ4jDAxVo8wGrq1na5gAAVq3zI/OV8SaU8flY=
X-Gm-Gg: AfdE7cli38H6x5VfOuK4gkrdtnw2G0zCtjEDYjUsXIP9DQnBzPQJL7JONPr43faQsd2
	oy8XurOPnbziPpwenWqyuNHqu0WO/1CFUsG0hqINejp9KQ1+UxmzEAA8RbEdoXAfI3JXdRkFF7P
	GpxAyWtCkUUNU9qumQevZ7usiutadWsTVmXDSwJ5LD//GHdfyx5I0qTjPMBxbCgbuosJqMHZI6a
	ykpQR8wdRPIncUKpsg8ubbJKwoO7MYKA1NSGbchZvSwWSFZ+BGXaAw9gfGfaexaj6g1DI/0ZHfn
	ur82tVGDKb0WAW5jxymJymDwYYCavawzPCwUj+K3FVhCTwjqCXPWYTN5pStzZY3olneNQBhOHtl
	UkFvNWAjYtyadhyPSa4UmSClrLMWQy7fijWrAv2u86DSY4KagIPCjUgG48GKtkFeYNtR3frpy1R
	u5Gvaa90er/NGl6HEMSUfWK6ei3sgnI4Q=
X-Received: by 2002:a17:902:ce0d:b0:2ca:265d:6942 with SMTP id d9443c01a7336-2ca2d550766mr21933355ad.13.1782812840116;
        Tue, 30 Jun 2026 02:47:20 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:19 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:30 +0800
Subject: [PATCH RFC 07/12] rvtrace: Add pre-ratified trace funnel driver
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-7-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=4774;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=eRKhmeO9nwyT5BisG6p3UGoQK0PWEsh0XUk+FQFnMnk=;
 b=sIine6RnwOaPYur6Fv1Uo8271Vqx0C9pY3YBOMuk6CMw+SeUioi4/DDIRURBLVttYA3hxvpF+
 OJbDlnqHH4hDpjCCvbaP1150IOmCWRTHdDRE1CN7XbGAufAzW/TymVx
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104723_126479_0977C7C2 
X-CRM114-Status: GOOD (  17.67  )
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

Add the initial implementation to support the pre-ratified RISC-V
trace funnel. This implementation provides basic functionality to
enable the trace funnel, configure its next sink when tracing starts,
and disable the funnel when tracing stops.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/Kconfig          |   7 ++
 drivers/hwtracing/rvtrace/Makefile         |   1 +
 drivers/hwtracing/rvtrace/rvtrace-funnel.c | 108 +++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index 5e84a3d0b633..f684ad0d8c3f 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -23,6 +23,13 @@ config RVTRACE_ENCODER
 	help
 	  This driver provides support for RISC-V Trace Encoder component.
 
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for RISC-V Trace Funnel component.
+
 config RVTRACE_RAMSINK
 	tristate "RISC-V Trace Ramsink driver"
 	depends on RVTRACE
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 51b292b1b4c4..573709f9b2e3 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o rvtrace-perf.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..2bf553a88d98
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+#include "rvtrace-v0.h"
+
+static int rvtrace_funnel_start(struct rvtrace_path_node *node)
+{
+	struct rvtrace_component *comp = node->comp;
+	u32 comp_maj;
+	int ret;
+
+	/* Set pre-ratified comp's next sink */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
+	} else if (comp_maj > 0) {
+		return -EOPNOTSUPP;
+	}
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	return 0;
+}
+
+static int rvtrace_funnel_stop(struct rvtrace_component *comp)
+{
+	u32 comp_maj;
+	int ret;
+
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj > 0)
+		return -EOPNOTSUPP;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to disable funnel.\n");
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_funnel_probe(struct rvtrace_component *comp)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
+	int ret;
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	dev_info(&comp->dev, "%s is available\n", fwnode_get_name(fwnode));
+
+	return 0;
+}
+
+static void rvtrace_funnel_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+}
+
+static struct rvtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_FUNNEL,
+	  .version = rvtrace_component_mkversion(0, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_funnel_driver = {
+	.id_table = rvtrace_funnel_ids,
+	.start = rvtrace_funnel_start,
+	.stop = rvtrace_funnel_stop,
+	.probe = rvtrace_funnel_probe,
+	.remove = rvtrace_funnel_remove,
+	.driver = {
+		.name = "rvtrace-funnel",
+	},
+};
+
+static int __init rvtrace_funnel_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
