Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3361606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g9hDbg+2;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=BKZyfKJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gd1EbSSeOmit44IcwTXtlrMQ9Of8iS4+mRLbS2Yhou0=; b=g9hDbg+2gpKfma0k8OmnVgStts
	B1BXhC8zn6D3/Hzs6mgvlZdLnSRYKtD1BSV90tz6nQTHxB07G79uOu6WrlP2qs0ePMyejEnZiA+nN
	T/D62YGBB5dCGzrkomxJSmoD3pxcr/hpOQ8lK0suRU1GM+65JkjB2EeHeDywke/LZwjK2zOw8cq1r
	z4UbGKrk2NRN3FcZYWihoC2L3usypzDMZxb/VFily5Z6j6a7bLS8loJmmH8J6mcDKq14r1S0NzPab
	p8OQ3YL3E1YQ6z/k/EkBy+Tg7nHvIM7eSTSiPxtmzQ7dt7qidWEkLqToGuhHR6DM4+ibRnjXlpfGH
	d5IagI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lx-0000000FOIP-1NGc;
	Fri, 23 Oct 2026 03:16:49 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lr-0000000FO43-1yJJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725352;
	bh=oZ3dwcZhMUF8cd3C/+STHOota9SSEAdXyuE/D3PhF9Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=BKZyfKJRgUhpvevVTOwkoMRjM1R68rUO1T7lpAPe90YwEUeW71p4P49auReepm9Ut
	 B6X9I6BGl4s49J0V9jFFfd1o951Q7NzPfpLINoZYZyDlbKYycPEIYxPghJfT1s26Qv
	 pQVe66NXMcZIn+vic+yBI7tQcGiTjKGuMlKBtp6I=
X-QQ-mid: esmtpsz11t1792725344tb88ffc15
X-QQ-Originating-IP: /x+brBj2aJ9X8jERn5FG65pPzVut3TgkYs594RU+spo=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5361625773672999170
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
Subject: [PATCH 09/24] gtrace: Add port-level start/stop driver callbacks
Date: Fri, 23 Oct 2026 11:14:50 +0800
Message-Id: <20261023031505.2020925-10-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NSahpW5IwUZOVlwgksr6u7viIqmOFqhxAUX/EqC0yqI4jYY7hZSUM8ut
	yoT3srH+/IS3IWYYO0nQBfW1rEnKVtr7BEywbv4rl6EuqcM7AYtMbBr1AQwzhaAwTiz2rlT
	Wm9MGWQayxbsXxcupV+fb87IrsDTKnTJAQh8B64C8xkiGNkXD/HVCEzjjn81wCGr1mGGMqC
	CvYY9JQ9yVBoEtxHHcLHLrA7EfA6/opz1VhB1OQsjR/zspCkCZObw4Qa2sA8uRR0Y03dwPN
	BUy16dX6OB30sv3t7UdHsZWkvNn6P2Vs9iOUkhyXNacqINAJE8rXKk71JqsKpXJ/cmwHB5u
	KF2YTwQ0EKGZPa8cX2pMTM5b9lmVRUTBuJCsJXNT0EUcfNlWjIa/wLVxNP+GrWMDNT7XNUE
	hGNUWCf/EQCDcSTzAyDDZ9wynx0FfUuekO8ZTl4u/Bnw8GBHDBUYaV1jCVBFWfS13hgAS0f
	0ak1afcBay0LtU0WtsJgz2Bel6YaNUB/nWGfYIjtY7qA1oLCk1Y2e1kKxKdsgUeSgeUxSl9
	fs2tLD4GvMxold0Mp3GIj0yyFgiLSZBeKeaiPMWR0cLoyJJdKvM6/6QUM2CKI5CEEFSBbFl
	K46z2sMcwoO4Iw7Fm1bRUXUZpYypZErA+y2kcQZjTDXGDFqZiJrwY4+8e42XVlUKzdee+ri
	ULnfYNW9Wgf5FKNrnw4cE+x6E0aE2bz5CcsV1vBlzFvTuWeoPwW2cLrM/dh2ANYOGpUaHh4
	A9OAgflIW1jTPSku0v8FHUdQ5CjaXoeNf3Vb7I7H6D8Ud0FhA4sPdhJxuszmHEboLr39o+V
	SYEm04ME5F/YpLTzhvrH2xFOIO34A+mwMsMrEt809VhjFESG7Tl0aTECQyIc4VRNRgKKIJ6
	K8HHno1z0yQSvzqS129mIZnYmHV2k1hpR0I66bSskoG7f7XpO4QziDWBUlVwEruBMaTp2Kl
	g8yAGYJW0NmRJCgM6WFC+YGMhR/6cR7mq2iTN6XpfcLzmAc7bqoPhxsgdmAtC/C9//cExhx
	3p1uSKDmbiKtqNKNYiHMJNDVHDBXx9waNmVGIA6RIjLpyjk66C/yjl7IvzVQo=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201644_389815_002D7486 
X-CRM114-Status: GOOD (  16.35  )
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

