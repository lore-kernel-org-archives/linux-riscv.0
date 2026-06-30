Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E092C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAW/O2Lr0h3I1zkAsDr/L90vVVazToIAQLYp3OqWbQA=; b=JfSXQennXH8wR0
	dhCrZntIa5xW8Zayp+ub0mJnofiQpdf+guxLY4yxFCZjjFMQqmVxNAoRKM5tyi2vdGI1TvOAOgbEP
	WpA77Jsrffvbiej2pAH0RpSN90OzQXTp+mWDU1cfeRjv20T49yOPbW41RDV/fcGU5h/m4bS5hDCAA
	T59b/xdmLrS5PNLsnq65CyOaDPSqGvqe9GNQrhNlFAf3X//K0UbrDWG0lNnA16BDx4zjrACVofB9y
	Kh8uls7HW4tized6WR6M46vEfr72BunRaCPD8dnBkSW0roQTA0B0mJJSYcN6QBEKVb+s3dkU+o47D
	t8Imr4FiCzfOR46rfkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3v-0000000GVfL-2hw5;
	Tue, 30 Jun 2026 09:47:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3u-0000000GVeC-2Nl5
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ozDuGKmJyaLLZ/9Y2e4zVCOrAth1HXfElawe4E1zEVc=; b=C08+n/K7ycNqleNSahq4ZnlVxe
	gSLxNsrh5Wkpu5m+5Rj293LgjCtt1/Q45JwVJTaApVoJYYl4SqFZUm8saOPT56wKad7Rigbw0mc+e
	BqaS1EvwuxbPd7K22n4+7YyUvMldCJQdpXpdDiVlDAVfw50Q86fx+EcRrFCkCc/xw2sCu7h+X29W2
	U7gWcJS0PyVXAOpfejyeIKt5/N1JemxkdYs7WsMQuPUaoS6OLiU0cIZZoPXaoLPuRLjlLinW+LFnH
	Hb3zhDe39jnwpN6jRfdT3EU8DJFH6NcOYX8K90wJg/hbVwVTMUriOAqujoUwYfgceh3Eu1okx3cKj
	H8MDhfcg==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weV3n-00000001jOh-3hin
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9e8a1d256so20353255ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812835; x=1783417635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozDuGKmJyaLLZ/9Y2e4zVCOrAth1HXfElawe4E1zEVc=;
        b=OG+o58Pp+dQLizHZHmtog7sl5uINAS60QMxzcQOh8S63n1Fe8oDZNl7Md5a4WDKcqK
         PmdFfoL16uDz/GUnSwJDDFh0ejZ2cqUhhQWHqcN35NTVAQymxL8pSwyZF/gzWvYNCjIp
         YvdyevJ90Nq4k7/vipABrEogXLLAcDK2LJN0Z+3lJbdW6OgQQiKZ/yK/27AUFPmrqmkB
         3dA3WGTSuO4ZRtZrkCkrPklpH3nLTeUNDmm1+uPMEz7eav7QT8LUZQr2Z7GdcipbLCFj
         PxUZyDzVKicoBwA1rwwPRaVzMsNQCTJIv1XMUGPAPI2jZxVfAOcGf01emECuh/dEqXb6
         stgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812835; x=1783417635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozDuGKmJyaLLZ/9Y2e4zVCOrAth1HXfElawe4E1zEVc=;
        b=jMLPsvZbJvqLxtoPLpo8YjD6wFzGOy3EMSVskIJTREJl/h+nG36I4mRECBEOWnlsxG
         dmOtNLdQAhn/VHYos3gAx6Nr+E8FlJHnFyxva0VUdeh2AnbDczGQ7eaQjGySZAniAYd6
         pgzwnjqjQNFmX19T1RteiW7DBwpAiGUiT6rFkkF6o5Aug62OjpbtPe465aFjxx8Ab7Fp
         r/9TrAuULkqatVPph57zZ9EteXVeczckgAx35xmKmbvMX8YdCDXGIhBAt11/uUFbtAds
         ws22FWKqNn+vfqDqmak6Y8xuMu7lqSRtv+8FMvtyk24l7ejyG32F20/cEi9Bygxawwfv
         B4cw==
X-Gm-Message-State: AOJu0YwniXLF1CnIPqB7dQG+6tVH0NQSKt6/A3AmCGvI1dSoj8nUXaEM
	cZmEO8MWenitBnrY+aeO9/mJBMrErrJLw7TReyAzY3HAH4ZfnNSBq8kUs391TwqbwfU=
X-Gm-Gg: AfdE7cllLV4kcGtesAb9KXzNMRyIAUczgxkJ5wQAwiaQM6miB8C0cjH4yIgJtdAcT7n
	yes7rdWjEx8mDLykm3v9CqrdYnbSChHd+VqzKWPzEuXZUA1k5eeoShyUvgTamwcMXGRTrgkxrkT
	+FyL3ENuNnyPb5jfUeOgiEHuOqG/1B826jSYiEQWiOEz06cdBzCyHDLXlDRycUELC+CSjelyovx
	ZrNMXsA0ljrdry8kXZtJxjUji/Kvrpth1PTNdEL6GuTPAat7rrrIl+Rc7bABEDfC9gKHsBnTf32
	+7HzyvA09zYiLluMiK8k0EpfNZ24N2vY2tsXzOBL29KG6YRXjTXvV2VNxakOUXBCV7R+HwQ75kH
	qSpUCZ2los7HEoC56YLQYP/7bKFb8tw6UuqPd9kZcMECR+tTkCYSiEw5uK+CDgbRr3SJrgBJ5Po
	AMP84AiUowFhQL/M4/lp94ovtZQhNRkUo=
