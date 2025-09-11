Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C30CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B65zZbqdZ4IPBpp0I4pYnbiF508HuMIdIvoJpT1smoA=; b=2/MlI0SvHej2rn
	8Nm2P3WTEHmGaMt+z7Z8SW9co+XUyVlfMdQFXtvL7M6Fa1k/4FFUVku3Wj2FZaasTIgcKUASuqA59
	zVJZYrhM4MAsL6MykDT8Cr/1eNx4W2X9SFxUc5O99Q3RXIMvCCo8dx+bMEBvVgooHl5zfRg88hXX6
	DY6dzDAKNXV9VlZocmsKxUT1bF2/jtTXri8cu6nYwks85IMxe8rX9Swdw41Z/Gll29/hgKVTy/diM
	v4LY83szSl4FOZLteIiJS99Hqum3XO3Ed8oimaEymcF7E8T6mw/HviU79Z0EfYOxIbdaeQd4WbYMi
	rujRR+jCegAdlwRjX7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfw-000000032kH-1MIV;
	Thu, 11 Sep 2025 12:45:20 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfs-000000032hg-2S3X
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 12:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757594714; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=klrJ7g5FLgpuRyahGw6eB5ihL1iuaDQ6Jxw1/EVd0js=;
	b=Xn8Tawu/lSHe5b+OTSAts4Qr+ckhRNC9D/ewvfXDSE1q5MCBFTc2NJ6ESgZahBeI/qDYK9Jf2esy6Q3ifVNszXXBpsMTjZpUQs8/dcOplB7cUm98mdp2kP1F3zGKYLQ0VmwZbRdoiidYWsW0CpnbARpcYZid51UYYyMcWOU1gYs=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WnmLJjq_1757594712 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Sep 2025 20:45:13 +0800
From: cp0613@linux.alibaba.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [RFC PATCH 4/4] riscv: trace: Support sink using dma buffer
Date: Thu, 11 Sep 2025 20:44:48 +0800
Message-ID: <20250911124448.1771-5-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911124448.1771-1-cp0613@linux.alibaba.com>
References: <20250911124448.1771-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_054516_785978_2B3B3F74 
X-CRM114-Status: GOOD (  15.24  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

In common SoC systems, the trace data by the sink is usually
written to the memory, and the memory needs to be a large block.

We have two methods to achieve this. One is based on reserved
memory. This method requires pre-isolation of memory and is not
flexible enough. Therefore, we chose the second method, which is
based on IOMMU to map non-contiguous memory to continuous. When
implementing the driver, only the DMA alloc related APIs are needed.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/events/riscv_trace.c | 49 ++++++++++++++++++++++++++++++++-
 arch/riscv/events/riscv_trace.h |  4 ++-
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/events/riscv_trace.c b/arch/riscv/events/riscv_trace.c
index 3ac4a3be5d3e..e8deaefa0180 100644
--- a/arch/riscv/events/riscv_trace.c
+++ b/arch/riscv/events/riscv_trace.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/perf_event.h>
 #include <linux/vmalloc.h>
+#include <linux/dma-mapping.h>
 
 #include "riscv_trace.h"
 
@@ -55,6 +56,44 @@ static void riscv_trace_init_filter_attrs(struct perf_event *event)
 		riscv_trace_pmu.filter_attr.priv_mode);
 }
 
+static int riscv_trace_sink_dma_alloc(unsigned long size)
+{
+	struct riscv_trace_component *component;
+	dma_addr_t dma_addr;
+
+	list_for_each_entry(component, &riscv_trace_controllers, list) {
+		if (component->type == RISCV_TRACE_SINK) {
+			component->sink.vaddr =
+			    dma_alloc_coherent(riscv_trace_pmu.pmu.dev, size,
+					       &dma_addr, GFP_KERNEL);
+			if (component->sink.vaddr) {
+				component->sink.start_addr = dma_addr;
+				component->sink.limit_addr = dma_addr + size;
+				continue;
+			} else {
+				pr_err("dma_alloc_coherent failed\n");
+				return -ENOMEM;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void riscv_trace_sink_dma_free(void)
+{
+	struct riscv_trace_component *component;
+
+	list_for_each_entry(component, &riscv_trace_controllers, list) {
+		if (component->type == RISCV_TRACE_SINK) {
+			if (component->sink.vaddr)
+				dma_free_coherent(riscv_trace_pmu.pmu.dev,
+					component->sink.limit_addr - component->sink.start_addr,
+					component->sink.vaddr, component->sink.start_addr);
+		}
+	}
+}
+
 static int riscv_trace_event_init(struct perf_event *event)
 {
 	if (event->attr.type != riscv_trace_pmu.pmu.type)
@@ -105,7 +144,7 @@ static void *riscv_trace_buffer_setup_aux(struct perf_event *event, void **pages
 {
 	struct riscv_trace_aux_buf *buf;
 	struct page **pagelist;
-	int i;
+	int i, ret;
 
 	if (overwrite) {
 		pr_warn("Overwrite mode is not supported\n");
@@ -135,6 +174,12 @@ static void *riscv_trace_buffer_setup_aux(struct perf_event *event, void **pages
 
 	pr_info("nr_pages=%d length=%d\n", buf->nr_pages, buf->length);
 
+	ret = riscv_trace_sink_dma_alloc(buf->length);
+	if (ret) {
+		kfree(pagelist);
+		goto err;
+	}
+
 	kfree(pagelist);
 	return buf;
 err:
@@ -148,6 +193,8 @@ static void riscv_trace_buffer_free_aux(void *aux)
 
 	vunmap(buf->base);
 	kfree(buf);
+
+	riscv_trace_sink_dma_free();
 }
 
 static int __init riscv_trace_init(void)
diff --git a/arch/riscv/events/riscv_trace.h b/arch/riscv/events/riscv_trace.h
index c28216227006..7819fbeace1f 100644
--- a/arch/riscv/events/riscv_trace.h
+++ b/arch/riscv/events/riscv_trace.h
@@ -49,7 +49,9 @@ struct riscv_trace_funnel {
 };
 
 struct riscv_trace_sink {
-	;
+	u64 start_addr;
+	u64 limit_addr;
+	void __iomem *vaddr;
 };
 
 struct riscv_trace_component {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
