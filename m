Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02D60A3812
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ghJ4NFSI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=WI6muSmC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nxU7z3N1xzuwj4QGKRdk5YlYDdi83IySdnM9sh65vyw=; b=ghJ4NFSIC4DLnawEaraxcIqSbO
	0Necag1pci57CGVxh51fdoz1blL+cQDb9yPJuMQjtTvzfMfuUKFx24gJK+BLyUazd9bLhNQ3snbZl
	wgPlnfmZST2ArWyVagacOcoKqAZPld09/epLBRiyP37UNgdkPk3VQWLGZVgTbkLeXr8aJ7zASX1rS
	ESaSEQ2VUFr07WrNvi2DSn2noZYSSZd10n8E2l+5xQ5pkD79jHALwl0olm0Y5WdRmAJvN9kgfb5Yz
	yoaUJK70e+lQCwI81pMcTu6R8vWJsrYFsM7EP7+vTHRBxAnJZtA9kG+0Zhn6EUD2MGtgpb2y/FTQc
	+HBmBZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRx-0000000CU4z-0bx6;
	Thu, 26 Nov 2026 09:07:29 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRt-0000000CU2j-39py
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:27 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38692f62b22so8497000eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684045; x=1796288845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwKsnhSZQ8XFeHSv0eyjguQWfHByolFJAVMuMClJrgY=;
        b=WI6muSmCnYvJ/ALIh5e4jD3zxnf0RM23hDj17JVemNyjE9x3hZ5fKOR1GBT/NR50PI
         bgkW3KmvFHy1/XatUuZPGxn1mRrZ473VHprSFrBN7q2Ze5Inz14wWInSvjMV9cdc9rAC
         0KCROuMHEmY+j9sqlYcJb5qydpwmPKKlooST1rKUZnkZ9JiatLFAL7ib0nCHRJ9bi9Z0
         bOLTM+bdznuFvVC75ShNn4BT/9xf60tBvKsjpLBlm+M/AeNYGfsGIKpgr1dDe9naReXR
         6FPAot8rqR8fw84vgWzol1PxKdlRgQvpTseV0e6ZIGAzPiFM6muTHIiZTHSx5CT+ZVSQ
         iz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684045; x=1796288845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwKsnhSZQ8XFeHSv0eyjguQWfHByolFJAVMuMClJrgY=;
        b=zVT4owHia283B9AZqxzDkkicM+WTpzE71zzXc0u8AkcD5XG/+s3KL5PdjL/Dy3zEvO
         p6D3lFNrrMprGkTJ1t141DqEddNLJTuK8Jff6girp45JLWipOZPntTEIsm4G4pUCzEcp
         jySHFZv93KiYZZ7cKRM3XA9f++/+zuqeHH4lNS7qFiggy8KOGVwz5mp6IfwsWZLCUbr9
         bIqfWxhsrNEIGoRejKrNw8k9475oBSYDTRiRiIfMuB8/PR62XwzaX8C68RDHQwU5Ie6z
         G86QGR//nF5byskIzFwkjMt742ZpuwCT0MlC6vLZXw5irkn5YkWhDUXtI9A+JFEULPhd
         LiPg==
X-Gm-Message-State: APuU4Z8JsiPOSKe2TkV8IbvY25Ju9HPzDMxo4wveQ9GzT0pYHxWoQ4j6
	bCpn0VUgy9dC1uZwEZ4fvN0Ii20R1iw+cA8pr3uEaOj+Hm0H5Eom8qZXxtZT58GBk+k=
X-Gm-Gg: AZFdTZdeqTiPAt2m5F/sBNR5fvW7lqMKbpczv5YXcovc1Oc24DvgHoLb6p+Ujne4FOQ
	2P5SDh60e7tYt2GmEgWj4D4lWNypbFp+CsntCo59wM9fWyY2zL91AWtdNx2Yv4IRwda2IUBZlxL
	dC33w9ABnRcmzXtj5uubr6zaDi4J+EccKNGzHXd7DbKe9UJntZvDub0o65NTPOQ1SLqlFs2dA73
	XPBzlah4SGs7kfPZpRr9gPSwpKm+VXvlEMckG2gKY0piZHv9uNlLKqw6vF20Ty9sD8G6ARms+6V
	5FsG8rVuSfWFoirxR+I+Il2Tf7Q4SRAdd2AoL4uf5C8rlcdXv04ggFV0BBg93xJ2NqjSar1uEap
	2Gn8XpW/R7iaxcl1lFXNahyOU+6UbFxQKfvZm4AyLZhrKU1Wa3OQMWwKN4fT6OKnJQS2zo9zu+Y
	KiJs+RoWNuRBfQymJ0LOEPMlCvBqgYiBK9HsI9TywJgpeWVd1B6aab8vi/OvN61J1Hd/yCGiREZ
	0F61UwRC2cKXmQVvW/MgIdtRRw9SWtO9JTdzav3wecPX6ylPqI6xEMkycMbFf6ixz6J9wFd6O7M
	MwvimxvTv6mpSu5PTi7H/A7Ggcw5tMwM6ukTdFOEUSPF
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr20691278eec.37.1795684044736;
        Thu, 26 Nov 2026 01:07:24 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:24 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:09 -0800
