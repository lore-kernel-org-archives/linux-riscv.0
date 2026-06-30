Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E5C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNRJPx4MOwjJnXMuyfYrf5MmPyDjEfy5DUSkcmKnGeE=; b=zSSVlY678s+Kyc
	NizLKXFclvkRz4abqA+KQyYhbMw0WREKqvAngub66PWRazlJg8qBcD098ieKzbgDnkhe3Bwl9rIf3
	5OYPUliV7ThnvRNaTtNSOMm8GK92i8qrkk8HfTz/vHFlMS0Z/usiGVZ/MOcdxf4Xb76Nd5xVEXquc
	DccMXcdMVrHNn47medNlAXYn1jF7C7PoCxq+ZVeUfVVd3mv0BzKYlCc/YUlgfu/+R5js8l7GUZSyd
	gqO3JSXxs9abDljYqIoV7TFewzBcAR1E2EUa3B1YGCzC8Vwv9KCsJ0DVnTLJ/1pTBgNh/XZlxYXXa
	+mhOUrTpev/jgCEOl/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV4H-0000000GW69-2blB;
	Tue, 30 Jun 2026 09:47:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV4F-0000000GW2W-41Co
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BFOOmoV1aNQ+UZSLd9xC7p0AFbf/86JbQyaITygLl/I=; b=fygJEgWb8UNsimSQC2dRpSCJvN
	eU3jHhFPoW7Fa2vfJMHPzB/v8BthNFlV5JHmj4mcYTUSXNc9kRp9f4+fMY7A8y0LxE7BBBgOuEsSj
	Ki9v1fE8oetMyUNi7wSbH0n76dvPPChMLibrman5j0S1mBLZn/l+XmfoZ92sH8WfKPxrc3Ia2yf/W
	N0nCiH9/P4QBQwuTKc7T03mg1zLM334UsLafSzfQA7pmRMav3iyToOCC8xEdpX4eBuRyYzGG9rg7Y
	+ammpO2JZGoEvshkQ4jj5Wqdf6rP059WgNVpHGufx7aD0zlsgwXV1stXouN8+jmWyi+X6/C/SOq/K
	yWotcG1Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weV4B-00000001jXs-3XP6
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c821a50615so21687155ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812861; x=1783417661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFOOmoV1aNQ+UZSLd9xC7p0AFbf/86JbQyaITygLl/I=;
        b=O9lnBdUvlgfN7Xuj8ArM6eEzChKy/H1t5SacycFhmOknBvF5hOiQ2k+JVSdW04E/Mb
         9G5vCiFMJouJJG3WibJGF3UiN22i+ZyXYAHoEOf/xA12UsTrxfey8ZmSQZzXCWlOcQ0J
         Gl/jrszIOtf6GWCuA/98QwB/3W3HZP+IhBDx4q7moSw9KEkafK5FUxJ4sNvGjrJqDxNf
         ++ixSuBgqWe0eh8wUuuZmXRPZxscrHT+qKJNbxgAl6pj4cjmfPuTTmco8kObONb4XawY
         X5KnElFMv6IG4q+HXQR1LyIyt2/BzkARCLz/9s+VSWw9ctGui1T28WH4z9ZvbukqPpWm
         FFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812861; x=1783417661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFOOmoV1aNQ+UZSLd9xC7p0AFbf/86JbQyaITygLl/I=;
        b=QZ2FcvWvOU5y+M2NZ9dfQi0d6qHFFa+COIcOkDGwNdsp6D+Ju/RG9ZzRClPZzfTpY4
         wfsHGqNdNYWUdecvObTF1olzQBWhlcRIYlpfbonne0i73RKPSyghCc+Ws4IY8xOFuPfR
         MVUMK6NcsfFZS4qW5BYNa9sTIB21W9CwNaFAmXAY/hFXU17UoEQNXH3ePjhOZIADtzNN
         muXFSdwzYERHDueP6lAWCzpbs7sLVRs9ZJD5Bc0SF48bssRDbVrEd3CMXxts0SE5ojYm
         vZ6C16FaZ8rpP6pye96oScQGjwHgs9BxsRyKy6VAI57ggC5omcvxZxc8w4dR0j7cTQ2t
         Yanw==
