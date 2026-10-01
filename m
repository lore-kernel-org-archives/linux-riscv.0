Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E14CA5FCC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGopNPl3vcOlIDlGniyeC1Q5HTtxRwVvLby8ZpbWYBQ=; b=dvgZ1faWk4s+vh
	5r7vvXVYDdlyFs5AsA7s5ZnqFuwH3Tr7Z+O718oPOm6FmBE/WcXIQGLtx5fHMkBF7hcBDJUWogrBW
	em91I1XcxeZ3/WoGDQc84RoXKI+gUVO8UVkGbPJAWxRp4cabZRBAlHE7l8m9e5CbPlyBPBtHt8iA+
	DWE0h1g0CjCVZrx2t0yYYnddaadaf632cGkTa91pEgjulWRVTEP4Ww2qoA/DbbXKFsNBfLepyftdP
	2Ck1CEUWkZl/DIr05IzmncKL68kKuuCMFHZcbcwy49oT7XT+s6NrjZRswKAZroA54uG8l/kkksRMi
	VUkcDi1P+aDK6/M0hchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hj-00000007nuY-3anB;
	Thu, 01 Oct 2026 05:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hi-00000007nsg-2CYA
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UJsoYpln4rp3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=; b=PF5Uk0phDS3IqZF8BliLljBQli
	RgZJGHQfbDvmimmfiMK24dJtQBGWUHlIFzXxsLCKPmdsTQGyToJjvCaHx03l251qtKNvTivbifuyU
	od6CWGgDBXIo0vHBEJVmNyZAYp+4O4lUCOz1EHS+bJh/GG+yUzo8WlrfY9YSt4dbkarGuCynjNpt1
	hmehitBTtY6SwFOH1cqPxjLToMMOX614JHpPMbUCk3pefzepYl7heR/u+XnMviXhz/XdIeBxVc/7X
	ma6JZqHAVAyt0Bq8QInAab2928z0myhO+vMWyeg2pLoxnUc4aPypGYIe7mGyXRPLESkCJwxKJPfCZ
	G1CZIRyA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC9HD-00000004alG-0MPz
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913hIUD1242104
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UJsoYpln4rp
	3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=; b=nNJ+Ml7CqLpej59JnzWd5Elg6eM
	gpBn8iHxVxvlG43XYjLFbkvyi6dtdiBVoNzxa/NZ7DHDysShpw9gYciCSdAY7ZPk
	oj0Ilzk/fzrDgdikD7NgUjzXprWcQs+5frB28zI79YxVPVxjN4k1lM6HpdGIbczC
	YxBo/kwsU1X8hj443uYaB4Z/Oo/td5R0GlRYH6nBfHh5bcfEaTtNn3gS2lMbBvPJ
	NL2+w3jh7keXutvJpxlBAXSKx1gZwiSO63rS7olOVSsDLqzaNv/39Me2f0oUg1bb
	pfhDCvrQJJ/GKoyNmmix+qhSS27nknrbiDSqQTr8wq6im0lLbJ060nMfi9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pjmag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8cffbdbaso42698185ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832253; x=1791437053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJsoYpln4rp3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=;
        b=JSGzx2+utWp4TwzNUDqkBt9tnl15ggVDwM1m4KT5XXwsN+uH34vCj0Tbpe4Fua6T4s
         1OPIbtUJX69d0d+HZOHHK4Vgsu1yOpbDEBUWlgAGeLr0ng8j3k4z624m9I/6xoIyVys/
         2pCPgtywc4SshGM6RhvuwZhB1hgueS4ez+ydRToMttwEKESwkVIHlYLGabb+iLcnP1Ew
         vgGS4unlH/Ab4/eRzjxgB7mJW4p4Vm2MW1KDU5HPwSq/6RWY6kirX08Ealwnj8cT5NH8
         QJ/BW23jpv74x95i+Euu5XZ8r/0ue6xUCW2OdY3O9f1r6/gB9+GL02Boz32GIXoZkpWn
         yZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832253; x=1791437053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJsoYpln4rp3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=;
        b=WeByWTcs6ywZkcEpeoRMUYEEm4YLKsE83Ja7JluMouw7PWeotRh8e4r0AHDnSL9fMw
         PcGrHvnVZyc8zBtc70pkIJLOer1+oWUuug+4HqKznaSPPB+F81jH1QaOv8ozNl7Y+wx3
         iisE35OxHmDzw9Ek8v10EAppPRGo4gD2TGo4748kSzBqZCadW4kCHJOYwnxvuTH4swzX
         GcjbDaxuIOwxeqBrOcm79Ha25ba7vOoS7typsP+8VP7v/6SwEGPD3YiFqiD68TZdXfLr
         PcZyQt8jAFGs2uZiGqq1kv8IbSTVPQF9I509yucU2Ft6s1edYYU94DxaJZ/A6HjZBXIz
         /gug==
