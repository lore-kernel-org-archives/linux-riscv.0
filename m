Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E2606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ttR28s0A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YsO0UOtV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SH5ZtCIP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WA39oAB/uhDLAKaI7+aHVdVI/Kx6Mw9ZYH/0nQDeZLQ=; b=ttR28s0Az+klxMeOt7+e6Sl3cS
	B8SeRy8jMDq1bdHFaOF3Pr1dPnoyEhLtMdGFA36vVk/qSAqcFETAYBugdin+90ifvUNvFDraFs8ss
	xQv0Y0TPYSxHn/OISD1d0De61yHb1AzjDAoqJutfaqMevanw/3q56K0yXr2C+4xg2tnDrEBrKFlLE
	Z9AEFGYLqB+itwbptT232qf5gNr6AEg3QCBSjwUZ+dvXDUh0OJ+WA4B5x1dkq4Xw65pbqMgiOfVNW
	H2kp52LNo8u6iZ7BbtHy6BH7fDnEuXqHRajuLwqMW+Ged3QHQRRNW8hCkzT+VBRGOI8a3Bgsu2gYl
	zWOxwtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDL-0000000CeVy-1TBs;
	Thu, 26 Nov 2026 09:56:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDI-0000000CeTK-26WE
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B1An2334995
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IkVaq6Ue855
	meA9poXjErI1YisM33Au8Y1I79H1eglA=; b=YsO0UOtVdxOtIIbSVef0BiAi67L
	7dE8JQPyR/maoFdGnV3jO3hC8ZwWZCugbSNdx3Gs5LTZocxbCcWm1XQA8iM1hFqs
	HxZsXj59ZeGqd3wIJcLU++LCo7tCocmgdaYvwb3v5HrNcf4RvaQH1byJI/2yh9AT
	QKd4aRODADqr52QcHKPTLOxF6ziivHe3L+xd7T+esK3FR5V/A3fbHqc6srBpqL6f
	aqpPGLdvB+TWo21MKPrvi4DbEAtmgep1wBpAFAFDW6+YQJXzamNF368BE+oWro0/
	z5rjGK1XbDVkwrcBbCM7nOSEySRh5QGNno1A4iyMjfwgmPw81F/+fhlBE7w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01qy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so4166730a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686982; x=1796291782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkVaq6Ue855meA9poXjErI1YisM33Au8Y1I79H1eglA=;
        b=SH5ZtCIP2NlDio65rzCkThXD05BpAz5XL4kF7vdvu8xBtpctM+xsFAuBZ4BfbppJCn
         fgGOw7S3hj+IYBqua541A5XIpwmSCL94ORVvWepoqDzUWATW+HVQ/cCllztTAFUvnSXH
         Y5FrpXcobLCr/JN/qEU+3NWuytKHEfA3BWnR8RBtgjzEw/yjxyHCkUkQnzaPdJiR7x3J
         tzHrln+QNRiw6Mh2C6dXbNFgHyfNWVmCMTKi7NJy5dcxWHEhsG/mEmMBmNaiVNGSj//W
         DcfSuIQ5sNhRajX7JPy/3j7U/h4qoLBI6ZuEb1bELBEjHUheN9m+9etc0KXwVbpXC+9b
         l8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686982; x=1796291782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkVaq6Ue855meA9poXjErI1YisM33Au8Y1I79H1eglA=;
        b=gr1Z7pBk5eS93OlLrY9MNaBRPaWcXm0Z5Lw5Ue6x8GKr9T6ThA4yUCHz1GMywtCphk
         pqMdUCYDeDZT2OOlBQ3Ri0ZOlnr6R2YEsyNjM5Ze5BTmgT6XlNRujVg9/gqmXFEDNLiY
         Rbuw5FsZAK2p06QXY+O56PQCHd4W2BqvmBuc3kpevHiIGihpdtxso1sJtLAyf9YE0Obt
         08GkN3GbOaQadE215v+DvlXvMczIn4b7hmmbDFdDTmsBfJHkSxmosT0kKFN28ppkD+/p
         lGDbG0g3ODKVynY9PZoWNumW21KjQYfdccCpP30XRXaGAvJO59P9kTx7KPZ5/c+Bi/qH
         +1bQ==
