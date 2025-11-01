Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F44CCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVxAxn3yPFKHusFkgT79fEVrXaFbsaY4v4mfrI4urPE=; b=nJUF+lEb4tbNoE
	Hol8RZAlzqk0BjrtpkQi9DTq2iY6v7hdPXQoXOlQv0Pdh6CAagDCJBhdNE0kPebuSQT8SWdhmgxJb
	CAeHJVt78k5S/30bh7aquFNPHCwMDKo49ofK/b3FbAinKIevRbgb0dGa1GzuqrTn6HXxOKp4lC+Ph
	ceH0MESgWQvZv6TL4k4kGShjzlabFCKHvf/5v5KjfViBs+P2Bs8kBYso/r7s4UH1eXI/U98Ol8ugK
	NNUO0QZpl6BRJL48yBMEY02/b5tCfJv66/MryxZJ0qdZkwyG+MZIZysX1oUZNUWVfREzQJ3f+g652
	M3y7AfCF6bMzzTq0RghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlK-00000007srh-1DYm;
	Sat, 01 Nov 2025 15:43:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlI-00000007sr3-13Iu
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b98e6ff9071so113296a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011807; x=1762616607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOvY7+y3+k/BpOCCJeQtfZUneWdciA55AKvg4KUFkXw=;
        b=ZNYDBdXxwR3zLGDxRcVSZSO4TH/lbfGcPB2cnoTNeH0LQx+Lw9/XwSxI4L7foXB8Uk
         o/VW55HFj2QXpkZLfa3kbPXh4+pYe/k+LlGhTXwb8/CM29zu1c7cTyrQGro/agI3+Ung
         p2bmMpQtZUsIktB8UFq2sQHcPkZHvU8sZDfOnBPh1KiWcf6oS47cdtaUuubN/B5YIvpz
         OCeT7v5QgFluOQpNDcjXzeNEoD+g+VlbEz/WunGJV0DmlLtIyGf9X2+/+XnIziriAHpw
         JyPB82UvGetQtj3iCUe8gDvLWKKfA0Pwxo+i3SJ7pSxpa6ORB28f0Qj4fb/9CSAD0EBF
         /JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011807; x=1762616607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOvY7+y3+k/BpOCCJeQtfZUneWdciA55AKvg4KUFkXw=;
        b=CKcB6i7U5up418JlPWegb7g27otwTt2LPzAXxCa9+3+dZQVPkOlFglFjq4gF4QLJ1B
         1HGFTZgaEP/VGKPDmK1RQlJVhfmPwbdZ0V1kwdIwyG+PzVuqqCaReEMYyINapOccronK
         DNUky9wt7u85AeCXx9n4AYq46m2YX7NUxGYh54+KIUdIjLyhvU1k0XbpIlX6FkdrkAth
         ukqsnLnltRF35K+eYLlz6yYyr0Y8+oaGHbLi5uPFBZKo1/pgQsvMjPVwpi7C6pkhw6bV
         l91dLLpNHrDqmcyZ9NGupB1qPFxSZo8a1gzVQ27drwgryjCAmRRVPTas02GIFWSLIUHt
         O5XA==
X-Forwarded-Encrypted: i=1; AJvYcCVBoQC2MpozoXdvmCRl7MnpzodTgccmyzV/NgStKsWMsIizyYBlVQeLDw+l2HzbGDJH5mjiuKLLY9FCAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyecCgSp6LGYgUYmbl8yHNL5pOyv75fyyfd4B0LEkFKNVsesUSb
	cv4k7tiJdOLwJpHzu9UHd2mnGbqbcOz9lVPrJlGP5sUH7bA78TKEFgbFNdgHh5Rnpj8=
X-Gm-Gg: ASbGncspoaTj02876EWgVWhkrw1VCw+eAiXwUzaPfLROWQ4938Uo/FXq9I+jjHAcTig
	PMwsDMqg2x1ok8+PGgmWij8xxY7/6WyzGkq2SmNw5hCz9CpqgikL+g/Bfui2tKQDnuhl3eIsTnP
	VYwjrUC5adt+f1tso1rMTocniOu5WRz3bUqtqHy5EiwPbnwhaRHmO2DjyxhKoOHlq42YTwUKYpp
	5vv9R0AtnlBJpPndg2IQ0hcMgopicLSrr73SGuODINaAIv2QWc4+VjnT6YIQKqffjdaaODFZKuK
	ZY8mXTH1RuS3d9HtB4pdqCp2OVS4ucs057ho3f9nXBUkLEJ89DMD8kBgEWp55arBh/XszERQ5Vj
	S7MxqA/B6NVUK+d4zT8dMLTKkTawQRF8DjAlPheq3fzAPfkVfxYitmDCDDb7xEnO/xt9V0jxU10
	Q2BbcgiHg2JINmIOAToK7xCKheicjVDDWRWnjyWq7clPoPJNmyqXg5
X-Google-Smtp-Source: AGHT+IEfN3sDw4+c9kAcEeOlETsmvroTxjtc7mSSvF7SLOSV5F4wykTjDG1l/xLBcJfYOVZ8mhA2wg==
X-Received: by 2002:a17:903:41ce:b0:295:82d0:9baa with SMTP id d9443c01a7336-29582d0a17cmr2501135ad.17.1762011806967;
        Sat, 01 Nov 2025 08:43:26 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 03/12] rvtrace: Add functions to create/destroy a trace component path
Date: Sat,  1 Nov 2025 21:12:36 +0530
Message-ID: <20251101154245.162492-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084328_303974_68CD80B5 
X-CRM114-Status: GOOD (  23.76  )
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
index 32fda1647b39..7006a4469d62 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -211,6 +211,53 @@ int rvtrace_disable_component(struct rvtrace_component *comp)
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
@@ -463,6 +510,182 @@ void rvtrace_unregister_component(struct rvtrace_component *comp)
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
index e8e055ad6583..4b31ab96e721 100644
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
@@ -72,6 +74,12 @@ enum rvtrace_component_impid {
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
@@ -238,22 +246,53 @@ int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
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
