Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26747606A69F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GK9wrCiJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NXUF8+hU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ZfQpszx2FLzZ6JHWke9TmXa/5EwLEtnmZSachKnIqs=; b=GK9wrCiJoI8+tli44HMiypkv5K
	H+b0XBH120oopIexpHiDh0oS/F3UuomSDLCGzFIqD2rrVWcGjZ18Nc+xtfRHwWgLSfClA1jSTx3il
	0UfSSxXoLVUIY8pxO/sH/FtdqdDRHcK5JsqF4pTiWwDdog9Su6Sly6FKAGoPX21sR/32nANpBJtnn
	HZBlubR/IdKwme5c7BDxstL+Ou8ujX/KZZQ/u9nOidMawkVlUNrnIwWFUOSo+QMZhq6zSAgVf9PW9
	tznAzsgAYyzvmyle1iowS9cn3pdxzgtN+9COZhBYP/SDbZLZynSJHI9Kxea+jfMBswzlju1M70T0C
	uvEdoc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS3-0000000CUB3-199C;
	Thu, 26 Nov 2026 09:07:35 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRy-0000000CU6b-3i0n
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:32 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386ab9ab619so8841150eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684050; x=1796288850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=496JOXpOEHemKz8UL2GWW4yob5VAkawIc7w2N9x0+W4=;
        b=NXUF8+hUlXJ1FIjyJO+XkbFR0TZMVBmxYIxjVsxC1V6iDHC5N9+A6aDtNbPIdRWIyh
         sxFjQwAVBUNVfO+9P16M9yLxwP1unPrKlT2XRLnf9R2aKZSQ1OKgjHBicyEge5cyXFXd
         accfEslctkeghbL2J06Rzyx68Xg5EP44NZXEfls2FeiZid21K9RBJ6nnKHic7LcD7IBY
         jFSGaSI0C1r6CPoS/C20MrR5RCSeeW62nYSm/b+nI3dc318DI8mA+JrLvuQpd5BXNNEC
         W74r+SWHheYqKcAa927fODBWZwvDPdEsXQ+cBo3dk8Uy+ZusfU1LABSpy2K2gzYnTYeI
         Dh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684050; x=1796288850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=496JOXpOEHemKz8UL2GWW4yob5VAkawIc7w2N9x0+W4=;
        b=O5KJ3puPMM6uA45IKGusRH7woGVmwYatp0bUWLqf12Y0apl/7+PKxanc6EXELrd5qj
         Keo59NvULUezydmfbDrVF1j+77G+EftTSZy+U9pmcg61bRDCSh9dFqu2yyAUjfScssbY
         2G+AUDF99dtjtHLJWnJCT1sfQCG3CDLZtqv+QcCxZR3BJs9Oul08r/8R6HTPa+1s+lSz
         vwVFcIzxxZYpKhEvP3UhaiYnXrQfX/YIsgiYvepaCLnaOPrmcpeTcRKQvwheTc6b4Hm6
         1JJv9B0HeK1IYU7VhlHSE6nQU7auvnIUmTtWh8b/211go83fsLJbg4l0rG+X39n4iK9m
         3XuQ==
X-Gm-Message-State: APuU4Z8adOS+bT68B6N8h69qT32LlVjG1Puppxdk3lREOAkhUxNcnQKQ
	2UOPiJURVC9+BJl/1qD6qAONtG2nE2FWrpSPRIbhEpwdaW4yG5VGhOT86v4L0jeQ4yE=
X-Gm-Gg: AZFdTZfjPVL7Kg86Cr2k+6XV5rKhJ0hmWxastDvS5Qquw9ZOa+ajFSQOuTjhCxYKqmK
	RvBElgp3FtntPlwJJ5sIdiaWIr/h1Y2MCTQ9RyEGIoqK0LeFb1t0zSCV6KUI0QW1XqIDKvwWiHu
	BwgH4rd1TajDXnHotwdwvjb3pbL3uhZEqLU3IjLn9UY5uUfCazLkzJrRpio8TNm6rudQoDggY/k
	kW0r+qH1nwMsOukgrEcRlG+iSPJZi3fk4g/OCa6rfPRecFrrAgYnqcAKBWVoOPkgNbrji8D9UFx
	OQs6oIZb9fmbiItPOf8qFV+6taMbDEk1CnKb8CPA6oO+Js8f5qUQS9zH9nexuxxECyCH8H57la+
	mt7F8Qk+Tilp8GPX5/An3Bnt0e1HUcCIk/FKmobTd2dAtUe1XxUBRD4mw/mFZlC0T+ahvfmkpRp
	LrwIdw3vii0zJ6uGMLhL4K0qL4NoocyhyEg9jOEymMh3JT/zjHk+0HdMl/dMu+1bXhCNMFK3xMq
	plmPBoKqrKOhtr/RGTbL2SwDNq9T/CqpD7E7LkQ3QoEaH6yU+BMNTIWEvLnOD16TiLsOgniUTcN
	LyouTcF/vyUgRxTh5alw5OTcKT9MLsocR4nQHFWx0WDW
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr24314577eec.41.1795684050228;
        Thu, 26 Nov 2026 01:07:30 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:29 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:14 -0800
Subject: [PATCH 08/10] gtrace: rvtrace: Introduce struct
 rvtrace_ramsink_regs to abstract register offsets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-8-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010730_939531_4870D540 
X-CRM114-Status: GOOD (  17.33  )
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

