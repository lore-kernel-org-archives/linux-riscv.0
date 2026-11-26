Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B9606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqdQqlUO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHFIvge3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qvyi8xn6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u/xK5iu0wve1wm4Gkj/jrHd5xYh0AUZQ5Iz9xxZEHZA=; b=gqdQqlUOm9g11jKECX/SAqJnG3
	Q9a4oXBHCaQmzvxEfGOizgN4GMtDRfj7JgHrMQL+W1ufBKmi5P+peeLDU4IQl5gimempFwS+WH9Yy
	BDJdd4gA3SpzryR2b6FxxUDkapwd0B9Q2oyvX2zcHp1dmkuf559moP3qPDavnUCy3NqyJ82Oc6JQB
	JphuMH2oNOZ1EMYZVrOsGkYF0pMzdl/PZ4UAUe7ZfoGkOjTjkO9EbcHX5i3u9gC5fDpTYz7kXJUTd
	K8bPdSwFSJqQT6sHLxFIEnC/PeilVRhikuROSezC8S1mq3A+Ba/UzwEARRuj4NcEdQvQcBWXc2Jhb
	HjBgL2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEA-0000000CfA9-1Kjv;
	Thu, 26 Nov 2026 09:57:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWE5-0000000Cf5p-2p26
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Ar7G2885419
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yx2yUdKHe8e
	SskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=; b=hHFIvge3I3nFaE/FHCIErTdClij
	nE8KqW+fMg1GJc9QzfMvXDqb9qs3CuqZpXvozX/5b90cOdG9tosrd0+Rs7LQ/xS8
	OEPNmQwirAUhJ6KKceiULeY/ZST2oVHwrulzoT2EcGFj70sAelEr9eyThZhVNcF4
	NzR4DiqiCMv/7fS7A+aD/i3uoMDTZiasUe4REJjGtUtqwzA4PoEjwZHY8KA5c1FZ
	HU/NPm/La/YuW1iuEiymOuhf4jqo3HpZ1XbGLsU0e4NfWfMZUVTFHZSHqonSId2f
	J6U4w/oeqJ1/vGnXPus5c53cnEm4s3geaz/bMmCq4k+4MF2qnP1HEEUpKXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgvk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so8185366a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687032; x=1796291832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx2yUdKHe8eSskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=;
        b=Qvyi8xn6WaQCvMeEr7/lX9V2OVaKvVBoDISSWOgcvdaFbMnXTdDbEYiTzi5/Y/fYRE
         dJ7JqEG9zZK8RhOZkWPZhyw9m8XkSku99cdRTttCorKrQT9tbem6njn2uVJxQXF8aGX1
         2JAT/P/+A9IjAQPR6UR9n14oZjHxiiy9nypODUxHvGf91BwbdsNtCLheJ59jVQcIcJZ8
         fO00edCBsiqK5hJa+e+5dhGTVxZ+NcVGm3v7WEpuNnFD6STlqC6zQpyKL1i+Cjlxl9NK
         XxDuYpqiAis1I/7QFjsviGEY04jeKoH9hAbnOqRrHO9LFc3TBUaQx5zHXUd2/kMc7Ns4
         e3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687032; x=1796291832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx2yUdKHe8eSskqByOkClzqHbWA8HEP3yj5O8Bu4IcE=;
        b=eS0irZ7OvX/dhfgGZj/2vuEbneUEdsrueLbmfB4rFkTi+QMDtXbWqvUwg91vE3QH+6
         VfbiF4EcxoM083W64j85m4ndYqQMRKXEmjtEPfqLfyOdME+UFtNUEKNI6FiOLkrFfxDa
         /+5Gy2VLC29Ws/cegVCVQ+UqSThIWURqN+BUayVU/0yx2afLKW6p9KwWqzOlSBfs1c2R
         4ESbGCZcR0wFuUptAf1KRuQLQwTUBpFEIwrnshAWUdFzzg6sLiiW1GSx58yfWdUAAJRS
         1+LwZiP0V8IatVgICWs8xQL4LUeVyw/UXkjviW1jRX4qlldsW4ilcNlZ2Ovtdb4tH30S
         UcHA==