X-Received: by 2002:a17:902:ea0c:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2ca2e915405mr23302545ad.29.1782812835400;
        Tue, 30 Jun 2026 02:47:15 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:14 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:29 +0800
Subject: [PATCH RFC 06/12] rvtrace: Add pre-ratified trace sink config
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-6-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=5772;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=ECTwA0XtfV45FIxMVmnl4WL7ctH+u5U0uVvayrBzmhw=;
 b=lwgZgEA1WBif9ZVQ2oc6ygnD0CAKPkGgM2IdZ8v89xxblXjLonQfEF5ml90GGNjh5JF1APth5
 1Z+E8QPmFDyA3FixbxI9ELSf+gpPKQuPAR8k+sDCS5xnFP3MkvbNXMG
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104721_728945_9ECFB3A3 
X-CRM114-Status: GOOD (  16.63  )
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

To decide which sink to send trace data to, pre-ratified trace
hardware (eg., SiFive) sets a sink bitfield directly within the
current component's control MMIO register.

Introduce rvtrace_v0_sink_config() for pre-ratified trace hardware
to correctly configure the destination sink based on the hardware
capabilities and the current trace path before starting the trace.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 27 +++++++++++-----------
 drivers/hwtracing/rvtrace/rvtrace-v0.c      | 35 +++++++++++++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-v0.h      | 15 +++++++++++++
 3 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index f3be47e448cf..47740bbdc206 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/rvtrace.h>
 #include <linux/types.h>
+#include "rvtrace-v0.h"
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
@@ -15,14 +16,19 @@ static int rvtrace_encoder_start(struct rvtrace_path_node *node)
 {
 	struct rvtrace_component *comp = node->comp;
 	int ret;
-	u32 val;
+	u32 val, comp_maj;
+
+	/* Set pre-ratified comp's next sink */
+	comp_maj = rvtrace_component_version_major(comp->id.version);
+	if (comp_maj == 0) {
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
+	}
 
-	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
-	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
-			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
-			       comp->pdata->control_poll_timeout_usecs);
+	ret = rvtrace_enable_component(comp->pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to enable encoder.\n");
 		return ret;
@@ -61,12 +67,7 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 		return ret;
 	}
 
-	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
-	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
-			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
-			       comp->pdata->control_poll_timeout_usecs);
+	ret = rvtrace_disable_component(comp->pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to disable encoder.\n");
 		return ret;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.c b/drivers/hwtracing/rvtrace/rvtrace-v0.c
index bed35f631390..ba87e1f7a839 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.c
@@ -6,6 +6,41 @@
 #include <linux/rvtrace.h>
 #include "rvtrace-v0.h"
 
+int rvtrace_v0_sink_config(struct rvtrace_path_node *node)
+{
+	struct rvtrace_component *comp = node->comp;
+	struct rvtrace_path_node *next_node = NULL;
+	struct rvtrace_v0_comp_features	*data = NULL;
+	u32 val;
+
+	data = (struct rvtrace_v0_comp_features *)comp->id.data;
+	if (!data)
+		return -EINVAL;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+
+	/* last node in list */
+	if (!node->conn) {
+		if (data->has_sba_sink) {
+			val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		} else {
+			dev_warn(&comp->dev,
+				 "Component is last node but doesn't support SBA sink\n");
+		}
+	} else {
+		next_node = list_next_entry(node, head);
+		if (next_node && next_node->comp->id.type == RVTRACE_COMPONENT_TYPE_FUNNEL &&
+		    data->has_funnel_sink) {
+			val |= TE_SINK_FUNNEL << RVTRACE_V0_CTRL_SINK_SHIFT;
+		}
+	}
+
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	return 0;
+}
+
 void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata)
 {
 	struct rvtrace_v0_comp_features	*data;
diff --git a/drivers/hwtracing/rvtrace/rvtrace-v0.h b/drivers/hwtracing/rvtrace/rvtrace-v0.h
index 562d3a77c513..48728fef24c0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/rvtrace/rvtrace-v0.h
@@ -9,6 +9,9 @@
 
 #include <linux/rvtrace.h>
 
+#define RVTRACE_V0_CTRL_SINK_SHIFT		28
+#define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
+
 #define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
 #define RVTRACE_V0_IMPL_HAS_ATB_SINK_BIT	5
 #define RVTRACE_V0_IMPL_HAS_PIB_SINK_BIT	6
@@ -21,6 +24,15 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+enum rvtrace_v0_sink {
+	TE_SINK_DEFAULT = 0,
+	TE_SINK_SRAM = 4,
+	TE_SINK_ATB = 5,
+	TE_SINK_PIB = 6,
+	TE_SINK_SBA = 7,
+	TE_SINK_FUNNEL = 8,
+};
+
 struct rvtrace_v0_comp_features {
 	bool has_sram_sink;
 	bool has_atb_sink;
@@ -33,5 +45,8 @@ u32 rvtrace_v0_get_encoder_impl(struct rvtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct rvtrace_platform_data *pdata);
 void *rvtrace_v0_get_comp_data(struct rvtrace_platform_data *pdata);
 
+int rvtrace_v0_sink_config(struct rvtrace_path_node *node);
+int rvtrace_v0_ramsink_setup(struct rvtrace_component *comp);
+
 #endif /* __RVTRACE_V0_H__ */
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
