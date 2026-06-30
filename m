Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A0EC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mk6FDUaZesYfCYA5GW+oMyQrpeU19xna6FCFdKqjQM=; b=WuP+q3lknfndzN
	v62WCIFEzCO4VajjHGZg4axVEpb4jM9Dp7ef9EjVImHF8L1RiOOqXqiOm7HrKrVDrUQcRwGM0j73O
	MmM9AHhUHqm0r7IADVzpbExrSnPPR2SUUQV+Toq79Xu5KoMdbW1NBpjzEopCb2OCo+IhLTjfNvm+x
	DRst4zBltMu66F9OfRsgm8fnvEsKpUaJNL1yoUMPdWdoc7OLzdVCFKHEf4+qsjRSyDuxPvMKmGrjC
	9DLvY9fg5nSaXjvXeGl42QwHk8frniAKMmp/Nhrh/ZmHs6v07ofmhTdQ60s9VAx/udOUsnsPvQUai
	FJuqL4JClxYRWzuQsVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3U-0000000GVHF-0RAF;
	Tue, 30 Jun 2026 09:47:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3R-0000000GVFp-231S
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:46:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c9c1779fc8so9587395ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812817; x=1783417617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B91IsKiKSBLDxQvOwWqL0iEBK/LnKCgLJJ+MpBBdIFk=;
        b=XG0rdzuRuJAJHaRBQnqZMW+YY5tyH9CHmsMxXCozUnvCB5k5J4tHGbQ0RqRuR+HJFR
         waVZ+DkEl44TH2UtmIAD7WKFOVtaeA1Oapc2hpi/rn+kK9XeHLW7ai22bk4YXPhcivz8
         rYu5Df/ZrcfP2YxaNqRayUisB14sWBlmHJuvVNongTTCHlyEmYk5Js2rDv6mkxMfkmTo
         f41b8Zx8DooZHvZtVF315xHbO4SiAGs/R+UGfWj+slEHtX3i6kZXEyrjYVEK/aQQU8Yk
         Hd7feoP/gGwOH+qLo4QuR1OOh2lsKR3b6N/r29tHOlF/G/S8zbceOJv1VvBhcs4ikQ4a
         2ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812817; x=1783417617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B91IsKiKSBLDxQvOwWqL0iEBK/LnKCgLJJ+MpBBdIFk=;
        b=IxfpjTv2agkc7t+DlKPaRp1iWmEVBh75ZQJ8JMtU/rD3FxF0bRQVICQF/XocioYfFo
         vK2DfuvKVA+fdHUqiFbTiRQZeoxGXxds3Nvw9S5t2NINqXrEl5rwEW/ptO8IU+aFZ/mH
         tjYGKM2qTKJq4Vk8CF/dj3tZ7tUDEPey2L1DCcMs2lj9niUNbRS4lsRCgcXqyMFzQMza
         e7/pyKG0diCx4jG62u8C5DcSOdftRn4m35eoXagpLmdvVqX6qy1/aqHPEMsLOKJrhOKE
         Sf3ApgrCcp/BQ69tspuyrIynvmQkRCbYukV2ZBOuyqVU3QMKHTej7HLqTIgCibfwfpbS
         sGKA==
X-Gm-Message-State: AOJu0YxIF7UrRUyQzzDqJpw8+DzwZL2zCcpdL681jbH0rFBFiDiNxxn1
	QBa2VSfzahE/FmZHHgJ6TqdbsCJgPOqwDUqBWs1tbta/rqZhAuAb3mvtR9eKchcwyoc=
X-Gm-Gg: AfdE7clHdN+gARsM1fvGAwNwOBCSe2RXSOn47+EXeaPsIQusnCzCDLUBzKQbbxFIX/j
	95XqfPi4NQA6ZjdbRj34Mw/RX8npsevuziXvl2iH45G560uPcgeW4rPARsZ8ULwQS0bvNEHUpZU
	RX7KF3HLY6qs0NkeDWz9vxNM3rMgxH99Kl4b3z0HCBojRwxlyfQzniMYoA21/PyJhQ9UaVpksVO
	einz9bNHUo/K8keX0t/xljvc4x/9FEI7LlG942lTMkZzrHYns8q0//6t9OmLGXGiyDEVceR7sc/
	q96+kasyvCvJWwM2sFKlmKbj/L0pwR/DK5IAwizwKpfjvXzQHRaqed21AYuP1Y7EL2aoDW8tAoz
	epeSQwhDZVaax+YVYwpNj9TvAv4H92AUySpp3PHQM9+B410wJ0/RRtV1jF+3DsjgFEDtni0QGoC
	zoEBl915xqHhqMThJdb6fLA+1SNdh2Fno=
X-Received: by 2002:a17:902:d584:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ca2ec35fb8mr21656615ad.44.1782812816777;
        Tue, 30 Jun 2026 02:46:56 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:46:56 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:25 +0800
