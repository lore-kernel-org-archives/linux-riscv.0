Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD3EC5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4tbh2UMlclf6ut9hPmZUPt2vKSnzzhzBRQCFmMnX4g=; b=NbojLe7sPIDfhk
	AnUgDt/5fw0AJQwwXr3LE+kB95860OXhf/xHxhM/uwKH6H5ADhLMidH4vhwcPFxwOTpxB7/RTO5IH
	JKJiGJJ4G2VeUZUtnf1SaxdqdWLXJjzY/TT0yZiYTz33TvYh9/x1+M2ez3UOGiZntCNvGYnP4BcpG
	eLlNwBeG0BKJSLadRnmkkd+4MZh6z8bzmNwkvKYrx1WvWQ37vzzwhkzzeLCetrYFkHNAPkqSEYhAM
	VvWoF+dx6RZq77F/c/63+ZR2Q5X84HFYPT5+uonaQd9XgG9Cb24JDS7KfgYI8pnIiqVYVUwQQfzrj
	Z6+Fndzj81+03V9OKC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqq-0000000CEVk-3BTn;
	Mon, 10 Aug 2026 15:23:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqn-0000000CETV-1grg
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:23:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjUJP1309608
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppv6/+v9uVe
	vJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=; b=X69xIKWu6fWyQ+ZVwupH7YJO3nK
	ahBgH4pOCGfltc34ioXuUkM+fU+KQ6pkNe6HZfUMpWBrXHn8EuaebiIHpHUQKQjI
	V3Z1k6dmRY/YGzVeRsfG2uRhhs1/+EtMl9446pBW9TZSOCSReHqkm6pz78HxMyXV
	ppUbagr50tFFuAibSsQ7GpB1EaiapuN8cvySIub/tIzJ8ZfclJBVcFmARW2hdeAd
	ifafM02ZOKrqVoK8TiN2EVEqho9mOcNNQtyk3a8wuHtUW+yeIHdqVhOSkwGs0hPX
	ltho4+atljcoF/Nuap4FKLdKczGh+ib3mrCmKei9heFdwSuEEFzgIKTCltw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsbnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso2483371a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375420; x=1786980220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppv6/+v9uVevJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=;
        b=WHmpsw/Zkf+jS/dsHUkTMWv5NXLKP5T43D6hkRgeXneQYh68Qt0QjMywGDNoK5/noF
         g31tjac0gYfxS2GMx6+eivV0kdrva7Hcw5iaBwHmBppwkv3Paql4gj6Rb6y5A/9+OWp6
         YYyLY8DeEAr9g3WmKwNsMRbkZEHe88ynDG6sTJ+5xawiy+0PlARAwaL8m/SU8usOelGB
         HPR3dHumG34I31kGskg5Zhhd0dlZHHHf7rQdLv8cM5JGKzYD+xOV7gPyWjjM7oMh8kCo
         zLsaIPANbMWlckQeshR1v1Ja3z+Tm1El+apt/3HOia2fsyignuhjPaygSSOPdOZUsZHe
         N3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375420; x=1786980220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppv6/+v9uVevJFb5FIxPNtQrsBx+IieOd9pY+4ba1bM=;
        b=qZEq57Bg7pteon8QVGdDiHEvNouMzLwhLOrnvoT6erMbYkVwOZ4om4HhL812OZpyKw
         x6QH7zzutM5B0IImaubc1lR4OCU0w43Sc8+gRvnxG7Xu+zmkTN2K3ksiCxKMi8S/UlAO
         /fXe6SBH/rm4BaEIvdN7N6DR0youe8g5BVF0ROlX2YQTe9waEK7FcI6Uo5JWIJmND7ph
         FDUufu4QWrPa9t5bfrtSZF9JTqWiR8SlKVtD+xwRPdCTMiiu4eTKSRJP0PUdnn0p6cr0
         gcqUZLhwW/yz09Y6uPwqxhpBx6RJLd+h3P8/ZvG42nOSUj9XbGV59sygclBnrRp/3UUb
         W8kw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9nspnmSjmxGAmIYPOS2ih82bMpxVusmKvPQQQlffgsp+yRGq6fYyUdSRyaQuMBKlJmnZXSeSq5iCZCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLsc3bahFkWfB+Bto1FUCoKkfGKLu3wowWxebsX++F0i08BOnt
	69rl0d67oKFju5AnNPLRJN3RAjuK3/P0R59O/R+FQx99ud4Wq6EH8iuvo/1uukLM4ikc9tC3MU2
	A/1NUPyTVllve53IX3YabM/leARDPc5Zb3ipmt6JUAEjAQCJ2IRm4aXv6/ClIbxWibKjxfSU=