X-Forwarded-Encrypted: i=1; AL+hErHIoIJURn/K9/PzHjIMD36RuHkZcypOvtg99V7/rClJo7AKmzzRG77xhMi5X2w2FQ0zdP6mBb48ErZdxw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/N0UKJR8ApF4ty0La2ZPaWmUOHuLwyH0GryeJtUa+6lhiNSe8j
	4SiYslATBYXSb7fcbDMX/ZK4mFCNVbX6KASpIUWBzrY5MidSipLmttuQTzNGe0vM8PckC/vsaaY
	g6ok3oKcBLSzy8NjikYnvJgw86+4npManLUI39U3iYzD7ur7T6dXJo5OR55ynOf3xyao/Gqc=
X-Gm-Gg: AZFdTZcnXPezWxUXh2TX6UBr8VCA5+d9oGw5deXAMFiw4wpzN4Mta9ODbp67VYJHfZ9
	M/+UAW5dx64gKtmXznSpwe2+M2rV/9WuMVTkjrPtBPJrK//33DwpN3dOZ4/t0koKN6auL6MKeRc
	XbJpL8x2EjA7cTJNVou/UdmBrzEAUxWKWvc7hBi9YrCXtzzn1rW/VohktcWE3tEtUQKbVms2MYJ
	vFVWiw0AgE2kS/CLcZ6pAnMxyv1kC87zgwgrWNYhpsBWkSZtGx+dkYl9mwzASNWPhj53VvlaLyW
	uGYGTk0HNaHI51T4bW0tUFYzITSirjpUhkgaca+4Y2mhJGivBXOoydv7hZYu60UgO52CuEzt4WD
	XwOVhymhd+w39SPNrJAW/VazOSk2/8Gol9ynLLYZmDyfugdqaE9F1aNRscRYh3ubA6W5Mve5Eq9
	MA2uVNNdv6XSht3QB7+p5Xp/P2wV5eSAYL4MMCM4j3PNVYuukJwPvlnDaU1vwAHYm9CLR+eOH//
	Q==
X-Received: by 2002:a17:90b:5407:b0:3b3:cb22:72d0 with SMTP id 98e67ed59e1d1-3b41c8fe453mr20573522a91.29.1795686981894;
        Thu, 26 Nov 2026 01:56:21 -0800 (PST)
X-Received: by 2002:a17:90b:5407:b0:3b3:cb22:72d0 with SMTP id 98e67ed59e1d1-3b41c8fe453mr20573502a91.29.1795686981357;
        Thu, 26 Nov 2026 01:56:21 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:20 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 03/14] gtrace: Add RISC-V platform driver for the gtrace framework
Date: Thu, 26 Nov 2026 15:25:24 +0530
Message-ID: <b5b3dc4a1ca378ea74498d1adb0207e281e6ad01.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b080247 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MynGWnbBoGqc5BfHMUQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: gvAktWwQllZdvipe9MY1LpZyuondrMeh
X-Proofpoint-GUID: gvAktWwQllZdvipe9MY1LpZyuondrMeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6GXVQxmrGeRb
 jvV9u3bpLG+kJLBjoFlY9IbTCTz+8n2WWAhLRFBgjZkBIjG7w+6ZdXyss5aeGrjAdtpUsv50g8h
 tr6C2XEtrN2qmw9VGZJ98p2vjp8grb1oKUsRIOccCBbGZHHRz4EhzxJQjKlCan4Y7SFBEp9Smkc
 BoGUeZH8Q8g3ehnypuZfRYNfb0qvS3VJ/qboJPoAtYGYJBa5ZZBFk0vUHD5CF5+x9pKeQJoGB9q
 VyNl/EEsE9V/L9sWAlOqjeODDnQJbjHI28Jj6Grh8IclVx/pqms7rbo9tgnFsoe3ax60IvvSZPZ
 Q8gUZDzpJYW7gusx/ColopKg2awBhdJaimIkNxJuHItcSVJISqbc2ydQaxqh24AhjD3xJbtRUwB
 Qd8mbOq6FKvZE3eRz6dlXOVk+iHfeGUC4MDvPmFUDA3RtQUJQqLe5evkGAl85nas+7MEeowxSof
 PZOGAdobFg2nhl+YWJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX24WeuDa+hwcR
 tSbAyG85exWcNb9ZsB9j0j3ZT8gMsHfN/b3HgeIJ2gm/vsF3tf3TeYlGZD5pOObJ1DQmCNYdFuj
 8KiE2b+Ld9+QaNHiTJwxuxM0EHoK+6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015624_690878_10EF312E 
