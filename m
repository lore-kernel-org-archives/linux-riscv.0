Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91401606A6A3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fBcJlIjK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=P4UxXP2F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bREreyovMofPmQ6IMWTkbyPqGHQ/IiUt/7AaPTjBCCQ=; b=fBcJlIjK5QV48zQIjHYrfnsdCh
	jazWbauwJB3uqxXLgEqu94myBZPl9qTDU4CCcrmk9rJ0NPDr5qoOb1+GOGKrjh6mXrgFFZ0D4wHJY
	KcpgCMk4l8fS4BSavr/Uq0bEEChsg1Rb959O2abCEyTWZUdcu34jNiSiZR9FMfkW3Mn65igA3e59z
	wNgkFU6OXt8GaEN1icjq2dgtYJdX6Du8/0FNWJcSyXYEMKyxY2MUmlWE0SfpReVn12B1PUT7eFBW9
	0FPE68WV/D2nc2/kCnaIm/59I1mgVT9SAGbe7FnE4WngOc8j8dUB2jgqxRnKeU3FKqmidt5tCYsx8
	NmvllDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS3-0000000CUBO-2lB2;
	Thu, 26 Nov 2026 09:07:35 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS0-0000000CU7U-17Nl
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:33 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-386d1859e1cso1341977eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684051; x=1796288851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYX7EvEq9ESzMVm36E28mPPSs82CWs6SVx64L9aqOo=;
        b=P4UxXP2FNiSlnKl3NJHHoja/R6RDHw8m1Q6JNUtkHkg6lwk9L+zRC6Gtwc1G83niGH
         BKvkcuVjX5G8Ye7nW/2pASBY0mLK4VWK1TLgXfRPKl9ObEtHztza/2sDVAexpmWGc9BR
         xZxy7RpojKKItDMSQf7lS46NVUHvLYY2m/C+PP6tmKIsCER7cwXXv8gamVzVlYfMboL3
         Khr2jOtABiPS8JL2LPFNHxJzVZCq8nNBm+O0EXtzVPCXD3csS7q0rD33cPGfZlzxPqN2
         9+xv98GRjZHki++7Z97MaVQkvPIhojn/QsDtg9EZhrFIBieMWnikwONF/tWap/S7lW8K
         7tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684051; x=1796288851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYX7EvEq9ESzMVm36E28mPPSs82CWs6SVx64L9aqOo=;
        b=kDlyeyNCxbHX6WjVU92MbqbrX/pgkbLNfNU9yk0iV9K3ZdffwL/BovDqAfpLE3/h/y
         2P9GsWxUNiDi1cimUdy2W1+dM+wJEo0a9HDzUDe1VaZPh0xjSrsY5N5Hc+iWodY1RQEs
         MIlL1dUYheZ0/gEe0Qk/59xNaDFglis1Mezq/Eq+5DDvb8q/qvkAdmQYQfeeZnG75Won
         9PD9Ap3gj/yIuPsc8QhWcKgbEMRdBcibGeAJ3gECDLPf30IM+OL9oCGUdZZSrtRh5hN3
         yLjaVsG0k0CVB03zswmrPUbxKivMA2O8GJ5HwH1spaweEn8fk4TFzQmsvoxBv3+j79vP
         sdeA==
X-Gm-Message-State: APuU4Z8Cs7T+kf8BEQx6Q4hf6Yz+KrQc1Gpat0D2Xr3yHBQx2YVm814c
	6jg0je9QWhZ/Zf2I6qTdDNYWW0IGDWbazlFYqSEBy0+zkvlWu/tmY32g2B2hSEZ5CD4=