The pre-ratified trace ramsink implementation uses different register
offsets compared to the ratified RISC-V trace specification. To allow
the pre-ratified trace ramsink to leverage the rvtrace ramsink setup
and copy functions, introduce 'struct rvtrace_ramsink_regs'. This
abstracts the register map, enabling both pre-ratified and ratified
trace hardware to provide their own register layouts.

The read/write pair helpers no longer assume that the high register
is located right after the low register, and take both offsets.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 69 ++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 52aeb7626a55..a164db57167f 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -15,8 +15,11 @@
 #include "rvtrace.h"
 
 #define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
 #define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
 #define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
 #define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
 #define RVTRACE_RAMSINK_CTRL_MODE_MASK		0x1
 #define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
@@ -33,7 +36,39 @@ enum rvtrace_ramsink_mode {
 	MODE_SMEM
 };
 
+/**
+ * struct rvtrace_ramsink_regs - Register offsets for RAM sink implementations
+ * @start_low:  Offset of the start address low register
+ * @start_high: Offset of the start address high register
+ * @limit_low:  Offset of the limit address low register
+ * @limit_high: Offset of the limit address high register
+ * @wp_low:     Offset of the write pointer low register
+ * @wp_high:    Offset of the write pointer high register
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
+/* Register offsets for the standard RISC-V trace ramsink */
+static const struct rvtrace_ramsink_regs rvtrace_std_ramsink_regs = {
+	.start_low	= RVTRACE_RAMSINK_STARTLOW_OFF,
+	.start_high	= RVTRACE_RAMSINK_STARTHIGH_OFF,
+	.limit_low	= RVTRACE_RAMSINK_LIMITLOW_OFF,
+	.limit_high	= RVTRACE_RAMSINK_LIMITHIGH_OFF,
+	.wp_low		= RVTRACE_RAMSINK_WPLOW_OFF,
+	.wp_high	= RVTRACE_RAMSINK_WPHIGH_OFF,
+};
+
 struct rvtrace_ramsink_priv {
+	const struct rvtrace_ramsink_regs *regs;
 	size_t size;
 	void *va;
 	dma_addr_t start;
@@ -56,20 +91,22 @@ struct trace_buf {
 };
 
 /* Helper to access start, limit, wp pair registers */
-static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
+static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata,
+				     u32 low_off, u32 high_off)
 {
 	u32 low, high;
 
 	low = gtrace_read32(pdata, low_off);
-	high = gtrace_read32(pdata, low_off + 4);
+	high = gtrace_read32(pdata, high_off);
 
 	return (u64)high << 32 | low;
 }
 
-static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
+static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val,
+				       u32 low_off, u32 high_off)
 {
 	gtrace_write32(pdata, lower_32_bits(val), low_off);
-	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
+	gtrace_write32(pdata, upper_32_bits(val), high_off);
 }
 
 static int rvtrace_ramsink_start(struct gtrace_path_node *node)
@@ -152,6 +189,7 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 					    u64 *format)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	size_t bytes = 0;
 	bool wrap;
@@ -163,12 +201,13 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	src.base = priv->va;
 	src.len = priv->size;
 	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
-	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wp = rvtrace_ramsink_read_pair(comp->pdata, regs->wp_low, regs->wp_high);
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 
 	if (wrap) {
-		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+		rvtrace_ramsink_write_pair(comp->pdata, priv->start,
+					   regs->wp_low, regs->wp_high);
 		src.cur = wp - priv->start;
 		priv->prev_wp = priv->start;
 		/*
@@ -191,13 +230,14 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
+	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct device *pdev = comp->pdata->dev;
 	u64 limit_max, end;
 	int ret;
 
 	/* Probe max value for limit register */
-	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF);
-	limit_max = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, regs->limit_low, regs->limit_high);
+	limit_max = rvtrace_ramsink_read_pair(comp->pdata, regs->limit_low, regs->limit_high);
 	if (!limit_max) {
 		dev_err(&comp->dev, "trRamLimit register not implemented\n");
 		return -EINVAL;
@@ -218,13 +258,14 @@ static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 	 * Check if DMA start and end addresses allocated by the kernel can be set in the ramsink
 	 * start, limit registers respectively.
 	 */
-	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start,
+				   regs->start_low, regs->start_high);
 	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
 	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
-	rvtrace_ramsink_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, end, regs->limit_low, regs->limit_high);
 
-	priv->start = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
-	priv->end = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF) +
+	priv->start = rvtrace_ramsink_read_pair(comp->pdata, regs->start_low, regs->start_high);
+	priv->end = rvtrace_ramsink_read_pair(comp->pdata, regs->limit_low, regs->limit_high) +
 		    priv->mem_acc_width;
 
 	/* Sanity check start, end addresses */
@@ -245,7 +286,7 @@ static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 	priv->va = priv->alloc_va + (priv->start - priv->alloc_start);
 	priv->size = priv->end - priv->start;
 	priv->prev_wp = priv->start;
-	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, regs->wp_low, regs->wp_high);
 
 	return 0;
 
@@ -275,6 +316,8 @@ static int rvtrace_ramsink_setup(struct gtrace_component *comp)
 		break;
 	}
 
+	priv->regs = &rvtrace_std_ramsink_regs;
+
 	if (priv->mode != MODE_SMEM) {
 		dev_err(&comp->dev, "only smem mode is supported\n");
 		return -EOPNOTSUPP;

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