X-Gm-Message-State: AOJu0YxjqVIDhx2coXzeIaqUsMctK1rY7P/BQLOw5xaVZo8znLAnEg+Q
	HqHOo0b9laTchAqXY+T7DIod1OLbwfzutHqaq9k7H/tsJnpAOtLDhNg0/ZbY2tc7FHQ=
X-Gm-Gg: AfdE7ckN4k8MeSSftoUXZuwEBZHuEx7TL8PncJHNWON1/ggLJ/QM2DHcPJrnMi7U5Ek
	TxOtMcHYltdq/FeQ2Fj6Z17/SgHAAfG610Iwlrk5Fl7UGbRvn/ESHK29ZxhQX7H8vDvaCbKo3Ht
	dUjLskOuk2r6QkkFXG1QZbbixHvPoFojGZTOCbTONZoit4uxFohA5GCTowK2nEvdD5KMRehGo0N
	qTOVbdxSoTN5UmyodGo78HPJQlttuxMEL51JufZDQjS1+vL4ungQxlK47hlZ7fVQO0grClsi4z0
	7B4iJpK/pFGqB86GJAoV8Doqu/Ckwc2IQ8HgZtojQYq5PWaCtYchVFh7dUPlDiPRIXOxPzcgQp6
	2Y042Vu2S530UU0AEwKKa4q8cAlh9MpmNIJKv7Bq4ZkskRw1rJkjhl473zR0qnr6Xn/gchPWAMV
	mOCGtn9z58/UL0HffxlPvjbl+E99HQczU9fmKxoE4IMA==
X-Received: by 2002:a17:903:1b6d:b0:2c9:f44e:9942 with SMTP id d9443c01a7336-2ca2d547e03mr23166855ad.13.1782812844489;
        Tue, 30 Jun 2026 02:47:24 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:23 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:31 +0800
Subject: [PATCH RFC 08/12] rvtrace: Introduce struct rvtrace_ramsink_regs
 to abstract register offsets
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-8-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=8625;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=5/p1BkMdW55JzvCfTycWeCnv1Rmss0WQ88QFmhxlUK0=;
 b=XmAjM4IPZ7JekNuRXy+uU+tMpw2zAAw2qbW7VEutOMIm1NXa4oN+RBf3Qbx1Kc4SQfEpnJUFu
 YxisxbAGAxxDAnRC177xnShYjsftsLTvof7Xh3bDQSbt2IiSbB8Azyu
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104744_225577_EDD37954 
X-CRM114-Status: GOOD (  17.51  )
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

The pre-ratified trace ramsink implementation uses different register
offsets compared to the ratified RISC-V trace specification. To allow
the pre-ratified trace ramsink to leverage the rvtrace_ramsink_setup()
function, introduce 'struct rvtrace_ramsink_regs'. This abstracts the
register map, enabling both pre-ratified and ratified trace hardware
to provide their own register layouts.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 97 ++++++++++++++++++++++-------
 1 file changed, 76 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index 7aa525ac0f75..e569e875568b 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -26,6 +26,39 @@ enum rvtrace_ramsink_mode {
 	MODE_SMEM
 };
 
