Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DB606A691
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z40G4bKV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Caj54Gb/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fsZLJLKSHM7kmVQKE9fBV8YjHTIoEWXL0dy9UeWM1lw=; b=z40G4bKVSV1AUTXqxOhiH1aLPc
	H5z9MCNLfX+8X06RlBjk4uB7xyYVDJAtTOIFnIp3ULDuWlx3hrv4QYK95pHODCg60H0ldEyU5QCEL
	5pcs8efWrXe80w4RGy2eCUXFNCXG0ajmPU/qGGQmScfQGUkzzOLpW+NMwoSVw8OlW8NTgz8ehEG2N
	vDYn7u8ANbiTyJiCB5euTV6jwqpVUL701e9bG9zCdYxi0UBquv+pS16vTh3797mtXXwz4EEcdxYQJ
	rW660cHsxQjoeBiJJtXx1POYYOkxSfgzZ0vasrCV1Y07Ynpv0HEjbv2Bq68dBvgrwW30NbScPMBQa
	61wPu+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS2-0000000CU9B-1ybK;
	Thu, 26 Nov 2026 09:07:34 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRw-0000000CU4O-2MLf
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:30 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-386d1859e1cso1341901eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684048; x=1796288848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eduOfrcMezccrel/htE1vCdBesOoz7m//Yk7KumNRU=;
        b=Caj54Gb/EX6J7JUNu8Y69lFkL2x0hEI+d45Ci+gDCCTNp1Ws/7RsJ/UAGyGwpxuXwn
         QKkwvsRY+WiJ4oZmSVkoS7Dok3+HeG8wJQ7KxoJOKqQbXRjFb7GJqOkuPVX0GuXDPwIi
         dZd6o0wrhxsXh/OLEhIAkneKz7QpJfi/B6c6Gw291UnS7Q8NSYUHFpQvB/tcv7ZrRAIz
         ky/K2gIgfKHhoyiC3NKVr/JepEMCEFDf/yW80HRmT6Ym7jaQaMwor7nQReZEZQCnrYrb
         gEJAgQj2asS9FcbGqckBk4DoGE5APttLmCjpmcCHUIoImy2dJod/7GYqVb6kMQ2jBkyn
         lbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684048; x=1796288848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eduOfrcMezccrel/htE1vCdBesOoz7m//Yk7KumNRU=;
        b=gtrxSqjMqtQ7JSponUpbjl6YY3TZvvU1C/+D8GF71W+NmZEkRqmSkD9pbzjovE6gai
         9GrRyaxQ8Kw0OTXun2T9yV5iV2XdnS3++FKtqp2I+Xz9Aqnsg9ELbsiSH48or/n7TaYg
         t/szIP3963/dT0Wc4xv+PpNLZ/583AM2j4OTDWaH4oHeS6aWurVP8OtK12gKo34DvJxp
         mtDpgO3Aw4QZP904MgSzDSJCUYa7duovvYutps3JV0MOUOtombjpeMQfydVBXcFvv93J
         WCmfIJChba/tB9uqJjAW5Zpld7OIqe7qQRrVAr2i9D6EI7q/FFCetWTfGMCU0pCtbsyT
         HCcw==
X-Gm-Message-State: APuU4Z8bP+zoDUQNmWgoSqLFagf4NyzI9XfAJ21dNjtRPhWU1uX/IooM
	G4z/ltjBch7eLQTyWALjpqVvaEWa3xWZL2kf1f2Z9DapY6Vje/0iWrV6G2Azu2AvkiY=
