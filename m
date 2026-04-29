Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3CFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rDvJqK5Puy9ewdUK4dz9E1WuEKzDRN9rEKGXp57Yhk=; b=2/KaXAmppuMcX/
	kcYSCndaf6OErxCBS0f1nNBx05Wj0OpmpiVbRinl+piCHhfLf9L5Kq6INPxfqybzovZvrHW1CxvPK
	GZ0mbRcdgx67sJ72uqZnYVF/M15XKRx5VZ8Lz/MfAARY0MQmL7s+HOCMyhbBHR44D5JE65QSwU3YD
	pPlfP6PYEzk9fRISmXvrhLwb2E63IhOjY5KKNHxEAKo2Rp427agcBTCTPCXSXh0vBOqMePPn1Psz/
	PZ0V+yV1mDQ8n6uIttNjZTdk4qSZOxqV1YB7jjCybG4H8d2KLQ6+ct+wd41l+5Sj0kW5m55byt0Ds
	79Q7WYF3kdPr7389F/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Ow-00000003bR2-2SvS;
	Wed, 29 Apr 2026 12:52:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Ov-00000003bPc-2zjB
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 12:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8f0Pi81zN9tkL3OXmacgA2swuOinfVpfGGMeF5s7kw4=; b=XiDfzehZj2FCb3Ou2Dm18YqrNp
	gU9IpFQ944Ry9LZUFaEzoEBAxTkjiGq78PLu9oC3j39nVdLEIlZ+pF45oa3fEcDsC5pbJxscPwQTh
	TJ//wZxrwEM8hsvXrt++8GuaJJ4JgabIjGxgnk3Pit5xiJ2tjTKOb9GZLjR02fKr0F4IfwT5B385w
	Aj6DCdHH6UTKyjr4a1h8oaZTbfPkkQO2qHCkmqD5EL4KnjYngEg1Agw6qMeIsSjBQEPSGdS35WXqo
	sMw+xH+BdsC5gdiivOf6L+2/8BpA52dSt+W+bpyLMkT/dZNyiSzmFtB21hte8S1D7069VpH7VyAHs
	WleZMWQQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Or-00000005JrD-2vLc
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:52:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qXAd1642983;
	Wed, 29 Apr 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8f0Pi81zN9t
	kL3OXmacgA2swuOinfVpfGGMeF5s7kw4=; b=SLqksZqxI2Pz0AfeCZM6Q3K5aVp
	HpVgWmmb/hYRyuYXDdgo2s4Eji4LjnVvSBf97vDotqFYPaKN02y2+P+AcOo9kDrY
	pk3MGOkA/qptQPEMIZhMxPJOuA1wtVdh2jMk3U+8FqtWAY3t1Bux3Hd0MyElF5r7
	bigUg55L/2C0OhDDANerYLA57+3Je6kVJKyEecKX+aSx7rFo5HTzF1a0A0sSEGD9
	B9BQyIDb20vT45DHW7gnsxMhy5+BV+dtae1qaNCKodzDjWaBHua2/w0bumZpaUX8
	qNTmyJxfqiH+TJ8eUJfOQ8+3/3XanTSXU5GU1q2yW8QygT0Ldah+XQtjKbw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81jm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpbOX010778;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:39 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpcSp010815;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpcgl010802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C3A252212C; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
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
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v4 06/12] rvtrace: Add function to copy into perf AUX buffer
Date: Wed, 29 Apr 2026 18:21:29 +0530
Message-ID: <20260429125135.1983498-7-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: NCSAYNMQx2vM14rzxlhoVqKOiJQAZZ3x
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=J47OFj0AjNl56Ar9NcoA:9
X-Proofpoint-GUID: NCSAYNMQx2vM14rzxlhoVqKOiJQAZZ3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX9OcEn4X4rrhn
 Hkn6eH0CRwQaAGexpSYM+JxHtvlr9ZmhH/AQcWZkwKm6rlLCTOsLavyRLu6a7kSvA0ceDERF/Ed
 i5iRxKyrA+gQqHjD6PuAnC8cs7KlwRWOOGGTAEwUS0Bptn8adOxAg2cSgh4TKrmK2qPDxLmMira
 tGETXo1oGAi4QGDLflkbyjEn2n5/B+HFVE9GH9Tfwk7yV+uPhecWC7XlihpAY0mOn7JtXJQQhJm
 SdxfLsOi6ohXD/tYFqb+F4X9dhET82omY2T/kMGgEMTINwPavV5AwLH509bZqowYHnZe+B8Rsry
 fLvi4ccTnFixXFEJ2RkQ/vkJD2OFNwXfq4lWrADZtL0VOF3oDeqtHWDidaw7Lt2Sw0N+77mfSSo
 fkbBL308CciWBlabvvfrvtGlWoMUMpsXOgZFcmw5Pg/GJ+sAlpEneQ7sC4ue7eVitWMV+cTWyl6
 KMIAFVp4OW7ROWD1WsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_135222_071005_A58429C8 
X-CRM114-Status: GOOD (  15.97  )
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

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add rvtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 22 ++++++++++++++++++++++
 include/linux/rvtrace.h                  | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 733d07abffbc..6d45c90480f1 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -664,6 +664,28 @@ int rvtrace_path_stop(struct rvtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(rvtrace_path_stop);
 
+int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
+			       struct rvtrace_perf_auxbuf *buf,
+			       size_t *bytes_copied)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = rtdrv->copyto_auxbuf(comp, buf);
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_copyto_auxbuf);
+
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode)
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 2a7d8afd27c8..36663c7b3e30 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -280,9 +280,28 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
 int rvtrace_path_start(struct rvtrace_path *path);
 int rvtrace_path_stop(struct rvtrace_path *path);
 
+/**
+ * struct rvtrace_perf_auxbuf - Representation of the perf AUX buffer
+ * @length:   size of the AUX buffer
+ * @nr_pages: number of pages of the AUX buffer
+ * @base:     start address of AUX buffer
+ * @pos:      position in the AUX buffer to commit traced data
+ */
+struct rvtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
+			       struct rvtrace_perf_auxbuf *buf,
+			       size_t *bytes_copied);
+
 /**
  * struct rvtrace_driver - Representation of a RISC-V trace driver
  * id_table: Table to match components handled by the driver
+ * copyto_auxbuf:Callback to copy data into perf AUX buffer
  * start:        Callback to start tracing
  * stop:         Callback to stop tracing
  * probe:        Driver probe() function
@@ -293,6 +312,8 @@ int rvtrace_path_stop(struct rvtrace_path *path);
  */
 struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct rvtrace_component *comp,
+						 struct rvtrace_perf_auxbuf *buf);
 	int			(*start)(struct rvtrace_component *comp);
 	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
