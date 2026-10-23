Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52444606A326
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m1bk8b+y;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kxJdmQni
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wvvM3My3mulaQgDp9woNNMUaIaW80UKO6iKJUpl+sK0=; b=m1bk8b+y/uIMZExVHln4QxpAgq
	TX97AoDK/pRa5tEjgjyXyCIkkt3rQ5UFqZ8rUmHCsIvuFmoTtpUkIDibdwTAsPqqifHIlv5oAcEJl
	FPrTEPAoiL3zn07dM2liR1wSHFx/HzenCaNvWvbNocNF2JeteTnl0foWc3t+AtZizPgjafaXyFbvj
	1qIKfttZXI0H3WJI2kb+h8uqUIzyNvGMmgE2k7E3kZv6nthVUK8Pq0yqLoC5G9/+qtj5amDG9G2gn
	HUHbd7Y+FI4yAkKmSXgd1t7TvbZZImzIgo+5RS+AuwQjfhVtnPM0pluH6u7BD90gzh65gu/GwqcJ+
	tbkEDBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mz-0000000FP3r-1wRM;
	Fri, 23 Oct 2026 03:17:53 +0000
Received: from bg1.exmail.qq.com ([114.132.65.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mw-0000000FOzW-2n7w
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725423;
	bh=vWQktdY0FJQ5gIjz1Q30N3BQ8TqP5aQ0k0nFlP9ztcs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kxJdmQniWYep+12l2eQgqZZCisJD4fTFbeqWxvKtKadhA4hxQfnspTOBVYVJTZNvR
	 NCZpoIEIMRbEvrnIvIbNx+9zfhw5n4+mjq8Ny62ZO3SS1aQM379s3PMBdARH4SUQQy
	 Zn8+uXFHUiinZ1TOLc6vXfag9lZDMWsbQa2Uz5vA=
X-QQ-mid: esmtpsz11t1792725367t0c5d5bcc
X-QQ-Originating-IP: m8cE/nnKQ7AQSkw7rS498QjHIKtl7CwzZZu0z0jXsao=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 501167956966261696
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/24] gtrace: Only copy AUX data from the path sink
Date: Fri, 23 Oct 2026 11:14:56 +0800
Message-Id: <20261023031505.2020925-16-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OfpDajcwo3IHQP+k03sP+W/QXns+tpOF0aOBHg9FzZHJBhY6QhkukzA6
	AjtVRQsbhhLfhBm97lCZ9GQkLOU8/4ei/0VnKhRCIlBTMoj+sSsaU+gaUKh4UIe6GFazkof
	VY690EhZvkSymVNiz5Z5nCo6LxxgupqLQT5yFF+dUyjl9oLgzr54t0Z8GMUyrd6ntB/AIQb
	WpjwkNiNJRVkJNbq9wRJ2tY+Zdm1grgl5KqOuLYC7/qTgf4vYLNn0WG/GuPw8wZeGhdQHIX
	B061hTfSXmBn6KuBnD6r0z89LNNcNe9jPOLpARV8weB2tO6Y9KzbDva9jPmhaE14XroL/1p
	CjhFinxVGTxeKULLCJb7PpaPnSPgBdRB9FiPUEpsy4xurY2ccuF6jCeP7nA0IusloI7ZBCb
	pn7Vr6n85UVbcC+tCB6odNZUTgGo0X6ZJjcLTsiQBizSy6MzU1mRAxxfUL48OnNcEJqIWs9
	JpkZTUH09rp0aIlcp5qvB8y2nB75flMW03dh0wdkaI8ByV1Zroz1qn21SyVVAnPkBQFjov/
	N589RDN0dF78TK/sx5RLeUg0X6N46w8eqSpW8kdxyUTdQIg1iMBP1ZWsRbPjUDSbYRTSTyI
	FqtWgfY9xmgrcsFJq2T6wPx6jwd24maIcYP6PT5jheDLqbKh66b0RuYkhFouCQx5CcU8EZ8
	xndy8Rr+ftw+6LpvhUd6d3qblFEUl8AXRsIDIRlDDEtIraH70IWce396xrAXvbH4SSzr8U7
	x2N7XEzcDkfMuXto8jkCFSrFSWElMU1x/b/V1OihoNZuOjJoyVJs5wpzmP1YL+aqYo+pENF
	EK+VUiAKlQIytbadUZ71biXqIaD8+glKYIGLNMwkQjpPR+52GJOX2nQFseSHowfqMYIwWus
	eFjubU224iuiip1YnzPVl+ZanbzIIKn2O6wZsMIzWJMeacwdsie6FnUHvubdyijEpES9PST
	QEo1b0DNl7mI5MUfCgXGZBT5o72v4A5Ul5SeEGF3WXxJPCIjiw/v1UAtmwAFRQ7bHiFot1j
	EZHZ46eGXQYGU1kI5Izgb/7H8SgVcnYRfQPFe2VoU6d2C1amzVHAWwFrqENmrMnxExGifbe
	ZjrGPDk0ULA5OhQ+jfoTCwLXiFeyiYFYQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201751_059332_ADA1F811 
X-CRM114-Status: GOOD (  18.40  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gtrace_path_copyto_auxbuf() walked the path and copied from the first
component implementing copyto_auxbuf(). For a linksink like ETF used as
a link, this picked the wrong component. Call the sink's callback
directly via gtrace_path_sink() and pass the perf handle so the sink
can set AUX flags itself.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 39 ++++++++++------------
 drivers/hwtracing/gtrace/gtrace-perf.c     | 13 ++------
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 10 ++++--
 include/linux/gtrace.h                     | 10 +++---
 4 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 231d06218d8e..a42b1844da29 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -806,14 +806,14 @@ int gtrace_path_stop(struct gtrace_path *path)
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct perf_output_handle *handle,
 			      struct gtrace_perf_auxbuf *buf,
-			      size_t *bytes_copied, u64 *format)
+			      size_t *bytes_copied)
 {
-	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
-	const struct gtrace_driver *gtdrv;
-	struct gtrace_component *comp;
-	struct gtrace_path_node *node;
-	int ret = -EOPNOTSUPP;
+	struct gtrace_component *sink = gtrace_path_sink(path);
+	struct gtrace_comp_priv *spriv = to_gtrace_comp_priv(sink);
+	const struct gtrace_driver *sinkdrv = to_gtrace_driver(sink->dev.driver);
+	int ret = 0;
 	unsigned long flags;
 
 	/*
@@ -823,25 +823,20 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 	 * sink's lock also stops another path from starting the sink before copy
 	 * completes.
 	 */
-	raw_spin_lock_irqsave(&sink->lock, flags);
-	if (sink->start_count) {
-		*bytes_copied = 0;
-		ret = 0;
-		goto out;
-	}
-
-	list_for_each_entry(node, &path->comp_list, head) {
-		comp = node->comp;
-		gtdrv = to_gtrace_driver(comp->dev.driver);
-		if (!gtdrv || !gtdrv->copyto_auxbuf)
-			continue;
+	raw_spin_lock_irqsave(&spriv->lock, flags);
+	if (!spriv->start_count) {
+		if (!sinkdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
 
-		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
-		ret = 0;
-		break;
+		if (sinkdrv->copyto_auxbuf) {
+			*bytes_copied = sinkdrv->copyto_auxbuf(sink, handle, buf);
+			ret = 0;
+		}
 	}
 out:
-	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	raw_spin_unlock_irqrestore(&spriv->lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 604b673a29d5..3c8b620df5a8 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -243,7 +243,6 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 {
 	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
-	u64 format = PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
 	struct gtrace_event_data *event_data;
 	int ret, cpu = smp_processor_id();
 	struct gtrace_path *path;
@@ -280,17 +279,11 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 	if (handle->event && (mode & PERF_EF_UPDATE)) {
 		if (WARN_ON_ONCE(handle->event != event))
 			return;
-		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
+		ret = gtrace_path_copyto_auxbuf(path, handle, &event_data->buf, &size);
 		WARN_ON_ONCE(ret);
-		if (READ_ONCE(handle->event)) {
-			/* Tag the AUX data with the source's trace format. */
-			perf_aux_output_flag(handle, format);
-			if (size > handle->size) {
-				size = handle->size;
-				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
-			}
+		if (READ_ONCE(handle->event))
 			perf_aux_output_end(handle, size);
-		} else
+		else
 			WARN_ON(size);
 	}
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 9588c32c5b13..e0826d3f0d60 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
+#include <linux/perf_event.h>
 #include <uapi/linux/perf_event.h>
 #include "rvtrace.h"
 
@@ -147,8 +148,8 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 }
 
 static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
-					    struct gtrace_perf_auxbuf *buf,
-					    u64 *format)
+					    struct perf_output_handle *handle,
+					    struct gtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	struct trace_buf src, dst;
@@ -181,6 +182,11 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 		priv->prev_wp = wp;
 	}
 
+	if (bytes > handle->size) {
+		bytes = handle->size;
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+	}
+
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index e9210b0a73b5..39ae13701615 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
+#include <linux/perf_event.h>
 
 #define GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT	1
 #define GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK	GENMASK(3, 2)
@@ -363,15 +364,16 @@ struct gtrace_perf_auxbuf {
 };
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct perf_output_handle *handle,
 			      struct gtrace_perf_auxbuf *buf,
-			      size_t *bytes_copied, u64 *format);
+			      size_t *bytes_copied);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
- *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
+ *                 via @handle (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @start_port:    Callback to start a specific component port.
@@ -385,8 +387,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
-						 struct gtrace_perf_auxbuf *buf,
-						 u64 *format);
+						 struct perf_output_handle *handle,
+						 struct gtrace_perf_auxbuf *buf);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*start_port)(struct gtrace_component *comp,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