X-Gm-Gg: AZFdTZed3SphGOyJFw6GzEuXmqnjt0qDbYKdWuC20cH5JWR0D6dq7HDGYNDDidp7EpK
	txGbxPsQeBaElZyDI07ggv6Ci+mzwoazsgMd9yN7MTJ+isUGUAZVLmJdZULHLKvoeJ3/7eEHHHg
	5im5n/9djp+QN+lGlI5zs+XjGSil8KGAbSyotj68E5LzZbfkcpl4sRGy5tdZ2rEz/56ywOV3x3o
	fu3fPeM4A3sqLnrw3HtLe3BILFKTSdIGRlwg4x355b6M684nh/+/Zka8HEk5GpcthY+AELQqKkz
	OAMwhaGgXbI4HRDBy0oCty3i88t0tmrzrEoX7U7KIgePZ9MxH8jvFoRDyt9BQ5vILMZ4iIDKFgv
	n+6AqrfUkupWAEsKkUpQaxBkOHcdN94X8qvm0Whw3i32UPn7UdHjthIr199Nz73MC8NSOHOdj2V
	5Kxiq4ZjyUzfiBx1a+9tDBYDerxPbPyp3FdC6LrkewCUwoRwnp8IrDGprbadJC0eCtjbQ/WDNm+
	VHwdKMTcrVYswx6agxtHkT9ZcODWTAMYjq6v3NQxhAk0zZfzGqxJsudQU79gynwUsHRf2T3Jw71
	7XQCHB9Kfxz+X7vpJOcdhkZpHmY7pXLbRGF+HUF1pauy
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr23988422eec.6.1795684047793;
        Thu, 26 Nov 2026 01:07:27 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:27 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:12 -0800
Subject: [PATCH 06/10] gtrace: rvtrace: Add pre-ratified trace sink config
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-6-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010728_672009_3E40AE69 
X-CRM114-Status: GOOD (  26.60  )
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

To decide which sink to send trace data to, pre-ratified trace
hardware (eg., SiFive, Eswin) sets a sink bitfield directly within the
current component's control MMIO register.

Routing trace data from a source to an output component requires
configuring the connections between components, and the mechanism
varies between hardware implementations:

  - Standard (ratified) RISC-V trace configures routing at the
    receiving end. For example, a funnel uses the trFunnelDisInput
    register to control which source input is accepted.
  - Pre-ratified hardware configures routing at the sending end,
    selecting the output destination by setting a bitfield directly
    within the current component's control MMIO register.

To support both, component drivers need the path topology when
starting, rather than just the component itself, so update the
gtrace_driver start() callback to take a struct gtrace_path_node.

Introduce rvtrace_v0_sink_config() for pre-ratified trace hardware to
configure the destination sink based on the hardware capabilities and
the current trace path before starting the trace.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 13 +++------
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 10 ++++++-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c |  3 ++-
 drivers/hwtracing/gtrace/rvtrace-v0.c      | 43 ++++++++++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h      | 23 ++++++++++++++++
 include/linux/gtrace.h                     | 19 +++++++++++--
 6 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 09b200bd1690..6fe71c5cd0cf 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -498,12 +498,6 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
-struct gtrace_path_node {
-	struct list_head		head;
-	struct gtrace_component		*comp;
-	struct gtrace_connection	*conn;
-};
-
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
 {
 	struct gtrace_path_node *node;
@@ -621,8 +615,9 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
-static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+static int __gtrace_comp_start(struct gtrace_path_node *node, pid_t owner)
 {
+	struct gtrace_component *comp = node->comp;
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
 	unsigned long flags;
@@ -639,7 +634,7 @@ static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
 		}
 	} else {
 		if (gtdrv->start) {
-			ret = gtdrv->start(comp);
+			ret = gtdrv->start(node);
 			if (ret)
 				goto out;
 		}
@@ -686,7 +681,7 @@ int gtrace_path_start(struct gtrace_path *path)
 	int ret = 0;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		ret = __gtrace_comp_start(node->comp, path->owner);
+		ret = __gtrace_comp_start(node, path->owner);
 		if (ret)
 			break;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 0a23c78c0caf..92672f1e7098 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -155,8 +155,9 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
-static int rvtrace_encoder_start(struct gtrace_component *comp)
+static int rvtrace_encoder_start(struct gtrace_path_node *node)
 {
+	struct gtrace_component *comp = node->comp;
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
 	int ret;
@@ -171,6 +172,13 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 			dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
 			return ret;
 		}
+	} else {
+		/* Set pre-ratified comp's next sink */
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
 	}
 
 	ret = gtrace_enable_component(comp);
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 67b6779aacee..52aeb7626a55 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -72,8 +72,9 @@ static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 v
 	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
 }
 
