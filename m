Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A6DCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P49n3WJIcqSYZcRYp95KQdbTBcG7Xk+119bkMilohd4=; b=LVUpp0TwvwEdEb
	b2swatt1DRJ906s6SLDDazobZNAkgE+bQKn1eMQ40zohCWYI/sIdDiO8q38/o6WYIIQdwfCT9WQd2
	Q5kJ/X+w/HZXCuu/MYCn3B1rSASQBlDkEWqv1PSNAdDgGqvhhrUSH3OgQI7iwQ4YI1GuLYxNzk58M
	Vo75dQTl/b0mSIVa/kCaAaEVywqORFd6A8hrsmY/SUu/rkJTR5x4uE7Ai5smUhrSC5Vl48nSnTJhG
	2CPuvZ2BVrihxdk/RhR1r+hovB+T7mPMHJuer6ZU4ZIXwTuZoCbdHHkcr3kKI8gyJTFLGHzwa2tGj
	XiU1KBnBSXMaVng/AkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUg-00000009hAj-3ZwD;
	Thu, 02 Oct 2025 06:08:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUd-00000009h8l-2smD
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:08:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso538454b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385323; x=1759990123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDMrSo5zE78/yp6K2Yzv6nvOvNQV4+z5IjijgGyjqfE=;
        b=ltyoifz97/QVG3gGu+7Diqt6StbbM9NmgKFCXpNRTFYoTQQXSNYjrP/TxevpmN4fA+
         +cHGLw6Rz8iNyzSz1SdyCWy6SF7dXrDA+5281BKkt1yfC2ZL8xaXQHLMPKRlarsgcxgs
         orZKCkc0u3D2h/GDEEacllTUwgTZeFuxc6K2D7+0ksDNZajrCL9wm5PYQFeZSAYWu0Br
         m0j6RPe/CrLJLLk2HXPANPmCThbJM2yPc3Lmb4zXrPrKqkJ2h+BjKP7gdpAYOmdXOFXe
         mrPgBkvuaVHfynmqN5RwMTVqCUqSffY8SRrfNCkd6j5HYO3pPoojNMd5/DWXC2nwmfJP
         eqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385323; x=1759990123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDMrSo5zE78/yp6K2Yzv6nvOvNQV4+z5IjijgGyjqfE=;
        b=H4pjfUbuCoNdWd6OuE7ZEKkorBim5TQzEcwIiJn7VUQbsrQ69xfkTnyxat+sPWIEJu
         ej88fooBC6rdPKmcTcxoCsqpB86l1Xyal93Uu/nLrkJGMI81NtX006ctF1KJegXi1bwo
         lmLFMA3Z0gm79xZCcWprcjvl55lFuQDuo5dDhtb41hOMGix3jfZN8q/W7ispk0JlWcC1
         iC45sK8qsID9K9Iz7QCq/1jzZmwWU+cVlGcKkWFT9p4SNMvIFNSaGf0RII6L+jK0g3Xd
         HfdbAY8I1BkemHpPCoX46dUKbQyCePiOI19DfEUId6wuJ63d561J/63ZzMFnXxzEW/lR
         jnag==
X-Forwarded-Encrypted: i=1; AJvYcCUyiV4XkHhr7BYi4LH2nvfgSFcqyifEQQ+EX9ny8KgIFZRNt8RkgTdXCOc9hV5EdKX98zF0wNjvArznig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdUVO6a/8YP3qebX8mlW+hyi/UxFuSE2m8mIN/p7L+FXdFuxxq
	vl8PmGqaWoctA9gDwD9Ms1XRuym/MQEhxnwi2mI/FaBAAkS70+OoLP5IU6zS90ejll0=
X-Gm-Gg: ASbGnct1SrfeZUwAgILGyxuugDq+UwFqYiKDmEIf8j8zrHjRqn8n4T3l8Wl2qpSkdSn
	3gP/5Isl/v/aTne6ZYncOZXfqRegEtx1wE5GzmpnGsohA7eHAhprFIeCgi36PTw6bXLQIMX4R1A
	e8PtgYmvRNxhxrNajdALpLv68fQYWHV8+wOywpMoMCzKn/0rlmvjyTInLY558F98bnPGwRrhJoI
	TfHRAyBex9a28isEFxgXowkJLuk90VSYy8Dl/TLTy4ioS2RX/IPE0007uiafeKFQ16O2jbroPub
	NSooQaVjatrVF8mmXPOLNkaIiZ5CRGF9KWQaQggIBmCHAWn32mK5pCfYeghs6VyAmydJcM78djf
	KG+qrIXQfH8kgn7jBgqW+8leUb3QbPy5aGAfZbZ5D/e8js/YdWi8nQAfQWBrixJicW3cswHtPSJ
	nyzJ0=
