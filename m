Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E9CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo/NwnFC6XyTwwJrRz8W+SFropeut3sOjnk0T2q99o4=; b=FKhSV6ho2Eck2H
	xHxFXea2wlR8coEp1OwR4XrL7JziFepEe3zJcF5H5biuzRNquZavcSPjJVL+u9zGlX+ndlDIlwSWM
	VXchdYoZAwnT56rElIg7YSEu8Hg49PmU32mHjuAJ4W7NI5hPQlujr0V4GUAPHsg6pOA31NHpYtHjz
	IIXZzVAlOIZYxIjHNF70QXO/RVrZ7gbABhwCxbC3DRJ+Pzm852iTxyUjg8NVjvM6TC5m91tcFtxu8
	1XjXGiKfk3SOZZfbm+Aq6N7cLhhvbtjoqp276xKGQbbxt1dfFwKsMRkNACs+egSyW7VIZ9rBgbo77
	hI7zTa73Mo5co6obVZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hg-00000007nra-314r;
	Thu, 01 Oct 2026 05:24:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9He-00000007nqE-1yN7
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6/r2QKyxxEpqb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=; b=u6tZB3ls3kwFaDwqqT1Sdn8YwA
	Pgw6gUcB4ACfT1R0qho5oyab30Ta9X4ooxwCFXCWi++REWljtg5/Cn9vvXYRpcMRSFVnzbQlDbTKw
	TrhiFU73IQMcuuEm8D6DQrE8HQKQDaTGas4RbpPNv3EFfJcGL9VY1xC4+UYSbrVlgbKSdt9hfbxQ6
	iEusMNsG/MyyiDrUGy3ks3vaajePPlh7KvEaJipiJGC0ksz9rGjiKWnYsMVfZmwaAZe2BcMkVaFC6
	glI1QalIvOSe2rjBEk6peBOp05yBMsiPGY63tiaKwsaIj+jLRy/RYblOFM7t2899KJ0PsjMeeJKir
	qCwFRmqA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hb-00000005Sp8-379g
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gYVo543015
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6/r2QKyxxEp
	qb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=; b=EwgAQ9/IfL+zbptFqk9pwGHeNhK
	9gihOYYSb6BJ5A+9H3VmipkDdG+XD0WrRyucffntX4APmwXd+Ywnp7VxrBOvb0nz
	5WdrfWEQjUzyA67y1K+OcS+0B8axPavwzG8Es6QZY9vsTiE71N31JOiVIKucnTlU
	x3s0dOyAGPa8GNdxCaFpGDmaNN/Rpms/IcCPYFQts46EsQkZL9lguCazk9GJpQUy
	cN2PkG4+veI/un8JkgYoG2Vwwdbvm6Wrhm/IObqRjIwzLB7shgORqO4rrGrrcYRg
	TsmwgM4t2SvRyiWdPOv9V0B9hjmm4x7DLhLGcqlNk0DIFoKhaP7bi1QdwPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctcjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e305755a01so6039515ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832276; x=1791437076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/r2QKyxxEpqb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=;
        b=MCbGjmeKKIpEKgyfwyZ9MeWFKjqSdcvIEzak/Y8bth2x1DLuRTX8Tof6Q1RQlMFoHk
         KZpjudnriQElzRDuPN5gU0CepfzW7+6zVYtKEQjzyHNDYP6OTE2BeD5kyu1HEsgfpcW9
         BuB2Sqo3K4sZHFao2kN08/mOdoyWdEuWw6p9oU1S33CsqdEIWqhFjV3GlFkSYfwTPvx+
         SbctoTjGa+GCQoM/DBf6x0bsI4K6Dy6qJEX/hNzDfLo8U4TtzpHPQk1pMUOIxaPlpzpL
         /J8zort0+RIAmhph39JjMtLNdnUh2gRj4r3QnGYDagEuDTQj3WaJxhA6zGz5qmkemUT5
         rFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832276; x=1791437076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/r2QKyxxEpqb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=;
        b=ggDyJJXrXwkcFsAzdGHzSvvWsM/OQYALARpkKvHaKoUZsdjmq4t0BOh2F7+WPi9Nbs
         /XGiK1uC8tOc9Pjo3nta27n/GZPPSw1qVB8LQKcq3suK0jSCHnHuSgkOknPZ4zr7cfUs
         oeuFhqQOP1n512y1mJZ1h/Am+SvVduRdxVHcwEf1GnKf6kKDZyZyl9wBp5NkRb22FWJK
         rdPFTlbJS0PvsZStKfQV3fheutPZXm3DO7Ppikot4D4m3gUv968DGf0SzH9Xbx82wF9j
         v5tyBoJ5WoIIVa6rsh7GF6u4yAH+ZCgEwszSKdbf3O/cuQpXktGOAQqoj0B9uBQdgQhb
         PjuA==
