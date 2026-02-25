Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E03EFB7F0
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TBw0A4++qBCbYhjdm806cTYPvNhAxn7IHbBiolpq5o=; b=cH6H8kam0GSSu/
	O866r5zUdIVJELHkgDtjyixgV7Aeo5n5x4J0As+IW3MwnS8QKLuElcjA8m/E+VXn8amQ8/ThzmCGl
	fU4VC6A/7VvPitR+XraU2xPPhpmhXkpkX3jNuVdaG5A8VHJviUN2Bjgr0zW1TKAaHGpTij860TExa
	FijqRCce7I7tgzxHAst6xFXLxcWJLhUbXnYY5t0LUyZnj0AhWcdV7IquGZJdMEU00GbKCUAhwgxUe
	0rCtTla1/INHFsnQxfAHOhUxR9307JEQkJBpeyF9YJoDaD2MKY0kBoCK/2lZd/iebnqalW47sxrsm
	8oVoCJRuawE6Y6iKRSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LK-00000003JkW-2NkV;
	Wed, 25 Feb 2026 06:25:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LG-00000003Jgk-38KB
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 06:25:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ONp0UO134540;
	Wed, 25 Feb 2026 06:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hxZVxXcr/V6
	2gVHq9sxbPJrXaz87OM850jA/r80z02U=; b=JjKiaGNyiisea4BrHloREcHDlqS
	R0jEQlgzrz94tnoewanmfPd8mmynsktOOJeXlN9S/w8dooKrTF40cbGZ7GQhPgKF
	mrYmXGTNziOPBFrz6ITh+7rgrHJ1ZsRvlU8peLNC6g//UbCp24WZz0SsvvwePPA/
	3QoUMxttVtdixFxkgSbMFyESvRcR9+PMEotKLJUmOGBWpi0FNaBazxBDfYodqUpb
	J3SaEK7J7bKkk6TfBF5V5f3rCFHB7iKdIyVJgAhuEIqYL/KLj8rjcV+RgBqnUeFB
	bYSbeK/5ZAni8ZyrVsy5R34wVmMC17W34F6di17jvaPogJyAV0Qxo0EjLCQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp158wv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P6OMbl001167;
	Wed, 25 Feb 2026 06:24:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5sm83dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P6OsBl001264;
	Wed, 25 Feb 2026 06:24:54 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61P6OsQv001262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:54 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B90A3249BD; Wed, 25 Feb 2026 11:54:53 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Liang Kan <kan.liang@linux.intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v3 03/12] rvtrace: Add functions to create/destroy a trace component path
Date: Wed, 25 Feb 2026 11:54:39 +0530
Message-ID: <20260225062448.4027948-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MSBTYWx0ZWRfX5dMwES4a5jOL
 PzkDqE4B5TS7+bBv14TRaOC23/vH3iO8J5J33FV8QkrDIeN0UgsE0wqQnVl65j/BBGI+zkdyQGy
 ykETFAUG2JuOvtmzFk8S7vObXzxU/bWxH22rCmfNTpnOI6482F1ZZt2Cb5yZHiRNyb7EQmsVpLT
 cs/S/VYO3cxWDbF7qSVwKI+EmrcKanEQfsYP8gGZRzCFpnLA/A9VaB2DSHfx9RxrrrHnTgKX3QY
 ROQ7UZrK4A6Ky82caV6+55//z61ojEvqSnn1FyBQBP/YoymYV8JqSYehWwZjoUe/Z7ahVKtbl2H
 bUXa/pS8S4K+5CmhemaqwmRaQoTo4mBwiT9Ozndmk3wjp+PG6bu1FP1fxWmtHTYXMmwlygDZYyW
 wdk0KDOxdiKjjAwEWq/+PW2uj53z+1PSpw5OquIE8brrZa3x+xLMysm9vFS+6pUdxASCWi21AHe
 PxLR3KH+5NcBQ790fkw==
X-Proofpoint-GUID: rg5-qdZ-lO1oULxUVaXdVYMxH9_xM5jF
X-Proofpoint-ORIG-GUID: rg5-qdZ-lO1oULxUVaXdVYMxH9_xM5jF
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699e95bc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=UaIybRF2xpGp7VXWmyEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222550_913200_7E38938C 
X-CRM114-Status: GOOD (  25.51  )
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

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by RISC-V trace perf support.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 223 +++++++++++++++++++++++
 include/linux/rvtrace.h                  |  43 ++++-
 2 files changed, 264 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index d69c2236493a..5f40bad215e0 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -229,6 +229,53 @@ int rvtrace_reset_component(struct rvtrace_platform_data *pdata)
 }
 EXPORT_SYMBOL_GPL(rvtrace_reset_component);
 
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
@@ -452,6 +499,182 @@ void rvtrace_unregister_component(struct rvtrace_component *comp)
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
index d6be6e3cc10f..00b63fa22da9 100644
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
@@ -239,6 +247,10 @@ int rvtrace_enable_component(struct rvtrace_platform_data *pdata);
 int rvtrace_disable_component(struct rvtrace_platform_data *pdata);
 int rvtrace_reset_component(struct rvtrace_platform_data *pdata);
 
+int rvtrace_walk_output_components(struct rvtrace_component *comp, void *priv,
+				   int (*fn)(struct rvtrace_component *comp, bool *stop,
+					     struct rvtrace_connection *stop_conn,
+					     void *priv));
 struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
 
 struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type type,
@@ -246,17 +258,44 @@ struct rvtrace_component *rvtrace_register_component(enum rvtrace_component_type
 						     struct rvtrace_platform_data *pdata);
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
