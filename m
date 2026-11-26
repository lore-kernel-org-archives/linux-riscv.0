Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F462606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vMgxOS0C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HLNs9fHQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uztBeaghPwu+W7/hWQNEBfOfu+VS1w1weO0bBc/2YuA=; b=vMgxOS0CA3P1Wn6mJZijxMsfj7
	wRJcAzXbo1pYBuCQgsM4ggf74rnrsDY0iZdGRVOBh1xfjIMD+HA835NMzwmIQ1EiX2qeDa06v+7ld
	h6ulrN18Aclr8QRddH/RtQFM+dvNR2RrhKkFqQA/u92jCx76gB/1OVBySCkb2UWaTN9mWT9mHp30C
	gGbQOfuGOQ5qkqZ4gNu2R+gwxIISnKQ2vkmznVEzGmbJi70e1cptEurnPsUEzPPZUYO+7CQvsxsQp
	QSYrichyxiz3iUUjxbQIcn4DI+Gs9pDNOfbCO6dqUJAJyahdb/5GeCm2Cuy6WZCaMWWX5KMXV6VKL
	eJmAC+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVSF-0000000CURx-47ic;
	Thu, 26 Nov 2026 09:07:47 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS0-0000000CU7r-3bV2
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-386bd881d39so6507630eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684052; x=1796288852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzYWNHwLyf/zZi3eZLCKNgKiDGvpaD8KYJ/QuAC6W+c=;
        b=HLNs9fHQUgELnJiOAu2wjkQPcLLu3Q7vc1loxohStYkIC50T9MZWyF+6kfH9DqGRnd
         MDSgMR74j9TzzeZXuM43fkdCLHR5xz3ZJqg1kVklcC6qu5YTecWgpGNscXZFMfeuBjyx
         VyAbZCSWi1SQWXzdJzlP8Tf1D9jg1XQpEKqOuooo6i94Ii3Rr/mvkiUmy8PV9BvMceIa
         VjlDmX0kunYoBfowJ2Uv/O+X2yxWUcNfikAYF7fCYmUkmlzFowcB7uUlSSqnJuOTEfl1
         95yYrygZFvHQlcbIbidP0YPH73tToyFRooW3ABFf++e1c8XrM+7ocFbAnoZ3VayH7v1/
         WKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684052; x=1796288852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzYWNHwLyf/zZi3eZLCKNgKiDGvpaD8KYJ/QuAC6W+c=;
        b=2FeKPV1QpNCbM/iWZaGu508pBWFpyonDQv+/EerF1uzzuHdNVu7IWukLxEhwEUtsrQ
         HGaC//8W38TgxLJzJC+4+ClQS9HJd46EX9kT6FTMe9Yv41EpWL6hwjtV2t0VKlDvCyoH
         neCWHWJhqX6WPNKRPtyhvcaMxmTwPQHCeY5HkYx4KBvzpderatub2lkVhpDGQF8uk/FM
         FWJ5dkENshACAYjWaxu+vKd2FHW4PL8wzN+2E+OtjWBhLafLYejrKgCxwbaN4lY5CMBH
         7FCTR8ZJR39tpwufcQFVckZKRsLDiDC/qXBNirzmLoB6S7bBF8hV8olnH+o18NQsl7/9
         KOuA==
X-Gm-Message-State: APuU4Z/LdyfwcqjS7J7LAP5/13VxM/dedsByDPjqxqRuKf/yD2sYq1kD
	j2T7BMgG8AjwS+5pfGW1wwaW3qEtUf86BDCnCFZTHdqHDl3aBXcJLxYteFk1oMrTSIU=