X-Forwarded-Encrypted: i=1; AL+hErEc2V1o2pwl6IUhUHFGwtuUTjX01M98hEW5WMGCae6Dz7lfzBPGPNR2kiSUCm6Y2BqhvqCxYpYAR4G25g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZroZDGiVSOOlHBvUcscQTvb/vl+m4I5Sm+MlWb9cdXXkY0wFv
	T0UkQ7KYFnVzgFYF2kJLgipDpO6aepiHZpCO2D8uSGU6yyvx+xIliEqmUKy3MesiOABfpBjJkbA
	Uhku8CMZebtIz2qUpaov/zHa6SAgdo19WwzbAGX/qoyj4kqdKJm6UPF3wlq+nK4ImwSQOlEU=
X-Gm-Gg: AZFdTZeHOAKAGZ0y3HhUZY1Mlitx5mveXI+ptBZJ+zpwh0ydA/eIuO5nW8mMjGA5+Zw
	HvwOSbLSzNGdd/xdXwW/UbeIS7DwfeEBJHeMGZQfY/7yrcpF66JfBfVTDO9Mdff23bb44/94HuA
	BgHM8G0OenFIJXA7FnzTpROvKQKwBSrZjaOVo1BsImmkRbSGsIf9eUZ/zKYfAemxycBk458hXov
	GhaUmEOxzbAMW9Tz8psVIv6gsnNDGyxhc+EML7Sv9d5oR3/jm13BoDpT3Q6qmpqLnQkceUKX6FT
	2y1RHdCgkjLl/Jpk80WTcc9NbCeil4Qa+tbr6AsX1Rlh7OC8fIVreigIKtC48VNS8OJQL0917pW
	VeXOS9kTgTMZJr0gokU7UKluH1UxxtizFHFiV0ftMObv9fdYw5ScebCvgkI9b72/LMw2VLN12wH
	K3CniCLdfDdHK/J6G+tjc42v8svwTsvG+lB1jNQEHGC6a9xVVLKF8GppV6NIrWLgPnnDZFGlYqe
	w==
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr5611005a91.9.1795687032164;
        Thu, 26 Nov 2026 01:57:12 -0800 (PST)
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr5610986a91.9.1795687031688;
        Thu, 26 Nov 2026 01:57:11 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:11 -0800 (PST)
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
Subject: [PATCH v7 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Thu, 26 Nov 2026 15:25:30 +0530
Message-ID: <4ea1823645f6841ddb551eb9a7bb81bd0879e57f.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX1Pqus/9sgSFq
 AzAyfbMrjgPChxdPOuAg3FMMt+RhNAKU7a5ttQtLl00qEVrs38jzIj4iIToPT7CoNlyKIhk5QRk
 AETjlt6ioiTO481zmD36+z2/vSyAhHQDnrj1r/E8PBIA3XF+wkiyHnOypdslZQnS7y1lgkI9axb
 icLp6IZBZwp3PVhDKgo1L0hgdVzqnrJSAhXjzqKcBAoPDt/HupDNCSNbBJ4zTTsu55VzMZjZm4a
 B6dqDSQ6vUFwFKFO/pjCvobvGL/pqKljcjMT91eIrNqD/omWn52/hMu3WBxTJxAYKDscIWZSzCq
 Ka/EMXVROWEY2pfkbxct8Tj6pPqpLRqStlhFzUKa5hHMNYs1zgdeV512uWcG+L3xAqxEyd/x+5+
 u1o5ocKbVPhGcPuM54vGnfAFdPWYPPfiGKhpuyTDxcccPD/JGtCiANHgeZszJKCQ24ZAtE+GibK
 yHaMckZbcvUVH50031A==
X-Proofpoint-GUID: Glocd0rriaizO8CueYniF5jiyas-B_bT
X-Proofpoint-ORIG-GUID: Glocd0rriaizO8CueYniF5jiyas-B_bT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7a4OCLX2z+pa
 o3ssTmyVdMTkFqK2ZkYdkiJ/zZIGcSmX10SNKdF4LOnqeWmfV1Sj0mnTQaslZsNlx1qJHecUGQK
 nj2Rx1baF/B3oQxT9LnyhwdlH9e1/io=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080279 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TIGyrV9T7BjKynz-N6kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015715_039508_0845F327 
X-CRM114-Status: GOOD (  28.59  )
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

Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  15 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 366 +++++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e3a621b59913..de4a3b533591 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -41,3 +41,18 @@ config RVTRACE_ENCODER
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	select DMA_SHARED_BUFFER
+	default y
+	help
+	  This driver provides support for the RISC-V trace ramsink component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The ramsink is a trace sink which stores the trace data generated by
+	  the upstream components into a system memory buffer. The buffer is
+	  then copied to the perf AUX buffer when tracing using the perf tool.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-ramsink.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 2660fcaa332b..31262cf5993d 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -6,3 +6,4 @@ gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
new file mode 100644
index 000000000000..24697e6096ec
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/dma-mapping.h>
+#include <linux/gtrace.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+#include <linux/sizes.h>
+#include <uapi/linux/perf_event.h>
+#include "rvtrace.h"
+
+#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
+#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_MASK		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
+#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_MASK	0x3
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT	0x9
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK	0x7
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT	0xc
+#define RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN	4
+#define RVTRACE_RAMSINK_SIZE_MIN		PAGE_SIZE
+
+enum rvtrace_ramsink_mode {
+	MODE_SRAM,
+	MODE_SMEM
+};
+
+struct rvtrace_ramsink_priv {
+	size_t size;
+	void *va;
+	dma_addr_t start;
+	dma_addr_t end;
+	/* alloc_* store the DMA allocation returned by the kernel and are used later for free */
+	size_t alloc_size;
+	void *alloc_va;
+	dma_addr_t alloc_start;
+	enum rvtrace_ramsink_mode mode;
+	bool stop_on_wrap;
+	u32 async_freq;
+	int mem_acc_width;
+	u64 prev_wp;
+};
+
+struct trace_buf {
+	void *base;
+	size_t cur;
+	size_t len;
+};
+
+static int rvtrace_ramsink_start(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 trram_ctrl;
+	int ret;
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT);
+	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_MEMFMT_MASK << RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT);
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK <<
+			RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT);
+	trram_ctrl |= priv->async_freq << RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if ((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT) & RVTRACE_RAMSINK_CTRL_MEMFMT_MASK) {
+		dev_err(&comp->dev, "only plain memory format is supported\n");
+		return -EINVAL;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start ramsink.\n");
+
+	return ret;
+}
+
+static int rvtrace_ramsink_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
+{
+	size_t bytes_dst, bytes_src, bytes;
+	void *dst_addr, *src_addr;
+
+	while (size) {
+		src_addr = src->base + src->cur;
+		dst_addr = dst->base + dst->cur;
+
+		/* Ensure that there are no OOB memory accesses */
+		if (dst->len - dst->cur < size)
+			bytes_dst = dst->len - dst->cur;
+		else
+			bytes_dst = size;
+
+		if (src->len - src->cur < size)
+			bytes_src = src->len - src->cur;
+		else
+			bytes_src = size;
+		bytes = min(bytes_dst, bytes_src);
+		memcpy(dst_addr, src_addr, bytes);
+		dst->cur = (dst->cur + bytes) % dst->len;
+		src->cur = (src->cur + bytes) % src->len;
+		size -= bytes;
+	}
+}
+
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    size_t size,
+					    u64 *aux_flags)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	struct trace_buf src, dst;
+	size_t bytes = 0;
+	bool wrap;
+	u64 wp;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
+	src.base = priv->va;
+	src.len = priv->size;
+	*aux_flags = 0;
+	wp = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF,
+			      RVTRACE_RAMSINK_WPHIGH_OFF);
+	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
+	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
+
+	if (wp < priv->start || wp >= priv->end ||
+	    (!wrap && wp < priv->prev_wp))
+		return 0;
+
+	if (wrap) {
+		gtrace_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF,
+				  RVTRACE_RAMSINK_WPHIGH_OFF);
+		src.cur = wp - priv->start;
+		priv->prev_wp = priv->start;
+		/*
+		 * There is no way to tell if trRamWp wrapped around more than once. As a
+		 * result priv->prev_wp can't be used and the entire buffer must be copied
+		 * even though some data might be duplicated.
+		 */
+		bytes = priv->size;
+	} else {
+		src.cur =  priv->prev_wp - priv->start;
+		bytes = wp - priv->prev_wp;
+		priv->prev_wp = wp;
+	}
+
+	/* Keep the latest trace when the destination aux buffer cant hold all the data */
+	if (bytes > size) {
+		src.cur = (src.cur + bytes - size) % src.len;
+		bytes = size;
+		*aux_flags |= PERF_AUX_FLAG_TRUNCATED;
+	}
+
+	tbuf_to_pbuf_copy(&src, &dst, bytes);
+	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
+	return bytes;
+}
+
+static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
+				     struct rvtrace_ramsink_priv *priv)
+{
+	struct device *pdev = comp->pdata->dev;
+	u64 limit_max, end;
+	int ret;
+
+	/* Probe max value for limit register */
+	gtrace_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF,
+			  RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	limit_max = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF,
+				     RVTRACE_RAMSINK_LIMITHIGH_OFF);
+	if (!limit_max) {
+		dev_err(&comp->dev, "trRamLimit register not implemented\n");
+		return -EINVAL;
+	}
+
+	/* Set DMA mask based on the maximum allowed limit address */
+	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
+	if (ret)
+		return ret;
+
+	priv->alloc_size = priv->size;
+	priv->alloc_va = dma_alloc_coherent(pdev, priv->alloc_size, &priv->alloc_start,
+					    GFP_KERNEL);
+	if (!priv->alloc_va)
+		return -ENOMEM;
+
+	/*
+	 * Check if DMA start and end addresses allocated by the kernel can be set in the ramsink
+	 * start, limit registers respectively.
+	 */
+	gtrace_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF,
+			  RVTRACE_RAMSINK_STARTHIGH_OFF);
+	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
+	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
+	gtrace_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF,
+			  RVTRACE_RAMSINK_LIMITHIGH_OFF);
+
+	priv->start = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF,
+				       RVTRACE_RAMSINK_STARTHIGH_OFF);
+	priv->end = gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF,
+				     RVTRACE_RAMSINK_LIMITHIGH_OFF) +
+		    priv->mem_acc_width;
+
+	/* Sanity check start, end addresses */
+	if (priv->start < priv->alloc_start ||
+	    priv->end > priv->alloc_start + priv->alloc_size ||
+	    priv->end <= priv->start ||
+	    priv->end - priv->start < RVTRACE_RAMSINK_SIZE_MIN) {
+		dev_err(&comp->dev, "invalid ramsink configuration detected.\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	if (priv->start != priv->alloc_start ||
+	    priv->end != priv->alloc_start + priv->alloc_size)
+		dev_warn(&comp->dev, "ramsink start, end updated to %pad and %pad\n",
+			 &priv->start, &priv->end);
+
+	priv->va = priv->alloc_va + (priv->start - priv->alloc_start);
+	priv->size = priv->end - priv->start;
+	priv->prev_wp = priv->start;
+	gtrace_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF,
+			  RVTRACE_RAMSINK_WPHIGH_OFF);
+
+	return 0;
+
+err_free:
+	dma_free_coherent(pdev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+	return ret;
+}
+
+static int rvtrace_ramsink_setup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv;
+	u32 trram_ctrl;
+	int ret;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Derive RAM sink memory size based on component implementation ID */
+	switch (comp->pdata->impid) {
+	default:
+		priv->size = SZ_1M;
+		priv->mode = MODE_SMEM;
+		priv->stop_on_wrap = false;
+		priv->async_freq = 2;
+		priv->mem_acc_width = RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN;
+		break;
+	}
+
+	if (priv->mode != MODE_SMEM) {
+		dev_err(&comp->dev, "only smem mode is supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_MODE_SHIFT);
+	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) &
+	     RVTRACE_RAMSINK_CTRL_MODE_MASK) != priv->mode) {
+		dev_err(&comp->dev, "smem mode is not supported\n");
+		return -EINVAL;
+	}
+
+	ret = rvtrace_ramsink_setup_buf(comp, priv);
+	if (!ret)
+		dev_set_drvdata(&comp->dev, priv);
+
+	return ret;
+}
+
+static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+
+	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+}
+
+static int rvtrace_ramsink_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_setup(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+	return ret;
+}
+
+static void rvtrace_ramsink_remove(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_stop(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink, can't free DMA buffer: %d\n", ret);
+		return;
+	}
+
+	rvtrace_ramsink_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
+	{ .type = GTRACE_RVTRACE_RAMSINK,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_ramsink_driver = {
+	.id_table = rvtrace_ramsink_ids,
+	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
+	.stop = rvtrace_ramsink_stop,
+	.start = rvtrace_ramsink_start,
+	.probe = rvtrace_ramsink_probe,
+	.remove = rvtrace_ramsink_remove,
+	.driver = {
+		.name = "rvtrace-ramsink",
+	},
+};
+
+static int __init rvtrace_ramsink_init(void)
+{
+	return gtrace_register_driver(&rvtrace_ramsink_driver);
+}
+
+static void __exit rvtrace_ramsink_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_ramsink_driver);
+}
+
+module_init(rvtrace_ramsink_init);
+module_exit(rvtrace_ramsink_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
