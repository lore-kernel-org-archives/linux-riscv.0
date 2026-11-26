Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571A606A69E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cBVXHjxW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=iMZoh4LT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yuTA/fzUl+HGjgjttufEh0Pl1iGkjkSVFTAH3mEr4sc=; b=cBVXHjxWFlJBzAfKfjpV4PANXI
	Et1bkA6OaJLP4C41B8ZkY29S2548utHI1WPOdBFQMt/7PrQlSrixcFRo5F4A+1hFrvkQ391D6c0NU
	klFwhaXxl3/90iY0PgQrtFG61JCVEpA4dUppAsuvd4oWlsPQN28JdDZ/vB23Angg/MZ7/f6CTZZmk
	yqKgc75RBtaem8i6Yv5DdQrndyIFUDPSRVSUApbqG9EmNjIjhLG4ML9BN2K7JHjF4eix5E+YGuYqO
	kI7e5XhMC7sVZGxZImayGT3i0tlzs3QUo0HPz/sM+8AYilgMzgp6WN1DK86mP3q7yNWs4JMyhhuh9
	tMfIiCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRw-0000000CU4v-42ls;
	Thu, 26 Nov 2026 09:07:28 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRs-0000000CU2L-2SOP
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:25 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-38644aedba1so10186784eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684044; x=1796288844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wwFoy6VZlzpHT5hFUyZG0YVsOzvP2dbjuSfoAkk4lY=;
        b=iMZoh4LTcdzYDCmJiG2GOCfbnwJxOaI1FtOYe013rb8xb6axgAM++Nw7S0YJG94W9z
         NGhyVKQQiO70qq+f405K2ROrBMXePdyD6WIlSToIkzzhX+e6LeAUcY3jxAieeefWs8d6
         HstRgTQledaVBNyrw1m6/nCC9atSsjrk1EHzdXoj0FaAL7FcMAiRU7bmcRVcLXsCt6NO
         7N+k+T6ooNkdti4qB3UZGP9TveGIkcwJ9EN9e3CkyEhGSkwNjQIeE2DRf4GI6WNcZ4mD
         /DmDeN+dCg2mNf4C1TiS81VSeJVqQPQ1iQgaSZ4SvxIsZFMDQWNDpK3UXSewhf7WC+xY
         m4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684044; x=1796288844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wwFoy6VZlzpHT5hFUyZG0YVsOzvP2dbjuSfoAkk4lY=;
        b=Od/wJb7j/jwYA0uf8TPjRslFVzI2EkGwHUHlh7+V74svTtBpvYIPVnVElBwokf4wjt
         As3BuWwihFJRuVoxBsG1rIKhYNQ+v9qYR/Z++qYcZ/L6aXyhTRG2oOipqkLS+7TkHp/4
         O+VlOZ4JSyUj7vuZDwLGsEtkAhQx52xCitbiuuNLiFuSbJwiaLXMlLEvZtnjpd0Zkbdy
         AT5LS/IXuX9QCrpHhgAaS82C7WEU07otb8yeDFrPd/6OQJ0NFLrF2jLrfJURPdCbJQdG
         lhpYMY2nq1Lnv+rKJS+tnw9B1hM015rlwp9Pgh7AOv2kRgfh3OyAYGb4hlKW9ORPXuJd
         JHNg==
X-Gm-Message-State: APuU4Z9vnWTpIyqrV2Eyy2zkX5yFmnE0NHRUU0fPfeINsDHvOi7T2yC0
	WO6tMQaaL7NP6hXIizI2bmQvGFmj2PrI5sRVTbKmnTXd92gamCewB8Rq3AU6xdRFn64=
X-Gm-Gg: AZFdTZd/IQmOVMn9y1+5OEyN35/Zx3v4bPmKL5U9ZWo/weqQcirtJU2MjrHcTMMCxhr
	IYrGgKlo7ZqpBgcwBUdTRBxn3LwPaUNQcmdnS/YDUiwD8T0ocxWg9aTIv8RdFDgIYu6wXvRgcDB
	c23F6gBouui4PzljFi1BiiT+vrfZCzRnEBT0/GAfZUT08/1YMnM81zjBhPXKbdUf3mbxAogN7d1
	/xLLO9076IDpCg75GCH07bc0Dgtjlsxtk+4aj6Qwm2I4w0reB9K7ic8u1UeuT26witexHltVoEO
	PqIGzlu8Gt9jDRUe87TC0dHkqIhzNIZSvx63FpT58DvRkZ/h6cM1e+Xj0QfirH8NumiCPmUAfJt
	O08sp9lY9DTryc7+BOi7P7TECthUQkn1TYiN6zKuNrhlYYU1sYPREi9JBDNs/T8XSfw4HCfCURn
	BHLfmyxZeFRhrfdATGG3PYPCaD94pw3Qo/vuLAIqGcvkFC3HZdLbFzo9GkoXzpIgdqvtnBsi6NI
	7XijPHPjICiBath9JUYmgV9DS0riawieFPGYjQ2lEK+Wi0RcI1acWnNa0UdMJZbOW0DKK0fSBry
	3GJiCF9R61IPexh+lrYLagKVKq9quAvyR98pMblcTXxN