Subject: [PATCH RFC 02/12] rvtrace: Add pre-ratified implementation
 callback
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-2-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=6744;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=lU+olg6b7xeVFnmwRYJG6Mnyo25fN+iR9etdHelbHUI=;
 b=oHZedcK//rLV5fqw1rrhytPWnhPCnfkdo8L1ckX2GZwlN8Y267sSo0+/cVReoIpiv1rhNs1gV
 hYL+xwkQXNGCzRkCH4GvLB84OgfX29DGgUqkdvVJHsBEYfjvSbvl0Qk
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024657_542719_91C62013 
X-CRM114-Status: GOOD (  24.16  )
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

For pre-ratified trace hardware, the implementation register
bitfields differ from the ratified RISC-V trace specification,
and the component type is not defined in the hardware
implementation register.

To address this, add a get_impl() callback function in the
driver data to translate the pre-ratified trace hardware
implementation register information and encode it into the
standard RISC-V trace implementation register format.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/Kconfig            |  9 ++++++++
 drivers/hwtracing/rvtrace/Makefile           |  1 +
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 21 +++++++++++++++++-
 drivers/hwtracing/rvtrace/rvtrace-v0.c       | 32 ++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h       | 16 ++++++++++++++
 include/linux/rvtrace.h                      |  8 +++++++
 6 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index ba11acf1117d..5e84a3d0b633 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -31,3 +31,12 @@ config RVTRACE_RAMSINK
 	help
 	  This driver provides support for Risc-V E-Trace Ramsink
 	  component.
+
+config RVTRACE_V0
+	tristate "RISC-V Trace Pre-ratified driver"
+	depends on RVTRACE
+	select RVTRACE_ENCODER
+	select RVTRACE_RAMSINK
+	default y
+	help
+	  This provides the RISC-V pre-ratified version trace hardware support.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 07403f4d94e3..51b292b1b4c4 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o rvtrace-perf.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
index 83e5a577bc52..6cf8e7dae2ad 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/rvtrace.h>
 #include <linux/types.h>
+#include "rvtrace-v0.h"
 
 static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
 {
@@ -114,6 +115,7 @@ static int rvtrace_of_parse_inconns(struct rvtrace_platform_data *pdata)
 
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
+	const struct rvtrace_driver_data *driver_data;
 	struct rvtrace_platform_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct rvtrace_component *comp;
@@ -162,7 +164,14 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset component\n");
 
-	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	driver_data = device_get_match_data(pdata->dev);
+	if (driver_data) {
+		if (driver_data->get_impl)
+			impl = driver_data->get_impl(pdata);
+	} else {
+		impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	}
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -194,8 +203,18 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 	rvtrace_unregister_component(comp);
 }
 
+static const struct rvtrace_driver_data rvtrace_v0_encoder_data = {
+	.get_impl = rvtrace_v0_get_encoder_impl,
+};
+
+static const struct rvtrace_driver_data rvtrace_v0_funnel_data = {
+	.get_impl = rvtrace_v0_get_funnel_impl,
+};
+
 static const struct of_device_id rvtrace_platform_match[] = {
 	{ .compatible = "riscv,trace-component" },
+	{ .compatible = "sifive,trace-encoder0", .data = &rvtrace_v0_encoder_data},
+	{ .compatible = "sifive,trace-funnel0", .data = &rvtrace_v0_funnel_data},
 	{}
 };
 
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
new file mode 100644
index 000000000000..825de1120c8d
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <linux/rvtrace.h>
+#include "rvtrace-v0.h"
+
+static u32 rvtrace_v0_get_impl(struct rvtrace_platform_data *pdata, u32 type)
+{
+	u32 impl, major, minor;
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	major = 0;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+
+	/* Encode to standard rvtrace impl format */
+	return (type << RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) |
+	       (minor << RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) |
+	       (major << RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT);
+}
+
+u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_ENCODER);
+}
+
+u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_FUNNEL);
+}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
new file mode 100644
index 000000000000..511aa6489caa
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 SiFive, Inc.
+ *
+ */
+
+#ifndef __RVTRACE_V0_H__
+#define __RVTRACE_V0_H__
+
+#include <linux/rvtrace.h>
+
+u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
+u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
+
+#endif /* __RVTRACE_V0_H__ */
+
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 0cb3bd474c2b..fdf6115d7f06 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -154,6 +154,14 @@ struct rvtrace_platform_data {
 	struct rvtrace_connection **outconns;
 };
 
+/**
+ * struct rvtrace_driver_data - Driver-specific data for RISC-V trace components
+ * @get_impl: Optional callback to retrieve pre-ratified implementation register information.
+ */
+struct rvtrace_driver_data {
+	u32 (*get_impl)(struct rvtrace_platform_data *pdata);
+};
+
 static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
 {
 	if (likely(pdata->io_mem))

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
