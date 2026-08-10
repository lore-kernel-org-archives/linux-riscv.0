Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105CAC5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uybvOChrSKz66PuB/vpXhn3Ot53WKq7x4gQ1c0KME/g=; b=tlbFFJheRDcC3S
	s5S1uST3rqwV+O50bNA7q6/DCYHlpiCS9EPl5omW1LciqYkaqqRHeq3UzuxZ4+l19m99C7WyT+kzV
	JM3FVkYoIU+VCMBeqVEgpDyCB4O2pX8tZyx2BDl2/2X8EsexOd+W6GitH9FzBk1pe0YwSrpuzH3NS
	XjR1SME6BQ80hTta8nRA6hpx+gAGFe0e2GuLZeyAeQg87/zPYjEuW2ZR3c5MwYLibN4ZfjlsOgEXr
	VejX0xwr4luxSo4l0MT4x4KBHBuVbrfxtge8ycJeDNfUmm2oThfULEHVZXbrR48LUTUJER/UESCj6
	Twhyb2JALGen5PvwSukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrI-0000000CElJ-3pQX;
	Mon, 10 Aug 2026 15:24:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrF-0000000CEii-2HDA
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACixsj1671289
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XI+TWSI9Lo5
	Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=; b=K2YqF+bnIXCh1qAEk55VNI5le2w
	pXvJkXtVJAjM6TXEIbwBBsjbl/CkldxatBj0t7EFk2xB/5pndnIieN7pkgZ2uDif
	r+cY4PTUFfrg3NLXzqhQOjAenfeSqyT1AqVaMNpPjTFiPecnRyHPFePFmUqcL5me
	A0UZJFZ+BsN2MCt1snvE8jV/eYNB3TOfy5vt+AOBCfhI7RMzr7LJ72/TZB5AWnG0
	bU+4b1W2HnM4EsGDFBUfFODUR2qGs+Qwe5BWFvo3X9UVymnXGtnFOvfNyiAGS1ES
	c6EOMLMKHZIodhDxEhHNatLk/8senGvFFFdQf8w11oMSZQp3mSb1ZxNpmCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2aa57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484f26852dso2291413b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375447; x=1786980247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI+TWSI9Lo5Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=;
        b=PEz+mfT+heyhqpjcy/PHdQQebARz5dYy0CEhngxbsGSXKcgUKYECK5DOcS55jqEGVQ
         wCs9owi1l0WFu4x7qwa7y6YzHlQD3JkHu0hMg7kQzElw0Je4dmA20yzohd8mihCZQtJH
         QoFqACvbbISIBv9sJkiLTQ8nlVtNsSD5pka/FUV7mpQodtvDcqp2ARxmDR1h+oAu3L1F
         BeegtJLkcSyLDgg9hVZWoPCKQNbzC49cBeokj/1wcso5vVBalQz9pJUAx3w11KSpgW7x
         uDsWJzYTPKTrxFMoLdNHFSzQGmBeIFiZ18aOsYBdxv47TjQIIqCb75GdoMxD5y5Qr2lY
         +Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375447; x=1786980247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XI+TWSI9Lo5Uxa4GBWQbvSKGeik/xwrPtHlF4bh58q4=;
        b=GXy7uFAFAuoajxrnF1jyY+cz4lDJlsoc1XaYIQB7wnuC4bQQ7cODBGuJ3qK8dynzCx
         3scjM51bMZZW0vbnigq37OsxogUVrTkzdSNXxAFfIOKXEW/pXdhzsw4dgvggSDuVArw2
         Z4JKdypO8tp4+WsROBMcJ3sDqW3Xy4uv/y1ixTX2St80rlo42NDsp+femHo1uSrsPGJb
         5bneG5T2u44qAPViUtV0b/a+5kAeRinARnMX3PqMwWHkhj7Y9Xoha3mFDLOhL5qlD2c/
         4HWIVuGt2kDv8SsatTweLML2Ro2W2Bi3FlcGROyCAlr2buCzNt9HrDdGc6Duli+MmF5w
         9tQw==