X-Gm-Gg: AZFdTZe9b3dkf9zOVKHmf/FAY4ak4F4+ML5pC2IVeCTz3W/nclWeLoWAGhUkD96VPGj
	dP4ktCOKJovzYFTDtI+6HELIGX2QS5aNpMmZO9wdV8K8FVEyZn26wS9kGE99Vgff28vfKrszBkN
	B8hN6xlQTcOe1+tvpRNktP91Rilc8zzIhkfp+8sZg8DPgc/AFAeqHvXd8au1AoyyiCw93tvuHVz
	pZSl4QHFwWtbfPUkCfEdSeYgBgkXNbAGLb7QDn5M4r7XA0cxNoSln85Cll2sOJw/IbjW2spFU1b
	B2v4uXuwzw2cgdh25BqUT74MiJQ+4JshiGEAh5PfmpxFayyb+geboPFL5dAtd7qF1L/tryUhjsf
	yjWUNwe63/3d98X9rsVuPDNlhfa3VwcXiwMRFfK/yTtXsY92Xopn6uUJehlvcg3z7+XqBAMDJLd
	SaxHhyt7hCoGFMRv7X7fcqQXpWB6UFzkhdIL4SXDCtUZMYNFzcahVSLedTN0x5esRNVExNXzcSP
	cP2cDEeHNZvUiTM0UG5OMB+twzCyNSYbmFOnug/8perH9lPRGDmDsaGgApkL+VntjkkMvjDjBE1
	oKNlL1OL/I6wNh9wGjM44UZXrcwTQL0itbtXk/j+Z/7w
X-Received: by 2002:a05:693c:811c:b0:386:ddd5:14e2 with SMTP id 5a478bee46e88-386ddd52196mr1604430eec.0.1795684051199;
        Thu, 26 Nov 2026 01:07:31 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:30 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:15 -0800
Subject: [PATCH 09/10] gtrace: rvtrace: Add pre-ratified ramsink setup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-9-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010732_539397_5C027913 
X-CRM114-Status: GOOD (  25.75  )
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

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers and utilize a different register layout.

The sink is only set up when the component supports the SBA sink and
has no output connections, matching the sink selection done by
rvtrace_v0_sink_config().

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
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-encoder.c |  17 +++++
 drivers/hwtracing/gtrace/rvtrace-funnel.c  |  26 +++++++-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 102 +++++++++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.h |  31 +++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h      |  14 ++++
 5 files changed, 189 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 92672f1e7098..8d2f7ac5e0fe 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-ramsink.h"
 #include "rvtrace-v0.h"
 
 #define RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT	0x7
