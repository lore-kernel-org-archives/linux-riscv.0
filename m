Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5433606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LYq7ftMk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGkC60DF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TzoWD6X/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qtInNP1w44xmZnFIHeAfCOYDHaHN7U8yZr4Budey0Ig=; b=LYq7ftMkG/XQTrVe+Uc0z80BUt
	3C8sSq6gLCIlBLKcryU/o+UkH3VHROt6l0EnpNnT3UNZch8BYwfnLY48I4lYI6QJhc4VeNPNUJ9hM
	9QJqeZzCzORcCJh706tRz0dEymCrKyfpB3yhmZ9h8jul6lV0GmChcCvKyqTG5MSF5bsiBBdZHhx7b
	4mhqe+L4j/YzmnSCBFDkkaCDSeLJcnFuzhxI/uXodnilFgo55LARkaAU1OiFbma1l+00U6Hdn1S7J
	qu7N/th4OQKUXdQYdayuf519VB5Qv1bthWtMVFCv5nrpCcMgWSdLFxR6/Ux1jtUY1Ky1ETlF3IU+L
	v9R2TF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDm-0000000Ceog-2Gbc;
	Thu, 26 Nov 2026 09:56:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDh-0000000CekQ-1k0q
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3iO1682474
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HgBx16XBHaJ
	octyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=; b=aGkC60DFYejd+1ly9Fe9fb6rayy
	8cDAo6Kmn0UYX8EkQmMRgGOfhLcP1e1Y4nCORTSwSg83B7Ivlz++kgD98ndYP67j
	8lPSm++000gUxt+hOPrcLILeFioLWWPsSqDADT//Wm9zUEhReYMTVq0FqwOsi5Y8
	KVJ0zea8zIt7TB5GpZl4ZkkZfiJeFYccTnoWnXNptrZN/3KRl47vho9nSNGF7I47
	lPbrJbgqQw+E+xEteLzmFYZJULRE2GfvktMkKi0V5R3MCeM8FPvZV/1Y6fv76bZX
	E9sYaxyel8tYtnp5ADPUzZdU6o3K+pb/tBes7/rO8KM61f54m9WBMOTwb9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekjuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so4618593a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687008; x=1796291808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=TzoWD6X/YDmEVRa+33Ef6A4u6UqcPbU7axKbeGZK+1MaRzqja8xdSfEc0tXm2frvTM
         rwgup5/d14XaFo5oVS4bUwhs7rq+mIrsoRqhdDK4Iy/yhs6D13aXo++lkraIHKVVi6Vs
         cAw6WpWOuausRHXwOe46rA/AvsPU/TpFce9CqEJfHw5NrMv/cChV4CrDLeOC/l7W0ZQw
         lnMoZtZkyeJycrfR6qtW8oECJfu3oEpCU9gA0VWrqR0DfOLb/eGKRWdy8tNZxnNVc6Ti
         Y3o7+263ui35uLI8ccK/qc1wRBapJ6rq9K1jH+7fYC74gHjmW3gBoCWh1GtYM6pNkAvJ
         bYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687008; x=1796291808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgBx16XBHaJoctyQ5sr1y8uJL3DO8PouYXzM4cXEFkI=;
        b=yqBPuw6w9Sb/NhC5k38mcYzTLIzKtIL6KqfqikgqB4YZoUpREe/uoxLkqDJ/kEcm26
         Y1h3KiXzTfJnzsorBqg7yROL/xrurYIqP0exq3wbRKQ+S3MPrEuBtKphNUOFzkr8kpcV
         PRXOX7wfl1RV0Udukn4Ai81Ksm82UrTWgr8amQgzEFOqaNmC3Z83hyUaOPLFvHycPyL8
         W1aCpl+ZaL3uOW4VHLLWCIaHpEHAHKnuzpTawOfUP9zNJzYz7FvAUJVZpnxU0ZwN+hjZ
         tmORt7aA9zVa6vXIUrXsygblfdf+M7gtdbYrJA5njSudMpgmiBvgo110LKSNoyjHiRec
         8jHQ==
X-Forwarded-Encrypted: i=1; AL+hErEmeMkyhsY/ZBF8AwOdzKq/7teQWewPp5efpVXzk/h5cVAkenI5xF9t4z4q1bax6m9NUVxJM2JjTKSL2A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+gTsmv7kY/3ncB9/I/wYRiSAnGXSzzt7MwTjnm833Z3JMYJz+X
	b6wgb+1si7R6DZtlRhDMWkYMg7jt0HLSKTm+UynoG23RjuwWkzM7eoalRIIZbVJ5jmpr6q4Xfc0
	2WFDwgKZ89jvTgVwAjlzCkNj0Cb8TJd0k9CinhZeUUcwOvQWQouQ8vZWatIbHB5yq4pFFRng=
