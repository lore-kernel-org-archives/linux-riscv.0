Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB8606A334
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pXxGy2+S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=kgmPtSx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Un2khYNQQVAtyFJ9FbPIadNOoPs2PxO4FtZUHK5dKk=; b=pXxGy2+SqGAB3uJH+MBQuBHflU
	lq1K/PdXFGpdWjOX01Vw9t3r1I1rQdYIF3ue0hXcxAwpc6Ju856oGArWpq3PgUqFQ6yl7ejzBEjlv
	c3bs3GXHlXUlpad66Fay+yFbkzen3DU2Fxtr8jK5gu6XeSYebUad64GtjB9wdwNogN2f2uEftGItD
	CqdTv25TKDpD9iaV+CIVcCRwUFJyZNVMkAdGz828ChI7PCavpR4mAZU9KWDiz+krO9llVFcYgi9ym
	+57KWp+utI+P3gmmAHU83xsY8AxVk4ocYSX7gelxV3FBc9Ro6XzPjWXzWd7C97twnisrwjHAIVXMy
	ytgPTSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS2-0000000CUA5-3fgm;
	Thu, 26 Nov 2026 09:07:34 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRx-0000000CU59-1xiP
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:30 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-386d1859e1cso1341924eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684049; x=1796288849; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=kgmPtSx8xg+tWF3VNVH6Wh3EZ+bt9xC1vecx+wcqCS8NdhpeW3xLGDfizqK1D92g27
         gCxQ7V/3DnJZBLZbifP+RwdbzBHzbzhB2rJahTh4aYz8mgK83gp4RnNtwyoBbYuQLSUX
         VTnyzHWLxfDA0wKEMfefmeIQKLRkjI+53aFzKginPtUuLJ9tbfGqpGOdZAx/OUq09WEV
         ftTgI6iPpNHYD9ggMkex036XnyZ/OcvfESeeNbFGkn/o75qv8CgUBshTQJXp3gb4o7uK
         xGJws3pJuf4PgwcCNWuhDuO1rhpEXqF+gI5LDKAY90l/WeTs3AFgDW1ETTdOtEdrS0d6
         Nr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684049; x=1796288849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=hnRqha0PLNzrjYg5+AZgFTYiTfdLtqSSCqJeH/91EnycDb5CfzyWZZv8kWlVZxSi6t
         z3wQb6/w2DKUC4PH7NaPMVtk7Vi/l7Bo9duSHj5xwoG37Dn77ynZ6YDvaOkqxBN73lOS
         T/tmnCKFiDxEoEOcJyfVY6KGnXCJD6rcOxn2sx3pwxQ0y3CYGDRna3yJWqW3yvOHwfyF
         DyltJEGX5HV1HghA8GWJzxvEUdtxdo4GXE3wUD7cYB0SCDUNEymNtkn7yNZ8hON27woN
         rK3HGMYNMf9iaHma4oKGUurEfDCWw0EZksxa+Hh7qLTq2k9UXAi2lUEhkAI+tjY8Or+C
         4DsA==
X-Gm-Message-State: APuU4Z/aqCCZPnjAZbyafpHZ/cTQYfAw+xNB8qt7YZRqGJtD+YpoznuW
	6PE10yrhqzwwMXKPMarTSuYjf2pEo6Ya5UR5OnUUa2PxyELCyUilcvdIPzfU4Hynqv4=
X-Gm-Gg: AZFdTZdGawE3PIo/QDOFs/DlyLsAp7lwXgKFCJIx1Cn98/UpeuJjDFGxPtzOfLpF0oL
	zZ6Lr2Ifiv87nlEFlZO2szAQtFWg/KVwUz8wlOafq+0KJ5TdTzgU6NZP9fca+0DwqHRYiwIsl9Z
	I4Xcq08lL3TTCdRbPVfukd8CN+NTJJMeVqnRnBd+dnSE0vWNy6sbPFOFP7eIlYKyNrmiD6BeuEZ
	9iZcddA5qM3rKJpwC3X3Ci+1MCbq7+v6Js8ezo3mlQJXmdghq+LjyBU0UtOsGZgnM1OB4hRCDCs
	xG6z189pAgqCGcZo6G5aVbSkBNX6YFzylo9sVHHupbkd3s2ZJ2ad40aPT14Ivk3iIl8rFSpzqrp
	qIloLsdwxt7yEzia3wnyAsDyCZZ3Tx0hfs+lOAbJxEJmbRrSH/rQt0CPdjTHljrmISJPvWm02xe
	1ocrW55v3AUXfrzt/BSFzS4ZQFjb02LMZzIeLyc/mkFg4lxguLFqQLfipsgKuJmww6iyIZvmslo
	MyInauFtv7woBUo4JD+N7Zn/KRWtAMopw3heqg4mH87WqJYpyRiTAWTWjLjDyYnGbJXJZ58O49k
	BCv5hX+J3qYF+zlK07vItbfYYPzk88F4nQwcuq0lttJ7
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr29001166eec.23.1795684048801;
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:13 -0800
Subject: [PATCH 07/10] gtrace: rvtrace: Add pre-ratified trace funnel
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-7-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010729_571370_741AED8B 
X-CRM114-Status: GOOD (  16.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Eric Lin <eric.lin@sifive.com>

Add the initial implementation to support the pre-ratified RISC-V
trace funnel. This implementation provides basic functionality to
enable the trace funnel, configure its next sink when tracing starts,
and disable the funnel when tracing stops.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/Kconfig          | 13 ++++
 drivers/hwtracing/gtrace/Makefile         |  1 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c | 98 +++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index b1f9ca8f73cb..66fc2791d8f4 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -43,6 +43,19 @@ config RVTRACE_ENCODER
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
 
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE_V0
+	default y
+	help
+	  This driver provides support for the RISC-V trace funnel component
+	  which combines the trace data from multiple upstream components
+	  into a single trace stream. Only pre-ratified trace funnels are
+	  supported for now.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
+
 config RVTRACE_RAMSINK
 	tristate "RISC-V Trace Ramsink driver"
 	depends on RVTRACE
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 0a2e2d1732c2..38dd96b3dc34 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-platform.o
 rvtrace-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..2e0843d233ab
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+static int rvtrace_funnel_start(struct gtrace_path_node *node)
+{
+	struct gtrace_component *comp = node->comp;
+	int ret;
+
+	/* Set pre-ratified comp's next sink */
+	ret = rvtrace_v0_sink_config(node);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set next sink.\n");
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable funnel.\n");
+
+	return ret;
+}
+
+static int rvtrace_funnel_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_funnel_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	return 0;
+}
+
+static void rvtrace_funnel_remove(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+}
+
+static const struct gtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = GTRACE_RVTRACE_FUNNEL,
+	  .version = rvtrace_component_mkversion(0, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_funnel_driver = {
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
+	return gtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
