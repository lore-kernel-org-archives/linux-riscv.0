Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3DCC5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D2QRkTArDu5/tgpn7JKtqnWzqXRs7qI1qO1hb4LsdE=; b=QOdYMBpr2CL14/
	A4OyY8wCDfSLwscG4/iMcl2nnyZtXkBzRLTlmiD50uvHmex1qVbUc9U35VAYgOR9Uhfk5cRpyvqFY
	fraYfCJf6FviqoHw+LNb1RyG/NOLSIXLUNPfeUEuKxPtHDPhpZwMjTmkaIuhLx7DJZT4hBCg7Z4ov
	8ffxWPsVRIOXeXW8WMDiHL9fZRNWrzBP40+la0RBil+ZzwoZrBgYT/+YsdEet70QKwwiUtxPVFTOo
	KmsLelAi1AJdUAS1S/M/vkTIm6MabxDNb5sJAETCMFeV+tf4VH+qQE69SWPl1IZoslK8FKHYUKXMu
	Vu3RU5ImLCpBBK2ZnFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrR-0000000CEpe-059L;
	Mon, 10 Aug 2026 15:24:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrM-0000000CEnD-2xrm
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwcm1671271
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F3lO+z9pBhh
	CrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=; b=YVXZp3D8mt/0Jio5Z7KGC+NPlES
	tLo58Q3z6Nb0i5IM2p/0wyv3xMm7hgqV7LaGKSCxlTFU+DpZgvEj7p9WCKTAJZLj
	/OliV9VPv435lefvM3NZsuUgeaRVDASXjtEypSkw6IAgZCXe1RvxQMeHXJOTR2wh
	k3J3NhFkRexn0Sl1CtDNZB2xgar9FhmKFPYY5Z8w3Ax3Rs9Gpi4ttf3kNhE3KZiM
	Tl0Jk0pYKD8cBDAd8h+PeoEsycymSZr6aOBwzY73klhmudhDg6UkPy5jkK+C790Z
	g1iBgGLn+JCE6RWwt615yiOjb0dMvjVK9OJ7RXT0P49smjdi/oVg3TftLnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2aa5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso4154829a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375455; x=1786980255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3lO+z9pBhhCrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=;
        b=VJ45AYoW+vkFYIziI3XIhS+F0mSAAx13sBLQrTb0e1uSsX2JMFS6jOx63lYefbq+6b
         UIxVvAKAmw6jdo268Rz2jWlFe0sXaTukkWo1p+ITimA4LqaRUwH4C/wjSqOOzT2ltNRw
         W5QCZX0unP/xCJl5kNk3VCgNrm3tUeu1x8DyBM0PsdzvwlL3DNA/hb4QoLvwCGDWPsx0
         05FR2ezywWnrSqp7H5N2eoZxx7g4WN+hASQenqZaI4dgbaAJxXcA3sONGF7D7YnN997H
         eZ0uqjie72lSwUDQZorRjpWpUoi1kANBW3RFPCOrZN6wFh9x8FN3nXeU2BvB/MckVZVF
         XZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375455; x=1786980255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3lO+z9pBhhCrUuVUAW46lJD8XPxBVHzFGVCYA/LlGY=;
        b=cIJWcoper8pHxrSR+/aiS+y7e2yFy2s4o3SQs5T4gPdiH7B/ViAoV9a/XtmjcfOpOR
         0KYqBSccIrUAMQn3z0EgILw/0vJgEe5DzA0SsC5N9Z3HmEoUT3/wbebpZwoDrCb7LE5S
         ysuC9/6IFEBuwVQarO/UcEqPUTt7wcjLx80b7CyAE9Nnm7xbwkw/SFCyJhYPMplH+eji
         4+pYerFBeyYOlWl9jcZCTntJnb2+WUokW+YYQHFuy1cchujoiUeuanD7kATxX7B5X7p3
         Jz/0jnZSiE4rDEyElKGXSIq3Gui4AAphJ00pLVo3ufMRDPD1hwp0ceOluk8OX/aKpaRv
         Qa2A==
