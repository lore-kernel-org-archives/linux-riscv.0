Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA6F357D9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 06:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYu5ZeSCN3upyGyNq0Qy2ifm5355uXfcOdtdAvuosmo=; b=s/Y20hL8y4v/DW
	KYrC4KLm6hTHGly1a9nO0XzJNYdJXJ6aWMTf4BpsJMBtjq2v/Jp8mNYc3oUhrrWx7gWuPqOIQsORW
	7BvORh4HupUyrFvNdklm0napo/GiUcwsTFRTIpQzmPsKeQC+DZZ3RWZqkZbCES8Yx39Iy2xFbFcEm
	G03hqVxlVRtJ8Rv6hFbukqYQ+a9Xsb8AXREnw2T8HNcrl6kQtIsSJNkfuT0tWHVit4JqINnRd75ne
	3ocJY3pI2ztuq0oyN0PUMHHbv76pjIOM9NySuH6Xd/FW8uZgztjF62PrNBBpUYdD1QEt74pOUrfXA
	Zgfx8bPz4cRSuxJ1a9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LC-00000003Jbe-0fc6;
	Wed, 25 Feb 2026 06:25:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8L8-00000003JYX-2bKp
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 06:25:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P1dRsE3660109;
	Wed, 25 Feb 2026 06:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aEeCcigjEOI
	QiU3b6Nnn6bwgMriruVIr7smJgHT/vPs=; b=VNbL5fvicPi6fZhf9rG/YP97wDo
	d+SNiw5mimCqWSSildZVoYvAn0PyjEJGqLUwCu4/Il56s41HlSNt3KjtU5F1UZOv
	Wf2LbqVtaa0SvWrH3y78Wl5Dwzfl0t9kHCshkhjW8w3DBWMA74YVYvZV+HevIKbV
	Ykk9WeeOQ9MKtRoR3fhW8xdsc7zDgyeRBakwf7CfH3l1WlXZRJMoq2ZCLRkLNu5j
	mBTr/zU5YqW3LHddyRZwwrm424ALogEdR7ozZwL4Df8keJLCbdODdooyBnUcd9j5
	hahnDhAcBbPT4hrDge5TrfC+IoPPcekprZNFnk7OqQCkPN5iJT+mlD0i5rw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sa62p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P6OtpV001288;
	Wed, 25 Feb 2026 06:24:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5sm83dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P6OsH5001265;
	Wed, 25 Feb 2026 06:24:54 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61P6OsI5001259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:54 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BE13E249DD; Wed, 25 Feb 2026 11:54:53 +0530 (+0530)
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
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v3 04/12] rvtrace: Add functions to start/stop tracing on a component path
Date: Wed, 25 Feb 2026 11:54:40 +0530
Message-ID: <20260225062448.4027948-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699e95bb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=a8cUU4qgmBzOD3ajWOcA:9
X-Proofpoint-GUID: q2k8PoKbEc5gyhTKzuyPUKrN_fD0rYh9
X-Proofpoint-ORIG-GUID: q2k8PoKbEc5gyhTKzuyPUKrN_fD0rYh9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MSBTYWx0ZWRfXyvbB8/BBCnsC
 5k7UKyCRyJqW3mvggcpTlm4KGybrFE4uW0SYCI6kQM+ZyOJ4f7qiFB4YqxDZlqy1tIyJTSd4Nsl
 Zkxo0Z136s0BwBIg39lRQgfLCg7ioruFD/J+mmw2FTrkcwx2+2i4XA29oag9Xo4AbVIJYs5fUtp
 aSrTY0Yt600FM/Sc1lejvm3JWwHLBucrQSPYzHJD661tc0PriCzSrBk9uXr2pf2Q7ELaVUXoqBS
 ZW/m21j33hOWKn4+TbTIoYzwhfoY6JHg21zBx/99qnYhbIxXWl8SKBgvnK0M+0IEBah+9OKWfo2
 3YJ74IM0G27VOCayXkV4VDKOatyLlUDzYAJDf1La2lq6yTUT8Sjn0gNgXyYe8gWT2UBZH1r2nBV
 gvkEGAfBnZP86OssLA5CjkKAGRtKcnNG2jNitw20RmkSzTrmbBJATzd1hgYCNX0Cs4OOQEoQ3NL
 CO+910xFrsCRTLsEBYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222542_664223_C2DDA6FC 
X-CRM114-Status: GOOD (  15.56  )
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

From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add rvtrace_path_start()
and rvtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 44 ++++++++++++++++++++++++
 include/linux/rvtrace.h                  |  6 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 5f40bad215e0..fa848935003a 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -620,6 +620,50 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
 	}
 }
 
+int rvtrace_path_start(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->start)
+			continue;
+
+		ret = rtdrv->start(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_start);
+
+int rvtrace_path_stop(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->stop)
+			continue;
+
+		ret = rtdrv->stop(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_stop);
+
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode)
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 00b63fa22da9..2a7d8afd27c8 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -277,10 +277,14 @@ struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode);
 void rvtrace_destroy_path(struct rvtrace_path *path);
+int rvtrace_path_start(struct rvtrace_path *path);
+int rvtrace_path_stop(struct rvtrace_path *path);
 
 /**
  * struct rvtrace_driver - Representation of a RISC-V trace driver
  * id_table: Table to match components handled by the driver
+ * start:        Callback to start tracing
+ * stop:         Callback to stop tracing
  * probe:        Driver probe() function
  * remove:       Driver remove() function
  * get_trace_id: Get/allocate a trace ID
@@ -289,6 +293,8 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
  */
 struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
+	int			(*start)(struct rvtrace_component *comp);
+	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
 	void			(*remove)(struct rvtrace_component *comp);
 	int			(*get_trace_id)(struct rvtrace_component *comp,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
