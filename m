Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146BEC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsLqNwt5ZWdadloLv4MwEKTfvD9jL86bnwdY+hX25VQ=; b=cCa1ciVY+91JB8
	4DnjTLv9Hhmg9H0lDyNOQJnv9zXH0NorSwk0qRLP91mCHrgOIh/3Jj4bjBYMRvoE3+589gp86LuLK
	Zp0ciYhDo7DvOyBBQt8DSRXOSvtma1kwShNjnzTNQGjqWMtbVoKQ1BIYrY8nOXYebtic/4LtxrGO1
	v3/cPl59JhlqYsv38qqbVyoRhpMGa35olk8/ybWaf6NRrntER2GSENlJxd/VJTJcAbMOu1Hkw5p9o
	NsSYH1XDeNSkSt8SeQMEV01z+m/ZpfxQQ2YQgrDrDX1pLhU5hAS93OtMGR5QUoHQI3m3nL1ir3Ynj
	/DLG/6lEnyWARd9NQRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3Z-0000000GVKH-0vzH;
	Tue, 30 Jun 2026 09:47:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3W-0000000GVIG-1BXo
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c95a0c0aa2so29351995ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812821; x=1783417621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnAOQCSsF2o4VZGP8SMJogyuZsC7iPNVxWIrUn/m6BM=;
        b=DteoA8K6n9f69Mgl/q+anUrfXUMM/1hcm6ljvAltn04bTGTsNjmGEEZhIVFpYUC9uL
         lBoyx4OfzeeWrcHKpt0mRA09qqT1ROH6pB/b+aLt6s6Pqcy3RznfyZJG//kc7xGKC0CS
         GuzlEsUXMcIL39HUg91MSzQoBkYR2SLnjdOOgxe+SzcnTw/yldzhBTy+7cDOPEbgxT3A
         /v+4pv1MeBfZzcpoqbqq/eY000OQXVp9jYr3/nXSeppsbSQhu870tao4+YJfERZlRePN
         nRA0DmkkoyJ+f1xt53RyiuJMA5g9z3AC98t+tpuTMHEKq1Z0NaBhK0d6gEMJnIVucVuI
         F/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812821; x=1783417621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnAOQCSsF2o4VZGP8SMJogyuZsC7iPNVxWIrUn/m6BM=;
        b=ZOqaFJBYskHDdNBtkxvregUMphphD1157XeRKJOav1mSAq1Mj4KFc6WLesY58FyCdr
         ap+IcshOZaE5PR8GdDDWJmW3lPheFf3TB0jgdbSbPiRVipCfAv1xgwV+x4C30VD1CW7i
         +HIwFtGTDv6u8Src62NWB7ll9u03k5P3FOVsYh+vguOPqoQOSNCavy636GAsYuymDlIq
         t+tQdHicdouF1x30mfgcorbdnjIRDcImuWUBcBZVmx1hiYSggSpdk/9a+Lx3LzhutKaf
         VC6U2qchee4+gXA2yAihM6cirIQzTkYSVuV6KuARVzSm1JurFTpQgkyNPZz3+iv9arU0
         3BeQ==
X-Gm-Message-State: AOJu0YzBfleThg4psEHvRyHoFqOIkRd/suxnUbZXRyrGQLJ2d74Uw9GY
	snJmhtcoJRGiBvjLQW7OfcGzFNpd9NZaCw/F8vEGg9oa9bKvO1JmufHBNks0CWB5oDk=
X-Gm-Gg: AfdE7cleNt18+iIy590THFf1g1yUZWuK7eU7ycOQjAWOFsKvhMW072eQ58qPBH3oYuG
	8krHwDMcjsFmWw2cLe6sv5QjrGL/q9dStCoMErBjYIrmwTS9XvEp+8cVwnkVc+m8TG5w2Wh81F8
	I6k9GQ6LqjPGykdd3XJ++Yp+ESs4VHqU5vSGIz0INyUsXYukJfInsVxNflFWMDqU9hbrKozxEbJ
	pqQ/yHw2tlijKhIFu89N6KxOrd16I9SNOLU5hjg+lJJ55sFOF7rfQBswNaFYOhlmDSEgd15efEA
	ZcUAgkcn5CEeaL5DNtB2N83IHSmsEIge8xuUVfdU9aaq+QkrDKMV1pgUEQp4dGEmnm9+vdcTI0w
	VtEekFut5OBgYhmznpEVk+tAzXHcJvHWxnylkcr3TOt53X3EYlQ5fp29Bg6Hl8B5P11kYsTEI7F
	c5Cs9A/5xwUvFZQvu4j7rHH9u4DN94pVI=
X-Received: by 2002:a17:902:e950:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2ca2d52a0cbmr23236415ad.3.1782812821271;
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:00 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:26 +0800
Subject: [PATCH RFC 03/12] rvtrace: Add pre-ratified private data callback
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-3-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=7165;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=JTR9gEm5UhAF2yG09QL0loA3AKcywA37X87hRt3foz0=;
 b=tIbr2LFjXZEnVs8swWuQjZQ2fAxttCaAZlsULyX3YmBYqEw2oL34+Ya3+P/l+3mWuotHnCsQI
 bhlCNQl+RiyCkZUWHdGwLeJTk3dnBDCW/C3Fu9uZVWEgAM/XPS6KuYR
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024702_334564_3A2D5203 
X-CRM114-Status: GOOD (  18.38  )
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