X-Forwarded-Encrypted: i=1; AHgh+RpOLwUZ/h4OUK6YbIlFMVhF8knIpGrnlMw6tyJcfImQE85ZGntwrEWFNQBPUDwmimj/BbQ4zbZ7MaYHRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRhzH27AEbBDCwl3eQclJevDjtcEJ+xeG2IBYiQz2nmHew4gNn
	gTSpPkoBurVNnSn/CUiYcOYf+ErzXAPBhHilZQSMwHoO0+YdliogT144NkC1c813HHKPvtgBoMz
	6T4+GrpNFFCeUy1OMOspxh/AHxYeYk8AoLYnlG78GLEbzGm695ZXLE65QnBmk2KbFa+P4AQI=
X-Gm-Gg: AR+sD13GVb2rP77+xAfC7v8cIE4CxoBIzZY6M3nprZC75oq/wLHpS/WuCahtLQ86avw
	I0P2fk3HUGrpe9Idq7jSWEPHQUUkV+F+XWHakQF/Km0cfRCPw64cpUy3waJM0xC/qX+L/JZl6qL
	ksxdqxPNcKF5extdOsFxSaLpQqs6tCXmAOOL+sfGsWlofWNwuKycsPz8biWTVddiqRQNVJQPeok
	aL7eA0a4KZBYK3BGZB/wlf8qpVkM6X2qDkWdafSosn/JVrPhKY8ZhEOUJgVtgs/L1d/lczcpAyG
	fj0wF3D5Bu/wESZzOexIGz3PtOnwqBq+yKzvziKjv2a0FBJ9DCedarR/vDzPEDrOnM6mHaCEjmd
	gYKBVECpzhLPnmzDuzpHbMPXiKRIr2Ukq1vBrcBNWrHjOTtkk1GwcRW5u4JHLW1JWcJoZdRgz/u
	q0/ZOpnsI9L0EL+qo0uCc21/fazg==
X-Received: by 2002:a05:6a00:ab89:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-84f4fb800c9mr35806053b3a.0.1786375447135;
        Mon, 10 Aug 2026 08:24:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab89:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-84f4fb800c9mr35803483b3a.0.1786375426778;
        Mon, 10 Aug 2026 08:23:46 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:46 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Mon, 10 Aug 2026 20:52:07 +0530
Message-ID: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79ed18 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a8cUU4qgmBzOD3ajWOcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: lcUCDCk9PC2nosfJMTJOT4MHGqVn_L5V
X-Proofpoint-GUID: lcUCDCk9PC2nosfJMTJOT4MHGqVn_L5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXwrE93sOxGLUW
 Y4+c3JnDO7Lej8MdkdcAO87D/KAFrne9n+6ZZD7yPrvGLSBLdO7nLunWoh9bEIUval+l27j1EjN
 KzIOHemfbNWtFqBDNEQyv7LHQ1QAHyi5F8y7wyEK+o6SxY49fVoN1Radi8DIauMKmkvdiVZqYCI
 oItoUyqG7MOOaT7vdZLyKqCnKdGB61Vx/BRE57+Dv+r5mJVucXesTLGTZWPL1YQNCgiiixsnclN
 lOM4GNNlaWMKe1JTb4QE2h7dGL7Y68gd+lnDYdfkq8mkICxxiwXZV7mdL6tHYAJo8Cwpk5v3Gwl
 vJnizwcc547A5ktXi/VzkaOPpjeVJyq1mLOjaiH3ve2ACOWkJ/5w5Fep/Gh632hEm7YVrZU/sHV
 kEWhEQL7fyUqxzcaV/SbPDKrLCOp0MQcBWJKwKNb0E7Cajb1/1wjTZDtGK5KCc0sHonogpTztDe
 lpUP7iZLVmUiDMMZ2EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX2JcKqcWDQecm
 jz0BYM1xvbmr0QQ2m98Q/FpoLQ5jXWofY623LyzINs5K3UDaKQmhFw/aP1o35Kig3cc05jzZDYk
 QdbG7OZpdCLoLarXB8IyMECqWEr9W5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082409_820088_357E84E0 
X-CRM114-Status: GOOD (  15.72  )
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

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 44 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 |  6 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index a89d195ab5b8..6ff1b3087947 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -582,6 +582,50 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+int gtrace_path_start(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->start)
+			continue;
+
+		ret = gtdrv->start(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->stop)
+			continue;
+
+		ret = gtdrv->stop(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index b74d4b83b141..78e2ead3db8e 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -254,10 +254,14 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID.
@@ -266,6 +270,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