@@ -34,6 +35,8 @@
 
 struct rvtrace_encoder_priv {
 	u32 srcbits;
+	/* Sink embedded in a pre-ratified encoder, NULL if not used */
+	struct rvtrace_ramsink_priv *sink;
 };
 
 /*
@@ -112,6 +115,11 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 			val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
 			gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 		}
+
+		priv->sink = rvtrace_v0_ramsink_setup(comp);
+		if (IS_ERR(priv->sink))
+			return dev_err_probe(&comp->dev, PTR_ERR(priv->sink),
+					     "failed to setup ramsink.\n");
 		goto out;
 	}
 
@@ -151,10 +159,18 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
 		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 	}
+
 	dev_set_drvdata(&comp->dev, priv);
 	return 0;
 }
 
+static void rvtrace_encoder_remove(struct gtrace_component *comp)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	rvtrace_v0_ramsink_release(comp, priv->sink);
+}
+
 static int rvtrace_encoder_start(struct gtrace_path_node *node)
 {
 	struct gtrace_component *comp = node->comp;
@@ -246,6 +262,7 @@ static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 static struct gtrace_driver rvtrace_encoder_driver = {
 	.id_table = rvtrace_encoder_ids,
 	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
 	.start = rvtrace_encoder_start,
 	.stop = rvtrace_encoder_stop,
 	.driver = {
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
index 2e0843d233ab..463e504aaa92 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -7,10 +7,17 @@
 #include <linux/device.h>
 #include <linux/gtrace.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-ramsink.h"
 #include "rvtrace-v0.h"
 
+struct rvtrace_funnel_priv {
+	/* Sink embedded in a pre-ratified funnel, NULL if not used */
+	struct rvtrace_ramsink_priv *sink;
+};
+
 static int rvtrace_funnel_start(struct gtrace_path_node *node)
 {
 	struct gtrace_component *comp = node->comp;
@@ -45,22 +52,39 @@ static int rvtrace_funnel_stop(struct gtrace_component *comp)
 
 static int rvtrace_funnel_probe(struct gtrace_component *comp)
 {
+	struct rvtrace_funnel_priv *priv;
 	int ret;
 
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Pre-ratified ramsink setup */
+	priv->sink = rvtrace_v0_ramsink_setup(comp);
+	if (IS_ERR(priv->sink))
+		return dev_err_probe(&comp->dev, PTR_ERR(priv->sink),
+				     "failed to setup ramsink.\n");
+
 	ret = gtrace_enable_component(comp);
-	if (ret)
+	if (ret) {
+		rvtrace_v0_ramsink_release(comp, priv->sink);
 		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+	}
 
+	dev_set_drvdata(&comp->dev, priv);
 	return 0;
 }
 
 static void rvtrace_funnel_remove(struct gtrace_component *comp)
 {
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
 	int ret;
 
 	ret = gtrace_disable_component(comp);
 	if (ret)
 		dev_err(&comp->dev, "failed to disable funnel.\n");
+
+	rvtrace_v0_ramsink_release(comp, priv->sink);
 }
 
 static const struct gtrace_component_id rvtrace_funnel_ids[] = {
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index a164db57167f..f183dcd71c7c 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -7,12 +7,16 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/gtrace.h>
 #include <linux/minmax.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
 #include <uapi/linux/perf_event.h>
 #include "rvtrace.h"
+#include "rvtrace-ramsink.h"
+#include "rvtrace-v0.h"
 
 #define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
 #define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
@@ -348,6 +352,104 @@ static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
 	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
 }
 
+#ifdef CONFIG_RVTRACE_V0
+/*
+ * Register offsets for the pre-ratified system memory sink embedded in the
+ * trace encoder/funnel. teSinkBaseHigh holds the upper 32 bits of the base,
+ * the limit and the write pointer (shared register).
+ */
+static const struct rvtrace_ramsink_regs rvtrace_v0_sink_regs = {
+	.start_low	= RVTRACE_V0_SINK_BASE_OFF,
+	.start_high	= RVTRACE_V0_SINK_BASE_HIGH_OFF,
+	.limit_low	= RVTRACE_V0_SINK_LIMIT_OFF,
+	.limit_high	= RVTRACE_V0_SINK_BASE_HIGH_OFF,
+	.wp_low		= RVTRACE_V0_SINK_WP_OFF,
+	.wp_high	= RVTRACE_V0_SINK_BASE_HIGH_OFF,
+};
+
+/**
+ * rvtrace_v0_ramsink_setup() - Setup the sink embedded in a pre-ratified
+ * trace encoder/funnel.
+ * @comp: Pre-ratified trace encoder/funnel component.
+ *
+ * Return: Pointer to the sink private data, NULL if the component doesn't
+ * act as a system memory sink, or an ERR_PTR() on failure.
+ */
+struct rvtrace_ramsink_priv *rvtrace_v0_ramsink_setup(struct gtrace_component *comp)
+{
+	struct rvtrace_v0_comp_features *data = comp->id.data;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_ramsink_priv *priv;
+	u32 val, sink_bytes;
+	int ret;
+
+	if (!data)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Only components at the end of the topology write trace data to
+	 * system memory, see rvtrace_v0_sink_config().
+	 */
+	if (!data->has_sba_sink || !gtrace_is_sink(pdata))
+		return NULL;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	sink_bytes = (val >> RVTRACE_V0_IMPL_SINKBYTES_SHIFT) & RVTRACE_V0_IMPL_SINKBYTES_MASK;
+
+	priv->regs = &rvtrace_v0_sink_regs;
+	priv->size = SZ_1M;
+	priv->mode = MODE_SMEM;
+	priv->stop_on_wrap = false;
+	priv->mem_acc_width = RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN << sink_bytes;
+
+	/*
+	 * The pre-ratified ramsink's sink limit and write pointer registers share
+	 * their upper 32 bits with the sink base address register. This hardware
+	 * constraint prevents the trace buffer from crossing a 4GB memory boundary.
+	 *
+	 * Use the optional reserved memory region defined in the Device Tree to
+	 * ensure the buffer allocation adheres to this constraint. A buffer which
+	 * crosses a 4GB boundary is rejected by rvtrace_ramsink_setup_buf().
+	 */
+	ret = of_reserved_mem_device_init(pdata->dev);
+	if (ret && ret != -ENODEV)
+		return ERR_PTR(dev_err_probe(&comp->dev, ret,
+					     "failed to get reserved memory region\n"));
+
+	/* Set comp sink to SBA (system memory) */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+	val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+	val &= ~BIT(RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT);
+	val |= priv->stop_on_wrap << RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	ret = rvtrace_ramsink_setup_buf(comp, priv);
+	if (ret) {
+		of_reserved_mem_device_release(pdata->dev);
+		return ERR_PTR(ret);
+	}
+
+	return priv;
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_setup);
+
+void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
+				struct rvtrace_ramsink_priv *priv)
+{
+	if (!priv)
+		return;
+
+	rvtrace_ramsink_cleanup(comp);
+	of_reserved_mem_device_release(comp->pdata->dev);
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_release);
+#endif /* CONFIG_RVTRACE_V0 */
+
 static int rvtrace_ramsink_probe(struct gtrace_component *comp)
 {
 	int ret;
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.h b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
new file mode 100644
index 000000000000..0c1b346af8c0
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 SiFive, Inc.
+ */
+
+#ifndef __RVTRACE_RAMSINK_H__
+#define __RVTRACE_RAMSINK_H__
+
+#include <linux/err.h>
+#include <linux/gtrace.h>
+
+struct rvtrace_ramsink_priv;
+
+#ifdef CONFIG_RVTRACE_V0
+struct rvtrace_ramsink_priv *rvtrace_v0_ramsink_setup(struct gtrace_component *comp);
+void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
+				struct rvtrace_ramsink_priv *priv);
+#else
+static inline struct rvtrace_ramsink_priv *
+rvtrace_v0_ramsink_setup(struct gtrace_component *comp)
+{
+	return NULL;
+}
+
+static inline void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
+					      struct rvtrace_ramsink_priv *priv)
+{
+}
+#endif
+
+#endif /* __RVTRACE_RAMSINK_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index d1dac2034a14..a554ff938533 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -25,6 +25,16 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* Register offsets of the sink embedded in the encoder/funnel */
+#define RVTRACE_V0_SINK_BASE_OFF		0x010
+#define RVTRACE_V0_SINK_BASE_HIGH_OFF		0x014
+#define RVTRACE_V0_SINK_LIMIT_OFF		0x018
+#define RVTRACE_V0_SINK_WP_OFF			0x01c
+#define RVTRACE_V0_SINK_RP_OFF			0x020
+#define RVTRACE_V0_SINK_DATA_OFF		0x024
+
+#define RVTRACE_V0_CTRL_STOP_ON_WRAP_SHIFT	14
+
 /* teControl/tfControl sink selection */
 #define RVTRACE_V0_CTRL_SINK_SHIFT		28
 #define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
@@ -38,6 +48,10 @@ enum rvtrace_v0_sink {
 	TE_SINK_FUNNEL = 8,
 };
 
+/* Width of the trace sink: 0=32 bit, 1=64 bit, 2=128 bit, 3=256 bit */
+#define RVTRACE_V0_IMPL_SINKBYTES_SHIFT		16
+#define RVTRACE_V0_IMPL_SINKBYTES_MASK		0x3
+
 /* Number of SRC bits preset by hardware in the Nexus messages */
 #define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
 #define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