X-Gm-Gg: AZFdTZeR2Renhqcw1LhD5Jp96nk4lqZymsqXR40CJff9SLACAerHMoU3ar9bTI4VwYW
	9mhNjZrP7ka0LBk49bb3G6/7RIRnVQ5zHVI6gJa4GfDaCIFPvBbE/Pwh693JBxHfWj6ztvTFo5i
	hPNaazfEc8YwP/WdZVznvnp8g3wGVe6Dya0Am0bdqHn4fEq4H9wROn3e2xcfej9a/teBLRoXdkA
	McvFGgLSmsBwyhB4cxj4jgB0s9i+F8TczC76af+JmRM3BRwu1xhWeinrslWMPpAAjNcZBdjUBIB
	YC/9aH5629vU87Mq8TRCv8vhTB7z5IUljehk0IS5EZKqgMAmOoM2EcJExWj6uordLsDDPILFb3w
	vreDfwQ3yjR1qEDd2sZz/MvGSqiuvaWauIxYXOBRL84PJ5hoY1wAV1oL5b2eYD7tKv6uGNNvKZf
	8tl7XA/As5vgWL5wyiUNz00wimia/+REEBEwXFFQ2xwRgChD29ATlcFaogNE5vII3GlU0ONU9UQ
	g==
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17904011a91.1.1795687007762;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17903983a91.1.1795687007212;
        Thu, 26 Nov 2026 01:56:47 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:46 -0800 (PST)
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
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Thu, 26 Nov 2026 15:25:27 +0530
Message-ID: <7c08bb0d199c3a8cf0ec0b875d5a42165ec164eb.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7IBz7QrRJfsB
 IPiN4ez0pBJEoDsb6PMDpMD2hgHvmIO87SRMFlBQiZA9scmJRf/+eNdRByCxTZ69DwCAFb8zjFO
 GpLxEJ8kHVR16PKsl4Ly82R1+Ic63990hH3wlmqnSLxhuSONG2/K/3z8+MPQL8V0BgIVvNcwrd3
 IkjYdp/EUrssvdbSGlEM6Xs2tjgAAFNkKzBFW6q1HzVRpcYLIWLmzZHiBNxEUCia59j9UogsMX1
 E/MrzqnBmAKFx2NR2C9VB7XVCyYv63EnuiHYDZCz4htsDsOtDrVlWiyfnP/ta5lXoHJerW2hUWw
 SiZzKOAV/R2Q+nNZL/97IpUChoCaHfAdkMp8SmwHwSX1i7n8eR07YdOL+0oEQgoPmD3uHxdkXEK
 UWQ24j50Gh5/vuHYyDi0Fv/oN7Mzz+o5Z3L2IppE1xWnoyOud9uYIzqTa+o12Ez27R/NrjzK8PI
 hDfwrJdcpTHTJ8LR/Bg==
X-Proofpoint-GUID: rlrA0GaEpXkayn-dMkn_20dbeEXW1w1z
X-Proofpoint-ORIG-GUID: rlrA0GaEpXkayn-dMkn_20dbeEXW1w1z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXw9FXLaInEFna
 zM0hHowojLNuTG/bJq0mt20PvxtE0z1gq10/6X7SVb+GBXeUFVbLnHnu+7o3L5yLzCskAoHJqaU
 HmcTUHdJMED3hcFnPcVO0wlfTwaKITU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080260 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=lv0vYI88AAAA:8
 a=EUspDBNiAAAA:8 a=8cX3ZGdeUJnqEQj61ccA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015649_506189_5FD64C3D 
X-CRM114-Status: GOOD (  25.49  )
X-Spam-Score: -2.8 (--)
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

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Suggested-by: Zane Leung <liangzhen@linux.spacemit.com>
Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  13 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 274 +++++++++++++++++++++
 3 files changed, 288 insertions(+)
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
index 20f67a78b8ab..2660fcaa332b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..f528a6af42e1
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/log2.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
+#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT	24
+#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
+#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
+
+#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	0xfff
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT	16
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	GENMASK(31, 28)
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
+
+struct rvtrace_encoder_priv {
+	u32 srcbits;
+};
+
+/*
+ * Set the srcid and clear trTeInhibitSrc bit so that the emitted trace messages carry
+ * the source id
+ */
+static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 srcbits)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT);
+	val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
+	val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, srcbits);
+	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+static int rvtrace_encoder_get_trace_id(struct gtrace_component *comp,
+					enum gtrace_component_mode mode)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 val;
+
+	if (!priv->srcbits)
+		return -ENODATA;
+
+	val = gtrace_read32(comp->pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	return (val >> RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT) &
+	       RVTRACE_ENCODER_INSTFEAT_SRCID_MASK;
+}
+
+/* Request the preferred trace format and store the accepted hardware format. */
+static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
+{
+	u32 val, fmt;
+
+	switch (pdata->format) {
+	case GTRACE_FORMAT_ETRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
+		break;
+	case GTRACE_FORMAT_NTRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
+	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
+	switch (val) {
+	case RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE:
+		pdata->format = GTRACE_FORMAT_ETRACE;
+		break;
+	case RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE:
+		pdata->format = GTRACE_FORMAT_NTRACE;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int rvtrace_encoder_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_encoder_priv *priv;
+	u32 val, hw_srcbits, srcbits;
+	int ret;
+
+	if (pdata->bound_cpu < 0) {
+		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	/* Check if trTeInhibitSrc is hardwired to 1 */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
+		/* Probe how many bits can trTeSrcID span in the emitted Trace messages */
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		hw_srcbits = RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX;
+		do {
+			val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+			val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, hw_srcbits);
+			gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == hw_srcbits)
+				break;
+		} while (--hw_srcbits);
+		/* Determine if there are sufficient bits to hold max cpus */
+		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
+		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
+			rvtrace_encoder_set_srcid(pdata, srcbits);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == srcbits)
+				priv->srcbits = srcbits;
+		}
+	}
+	if (!priv->srcbits) {
+		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
+			 pdata->bound_cpu);
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+	dev_set_drvdata(&comp->dev, priv);
+	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
+		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);
+	return 0;
+}
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	if (priv->srcbits) {
+		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	} else {
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		gtrace_disable_component(comp);
+	}
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret, err;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+
+	err = gtrace_disable_component(comp);
+	if (err)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret ?: err;
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
+	.probe = rvtrace_encoder_probe,
+	.get_trace_id = rvtrace_encoder_get_trace_id,
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