-static int rvtrace_ramsink_start(struct gtrace_component *comp)
+static int rvtrace_ramsink_start(struct gtrace_path_node *node)
 {
+	struct gtrace_component *comp = node->comp;
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	u32 trram_ctrl;
 	int ret;
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
index 01e62642c245..c9254e71a972 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -5,10 +5,53 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gtrace.h>
 #include "rvtrace.h"
 #include "rvtrace-v0.h"
 
+/*
+ * Pre-ratified trace hardware selects the destination of the trace data
+ * with the teSink/tfSink field in the component's own control register,
+ * i.e. routing is configured at the sending end. The destination is
+ * derived from the trace path: the last node of the path (no outgoing
+ * connection) writes to system memory (SBA), otherwise the component
+ * feeds the funnel the path connection leads to.
+ */
+int rvtrace_v0_sink_config(struct gtrace_path_node *node)
+{
+	struct gtrace_component *comp = node->comp;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_v0_comp_features *data = comp->id.data;
+	struct gtrace_component *next;
+	u32 val;
+
+	if (!data)
+		return -EINVAL;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+
+	if (!node->conn) {
+		/* Last node in the path */
+		if (data->has_sba_sink)
+			val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		else
+			dev_warn(&comp->dev,
+				 "Component is last node but doesn't support SBA sink\n");
+	} else {
+		next = node->conn->dest_comp;
+		if (next && next->id.type == GTRACE_RVTRACE_FUNNEL &&
+		    data->has_funnel_sink)
+			val |= TE_SINK_FUNNEL << RVTRACE_V0_CTRL_SINK_SHIFT;
+	}
+
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_sink_config);
+
 void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata)
 {
 	struct rvtrace_v0_comp_features *data;
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 5abdc4788f64..d1dac2034a14 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -10,6 +10,7 @@
 
 #include <linux/gtrace.h>
 #include <linux/bits.h>
+#include <linux/errno.h>
 #include <linux/types.h>
 
 #define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
@@ -24,6 +25,19 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* teControl/tfControl sink selection */
+#define RVTRACE_V0_CTRL_SINK_SHIFT		28
+#define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
+
+enum rvtrace_v0_sink {
+	TE_SINK_DEFAULT = 0,
+	TE_SINK_SRAM = 4,
+	TE_SINK_ATB = 5,
+	TE_SINK_PIB = 6,
+	TE_SINK_SBA = 7,
+	TE_SINK_FUNNEL = 8,
+};
+
 /* Number of SRC bits preset by hardware in the Nexus messages */
 #define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
 #define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf
@@ -40,4 +54,13 @@ u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
 void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata);
 
+#ifdef CONFIG_RVTRACE_V0
+int rvtrace_v0_sink_config(struct gtrace_path_node *node);
+#else
+static inline int rvtrace_v0_sink_config(struct gtrace_path_node *node)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* __RVTRACE_V0_H__ */
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index b8826b25d35a..6b2ff2a63694 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -258,6 +258,18 @@ struct gtrace_path {
 	pid_t				owner;
 };
 
+/**
+ * struct gtrace_path_node - Representation of a node in the trace path.
+ * @head: List head for linking nodes in the path.
+ * @comp: Pointer to the trace component at this node.
+ * @conn: Pointer to the connection leading to the next node (NULL for sink).
+ */
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
 struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
@@ -291,7 +303,10 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
  *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
- * @start:         Callback to start tracing.
+ * @start:         Callback to start tracing. The path node gives access to
+ *                 the component and to the connection leading to the next
+ *                 component of the path, so that drivers can program their
+ *                 routing registers.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
@@ -304,7 +319,7 @@ struct gtrace_driver {
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
 						 struct gtrace_perf_auxbuf *buf,
 						 u64 *format);
-	int			(*start)(struct gtrace_component *comp);
+	int			(*start)(struct gtrace_path_node *node);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