+/**
+ * struct rvtrace_ramsink_regs - Register offsets for RAM sink implementations
+ * @start_low:   Offset of the start address low register
+ * @start_high:  Offset of the start address high register
+ * @limit_low:   Offset of the limit address low register
+ * @limit_high:  Offset of the limit address high register
+ * @wp_low:      Offset of the write pointer low register
+ * @wp_high:     Offset of the write pointer high register
+ *
+ * Different RAM sink implementations may have different register layouts.
+ * This structure allows the common code to work with any layout.
+ */
+struct rvtrace_ramsink_regs {
+	u32 start_low;
+	u32 start_high;
+	u32 limit_low;
+	u32 limit_high;
+	u32 wp_low;
+	u32 wp_high;
+};
+
+/**
+ * struct rvtrace_ramsink_priv - Private data for RAM sink implementations
+ * @size:         Size of the allocated DMA buffer
+ * @va:           Virtual address of the DMA buffer
+ * @start:        DMA start address
+ * @end:          DMA end address
+ * @mode:         Ramsink mode (e.g., SRAM vs SMEM)
+ * @stop_on_wrap: Whether to stop tracing when buffer wraps
+ * @mem_acc_width: Memory access width in bytes
+ * @regs:         Pointer to register offset definitions
+ * @prev_wp:      Previous write pointer position (for incremental copies)
+ */
 struct rvtrace_ramsink_priv {
 	size_t size;
 	void *va;
@@ -34,15 +67,32 @@ struct rvtrace_ramsink_priv {
 	enum rvtrace_ramsink_mode mode;
 	bool stop_on_wrap;
 	int mem_acc_width;
+	const struct rvtrace_ramsink_regs *regs;
 	u64 prev_wp;
 };
 
+/**
+ * struct trace_buf - Trace buffer descriptor for copy operations
+ * @base: Base address of the buffer
+ * @cur:  Current position in the buffer
+ * @len:  Length of the buffer
+ */
 struct trace_buf {
 	void *base;
 	size_t cur;
 	size_t len;
 };
 
+/* Register offsets for the standard RISC-V trace ramsink */
+static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
+	.start_low    = RVTRACE_RAMSINK_STARTLOW_OFF,
+	.start_high   = RVTRACE_RAMSINK_STARTHIGH_OFF,
+	.limit_low    = RVTRACE_RAMSINK_LIMITLOW_OFF,
+	.limit_high   = RVTRACE_RAMSINK_LIMITHIGH_OFF,
+	.wp_low       = RVTRACE_RAMSINK_WPLOW_OFF,
+	.wp_high      = RVTRACE_RAMSINK_WPHIGH_OFF,
+};
+
 static int rvtrace_ramsink_start(struct rvtrace_path_node *node)
 {
 	struct rvtrace_component *comp = node->comp;
@@ -117,6 +167,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 					    struct rvtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	u32 wp_low, wp_high;
 	size_t bytes = 0;
@@ -128,16 +179,17 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	dst.cur = buf->pos;
 	src.base = priv->va;
 	src.len = priv->size;
-	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
-	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
-	wp = (u64)(wp_high) << 32 | wp_low;
+
+	wp_low = rvtrace_read32(comp->pdata, regs->wp_low);
+	wp_high = rvtrace_read32(comp->pdata, regs->wp_high);
+	wp = (u64)wp_high << 32 | wp_low;
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 	if (wrap) {
 		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
-				RVTRACE_RAMSINK_WPLOW_OFF);
+				regs->wp_low);
 		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
-				RVTRACE_RAMSINK_WPHIGH_OFF);
+				regs->wp_high);
 		src.cur = wp - priv->start;
 		priv->prev_wp = priv->start;
 		/*
@@ -160,22 +212,23 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct device *pdev = comp->pdata->dev;
 	u64 start_min, limit_max, end;
 	u32 low, high;
 	int ret;
 
 	/* Probe min and max values for start and limit registers */
-	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
-	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
+	rvtrace_write32(comp->pdata, 0, regs->start_low);
+	rvtrace_write32(comp->pdata, 0, regs->start_high);
+	low = rvtrace_read32(comp->pdata, regs->start_low);
+	high = rvtrace_read32(comp->pdata, regs->start_high);
 	start_min = (u64)(high) << 32 | low;
 
-	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	rvtrace_write32(comp->pdata, 0xffffffff, regs->limit_low);
+	rvtrace_write32(comp->pdata, 0xffffffff, regs->limit_high);
+	low = rvtrace_read32(comp->pdata, regs->limit_low);
+	high = rvtrace_read32(comp->pdata, regs->limit_high);
 	limit_max = (u64)(high) << 32 | low;
 
 	/* Set DMA mask based on the maximum allowed limit address */
@@ -203,10 +256,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 		priv->start = start_min;
 	}
 
-	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
-	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), regs->start_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), regs->start_high);
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), regs->wp_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), regs->wp_high);
 	/* Setup ram sink limit addresses */
 	if (priv->end > limit_max) {
 		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
@@ -217,10 +270,10 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 
 	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
 	end = priv->end - priv->mem_acc_width;
-	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
-	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
-	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	rvtrace_write32(comp->pdata, lower_32_bits(end), regs->limit_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(end), regs->limit_high);
+	low = rvtrace_read32(comp->pdata, regs->limit_low);
+	high = rvtrace_read32(comp->pdata, regs->limit_high);
 	end = (u64)(high) << 32 | low;
 	if (end != (priv->end - 4)) {
 		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
@@ -252,6 +305,8 @@ static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
 		break;
 	}
 
+	priv->regs = &rvtrace_std_ramsink_regs;
+
 	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
 	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