X-CRM114-Status: GOOD (  26.56  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace components defined by the RISC-V Trace Control Interface
Specification are memory mapped devices which are organized in a
graph-like topology and described in the device tree.

Add the RISC-V platform driver for the gtrace framework. The driver
parses the RISC-V component topology from the device tree, discovers the
type and version of each component from its IMPL register, provides the
RISC-V register level control ops and registers each component with the
gtrace core.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  15 ++
 drivers/hwtracing/gtrace/Makefile           |   3 +
 drivers/hwtracing/gtrace/gtrace-of.c        | 133 ++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c | 194 ++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          | 121 ++++++++++++
 include/linux/gtrace.h                      |   3 +
 6 files changed, 469 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index bcc3b4169a76..04986f216549 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -13,3 +13,18 @@ menuconfig GTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called gtrace.
+
+config RVTRACE
+	tristate "RISC-V Trace Support"
+	depends on RISCV
+	depends on OF
+	depends on GTRACE
+	default RISCV
+	help
+	  This provides the RISC-V backend for the generic hardware trace
+	  (gtrace) framework. It parses the RISC-V trace component topology,
+	  provides the RISC-V register-level control ops and registers each
+	  component with the gtrace core.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 3f90fb99c514..20f67a78b8ab 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -2,3 +2,6 @@
 
 obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o
+gtrace-$(CONFIG_OF) += gtrace-of.o
+
+obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
diff --git a/drivers/hwtracing/gtrace/gtrace-of.c b/drivers/hwtracing/gtrace/gtrace-of.c
new file mode 100644
index 000000000000..4ffeda32c4a3
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-of.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/gtrace.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/property.h>
+
+static struct gtrace_connection *
+gtrace_of_parse_outconn(struct gtrace_platform_data *pdata,
+			struct device_node *ep_node)
+{
+	struct device_node *rep_node, *rdev_node;
+	struct gtrace_connection *conn;
+	struct of_endpoint ep, rep;
+	int ret;
+
+	conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
+	if (!conn)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_graph_parse_endpoint(ep_node, &ep);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rep_node = of_graph_get_remote_endpoint(ep_node);
+	if (!rep_node)
+		return ERR_PTR(-ENODEV);
+
+	rdev_node = of_graph_get_port_parent(rep_node);
+
+	ret = of_graph_parse_endpoint(rep_node, &rep);
+	if (ret)
+		goto out;
+
+	conn->src_port = ep.port;
+	conn->src_fwnode = dev_fwnode(pdata->dev);
+	/* The 'src_comp' is set by gtrace_register_component() */
+	conn->src_comp = NULL;
+	conn->dest_port = rep.port;
+	conn->dest_fwnode = of_fwnode_handle(rdev_node);
+	fwnode_handle_get(conn->dest_fwnode);
+	conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
+	if (!conn->dest_comp) {
+		fwnode_handle_put(conn->dest_fwnode);
+		ret = -EPROBE_DEFER;
+	}
+
+out:
+	of_node_put(rdev_node);
+	of_node_put(rep_node);
+	return ret ? ERR_PTR(ret) : conn;
+}
+
+/*
+ * Parse the "out-ports" graph of the component's device tree node and fill
+ * pdata->outconns.
+ * Return: 0 on success or when there are no output ports
+ *         -EPROBE_DEFER if a destination is not registered yet
+ *         negative error code otherwise.
+ */
+int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
+{
+	struct device_node *parent, *ep_node;
+	struct gtrace_connection *conn;
+	int ret = 0, i = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
+	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+				       sizeof(*pdata->outconns), GFP_KERNEL);
+	if (!pdata->outconns) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	for_each_endpoint_of_node(parent, ep_node) {
+		conn = gtrace_of_parse_outconn(pdata, ep_node);
+		if (IS_ERR(conn)) {
+			ret = PTR_ERR(conn);
+			of_node_put(ep_node);
+			break;
+		}
+
+		pdata->outconns[i] = conn;
+		i++;
+	}
+
+done:
+	if (ret) {
+		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
+			conn = pdata->outconns[i];
+			if (conn && conn->dest_fwnode)
+				fwnode_handle_put(conn->dest_fwnode);
+		}
+	}
+	of_node_put(parent);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_of_parse_outconns);
+
+/*
+ * Parse the "in-ports" graph of the component's device tree node and allocate
+ * pdata->inconns.
+ *
+ * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
+ */
+int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
+{
+	struct device_node *parent;
+	int ret = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
+				      sizeof(*pdata->inconns), GFP_KERNEL);
+	if (!pdata->inconns)
+		ret = -ENOMEM;
+
+	of_node_put(parent);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
new file mode 100644
index 000000000000..a247b4dd56a4
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+static int rvtrace_hw_enable(struct gtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+
+static int rvtrace_hw_disable(struct gtrace_platform_data *pdata)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+			       pdata->control_poll_timeout_usecs);
+}
+
+static int rvtrace_hw_reset(struct gtrace_platform_data *pdata)
+{
+	int ret;
+
+	gtrace_write32(pdata, 0, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		return ret;
+
+	gtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK,
+		       RVTRACE_COMPONENT_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+
+const struct gtrace_hw_ops rvtrace_hw_ops = {
+	.enable		= rvtrace_hw_enable,
+	.disable	= rvtrace_hw_disable,
+	.reset		= rvtrace_hw_reset,
+};
+
+static int rvtrace_platform_probe(struct platform_device *pdev)
+{
+	struct gtrace_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct gtrace_component_id id;
+	struct gtrace_component *comp;
+	u32 impl, type, major, minor;
+	struct device_node *node;
+	struct resource *res;
+	int gtype;
+	int ret;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->dev = dev;
+	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
+	pdata->hw_ops = &rvtrace_hw_ops;
+	pdata->format = (uintptr_t)device_get_match_data(dev);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	pdata->io_mem = true;
+	pdata->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!pdata->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
+
+	pdata->bound_cpu = -1;
+	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
+	if (node) {
+		ret = of_cpu_node_to_id(node);
+		if (ret < 0)
+			dev_err(dev, "failed to get CPU id for %pOF\n", node);
+		of_node_put(node);
+		if (ret < 0)
+			return ret;
+		pdata->bound_cpu = ret;
+	}
+
+	/* Default control poll timeout */
+	pdata->control_poll_timeout_usecs = 10;
+
+	ret = gtrace_of_parse_outconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse output connections\n");
+
+	ret = gtrace_of_parse_inconns(pdata);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to parse input connections\n");
+		goto err_release_outconns;
+	}
+
+	/* Reset the component before it is registered with the gtrace core. */
+	ret = rvtrace_hw_reset(pdata);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to reset component\n");
+		goto err_release_outconns;
+	}
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
+	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
+
+	gtype = rvtrace_type_to_gtrace(type);
+	if (gtype < 0) {
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "unsupported component type %u\n", type);
+		goto err_release_outconns;
+	}
+
+	id.type = gtype;
+	id.version = rvtrace_component_mkversion(major, minor);
+
+	comp = gtrace_register_component(&id, rvtrace_type_name(gtype), pdata);
+	if (IS_ERR(comp)) {
+		ret = PTR_ERR(comp);
+		goto err_release_outconns;
+	}
+
+	platform_set_drvdata(pdev, comp);
+	return 0;
+
+err_release_outconns:
+	gtrace_release_outconns(pdata);
+	return ret;
+}
+
+static void rvtrace_platform_remove(struct platform_device *pdev)
+{
+	struct gtrace_component *comp = platform_get_drvdata(pdev);
+
+	gtrace_unregister_component(comp);
+}
+
+static const struct of_device_id rvtrace_platform_match[] = {
+	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rvtrace_platform_match);
+
+static struct platform_driver rvtrace_platform_driver = {
+	.driver = {
+		.name		= "rvtrace",
+		.of_match_table	= rvtrace_platform_match,
+	},
+	.probe = rvtrace_platform_probe,
+	.remove = rvtrace_platform_remove,
+};
+
+static int __init rvtrace_platform_init(void)
+{
+	return platform_driver_register(&rvtrace_platform_driver);
+}
+
+static void __exit rvtrace_platform_exit(void)
+{
+	platform_driver_unregister(&rvtrace_platform_driver);
+}
+
+module_init(rvtrace_platform_init);
+module_exit(rvtrace_platform_exit);
+
+MODULE_AUTHOR("Anup Patel");
+MODULE_DESCRIPTION("RISC-V backend for the generic trace framework");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
new file mode 100644
index 000000000000..e6be1ce303cc
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * RISC-V trace component register layout and helpers for the RISC-V backend
+ * of the generic trace (gtrace) framework. These definitions are specific to
+ * the RISC-V Trace Control Interface and must not be used by the generic core.
+ */
+
+#ifndef __LINUX_RVTRACE_H__
+#define __LINUX_RVTRACE_H__
+
+#include <linux/gtrace.h>
+#include <linux/types.h>
+
+/* Control register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_CTRL_OFFSET		0x000
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT	0
+#define RVTRACE_COMPONENT_CTRL_ENABLE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT	1
+#define RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT	3
+
+/* Implementation register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_IMPL_OFFSET		0x004
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT	0
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT	4
+#define RVTRACE_COMPONENT_IMPL_TYPE_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_TYPE_SHIFT	8
+
+/* Component types defined by the RISC-V Trace Control Interface */
+enum rvtrace_component_type {
+	RVTRACE_COMPONENT_TYPE_RESV0,
+	RVTRACE_COMPONENT_TYPE_ENCODER, /* 0x1 */
+	RVTRACE_COMPONENT_TYPE_RESV2,
+	RVTRACE_COMPONENT_TYPE_RESV3,
+	RVTRACE_COMPONENT_TYPE_RESV4,
+	RVTRACE_COMPONENT_TYPE_RESV5,
+	RVTRACE_COMPONENT_TYPE_RESV6,
+	RVTRACE_COMPONENT_TYPE_RESV7,
+	RVTRACE_COMPONENT_TYPE_FUNNEL, /* 0x8 */
+	RVTRACE_COMPONENT_TYPE_RAMSINK, /* 0x9 */
+	RVTRACE_COMPONENT_TYPE_PIBSINK, /* 0xA */
+	RVTRACE_COMPONENT_TYPE_RESV11,
+	RVTRACE_COMPONENT_TYPE_RESV12,
+	RVTRACE_COMPONENT_TYPE_RESV13,
+	RVTRACE_COMPONENT_TYPE_ATBBRIDGE, /* 0xE */
+	RVTRACE_COMPONENT_TYPE_RESV15,
+	RVTRACE_COMPONENT_TYPE_MAX
+};
+
+/*
+ * Possible component implementation IDs discovered from DT or ACPI
+ * shared across the RISC-V trace drivers to infer trace parameters,
+ * quirks, and work-arounds. These component implementation IDs are
+ * internal to Linux and must not be exposed to user-space.
+ *
+ * The component implementation ID should be named as follows:
+ *    RVTRACE_COMPONENT_IMPID_<vendor>_<part>
+ */
+enum rvtrace_component_impid {
+	RVTRACE_COMPONENT_IMPID_UNKNOWN,
+	RVTRACE_COMPONENT_IMPID_MAX
+};
+
+#define rvtrace_component_version_major(__version)	\
+	(((__version) >> 16) & 0xffff)
+#define rvtrace_component_version_minor(__version)	\
+	((__version) & 0xffff)
+#define rvtrace_component_mkversion(__major, __minor)	\
+	((((__major) & 0xffff) << 16) | ((__minor) & 0xffff))
+
+/* Map a RISC-V hardware component type to the global gtrace type */
+static inline int rvtrace_type_to_gtrace(enum rvtrace_component_type type)
+{
+	switch (type) {
+	case RVTRACE_COMPONENT_TYPE_ENCODER:
+		return GTRACE_RVTRACE_ENCODER;
+	case RVTRACE_COMPONENT_TYPE_FUNNEL:
+		return GTRACE_RVTRACE_FUNNEL;
+	case RVTRACE_COMPONENT_TYPE_RAMSINK:
+		return GTRACE_RVTRACE_RAMSINK;
+	case RVTRACE_COMPONENT_TYPE_PIBSINK:
+		return GTRACE_RVTRACE_PIBSINK;
+	case RVTRACE_COMPONENT_TYPE_ATBBRIDGE:
+		return GTRACE_RVTRACE_ATBBRIDGE;
+	default:
+		return -EINVAL;
+	}
+}
+
+static inline const char *rvtrace_type_name(enum gtrace_component_type type)
+{
+	switch (type) {
+	case GTRACE_RVTRACE_ENCODER:
+		return "encoder";
+	case GTRACE_RVTRACE_FUNNEL:
+		return "funnel";
+	case GTRACE_RVTRACE_RAMSINK:
+		return "ramsink";
+	case GTRACE_RVTRACE_PIBSINK:
+		return "pibsink";
+	case GTRACE_RVTRACE_ATBBRIDGE:
+		return "atbbridge";
+	default:
+		return NULL;
+	}
+}
+
+static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)
+{
+	return gtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT, 1,
+			       comp->pdata->control_poll_timeout_usecs);
+}
+
+extern const struct gtrace_hw_ops rvtrace_hw_ops;
+
+#endif /* __LINUX_RVTRACE_H__ */
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 6d223e26875b..46264c775efb 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -277,6 +277,9 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 void gtrace_unregister_component(struct gtrace_component *comp);
 void gtrace_release_outconns(struct gtrace_platform_data *pdata);
 
+int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
+int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