X-Gm-Gg: AZFdTZd7yLzdvLGC7Q4XLevL92PWngs6sGOMVwB0A3KtlpQu4ihs800Z0ufmLZOZi0s
	tKj5S4dgUGjMk/pSXaiugq3ZnhNtvHF2+P2mtkdcFSRBRMZ1TZbqBsFBc73FvF+O03pdcRXgA/T
	IiT05rezEAFmAMqXIMkZ0VarY/G2BtmA3edSTTZDtRr2/zNspwzw2lxVcdBfdxtpQs9t5GBaBsE
	LgF0eKooIFqt7DUxwabzC8rodGe85F6tvEeI9xRajLOlxYhvM0Xaw4Oq/eb3xJRBvat0YpzmyLQ
	wQI/VWZRrCy2LlrOgO2JyHC+1fALQNoviSse2m6RxwHlf/IHwe2aRO3p9QXxCvFUKuJd3X/IEfd
	mFDgd7DTgtjLG5snX4dM3SD/7/5XSiYhDcqFgGFhnHknyTonGPMFx83FV/bgss6U7QXJk3bTJSg
	B8LKPlD1iTd7hvTzjj9ialVe+IQ+KsUz7DizL3ajZm8U/Z84eNdje8lZ5LScoW5REC2ikJvG1PO
	Gd3UxngzK3mkdzrLk2qF+7Wd+TdIlgZD01Ag1Lwb6xop5+D4F+8d1ZKNB9tyIu2JYzSNPq26teR
	cxO03aYr49CE9seUizJ0N7tKkwqpCh1dm53ac0/vAqsK
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr26613125eec.6.1795684052116;
        Thu, 26 Nov 2026 01:07:32 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:31 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:16 -0800
Subject: [PATCH 10/10] gtrace: rvtrace: Add copyto_auxbuf callback for
 pre-ratified encoder and funnel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-10-1e686fd75be7@sifive.com>
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
X-CRM114-CacheID: sfid-20261126_010732_914473_ACE80197 
X-CRM114-Status: GOOD (  20.50  )
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

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers.

When pre-ratified encoder and funnel components act as a sink, the
trace data must be copied from the trace buffer to the perf AUX buffer
after tracing is stopped. To support this, add
rvtrace_v0_ramsink_copyto_auxbuf() which shares the copy logic with the
standard ramsink, and use it to implement the copyto_auxbuf callback of
the encoder and funnel drivers. The callback copies nothing when the
component doesn't act as a sink.

Note: an encoder or funnel component may be in the middle of a given
path, so gtrace_path_copyto_auxbuf() now only invokes the copyto_auxbuf()
callback of the path's sink instead of the first component in the path
implementing it.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 19 ++++++++-------
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 10 ++++++++
 drivers/hwtracing/gtrace/rvtrace-funnel.c  | 10 ++++++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 37 ++++++++++++++++++++++++++----
 drivers/hwtracing/gtrace/rvtrace-ramsink.h | 12 ++++++++++
 5 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 6fe71c5cd0cf..7a818d647372 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -714,10 +714,9 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 			      struct gtrace_perf_auxbuf *buf,
 			      size_t *bytes_copied, u64 *format)
 {
-	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
+	struct gtrace_component *comp = gtrace_path_sink(path);
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv;
-	struct gtrace_component *comp;
-	struct gtrace_path_node *node;
 	int ret = -EOPNOTSUPP;
 	unsigned long flags;
 
@@ -735,15 +734,15 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 		goto out;
 	}
 