X-Gm-Gg: AR+sD13V/AZOCDWS8OJiV+Bp425CUK8bZdAlvYJKRqOsQy6GKwzPKRLdAVTlLmJ5hg5
	/EPfJaqv8WViagjllzu/QVOIpB8IhhzZyhJ/dSs/HVdh3BIbXg7eiUz3Xx4/YeMs923W/q8fpev
	JDK1YexLa/tBUGNuBrT6NpxrFNfS7L9xbApICQ3dK79yUr8QS5U9eDI+wwK43dImqJ9j8qVi6qf
	USfyxDLiwSPfwGLgbIRBR9EQIoI3pu8c5A2eRiXpnDitMkf7zxXxtnYiQsiGwf7jqKgIIJ+KT4J
	afjmDpx95cJ82ip8YJlbhG3K87O0NUA/xVnHEI1A/4Gm4+/IQdGKmZepPta2RwBYm+YCrRoJ8qC
	QlKrGiOTBBvDTqnkYwlqAwoXwfgVeHC/8H4j9UnGXefu3vcYWFXTM/q02QC6zjyJpcXkHMQ6xQL
	kQcJy89KpBV+ffMQTGyqmCY7geHA==
X-Received: by 2002:a05:6a21:6e03:b0:3cb:9bb0:27a2 with SMTP id adf61e73a8af0-3cbce9e4f6cmr25124019637.34.1786375419839;
        Mon, 10 Aug 2026 08:23:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e03:b0:3cb:9bb0:27a2 with SMTP id adf61e73a8af0-3cbce9e4f6cmr25123911637.34.1786375419087;
        Mon, 10 Aug 2026 08:23:39 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:38 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Mon, 10 Aug 2026 20:52:06 +0530
Message-ID: <20260810152223.3946743-5-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: oQ8NGGKPYA0w55i4N9qYuBLw-8mx8dps
X-Proofpoint-ORIG-GUID: oQ8NGGKPYA0w55i4N9qYuBLw-8mx8dps
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79ecfc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rnG_eT2C7D_P6d9BKjkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXylmnTBOLdh0N
 cA3WnohQcGrnLHBiSpzwIh1axsYqTFXqKBTO4XQmzPc7AgqGvYLEsfTUzssczqslN+VVnNi7ZsQ
 DGp0OZysuQiT7gcRFQR0MbQ8rmo1unZS9lcekwXldxvVejpaPfEBAMwrE4lwAOO4NTdUCfkKmIh
 5tQoGfmMYJFTNLnWB85DWLaJRvcvHkvEmTXlqCTHjOs+ZHIuWFQWvdo4P3ac84xZOnOQHdkFXuU
 HXM3qPOWcl8r/DEFCyT5k55lpiLOqBOpl+Af4/QToixFJR+07kZ/iMDy2F1y/idov/fMDAn7baj
 YYx3zRmoz7yOw4CbNq+etNWfWcV/Rn2FgGhJBd54LFG+OCIvuGMdkpJfml8K98QCp4o7hjLrJCX
 cGyBzI/3mWYnqkswSOs97Se5d9VVR/SlDe1LZoVfQ2Zqv/NAS9zkGWWNCgy6TCi7ilz9CMkN1J4
 ZMnleaOLgV1Cvzy8mAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX0ziDoIiQ5Ex/
 gtxN4sRKFDvwmToKWkGbN971g3a4f/f/xZ4GAtz1bC64NhSS/CpGQ69+5tM2a7o0AcwVBp1lvhT
 Q5sIqbHCVcoRIb2b2xhk+Cb4g5yZh6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082341_468583_2DE85F69 