For pre-ratified trace hardware, a trace component might support
different trace sinks, and its trace sink availability information
is embedded within the implementation register.

Introduce a get_data() callback function in 'struct rvtrace_driver_data'
to retrieve the component's supported trace sink features and store
this information in the component's private data. This allows the driver
to access the pre-ratified hardware capabilities during setup.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c     |  4 +++-
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 11 ++++++++++-
 drivers/hwtracing/rvtrace/rvtrace-v0.c       | 20 ++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h       | 21 +++++++++++++++++++++
 include/linux/rvtrace.h                      |  4 +++-
 5 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 58454e9ddb4e..51546cbcc6ad 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -368,7 +368,8 @@ static void rvtrace_component_release(struct device *dev)
 
 struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
 						     u32 version,
-						     struct rvtrace_platform_data *pdata)
+						     struct rvtrace_platform_data *pdata,
+						     void *data)
 {
 	struct rvtrace_connection *conn;
 	struct rvtrace_component *comp;
@@ -413,6 +414,7 @@ struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type
 	comp->pdata = pdata;
 	comp->id.type = type;
 	comp->id.version = version;
+	comp->id.data = data;
 	ret = rvtrace_alloc_type_idx(comp);
 	if (ret) {
 		kfree(comp);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
index 6cf8e7dae2ad..8d2b03668c2a 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -122,6 +122,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	u32 impl, type, major, minor;
 	struct device_node *node;
 	struct resource *res;
+	void *data = NULL;
 	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -168,6 +169,11 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (driver_data) {
 		if (driver_data->get_impl)
 			impl = driver_data->get_impl(pdata);
+		if (driver_data->get_data) {
+			data = driver_data->get_data(pdata);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+		}
 	} else {
 		impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
 	}
@@ -179,7 +185,8 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
 
-	comp = rvtrace_register_component(type, rvtrace_component_mkversion(major, minor), pdata);
+	comp = rvtrace_register_component(type, rvtrace_component_mkversion(major, minor),
+					  pdata, data);
 	if (IS_ERR(comp))
 		return PTR_ERR(comp);
 
@@ -205,10 +212,12 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 
 static const struct rvtrace_driver_data rvtrace_v0_encoder_data = {
 	.get_impl = rvtrace_v0_get_encoder_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct rvtrace_driver_data rvtrace_v0_funnel_data = {
 	.get_impl = rvtrace_v0_get_funnel_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct of_device_id rvtrace_platform_match[] = {
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index 825de1120c8d..bed35f631390 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -6,6 +6,26 @@
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
 
+void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata)
+{
+	struct rvtrace_v0_comp_features	*data;
+	u32 impl;
+
+	data = devm_kzalloc(pdata->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+
+	data->has_sram_sink = impl & RVTRACE_V0_IMPL_HAS_SRAM_SINK_MASK;
+	data->has_atb_sink = impl & RVTRACE_V0_IMPL_HAS_ATB_SINK_MASK;
+	data->has_pib_sink = impl & RVTRACE_V0_IMPL_HAS_PIB_SINK_MASK;
+	data->has_sba_sink = impl & RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK;
+	data->has_funnel_sink = impl & RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK;
+
+	return data;
+}
+
 static u32 rvtrace_v0_get_impl(struct rvtrace_platform_data *pdata, u32 type)
 {
 	u32 impl, major, minor;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 511aa6489caa..562d3a77c513 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,8 +9,29 @@
 
 #include <linux/rvtrace.h>
 
+#define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
+#define RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT	5
+#define RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT	6
+#define RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT	7
+#define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT	8
+
+#define RVTRACE_V0_IMPL_HAS_SRAM_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_ATB_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_PIB_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
+#define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
+
+struct rvtrace_v0_comp_features {
+	bool has_sram_sink;
+	bool has_atb_sink;
+	bool has_pib_sink;
+	bool has_sba_sink;
+	bool has_funnel_sink;
+};
+
 u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
+void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata);
 
 #endif /* __RVTRACE_V0_H__ */
 
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index fdf6115d7f06..9f1afcfd83e6 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -160,6 +160,7 @@ struct rvtrace_platform_data {
  */
 struct rvtrace_driver_data {
 	u32 (*get_impl)(struct rvtrace_platform_data *pdata);
+	void *(*get_data)(struct rvtrace_platform_data *pdata);
 };
 
 static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
@@ -263,7 +264,8 @@ struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
 
 struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
 						     u32 version,
-						     struct rvtrace_platform_data *pdata);
+						     struct rvtrace_platform_data *pdata,
+						     void *data);
 void rvtrace_unregister_component(struct rvtrace_component *comp);
 
 /**

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