X-Forwarded-Encrypted: i=1; AKwUvBzNGNQvaEY1KnW9gfy2KH9jsvDmwzd3Ikf3z3T7xhmWnzUH0cxe6VTRStZxPOltjNsmNpXhEnGzj7sjUw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJUNSg+bbW+EtSHRVhlchLBzXWVNve4ptRR6fv75jxj8aE2SD5o
	ZpVt00NxyhzN7o70/QAdnFxHZWLBjD18HQKhv0GFf0kz1fomTZ+dAsOIuy7vuGTopH/u5pt0uTP
	ttSx/0QfuMzzu+gwxJUZ3pxFuekl5hTpj1V4F9E41V0uvOh6VPUBtgBAnppePD/0mpfwusRk=
X-Gm-Gg: AYBFou1NCktpoa7Xb19GNm+v0N0VDBwTtM+OMEToYbEdYpcLPCJA6yk5SCknQDhyFUE
	ZYtvOlg7J0aOuZikeu8s3xqR4/fp24s/RUobUTuKF/LIzkW43DKa3n2hp8LETbYtGSDMFTxXx7A
	R/IJcSza88FgVOFg6UmGfZf0hZcfITkw3uDz0k13+KudoVnb05RFZGS84a2KmzY/ojyHvNkxn1W
	WFyoj5c3lhP9DAH3G2RC4oIP9CXKVErG0Y6ZZA03Nbyv6RrwUZrP7ZDYu9Pv6GijY7LXTyGNqsj
	yKL3R9W2JniZnbopJZ+aUkoGvXKcZoILc/gh1cYC/7UIqS8dnV1dyaJY6opQa3NfO5JEvhShYOK
	pnvx2PzXFa4S89f64oblAESKfEO2OyvqjRYNQ6+hJI1kIUxL+fo6lVI8YF2ku3Vzi5kxPT+WdzL
	Kgx/RSCgE0iAYnX5AgPb6dENXC
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr27798255ad.35.1790832276137;
        Wed, 30 Sep 2026 22:24:36 -0700 (PDT)
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr27797955ad.35.1790832275632;
        Wed, 30 Sep 2026 22:24:35 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:35 -0700 (PDT)
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
Subject: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Thu,  1 Oct 2026 10:52:20 +0530
Message-ID: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX+v3wuwzWbVwJ
 qEPSXzBd5RytwR7XMTeRy+6OpMIV82zXVOQQeSJH6dFkJMMl21FtC8ZM5zA+LK9xpyJ2oGdnoN/
 eRuylAeyTJWKVf9GG1LBjVs9G8Fmb1BApVxvtZK0S5NbWtZTZ6rOCI+sSdiT6ZXm2fK4WToKP0e
 HIcYYPqR+JesxE0ZUb+k3GZKNxsfFeXM7n9vrAWDKU8E0h4Tfy9BP7Br6QNR1s7Qv00JNe9bQRg
 Xt7KX5XQLOT0UdrbFJWX8Np2D3/YiXoZ0qeDNsnUFw/j0ld/pBCwWjwdVDnlsP+NgzNlzrFsojy
 8QICYvRcQvT1MwIILCbEXmaOq6LeE8QTax4I8HsuPpTAK9SOyn0PK3m36uu9QQlKBKvp0EGj48W
 8veOGN8Ol0jR+F/0r0fKrcRTOndFdqlylwFP9Zwp2m+f4tuXotkjXJBhN6Cbkl9NDnPjeAxCobd
 QXjpGruV3W9yXsFmFwA==
X-Proofpoint-GUID: hMNW0VR2zYvMWamd5g01s0SDtCzeNW7B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX49K3TaEJHwOv
 y0ClscJvMht5lKj0b5/p0BLfv0ly/HWKiBatvIhnrQzYUvx87SMJr/4JvdeDMOdh+SRgrNnlAaN
 0Dz7eZ1n9LhTf01iAq4Cp8g0i7oMBN8=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abdee95 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XnCO0IvpVGiLHJXh1eIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hMNW0VR2zYvMWamd5g01s0SDtCzeNW7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062439_981446_FBF75006 
X-CRM114-Status: GOOD (  27.28  )
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

Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  15 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 357 +++++++++++++++++++++
 3 files changed, 373 insertions(+)
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
index 000000000000..67b6779aacee
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -0,0 +1,357 @@
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
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
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
+/* Helper to access start, limit, wp pair registers */
+static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
+{
+	u32 low, high;
+
+	low = gtrace_read32(pdata, low_off);
+	high = gtrace_read32(pdata, low_off + 4);
+
+	return (u64)high << 32 | low;
+}
+
+static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
+{
+	gtrace_write32(pdata, lower_32_bits(val), low_off);
+	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
+}
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
+	/* If destination cannot hold entire source buffer then write only the latest data. */
+	if (dst->len < size) {
+		src->cur = (src->cur + size - dst->len) % src->len;
+		size = dst->len;
+	}
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
+					    u64 *format)
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
+	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
+	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
+	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
+
+	if (wrap) {
+		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
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
+	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	limit_max = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
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
+	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF);
+	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
+	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
+	rvtrace_ramsink_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF);
+
+	priv->start = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
+	priv->end = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF) +
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
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
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
