Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC3C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc3/fQ3QdUNyBCFAynfLqcqwrjA55wrdzkzfSLWDGZg=; b=Tim07EI16VkgNS
	7+uWquSmeBiGfxflVj0ib/P485fi9bmDao+waALfGu2VRtZjMi7SphRM7kvhgqpk2iwC9RjesfeQf
	QT87QRlIBf5Kco58sNe43ZogIFEuegRpWJfHrl0LeahBHjK9pMjGmsWeJBudF7ZzxCLMMgMmBmXkn
	crJfnvJ2124M+/iGwtbL2IVZPMMKc3t9RA+Gbi7M6qLRGVoRWD6tkUW9jJ0KqzMneA2ITjFoTWJJP
	omdV/29SzM8ZwkHLY1UBlwlmxh8j/mrweSpedo1GdkCluAKux3ayIXm9nn9viSkARGbjMMiUWeE6C
	vuiSmCjiv9KWoT3DwD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV48-0000000GVtf-0gv5;
	Tue, 30 Jun 2026 09:47:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV43-0000000GVoH-18fQ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c81d799ef2so21213785ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812854; x=1783417654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54+PVtGjT/I2+HzWeb9Nv2WTZ9NUADQGofIdWFcjJJQ=;
        b=EWZEacv0Ya0rf+oBMP7X6Sh5tS1zLDOdrfwPk9fAbqacIHuYngCbb/yxoM87NktH34
         Eq5tEupyrJ2Dh4jFgCIVR8uYiBa+p4xDrs5bhbnJnQM+kFoQDi+2FIY6QWZU5HRwSH2A
         zeIR4M8UalDPioNoIZQx4k1b4zehwzyKE6TimTINr8A24yPTfTT5SvKK5sCWq1OzE5YL
         Ma4fdt8OF2m1aQ0bmmb2J46RYGtx++eJxOlUt+IJXE7dvBAv2WQ5agi/TsW8jNcFXqhG
         HEINbToBuMzJKxBC1HPTALr5fmxnDPPFnmx6Ynw1VobrPi+zUq59Rbs/I4eKcIT97lvc
         Nx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812854; x=1783417654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54+PVtGjT/I2+HzWeb9Nv2WTZ9NUADQGofIdWFcjJJQ=;
        b=UcDliPE3fpR9t4IX/h5GDv2viUyUwE/X8eTKvoG3o+oBohrHkUm5I7bHHFolUe7w8S
         pDNiAJupFb8f9WkEKOC3kx+8JvpvsHkEUiP+bIlRL/gWBd2FWmL4X1wgdY9NxwLUCOEF
         7T37ZCfQ94Y2XLiIxPt6SmAvMcYlpDQTAumacSIKfBwnrdhZ8l26V0jU65qIrqMo+116
         kyxsEbBUge+nBJzrBUfIHeqbrflRlWEIEGj+oLgaHp5xpgJ4OKOWJE+bFOgH4v1/P+vy
         UYr6L67doDb1gzIOcBMysRoOZ9k3LAeZMUfIbPQd6Ch0WAjs/GIKOBs1YhtDTk81JWRA
         D/eA==
X-Gm-Message-State: AOJu0YxOtw/63WTgpXDmK124AhTAS/YOSiR5fvakz7zCVlG9lJ01gmiz
	KdmB5gadMxMYGBJ6Rd4bgL6GHQJnDJiRe2ahNo+ugfYdWzjV+dvmlBlq551116dsyZo=
X-Gm-Gg: AfdE7cmbI7qw4eIoGkDLYSGvRVu7yEW5cRViZ2PZ4zqbujuBRgMm8dh0c8VnYGf1x7P
	YG7rYxvAyHJkPscxnGu3002kDny5QNmPArbNY6oiKEpDFYnLPA/Cc3KtKpgreXC4Hqf2NhUb30I
	MP998MYIsEdqyeujWEaXtEqZ2BxBUTXSTCGkS/0ZudfxZbjz6BoZMXAeXtDDTNFCrVDz4X6GrBy
	R1qBoBnuaCwap9PBW4ws0FsrZoxKAkw8bXBzjII7OcfXRmin5f9BAnBUuxah/LcSu9Iw2w9M4Nz
	BXH1DWLhM/qXbYrgR112kpNBhEeYYd0lqU7MmGISpNkOdrfphBt7g5mVay7Xaz3xQsbw76FHdUP
	bbc7kASdszdyfhwXrhvw3WYtIJRhZ5Xo5uHEgvnBf3hg2XjodV/6FLhF+VmskJyJG5aYxSBUN1h
	wUmlEUulhZnL7hVHIgTUJ6qIrJacMpwK4=
X-Received: by 2002:a17:902:e5ce:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2ca2eb33b99mr19931405ad.41.1782812854578;
        Tue, 30 Jun 2026 02:47:34 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:33 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:33 +0800