Subject: [PATCH 03/10] gtrace: rvtrace: Add pre-ratified private data
 callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-3-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010725_838106_945D5DBE 
X-CRM114-Status: GOOD (  16.26  )
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

For pre-ratified trace hardware, a trace component might support
different trace sinks, and its trace sink availability information
is embedded within the implementation register.

Introduce a get_data() callback function in 'struct rvtrace_match_data'
to retrieve the component's supported trace sink features and store
this information in the gtrace component ID data (comp->id.data). This
allows the driver to access the pre-ratified hardware capabilities
during setup.

While at it, zero-initialize the on-stack gtrace_component_id so that
id.data is never left uninitialized for ratified components.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-platform.c | 10 ++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.c       | 22 ++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h       | 22 ++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          |  4 ++++
 4 files changed, 58 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 8c1503bd8d98..b9b256d469e2 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -71,6 +71,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	u32 impl, type, major, minor;
 	struct device_node *node;
 	struct resource *res;
+	void *data = NULL;
 	int gtype;
 	int ret;
 
@@ -126,6 +127,12 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	else
 		impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
 
+	if (match_data->get_data) {
+		data = match_data->get_data(pdata);
+		if (IS_ERR(data))
+			return PTR_ERR(data);
+	}
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -139,6 +146,7 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 
 	id.type = gtype;
 	id.version = rvtrace_component_mkversion(major, minor);
+	id.data = data;
 
 	comp = gtrace_register_component(&id, rvtrace_type_name(gtype), pdata);
 	if (IS_ERR(comp))
@@ -172,11 +180,13 @@ static const struct rvtrace_match_data rvtrace_std_data = {
 static const struct rvtrace_match_data rvtrace_v0_encoder_data = {
 	.format = GTRACE_FORMAT_NTRACE,
 	.get_impl = rvtrace_v0_get_encoder_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 
 static const struct rvtrace_match_data rvtrace_v0_funnel_data = {
 	.format = GTRACE_FORMAT_NTRACE,
 	.get_impl = rvtrace_v0_get_funnel_impl,
+	.get_data = rvtrace_v0_get_comp_data,
 };
 #endif
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
index a5ca9001bc08..01e62642c245 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -3,10 +3,32 @@
  * Copyright (c) 2026 SiFive Inc.
  */
 
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/gtrace.h>
 #include "rvtrace.h"
 #include "rvtrace-v0.h"
 
+void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata)
+{
+	struct rvtrace_v0_comp_features *data;
+	u32 impl;
+
+	data = devm_kzalloc(pdata->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
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
 static u32 rvtrace_v0_get_impl(struct gtrace_platform_data *pdata,
 			       enum rvtrace_component_type type)
 {
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 2d83c87936b9..0681405fa414 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -9,9 +9,31 @@
 #define __RVTRACE_V0_H__
 
 #include <linux/gtrace.h>
+#include <linux/bits.h>
 #include <linux/types.h>
 
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
 u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
+void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata);
 
 #endif /* __RVTRACE_V0_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index 7f9e88d99b8f..b0cf2e1d875f 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -115,10 +115,14 @@ static inline const char *rvtrace_type_name(enum gtrace_component_type type)
  * @get_impl: Optional callback to retrieve the implementation register value
  *            encoded in the standard RISC-V trace IMPL register format. Used
  *            by pre-ratified components whose IMPL register layout differs.
+ * @get_data: Optional callback to retrieve component specific private data
+ *            which is stored in gtrace_component_id.data. Returns an ERR_PTR()
+ *            on failure.
  */
 struct rvtrace_match_data {
 	enum gtrace_format format;
 	u32 (*get_impl)(struct gtrace_platform_data *pdata);
+	void *(*get_data)(struct gtrace_platform_data *pdata);
 };
 
 static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