Add start_port() and stop_port() callbacks to gtrace_driver so
multi-port link components like funnel and replicator can enable a
specific input/output port the first time a path uses it, tracked by
the per-connection src_refcnt/dest_refcnt fields.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 66 ++++++++++++++++++++------
 include/linux/gtrace.h                 | 12 +++++
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 3f55d8b7302d..231d06218d8e 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -654,7 +654,9 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 }
 
 static int __gtrace_comp_start(struct gtrace_component *comp,
-			       struct gtrace_path *path)
+			       struct gtrace_path *path,
+			       struct gtrace_connection *inconn,
+			       struct gtrace_connection *outconn)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -690,6 +692,12 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 			cpriv->owner = task_pid_nr(path->event->owner);
 	}
 
+	if (gtdrv->start_port) {
+		ret = gtdrv->start_port(comp, inconn, outconn);
+		if (ret)
+			goto out;
+	}
+
 	cpriv->start_count++;
 out:
 	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
@@ -697,7 +705,9 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 }
 
 static int __gtrace_comp_stop(struct gtrace_component *comp,
-			      struct gtrace_path *path)
+			      struct gtrace_path *path,
+			      struct gtrace_connection *inconn,
+			      struct gtrace_connection *outconn)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -715,13 +725,16 @@ static int __gtrace_comp_stop(struct gtrace_component *comp,
 		goto out;
 	}
 
+	if (!gtdrv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (gtdrv->stop_port)
+		gtdrv->stop_port(comp, inconn, outconn);
+
 	cpriv->start_count--;
 	if (!cpriv->start_count) {
-		if (!gtdrv) {
-			ret = -ENODEV;
-			goto out;
-		}
-
 		if (gtdrv->stop)
 			ret = gtdrv->stop(comp);
 		comp->path = NULL;
@@ -734,19 +747,36 @@ static int __gtrace_comp_stop(struct gtrace_component *comp,
 
 int gtrace_path_start(struct gtrace_path *path)
 {
-	struct gtrace_path_node *node;
+	struct gtrace_path_node *node, *prev;
+	struct gtrace_connection *inconn;
 	int ret = 0;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		ret = __gtrace_comp_start(node->comp, path);
+		if (node->comp == gtrace_path_source(path)) {
+			inconn = NULL;
+		} else {
+			prev = list_prev_entry(node, head);
+			inconn = prev->conn;
+		}
+
+		ret = __gtrace_comp_start(node->comp, path, inconn, node->conn);
 		if (ret)
 			break;
 	}
 
 	/* If a component failed to start, stop all the components that were started before it */
-	if (ret)
-		list_for_each_entry_continue(node, &path->comp_list, head)
-			__gtrace_comp_stop(node->comp, path);
+	if (ret) {
+		list_for_each_entry_continue(node, &path->comp_list, head) {
+			if (node->comp == gtrace_path_source(path)) {
+				inconn = NULL;
+			} else {
+				prev = list_prev_entry(node, head);
+				inconn = prev->conn;
+			}
+
+			__gtrace_comp_stop(node->comp, path, inconn, node->conn);
+		}
+	}
 
 	return ret;
 }
@@ -754,11 +784,19 @@ EXPORT_SYMBOL_GPL(gtrace_path_start);
 
 int gtrace_path_stop(struct gtrace_path *path)
 {
-	struct gtrace_path_node *node;
+	struct gtrace_path_node *node, *prev;
+	struct gtrace_connection *inconn;
 	int ret = 0, err;
 
 	list_for_each_entry(node, &path->comp_list, head) {
-		err = __gtrace_comp_stop(node->comp, path);
+		if (node->comp == gtrace_path_source(path)) {
+			inconn = NULL;
+		} else {
+			prev = list_prev_entry(node, head);
+			inconn = prev->conn;
+		}
+
+		err = __gtrace_comp_stop(node->comp, path, inconn, node->conn);
 		if (err && !ret)
 			ret = err;
 	}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 4bbe5ac835ec..ee60585ef65c 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -55,9 +55,11 @@ enum gtrace_format {
  * @src_port:    A connection's source port number.
  * @src_fwnode:  Source component's fwnode handle.
  * @src_comp:    Source component's pointer.
+ * @src_refcnt:  Number of paths currently using this connection's source port.
  * @dest_port:   A connection's destination port number.
  * @dest_fwnode: Destination component's fwnode handle.
  * @dest_comp:   Destination component's pointer.
+ * @dest_refcnt: Number of paths currently routing data into the destination port.
  */
 struct gtrace_connection {
 	int src_port;
@@ -66,6 +68,8 @@ struct gtrace_connection {
 	struct fwnode_handle *dest_fwnode;
 	struct gtrace_component *src_comp;
 	struct gtrace_component *dest_comp;
+	u32 src_refcnt;
+	u32 dest_refcnt;
 };
 
 struct gtrace_platform_data;
@@ -363,6 +367,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
+ * @start_port:    Callback to start a specific component port.
+ * @stop_port:     Callback to stop a specific component port.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID.
@@ -376,6 +382,12 @@ struct gtrace_driver {
 						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
+	int			(*start_port)(struct gtrace_component *comp,
+					      struct gtrace_connection *inconn,
+					      struct gtrace_connection *outconn);
+	void			(*stop_port)(struct gtrace_component *comp,
+					     struct gtrace_connection *inconn,
+					     struct gtrace_connection *outconn);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