Subject: [PATCH RFC 10/12] rvtrace: Add copyto_auxbuf callback for
 pre-ratified encoder and funnel
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-10-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=6066;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=Y3LvXJ3xi2Nh+1HpbBhWNRW5L27t0VCjKmEzMmykAkg=;
 b=yZAyP0pNSWntOPDmVRDriT6BLWnDpoI8J1hALe2FjprJKbrdNQZXXMBGlksIJ+9wpiyX0YAlS
 Dz1xA3RgL5tCuedfhyy3tK3tQDW/B302hQVzT/7iyJGk28mB0JgUYRs
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024735_360279_7E05499F 
X-CRM114-Status: GOOD (  17.80  )
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
or funnel MMIO registers.

When pre-ratified encoder and funnel components act as a sink, the
trace data must be copied from the trace buffer to the perf AUX buffer
after tracing is stopped. To support this, export
rvtrace_ramsink_copyto_auxbuf() and assign it as the copyto_auxbuf
callback for the encoder and funnel drivers.

Note: if an encoder or funnel component is acting as a source in a
given path, we must check that the trace component is the last node
in the trace path before invoking its copyto_auxbuf() callback.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    |  2 +-
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 10 ++++++++++
 drivers/hwtracing/rvtrace/rvtrace-funnel.c  | 10 ++++++++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c |  5 +++--
 drivers/hwtracing/rvtrace/rvtrace-ramsink.h |  2 ++
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 153cf3ebffff..d902524e0358 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -677,7 +677,7 @@ int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
 	list_for_each_entry(node, &path->comp_list, head) {
 		comp = node->comp;
 		rtdrv = to_rvtrace_driver(comp->dev.driver);
-		if (!rtdrv->copyto_auxbuf)
+		if (!rtdrv->copyto_auxbuf || node->conn)
 			continue;
 
 		*bytes_copied = rtdrv->copyto_auxbuf(comp, buf);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index b187731ff855..41e74cac0c25 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -7,6 +7,7 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
@@ -78,6 +79,8 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
+	struct rvtrace_v0_comp_features *data;
+	struct rvtrace_driver *rtdrv;
 	int ret;
 	u32 comp_maj;
 
@@ -87,6 +90,13 @@ static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 		ret = rvtrace_v0_ramsink_setup(comp);
 		if (ret)
 			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+		data = (struct rvtrace_v0_comp_features *)comp->id.data;
+		if (data && (data->has_sba_sink || data->has_sram_sink)) {
+			rtdrv = to_rvtrace_driver(comp->dev.driver);
+			if (!rtdrv->copyto_auxbuf)
+				rtdrv->copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf;
+		}
 	}
 
 	ret = rvtrace_enable_component(comp->pdata);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-funnel.c b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
index 21f58001d569..b30609278a79 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-funnel.c
@@ -8,6 +8,7 @@
 #include <linux/rvtrace.h>
 #include <linux/types.h>
 #include "rvtrace-v0.h"
+#include "rvtrace-ramsink.h"
 
 static int rvtrace_funnel_start(struct rvtrace_path_node *node)
 {
@@ -53,6 +54,8 @@ static int rvtrace_funnel_stop(struct rvtrace_component *comp)
 static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
+	struct rvtrace_v0_comp_features *data;
+	struct rvtrace_driver *rtdrv;
 	int ret;
 	u32 comp_maj;
 
@@ -62,6 +65,13 @@ static int rvtrace_funnel_probe(struct rvtrace_component *comp)
 		ret = rvtrace_v0_ramsink_setup(comp);
 		if (ret)
 			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+		data = (struct rvtrace_v0_comp_features *)comp->id.data;
+		if (data && (data->has_sba_sink || data->has_sram_sink)) {
+			rtdrv = to_rvtrace_driver(comp->dev.driver);
+			if (!rtdrv->copyto_auxbuf)
+				rtdrv->copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf;
+		}
 	}
 
 	ret = rvtrace_enable_component(comp->pdata);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e794b01e19d0..d89cdcb971dd 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -179,8 +179,8 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 	}
 }
 
-static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
-					    struct rvtrace_perf_auxbuf *buf)
+size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
+				    struct rvtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	const struct rvtrace_ramsink_regs *regs = priv->regs;
@@ -224,6 +224,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }
+EXPORT_SYMBOL_GPL(rvtrace_ramsink_copyto_auxbuf);
 
 static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
index 7e0391aeffd5..a398db78e803 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.h
@@ -7,5 +7,7 @@
 #define __RVTRACE_RAMSINK_H__
 
 int rvtrace_ramsink_setup(struct rvtrace_component *comp);
+size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
+				     struct rvtrace_perf_auxbuf *buf);
 
 #endif /* __RVTRACE_RAMSINK_H__ */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