X-Google-Smtp-Source: AGHT+IHgKU6jM0c+W5oVcxlG6nEX1xAKWoIfttRFMeLhxyiP4XNtqKsWmTuThx5iRTl4h4Gz11OdUw==
X-Received: by 2002:a05:6a20:9f9b:b0:2ec:f29:1011 with SMTP id adf61e73a8af0-321db7561a9mr8065872637.20.1759385322705;
        Wed, 01 Oct 2025 23:08:42 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:08:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 03/11] rvtrace: Add functions to create/destroy a trace component path
Date: Thu,  2 Oct 2025 11:37:24 +0530
Message-ID: <20251002060732.100213-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230843_736906_F470B5CE 
X-CRM114-Status: GOOD (  23.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by RISC-V trace perf support.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 223 +++++++++++++++++++++++
 include/linux/rvtrace.h                  |  43 ++++-
 2 files changed, 264 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 52ea931745fc..7013d50ca569 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -194,6 +194,53 @@ int rvtrace_disable_component(struct rvtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(rvtrace_disable_component);
 
+static int __rvtrace_walk_output_components(struct rvtrace_component *comp,
+					    bool *stop, void *priv,
+					    int (*fn)(struct rvtrace_component *comp, bool *stop,
+						      struct rvtrace_connection *stop_conn,
+						      void *priv))
+{
+	struct rvtrace_connection *conn, *stop_conn = NULL;
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __rvtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
+		if (ret)
+			return ret;
+		if (*stop) {
+			stop_conn = conn;
+			break;
+		}
+	}
+
+	ret = fn(comp, stop, stop_conn, priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int rvtrace_walk_output_components(struct rvtrace_component *comp, void *priv,
+				   int (*fn)(struct rvtrace_component *comp, bool *stop,
+					     struct rvtrace_connection *stop_conn,
+					     void *priv))
+{
+	bool stop = false;
+	int ret;
+
+	if (!comp || !fn)
+		return -EINVAL;
+
+	mutex_lock(&rvtrace_mutex);
+	ret = __rvtrace_walk_output_components(comp, &stop, priv, fn);
+	mutex_unlock(&rvtrace_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rvtrace_walk_output_components);
+
 struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu)
 {
 	if (!cpu_present(cpu))
@@ -446,6 +493,182 @@ void rvtrace_unregister_component(struct rvtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
 
+struct rvtrace_path_node {
+	struct list_head		head;
+	struct rvtrace_component	*comp;
+	struct rvtrace_connection	*conn;
+};
+
+struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path)
+{
+	struct rvtrace_path_node *node;
+
+	node = list_first_entry(&path->comp_list, struct rvtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_source);
+
+struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path)
+{
+	struct rvtrace_path_node *node;
+
+	node = list_last_entry(&path->comp_list, struct rvtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_sink);
+
+static int rvtrace_assign_trace_id(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+	int trace_id;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+
+		if (!rtdrv->get_trace_id)
+			continue;
+
+		trace_id = rtdrv->get_trace_id(comp, path->mode);
+		if (trace_id > 0) {
+			path->trace_id = trace_id;
+			return 0;
+		} else if (trace_id < 0) {
+			return trace_id;
+		}
+	}
+
+	return 0;
+}
+
+static void rvtrace_unassign_trace_id(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+
+		if (!rtdrv->put_trace_id)
+			continue;
+
+		rtdrv->put_trace_id(comp, path->mode, path->trace_id);
+	}
+}
+
+static bool rvtrace_path_ready(struct rvtrace_path *path)
+{
+	struct rvtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		if (!node->comp->ready)
+			return false;
+	}
+
+	return true;
+}
+
+struct build_path_walk_priv {
+	struct rvtrace_path		*path;
+	struct rvtrace_component	*sink;
+};
+
+static int build_path_walk_fn(struct rvtrace_component *comp, bool *stop,
+			      struct rvtrace_connection *stop_conn,
+			      void *priv)
+{
+	struct build_path_walk_priv *ppriv = priv;
+	struct rvtrace_path *path = ppriv->path;
+	struct rvtrace_path_node *node;
+
+	if ((!ppriv->sink && rvtrace_is_sink(comp->pdata)) ||
+	    (ppriv->sink && ppriv->sink == comp))
+		*stop = true;
+
+	if (*stop) {
+		node = kzalloc(sizeof(*node), GFP_KERNEL);
+		if (!path)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&node->head);
+		rvtrace_get_component(comp);
+		node->comp = comp;
+		node->conn = stop_conn;
+		list_add(&node->head, &path->comp_list);
+	}
+
+	return 0;
+}
+
+static void rvtrace_release_path_nodes(struct rvtrace_path *path)
+{
+	struct rvtrace_path_node *node, *node1;
+
+	list_for_each_entry_safe(node, node1, &path->comp_list, head) {
+		list_del(&node->head);
+		rvtrace_put_component(node->comp);
+		kfree(node);
+	}
+}
+
+struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
+					 struct rvtrace_component *sink,
+					 enum rvtrace_component_mode mode)
+{
+	struct build_path_walk_priv priv;
+	struct rvtrace_path *path;
+	int ret = 0;
+
+	if (!source || mode >= RVTRACE_COMPONENT_MODE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	INIT_LIST_HEAD(&path->comp_list);
+	path->mode = mode;
+	path->trace_id = RVTRACE_INVALID_TRACE_ID;
+
+	priv.path = path;
+	priv.sink = sink;
+	ret = rvtrace_walk_output_components(source, &priv, build_path_walk_fn);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	if (!rvtrace_path_ready(path)) {
+		ret = -EOPNOTSUPP;
+		goto err_release_path_nodes;
+	}
+
+	ret = rvtrace_assign_trace_id(path);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	return path;
+
+err_release_path_nodes:
+	rvtrace_release_path_nodes(path);
+	kfree(path);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(rvtrace_create_path);
+
+void rvtrace_destroy_path(struct rvtrace_path *path)
+{
+	rvtrace_unassign_trace_id(path);
+	rvtrace_release_path_nodes(path);
+	kfree(path);
+}
+EXPORT_SYMBOL_GPL(rvtrace_destroy_path);
+
 int __rvtrace_register_driver(struct module *owner, struct rvtrace_driver *rtdrv)
 {
 	rtdrv->driver.owner = owner;
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 04eb03e62601..f2174f463a69 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -8,6 +8,8 @@
 
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/list.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
@@ -71,6 +73,12 @@ enum rvtrace_component_impid {
 	RVTRACE_COMPONENT_IMPID_MAX
 };
 
+/* Supported usage modes for RISC-V trace components */
+enum rvtrace_component_mode {
+	RVTRACE_COMPONENT_MODE_PERF,
+	RVTRACE_COMPONENT_MODE_MAX
+};
+
 /**
  * struct rvtrace_connection - Representation of a physical connection between
  * two RISC-V trace components.
@@ -237,22 +245,53 @@ int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
 int rvtrace_enable_component(struct rvtrace_component *comp);
 int rvtrace_disable_component(struct rvtrace_component *comp);
 
+int rvtrace_walk_output_components(struct rvtrace_component *comp, void *priv,
+				   int (*fn)(struct rvtrace_component *comp, bool *stop,
+					     struct rvtrace_connection *stop_conn,
+					     void *priv));
 struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
 
 struct rvtrace_component *rvtrace_register_component(struct rvtrace_platform_data *pdata);
 void rvtrace_unregister_component(struct rvtrace_component *comp);
 
+/**
+ * struct rvtrace_path - Representation of a RISC-V trace path from source to sink
+ * @comp_list: List of RISC-V trace components in the path
+ * @mode:      Usage mode for RISC-V trace components
+ * @trace_id:  ID of the trace source (typically hart id)
+ */
+struct rvtrace_path {
+	struct list_head		comp_list;
+	enum rvtrace_component_mode	mode;
+	u32				trace_id;
+#define RVTRACE_INVALID_TRACE_ID	0
+};
+
+struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path);
+struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path);
+struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
+					 struct rvtrace_component *sink,
+					 enum rvtrace_component_mode mode);
+void rvtrace_destroy_path(struct rvtrace_path *path);
+
 /**
  * struct rvtrace_driver - Representation of a RISC-V trace driver
  * id_table: Table to match components handled by the driver
- * probe:    Driver probe() function
- * remove:   Driver remove() function
+ * probe:        Driver probe() function
+ * remove:       Driver remove() function
+ * get_trace_id: Get/allocate a trace ID
+ * put_trace_id: Put/free a trace ID
  * driver:   Device driver instance
  */
 struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
 	int			(*probe)(struct rvtrace_component *comp);
 	void			(*remove)(struct rvtrace_component *comp);
+	int			(*get_trace_id)(struct rvtrace_component *comp,
+						enum rvtrace_component_mode mode);
+	void			(*put_trace_id)(struct rvtrace_component *comp,
+						enum rvtrace_component_mode mode,
+						u32 trace_id);
 	struct device_driver	driver;
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