-	list_for_each_entry(node, &path->comp_list, head) {
-		comp = node->comp;
-		gtdrv = to_gtrace_driver(comp->dev.driver);
-		if (!gtdrv || !gtdrv->copyto_auxbuf)
-			continue;
-
+	/*
+	 * Only the sink of the path holds the trace data. Other components in
+	 * the path may implement copyto_auxbuf() as well, e.g. when they embed
+	 * a sink which is only used when they are at the end of a path.
+	 */
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (gtdrv && gtdrv->copyto_auxbuf) {
 		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
 		ret = 0;
-		break;
 	}
 out:
 	raw_spin_unlock_irqrestore(&sink->lock, flags);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 8d2f7ac5e0fe..a854c4695351 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -164,6 +164,15 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static size_t rvtrace_encoder_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return rvtrace_v0_ramsink_copyto_auxbuf(comp, priv->sink, buf, format);
+}
+
 static void rvtrace_encoder_remove(struct gtrace_component *comp)
 {
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
@@ -261,6 +270,7 @@ static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 
 static struct gtrace_driver rvtrace_encoder_driver = {
 	.id_table = rvtrace_encoder_ids,
+	.copyto_auxbuf = rvtrace_encoder_copyto_auxbuf,
 	.probe = rvtrace_encoder_probe,
 	.remove = rvtrace_encoder_remove,
 	.start = rvtrace_encoder_start,
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
index 463e504aaa92..48d1084957c1 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -75,6 +75,15 @@ static int rvtrace_funnel_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static size_t rvtrace_funnel_copyto_auxbuf(struct gtrace_component *comp,
+					   struct gtrace_perf_auxbuf *buf,
+					   u64 *format)
+{
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return rvtrace_v0_ramsink_copyto_auxbuf(comp, priv->sink, buf, format);
+}
+
 static void rvtrace_funnel_remove(struct gtrace_component *comp)
 {
 	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
@@ -95,6 +104,7 @@ static const struct gtrace_component_id rvtrace_funnel_ids[] = {
 
 static struct gtrace_driver rvtrace_funnel_driver = {
 	.id_table = rvtrace_funnel_ids,
+	.copyto_auxbuf = rvtrace_funnel_copyto_auxbuf,
 	.start = rvtrace_funnel_start,
 	.stop = rvtrace_funnel_stop,
 	.probe = rvtrace_funnel_probe,
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index f183dcd71c7c..cc0a5785bda4 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -188,11 +188,11 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 	}
 }
 
-static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
-					    struct gtrace_perf_auxbuf *buf,
-					    u64 *format)
+static size_t __rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					      struct rvtrace_ramsink_priv *priv,
+					      struct gtrace_perf_auxbuf *buf,
+					      u64 *format)
 {
-	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	size_t bytes = 0;
@@ -231,6 +231,13 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	return bytes;
 }
 
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	return __rvtrace_ramsink_copyto_auxbuf(comp, dev_get_drvdata(&comp->dev), buf, format);
+}
+
 static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
@@ -448,6 +455,28 @@ void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 	of_reserved_mem_device_release(comp->pdata->dev);
 }
 EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_release);
+
+/**
+ * rvtrace_v0_ramsink_copyto_auxbuf() - Copy trace data from the sink embedded
+ * in a pre-ratified trace encoder/funnel into the perf AUX buffer.
+ * @comp:   Pre-ratified trace encoder/funnel component.
+ * @priv:   Sink private data returned by rvtrace_v0_ramsink_setup().
+ * @buf:    Perf AUX buffer.
+ * @format: Trace format of the copied data.
+ *
+ * Return: Number of bytes copied, 0 if the component doesn't act as a sink.
+ */
+size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					struct rvtrace_ramsink_priv *priv,
+					struct gtrace_perf_auxbuf *buf,
+					u64 *format)
+{
+	if (!priv)
+		return 0;
+
+	return __rvtrace_ramsink_copyto_auxbuf(comp, priv, buf, format);
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_copyto_auxbuf);
 #endif /* CONFIG_RVTRACE_V0 */
 
 static int rvtrace_ramsink_probe(struct gtrace_component *comp)
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.h b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
index 0c1b346af8c0..ff767da7f861 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.h
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
@@ -15,6 +15,10 @@ struct rvtrace_ramsink_priv;
 struct rvtrace_ramsink_priv *rvtrace_v0_ramsink_setup(struct gtrace_component *comp);
 void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 				struct rvtrace_ramsink_priv *priv);
+size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					struct rvtrace_ramsink_priv *priv,
+					struct gtrace_perf_auxbuf *buf,
+					u64 *format);
 #else
 static inline struct rvtrace_ramsink_priv *
 rvtrace_v0_ramsink_setup(struct gtrace_component *comp)
@@ -26,6 +30,14 @@ static inline void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 					      struct rvtrace_ramsink_priv *priv)
 {
 }
+
+static inline size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+						      struct rvtrace_ramsink_priv *priv,
+						      struct gtrace_perf_auxbuf *buf,
+						      u64 *format)
+{
+	return 0;
+}
 #endif
 
 #endif /* __RVTRACE_RAMSINK_H__ */

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