X-Forwarded-Encrypted: i=1; AKwUvBzsHJmiLmDBxj83moFcCRzQnDKhg1YN8GJ5g58qxfAXcZR6auLq4pQ5vp5cminzLuY4A7fuSp7B8MNCmw==@lists.infradead.org
X-Gm-Message-State: AFq9FYI6JljErRVdvUok7+BVgRpChvRV/6IK1meCbvkWQBbcPvoTm+hB
	094Px+xWL4gJpPgaFQvV1jZWI8MdtN4Y2B/oEB6k1FZ7rewSQv1LhGdESsfvF30V8bC1wBc6Lbo
	9gh1B3DVIwsSwxYiMU3iMYPjZ18F1xN9WMhFYCrAIqdrp5R04ao1fDnhw9HV8Euwk83r4V3o=
X-Gm-Gg: AYBFou2vLiE9W+tL7r655sgxONzpcTn+Lu96AAgWf+Hb9SubZ/Idxwoh/Y+FEpl/u+/
	sCJ2b1Av61TRBoKc9MfXtTj63nwJ7zKevHA1pZrl+A2ZwJ26C3S10F4UQaq9hMqMxe9SGebBykc
	AU7qcgpE/0QVpY4xZCl0pkeOxFa6IKEQEPkYle/kPSXNgwhRfK0/3tyO4DH7uhb92gND89tvbK+
	dw6oiZ1FbsZoaqxXTnh5vk8ziqYjr80g2D3g0G2FOpynYxnfrQ18VXuwQyLTvlxfnaxzREIEyMH
	YT1mnrnG0IyGMGe6mU6XN0t88eMA5KxCseFo7tU6GRJHXOu/5EvQiDcj2cNepCn6d1ZbwqLiRya
	AYgrVfH+EKHTPQXrqeWOXrVwBZ7bk4nNDqsdiMsfp1HcZvCV+/qYCmnQb5gYf5VCjbvQOeyLBkb
	ZlYah/oOnSAheDM/tlMtBguXgn
X-Received: by 2002:a17:903:388e:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e2e4a1cfc1mr31696925ad.26.1790832252490;
        Wed, 30 Sep 2026 22:24:12 -0700 (PDT)
X-Received: by 2002:a17:903:388e:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e2e4a1cfc1mr31696475ad.26.1790832251863;
        Wed, 30 Sep 2026 22:24:11 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:11 -0700 (PDT)
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
Subject: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Thu,  1 Oct 2026 10:52:17 +0530
Message-ID: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: bYFBt-MPcR-Vk3Q1yzLWbNLxypVI9vQo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX9WYoFj5VM3I6
 axmvnV81J+eSSmhrLWsON3ajJxE03l4qEgtCLR+sdY4jO6dwe+1UsbVtTPmmg78i+FxLod0yuQB
 s44ISSVb0+JRZUSkrEQS2175qQHpJRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX4qv78hjXEjvJ
 aeg0H3TvkYcE5TtXY0X46XFan3buSWkTpg44MlSEnty6O8/d0zl+QDV0psfVNDuzNDxJU07u8sa
 mQILtpPHXWjfKhrC1EYGFUI07wsKQUTuaxGXoOrSO655mct9dw2sc0LRztxwjCdebu7o+mm0kGZ
 cNXJN/NOMnuGUVJTb7Z2/gr2Jrl40IRArJcEcLgMGlzfT8sDKBPp05FwvPyYaMxJzJq5Q56nJcc
 zzy0jUTqIi9Qa7fdA/AslVAchJFTv+YhxnR6r704Rp052oDvlXIxhkm6a8SoleszsXSJddFKNjF
 a3pIlEA3uGFM4uoaXxwbOuR6Lpb1pW2gWmmE7kxejpIqmBGDR1XNT821FX06FSnBxkMZTfCv21L
 KVXx6DgoZakCFbcyBn8CkiPXf62tFrX0CV+MUYIekXbtTgHKHB3EASBBXqhNaoxdpiYWM6auWnm
 ScMJfHL+Ioxr8+WOvpg==
X-Proofpoint-GUID: bYFBt-MPcR-Vk3Q1yzLWbNLxypVI9vQo
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abdee7d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aa8L5a3Xh2TisPCN470A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062422_578789_26292E54 
X-CRM114-Status: GOOD (  27.33  )
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
 drivers/hwtracing/gtrace/Kconfig           |  13 ++
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 236 +++++++++++++++++++++
 3 files changed, 250 insertions(+)
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
index 000000000000..1f06b1a2b412
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
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
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	0xf
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT	28
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
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
+	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
+	val |= srcbits << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+/* Set requested trace format and return 0 if hardware supports that format */
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
+	return val == fmt ? 0 : -EOPNOTSUPP;
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
+		val |= (RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK <<
+			RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		hw_srcbits = (val >> RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT) &
+			     RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+		/* Determine if there are sufficient bits to hold max cpus */
+		hw_srcbits = min_t(u32, hw_srcbits, RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX);
+		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
+		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
+			rvtrace_encoder_set_srcid(pdata, srcbits);
+			priv->srcbits = srcbits;
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
+	if (priv->srcbits)
+		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
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