X-Received: by 2002:a05:693c:62d3:b0:386:de65:9969 with SMTP id 5a478bee46e88-386de65997cmr1466873eec.35.1795684043729;
        Thu, 26 Nov 2026 01:07:23 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:23 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:08 -0800
Subject: [PATCH 02/10] gtrace: rvtrace: Add pre-ratified implementation
 callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-2-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010724_642527_2F9F657F 
X-CRM114-Status: GOOD (  24.27  )
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
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/Kconfig            | 12 ++++++++++
 drivers/hwtracing/gtrace/Makefile           |  4 +++-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 36 ++++++++++++++++++++++++++---
 drivers/hwtracing/gtrace/rvtrace-v0.c       | 34 +++++++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h       | 17 ++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          | 12 ++++++++++
 6 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..b1f9ca8f73cb 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -57,3 +57,15 @@ config RVTRACE_RAMSINK
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-ramsink.
+
+config RVTRACE_V0
+	bool "RISC-V pre-ratified trace support"
+	depends on RVTRACE
+	select RVTRACE_ENCODER
+	select RVTRACE_RAMSINK
+	default y
+	help
+	  This provides support for pre-ratified (version 0.x) RISC-V trace
+	  hardware, such as the SiFive trace encoder and trace funnel, whose
+	  register layout differs from the RISC-V Trace Control Interface
+	  specification.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 33274a1ed0b8..0a2e2d1732c2 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,6 +4,8 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o gtrace-perf.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
-obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-platform.o
+rvtrace-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index a5655e983e51..8c1503bd8d98 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-v0.h"
 
 static int rvtrace_hw_enable(struct gtrace_platform_data *pdata)
 {
@@ -62,6 +63,7 @@ const struct gtrace_hw_ops rvtrace_hw_ops = {
 
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
+	const struct rvtrace_match_data *match_data;
 	struct gtrace_platform_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct gtrace_component_id id;
@@ -72,13 +74,17 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	int gtype;
 	int ret;
 
+	match_data = device_get_match_data(dev);
+	if (!match_data)
+		return -ENODEV;
+
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 	pdata->dev = dev;
 	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
 	pdata->hw_ops = &rvtrace_hw_ops;
-	pdata->format = (uintptr_t)device_get_match_data(dev);
+	pdata->format = match_data->format;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -115,7 +121,11 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset component\n");
 
-	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	if (match_data->get_impl)
+		impl = match_data->get_impl(pdata);
+	else
+		impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -154,8 +164,28 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 	gtrace_unregister_component(comp);
 }
 
+static const struct rvtrace_match_data rvtrace_std_data = {
+	.format = GTRACE_FORMAT_ETRACE,
+};
+
+#ifdef CONFIG_RVTRACE_V0
+static const struct rvtrace_match_data rvtrace_v0_encoder_data = {
+	.format = GTRACE_FORMAT_NTRACE,
+	.get_impl = rvtrace_v0_get_encoder_impl,
+};
+
+static const struct rvtrace_match_data rvtrace_v0_funnel_data = {
+	.format = GTRACE_FORMAT_NTRACE,
+	.get_impl = rvtrace_v0_get_funnel_impl,
+};
+#endif
+
 static const struct of_device_id rvtrace_platform_match[] = {
-	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
+	{ .compatible = "riscv,trace-component", .data = &rvtrace_std_data },
+#ifdef CONFIG_RVTRACE_V0
+	{ .compatible = "sifive,trace-encoder0", .data = &rvtrace_v0_encoder_data },
+	{ .compatible = "sifive,trace-funnel0", .data = &rvtrace_v0_funnel_data },
+#endif
 	{}
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
new file mode 100644
index 000000000000..a5ca9001bc08
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <linux/gtrace.h>
+#include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+static u32 rvtrace_v0_get_impl(struct gtrace_platform_data *pdata,
+			       enum rvtrace_component_type type)
+{
+	u32 impl, major, minor;
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
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
+u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_ENCODER);
+}
+
+u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_FUNNEL);
+}
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
new file mode 100644
index 000000000000..2d83c87936b9
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 SiFive, Inc.
+ *
+ * Support for pre-ratified (version 0.x) RISC-V trace components.
+ */
+
+#ifndef __RVTRACE_V0_H__
+#define __RVTRACE_V0_H__
+
+#include <linux/gtrace.h>
+#include <linux/types.h>
+
+u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
+u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
+
+#endif /* __RVTRACE_V0_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index e6be1ce303cc..7f9e88d99b8f 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -109,6 +109,18 @@ static inline const char *rvtrace_type_name(enum gtrace_component_type type)
 	}
 }
 
+/**
+ * struct rvtrace_match_data - Per-compatible data for RISC-V trace components
+ * @format:   Trace format to be used by the component.
+ * @get_impl: Optional callback to retrieve the implementation register value
+ *            encoded in the standard RISC-V trace IMPL register format. Used
+ *            by pre-ratified components whose IMPL register layout differs.
+ */
+struct rvtrace_match_data {
+	enum gtrace_format format;
+	u32 (*get_impl)(struct gtrace_platform_data *pdata);
+};
+
 static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)
 {
 	return gtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