X-CRM114-Status: GOOD (  22.43  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 223 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  24 +++
 2 files changed, 247 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 97398f2b7cbb..a89d195ab5b8 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -210,6 +210,53 @@ int gtrace_reset_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_reset_component);
 
+static int __gtrace_walk_output_components(struct gtrace_component *comp,
+					   bool *stop, void *priv,
+					   int (*fn)(struct gtrace_component *comp, bool *stop,
+						     struct gtrace_connection *stop_conn,
+						     void *priv))
+{
+	struct gtrace_connection *conn, *stop_conn = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __gtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
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
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv))
+{
+	bool stop = false;
+	int ret;
+
+	if (!comp || !fn)
+		return -EINVAL;
+
+	mutex_lock(&gtrace_mutex);
+	ret = __gtrace_walk_output_components(comp, &stop, priv, fn);
+	mutex_unlock(&gtrace_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_walk_output_components);
+
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
 {
 	if (!cpu_present(cpu))
@@ -414,6 +461,182 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_first_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_source);
+
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_last_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_sink);
+
+static int gtrace_assign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int trace_id;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv->get_trace_id)
+			continue;
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
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
+static void gtrace_unassign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv->put_trace_id)
+			continue;
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
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
+	struct gtrace_path		*path;
+	struct gtrace_component		*sink;
+};
+
+static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
+			      struct gtrace_connection *stop_conn,
+			      void *priv)
+{
+	struct build_path_walk_priv *ppriv = priv;
+	struct gtrace_path *path = ppriv->path;
+	struct gtrace_path_node *node;
+
+	if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
+	    (ppriv->sink && ppriv->sink == comp))
+		*stop = true;
+
+	if (*stop) {
+		node = kzalloc_obj(*node);
+		if (!node)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&node->head);
+		gtrace_get_component(comp);
+		node->comp = comp;
+		node->conn = stop_conn;
+		list_add(&node->head, &path->comp_list);
+	}
+
+	return 0;
+}
+
+static void gtrace_release_path_nodes(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node, *node1;
+
+	list_for_each_entry_safe(node, node1, &path->comp_list, head) {
+		list_del(&node->head);
+		gtrace_put_component(node->comp);
+		kfree(node);
+	}
+}
+
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode)
+{
+	struct build_path_walk_priv priv;
+	struct gtrace_path *path;
+	int ret = 0;
+
+	if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
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
+	path->trace_id = GTRACE_INVALID_TRACE_ID;
+
+	priv.path = path;
+	priv.sink = sink;
+	ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	if (!gtrace_path_ready(path)) {
+		ret = -EOPNOTSUPP;
+		goto err_release_path_nodes;
+	}
+
+	ret = gtrace_assign_trace_id(path);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	return path;
+
+err_release_path_nodes:
+	gtrace_release_path_nodes(path);
+	kfree(path);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_create_path);
+
+void gtrace_destroy_path(struct gtrace_path *path)
+{
+	gtrace_unassign_trace_id(path);
+	gtrace_release_path_nodes(path);
+	kfree(path);
+}
+EXPORT_SYMBOL_GPL(gtrace_destroy_path);
+
 int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
 {
 	gtdrv->driver.owner = owner;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index e8ca2bd46e67..b74d4b83b141 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -224,6 +224,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -231,6 +235,26 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 						   struct gtrace_platform_data *pdata);
 void gtrace_unregister_component(struct gtrace_component *comp);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  ID of the trace source (typically hart/CPU id).
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	0
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode);
+void gtrace_destroy_path(struct gtrace_path *path);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