X-Forwarded-Encrypted: i=1; AHgh+RpAC94r/s4Sa3Bimfd97fNKwIGVaU/GVyjWgU3S4t8mJCZBVA/n9OhjRWHCX4QrOjFIn3ItPzFaxt1dhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCL0Ux03Fk1NGLEr3EBvFo+wwdQY6TTxbRrRVYLnlbR8RxXJ9A
	HQn4vbcHw2X83dhe4cmj3wfpcb+0/jhsbl6o2o+C1vPSkgEEpBxJEb/fUwF9L+s5k6EijE+RgGf
	PB9yGR6TEw6dh6XBIb4xN/HSXpPkQUnzO8cB3vOIOdfBk+w7unjnhTWZXnLCZiatQkRptwpo=
X-Gm-Gg: AR+sD12BvlcjQ2l6x7EgBk4ONHww1eKB8J9jvrc00+oBt7fd3wiMuVf/l5DoAtHznkq
	zjA2QV1fwV8NJWTVi9PvynZRDDPzQ/X4pGUSzIcLWcLMa87eFVpStO7gQz5Y/sXzdkSMCNEAq/m
	1a5WxAXIDETH15xg4noDxUyKiJsFA3oQgOG2+bhdHsBd9wxS0NMTqVHS97yRrRz//y6ZCfsNs0+
	h25CnOpyKKMm0g6m4ZBhYHWAq6zfUhO9y/TBUUtsnk3lxaTZhGxMySWQhGd3HA+nnxtgEUPXWl+
	0B4cBmTiyL8XOHqGrWeQHmGUwYj+u8IpHifoqcqVyFW5BN0kE4ioBQdHqiez+NWRhFDx59KuBnZ
	txP7TPiuC6enMDY/JGHSk0bkaA+7t0y2pOQxZznS/ETLJrFqDz4IV5UeI7OInLxdJnQ7pe7DF1J
	dXOWUqeTo4XG3/2kjxVvGwHaKVug==
X-Received: by 2002:a05:6a20:43a9:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3cbc0103abcmr28768579637.4.1786375454621;
        Mon, 10 Aug 2026 08:24:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3cbc0103abcmr28768494637.4.1786375454158;
        Mon, 10 Aug 2026 08:24:14 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:13 -0700 (PDT)
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
Subject: [PATCH v5 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Mon, 10 Aug 2026 20:52:08 +0530
Message-ID: <20260810152223.3946743-7-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79ed1f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vQ3DPo-oxR4YcLRavt4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 2aOENKNjeF9bXAdgYRTc1b6yrRJTSiri
X-Proofpoint-GUID: 2aOENKNjeF9bXAdgYRTc1b6yrRJTSiri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXwhLOOKB4MfME
 9BZ6YMB/z/Y0jdPHLnNn8jdRbgYuEXk3bbO/mq7RijfAs6QdXxaWnWfysLUqPgEvFcr7/V7tJ+C
 4tInHTwmW+a3XuXv0j1ZwbRg8hxU3d6LMAh7cwXJdLTFeW3B16ORYUn4XpAwQOT48PX9eQ3NGsk
 KedKvGSKNwn3kN2qNpKlzwRYpo/Trm7eABLJpCo7eHxGt2zX1A9JpdgKGpnaFV5P0ekC2txNxLv
 mEs3Xt8tbMjB4STeqliRdfpH0Upfn7VQEVgDmQwM4SXCJp/fBf6sWk8cInbkts0PwYFI4k03Ixx
 cRPFnD7UnI0knPhUnFj7m1H0F6jdtZNuuEHbQdRcCzG0+moJN1XVi4/TyQE/Sefj4+grhUsIQrA
 3tLpGktlRhvNRe4mT4SJd5PP2GWgy+yZ25eTWPsAHO6fRAkIImU+z4h5+yVlTPBNSRZp8G2HqRZ
 FGw0TXYhILfNnJC28Pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX1h1uMETLv5dJ
 pkmJb2Zup9BrKv3UyAciTNi4yJQREvYJwXgxqaawPilBOiAqeBxeczDB4QXIrgiP5Jlz0F4rIbD
 Nsoh+H8t5MXoawviZfli0ALi8NsRUiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082416_875038_3C481CB5 
X-CRM114-Status: GOOD (  22.99  )
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

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           | 13 +++
 drivers/hwtracing/gtrace/Makefile          |  1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 99 ++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 04986f216549..e3a621b59913 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -28,3 +28,16 @@ config RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace encoder component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The encoder is bound to a CPU and generates the trace data for that
+	  CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index cf02316c1bbf..10a74f852115 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..9ff3413d1aa4
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+		return ret;
+	}
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret;
+}
+
+static const struct gtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return gtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_encoder_driver);
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
