Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D04EFB7F0
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cT8as5KhLyjhZbB1s7IXnHdfn9p22jqFgOS04++wyho=; b=3YDo7nVnbqWiBd
	2cupeb0W2ZKOFt9/IhiFNPAN3kQS5/mIXhqvW7RDzRYRnUT3O9zv+u7uPVuqsQ0mAY2mecI/BxdHV
	hMHFULk8IazmfBLDES3W6LaBViP9HN0HSBHh2n6Cgdyyvfn+ULU04Bk1/RSbwC1AYeKufM7nuzvte
	542/uOq5NNbEawBpQ2zDQZMNGKX9SQRTP15ilJLid62RYAEmp1mSxFAAtvrg+xVl0wOOYlSCcBpiP
	Sp/V9fBY/j8TCPLdEFn+Cl1oDBnVrRqDjOqyUDFIRORc1acIWaChzgFtoNdYlY0hI2zeFrkibPbB1
	TRItDvTMxNnnOXbrp/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8L7-00000003JYD-0p6v;
	Wed, 25 Feb 2026 06:25:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8L4-00000003JWU-25bt
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 06:25:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ONZJHM3177236;
	Wed, 25 Feb 2026 06:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXpV6H7vjYk
	qUaAQjiqyywI8Ceb5UFQ6rPmGH1z1J90=; b=XSSFpodev4Oq5CN8xKjdY/eak0H
	BQOZb1hK+geeGUZGtlPSvVX4em2/W5hqEVTcv0lh4WQwi8z9pfHTObF9SM+c1KuT
	muSkOFnKSovZsHTKGUGcw8cjxwsV63julFhlgRvOPP9wWFzUsSXxPsQ8DAA3PZVb
	scirxf33V9wsrbsanLStaY5NJ3BuYUNR27LK0BHQusu7TiMh7dla1Y6WpbztCP+b
	QCeV5JJzafo23VqXCLULlTggI5VTDcoKNI0AklCK2/gnFuzkQia4fg6N4mWbKJmO
	1FJmeTJfUtqqyohKdkMJ9jH1N8htxjhrB5z/+JC/rZkSm5bfzgMfOdFL+bA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chemntgth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:25:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P6OtoD001344;
	Wed, 25 Feb 2026 06:24:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5sm83er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:56 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P6OLn3001156;
	Wed, 25 Feb 2026 06:24:55 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61P6OtDl001308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:55 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C303E249F5; Wed, 25 Feb 2026 11:54:53 +0530 (+0530)
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
Subject: [PATCH v3 05/12] rvtrace: Add trace encoder driver
Date: Wed, 25 Feb 2026 11:54:41 +0530
Message-ID: <20260225062448.4027948-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MSBTYWx0ZWRfX5a2GkCWuUVKd
 5LkGn1Mcee22IteqNtVp2UA4ziggCmY5fC4j1T6Pbp1BoYTyZMTChRh4UgtNGrQFM8MYfTVBtev
 TidJUrh/EGKHMK92R0ynnKbrwOsksbtRb45Vw8sNkys8/UaKWog3UiZNlDAkR+U0QjVn8y7Lrrh
 KKW9xzgfZrKCrQCmRGDtgFPpoVgE4B6J19qXdXHf4iYvpMRAPZIyZdocP0mz/Dyy9yJmYc/u0bW
 xRZOZ+DhFtBXaIYTxO0JgpfLJOfE0s4zqySHN7hHsB496QTHet4lgzFGPatFyYsPh4iixgK9wOz
 11DrJe3IGq9BAJ3gopE7MGPc3Ii2mN5Qmn8wXq8OHasBk6rTDUpiE5guNlj8btPqSwrgFo3+Gto
 6qe+eNmpgPd88dF9zCY6AOiE+mEVsAo55sbztzACLA9oRgQRxvwUjINphq0FP0xnCubarSGrY+q
 3RSiCssX7+7bUKxXCWQ==
X-Proofpoint-ORIG-GUID: qwWsoajpRCxK8WLoGmSQMt92qiNF19nb
X-Authority-Analysis: v=2.4 cv=Ro7I7SmK c=1 sm=1 tr=0 ts=699e95bd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Snd26lYfUHIjvdY5T_gA:9
X-Proofpoint-GUID: qwWsoajpRCxK8WLoGmSQMt92qiNF19nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222538_820084_78E1D04B 
X-CRM114-Status: GOOD (  21.02  )
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

Add initial implementation of RISC-V trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/Kconfig           |   7 ++
 drivers/hwtracing/rvtrace/Makefile          |   1 +
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 130 ++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index f8f6feea1953..ba35c05f3f54 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -14,3 +14,10 @@ menuconfig RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for RISC-V Trace Encoder component.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 988525a379cf..f320693a1fc5 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-core.o rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..d189819aecf7
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+
+static int rvtrace_encoder_start(struct rvtrace_component *comp)
+{
+	int ret;
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct rvtrace_component *comp)
+{
+	int ret;
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+		return ret;
+	}
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+			       comp->pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_encoder_probe(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_enable_component(comp->pdata);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
+
+	return 0;
+}
+
+static void rvtrace_encoder_remove(struct rvtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_disable_component(comp->pdata);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+}
+
+static struct rvtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct rvtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return rvtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	rvtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
