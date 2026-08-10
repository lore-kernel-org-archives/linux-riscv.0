Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E753C5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSCuR6P9osrYeJeCXKJjB965UFX3j4iEYEgvubjE17E=; b=UJEIcdbmiaVHF+
	vfTC74Ue6WdXeypfMr+CFgb14302xwpSd4yBrpp09d62E7J4/EB/nC/2nobbAVaqoT0m105fGdF6h
	BBo3AVSip7wxQzs+ok+lma2nqeaILR0BPlyhQtzMm2A9eFVMopg6EGod1gkveJsp3jk6Y6abWzvBN
	1SgaI0Dr2zpMjEzzUJSwIfIjs1ei2qdp2cUmtB34G47TCvKi6nXb2ujzwczC1zrj59UAe5GxYh6PL
	3DYbN6MAq+OK/OO4oSraYIOWVRg9rJDlucqgVd21uOuHaAaTqaEvlGDem3PY27jvRJX7eNr79bbUw
	nM4tU8gr/9pA8sROZ5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRs3-0000000CFKc-2qWf;
	Mon, 10 Aug 2026 15:24:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRs2-0000000CFJM-3GEi
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Aug 2026 15:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WFsC6PGmfD/xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=; b=e0NJqx/moKZht4wDC695uBEWdV
	lvbaUUon96KCGoKSSIisQSlpapQOsQlB4zgzznvDZMsuf+APKEUnBCtKMg1Cv+5wdBJ+7hg3+RPJb
	FsIclMm0y0QBDwHwGOUO2muMIqXGE+/qg6FIkSMM5uIK4dsfcrPVj29F5eFTIxc6hFEQH5t+klXOL
	DSTf7jOBLEr/7JOiRP8ZHfV0K5n8/GkL09ThB55qYXk5H+783BRdalCQrX2RfhT3ddQaZOR7ezgLs
	cZJC8v/F6dYuM4Om3vSWIBI8Yg+TyY8ZSxc4/WFUD1gKdyw05sjqZMah2NcizN+VBNC89vC3eHwX9
	G8MVXp5w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtRrz-0000000Dw8s-0PP3
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj8cD1308329
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFsC6PGmfD/
	xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=; b=R5qfyTJ0DnVFzSA58wN2g589Z4c
	u3nw8u4VdT5jeVzLyME2ywod+n0GO+TLUUFIhAsNgmoT0TRPc7ed2zfnKiJRXjel
	w+F+dKk6MIMga5uo7OimogVNRuSAM2NqVL8rq5vsXOb+BlwhH1KGD2FDo6dBwtp6
	n2M8yY1CufUO/wKCMS1UR5CDRDbBbmP10QYmlvdYe0cvjEXsGUPbyzTiEA+sjnt4
	9vndn5hnsSt+UJwkkhgXg0tovW6oePQ2MAOUPpby+OV1PIA4KxpdBRbDdJG+pitY
	ZTi2jQ83BkKad1TRm3ULG9FSpvzizInuMozSkhIA1FIHPMLw91H0BgxH1LQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsbu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso5586917b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375492; x=1786980292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFsC6PGmfD/xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=;
        b=TpuzBVg+LsIlkcq50BP7fK8JV09Ql2ODUPwKBCy5aCGzlbFRQy+AUAAXdRoJGo8xgU
         i7gO6oumBi8ksOTQRUKYrcpjXWZdr7XYNCLIkcx/Eo7xjMwfZA2efyKR7I8qxxctYROi
         Gvu2ydC9PiaGmlEKG2CPvJBF8TlvoMeBhW1TU+RyU5+fz3Xqnt4kRqn9cy/cL3QJyvLP
         j5mY88M+FeUYCJErhIMvz+HIiLHXuh/IEoEKoqI3B3DoRnxl+YKIeS7ZX/1acU0GZyD5
         73ctH7aXJs+3hzeACQHWppTyWBKSMzz+CGp65kVv4b76CEudDAFtVI9mMsazlTv8Cz9o
         kZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375492; x=1786980292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFsC6PGmfD/xegtg7aOxmBQNqWxDfwAUvD3dRQnjBfE=;
        b=Tmxb7zxd2J4XzxXc1iy/u+tuG+ZQurasEHOsQkjc6zzbPI+d8B69js+Io3rxEcyGON
         jyFi+s8QIz/+5agJ4GaynQvqnOGhaYgrFchNj6ovvoU1UYQiJptyr/UYX9MOUFycmyQB
         eFJhaTB6FYmWEW7zNRuCJc/KczC9zSoMa1gmnFw+HHcwkI66GwZFbAiOqfyI8mwFDOWF
         1V7ckjf9AIcbommpFaGMTZndNt8oUA3Rg+tOqNnZmAad0DOqASRCPegn3a2Vh/FWNOm0
         ii4LR4zvUr0es1JpNhc2cIDYoZPlnYNKkqnlL4lU79gBGz1FyS3QNjSdcr+mjowwKmY4
         n/Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqVUZhBneqnTYF+ms/WDE6g+wM14NWBJYZgKT/sMH+dCK1jgxJoXDGQpMZHGZqS2rMPq3PGnqPNrGCOjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKeFnMKtvu2Iw9mSLau6mLu+7BAdnujGiSl5iuayykUKe6sNB
	Ef6iezsUXbNi2kGIPcvyHEAbO4cXA1LzWXRA4rTxvUEAqAqsiXeAsOP1DzOvOuo7VvfCwAqTbmB
	ONfKiSHQsWdl+9F5SIpE+182AhpJ9RkPhLJIiccU8TmfzX7g0jW86G85Bhr7jgCl+YJh5zFc=
X-Gm-Gg: AR+sD10mnUm9aZNMOeIKJYDdWp7G+FezmIPyg4UxnVCHKW15fyzhx4t9CZpun2D2WEK
	GV3BNYdmTHsdvfF/vtjuuxd9NnnQvHAsLQ5gsqutJMYjGh4XhvWnvzeE/ZeXzEA2ijhriFZsTUM
	HWw97ZmUQwaUlKq9pjUpIA+nuZ68mVgLCZ2Y0EiaDnvEc+6Stjj5Dgt/3xdKoZolE3At62F7CP6
	pD6AFw6VhzMliE3jdmVy6P1kMcmoFKUusC1cYxst3mWU8qp/An5be27t1h1GavE2nZrUewmfkJB
	jU2YqwCD+eoDExEsvhIUXZ4oAuM3qivb07uqH37f+8uma3aw9oPTF/SOjgmnjaEMxY3qthK0t8y
	PA3UCqxxOkTPhI/Ljj8jDeZfexKUw/o/xFx+ni492L8L7EDAzt9rMVJDcYH6dapFx4V91lOWGUI
	oH79xMzoR1IZU/UTUDVOG4GgSk7w==
X-Received: by 2002:a05:6a21:7101:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3cbd3a40d5cmr21251118637.17.1786375492009;
        Mon, 10 Aug 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7101:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3cbd3a40d5cmr21251039637.17.1786375491354;
        Mon, 10 Aug 2026 08:24:51 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:50 -0700 (PDT)
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
Subject: [PATCH v5 11/14] gtrace: Add perf driver for tracing using perf tool
Date: Mon, 10 Aug 2026 20:52:13 +0530
Message-ID: <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: vZlspa3LGjZNQn0bcZPIX_nXjSffEo0V
X-Proofpoint-ORIG-GUID: vZlspa3LGjZNQn0bcZPIX_nXjSffEo0V
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79ed44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_CJk7DrN_qkI4yTom0IA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXxEvbQArZ6i7N
 WkfjW9X9Jf9MlQ7aDQ+7GVowzi/wt8zunMmxDoChq9AFxXKpkZsFr78r50laQ7dpOmpWXui4hdP
 KjtBzHD7/K73Y3/Za0NXxJ90gLJcIx0teML4v/wQCMuyf/R04PkxtQsoxtQjX9y62JJ3aLyWvak
 oWKoqNLuNVCEaZa7H0Hbilnzs+sF+GWtSNx88Xle6s2meSukXQHzleFJzETawNj8OXhb9rhGSnp
 YiLPAc4Moitn6DJiP6FOsep8Vl2ZiK5es/5Usdwdulw/1wzkeUFabmOD3hlbD/59VMZU6feCTxY
 gBq1q8p5K4Kor2+7TxRqyTjhmGKF/v1U29oygSpzjA6IRY/Wv4JIK6ucHueo2Q89XOkWG72EoTJ
 L5FCq+zIyU9BfGkQPT+Kmeb79cwNMl5wmZnijeieMQSEiyVrpb1nq9bdVe4TsgSVPNXbm+iWSq5
 1lIb0T7RTXu0agtY8RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX4BvOoNnyKZfA
 B6jD0w0IvSxx2xWwOS9OvQPPTdWzWCMl0Y8DbbKkcRRT2OGsQREzmwQDCZrylc0/imJe2GNno2Z
 BoG4sKeJ6RRpemUXSQdsueUuiZbi0x4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_162455_616623_EDEAECC9 
X-CRM114-Status: GOOD (  30.61  )
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

Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data. The actual data format depends
on type of encoder device and optionally the PMU specific trace format
type.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig       |   1 +
 drivers/hwtracing/gtrace/Makefile      |   2 +-
 drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
 drivers/hwtracing/gtrace/gtrace-perf.c | 347 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   3 +
 5 files changed, 366 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index de4a3b533591..e5b62d65e2fd 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -3,6 +3,7 @@
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
 	depends on OF
+	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
 	  for hardware trace drivers. It builds a topological view of the
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 3e0c68d1b632..aa044fdc787b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GTRACE) += gtrace.o
-gtrace-y := gtrace-core.o
+gtrace-y := gtrace-core.o gtrace-perf.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 53a3679ba69f..102251f6a5a7 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -714,13 +714,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
 
 static int __init gtrace_init(void)
 {
+	int ret;
+
 	gtrace_init_type_idx();
 
-	return bus_register(&gtrace_bustype);
+	ret = bus_register(&gtrace_bustype);
+	if (ret)
+		return ret;
+
+	ret = gtrace_perf_init();
+	if (ret) {
+		bus_unregister(&gtrace_bustype);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit gtrace_exit(void)
 {
+	gtrace_perf_exit();
 	bus_unregister(&gtrace_bustype);
 }
 
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
new file mode 100644
index 000000000000..ed9155bbbdb7
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/perf_event.h>
+#include <linux/vmalloc.h>
+#include <linux/percpu-defs.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_PMU_NAME "gtrace"
+static struct pmu gtrace_pmu;
+static DEFINE_SPINLOCK(perf_buf_lock);
+
+/**
+ * struct gtrace_event_data - generic hardware trace perf event data
+ * @work:		Handle to free allocated memory outside IRQ context.
+ * @mask:		Hold the CPU(s) this event was set for.
+ * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
+ * @path:		An array of path, each slot for one CPU.
+ * @buf:		Aux buffer / pages allocated by perf framework.
+ */
+struct gtrace_event_data {
+	struct work_struct work;
+	cpumask_t mask;
+	cpumask_t aux_hwid_done;
+	struct gtrace_path * __percpu *path;
+	struct gtrace_perf_auxbuf buf;
+};
+
+struct gtrace_ctxt {
+	struct perf_output_handle handle;
+	struct gtrace_event_data *event_data;
+};
+
+static DEFINE_PER_CPU(struct gtrace_ctxt, gtrace_ctxt);
+
+static void *alloc_event_data(int cpu)
+{
+	struct gtrace_event_data *event_data;
+	cpumask_t *mask;
+
+	event_data = kzalloc_obj(*event_data);
+	if (!event_data)
+		return NULL;
+
+	/* Update mask as per selected CPUs */
+	mask = &event_data->mask;
+	if (cpu != -1)
+		cpumask_set_cpu(cpu, mask);
+	else
+		cpumask_copy(mask, cpu_present_mask);
+
+	event_data->path = alloc_percpu(struct gtrace_path *);
+	return event_data;
+}
+
+static void gtrace_free_aux(void *data)
+{
+	struct gtrace_event_data *event_data = data;
+
+	schedule_work(&event_data->work);
+}
+
+static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
+							int cpu)
+{
+	return per_cpu_ptr(data->path, cpu);
+}
+
+static void free_event_data(struct work_struct *work)
+{
+	struct gtrace_event_data *event_data;
+	struct gtrace_path *path;
+	cpumask_t *mask;
+	int cpu;
+
+	event_data = container_of(work, struct gtrace_event_data, work);
+	mask = &event_data->mask;
+	for_each_cpu(cpu, mask) {
+		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+		gtrace_destroy_path(path);
+	}
+	free_percpu(event_data->path);
+	kfree(event_data);
+}
+
+static void *gtrace_setup_aux(struct perf_event *event, void **pages,
+			       int nr_pages, bool overwrite)
+{
+	struct gtrace_event_data *event_data = NULL;
+	struct page **pagelist;
+	int cpu = event->cpu, i;
+	cpumask_t *mask;
+
+	event_data = alloc_event_data(cpu);
+	if (!event_data)
+		return NULL;
+
+	INIT_WORK(&event_data->work, free_event_data);
+	mask = &event_data->mask;
+	/*
+	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
+	 */
+	for_each_cpu(cpu, mask) {
+		struct gtrace_component *src;
+		struct gtrace_path *path;
+
+		src = gtrace_cpu_source(cpu);
+		if (!src)
+			continue;
+
+		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
+		if (!path)
+			continue;
+
+		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
+	}
+
+	/* If we don't have any CPUs ready for tracing, abort */
+	cpu = cpumask_first(&event_data->mask);
+	if (cpu >= nr_cpu_ids)
+		goto err;
+
+	pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
+	if (!pagelist)
+		goto err;
+
+	for (i = 0; i < nr_pages; i++)
+		pagelist[i] = virt_to_page(pages[i]);
+
+	event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!event_data->buf.base) {
+		kfree(pagelist);
+		goto err;
+	}
+
+	event_data->buf.nr_pages = nr_pages;
+	event_data->buf.length = nr_pages * PAGE_SIZE;
+	event_data->buf.pos = 0;
+	return event_data;
+err:
+	gtrace_free_aux(event_data);
+	return NULL;
+}
+
+static void gtrace_event_read(struct perf_event *event)
+{
+}
+
+static void gtrace_event_destroy(struct perf_event *event)
+{
+}
+
+static int gtrace_event_init(struct perf_event *event)
+{
+	if (event->attr.type != gtrace_pmu.type)
+		return -EINVAL;
+
+	event->destroy = gtrace_event_destroy;
+	return 0;
+}
+
+static void gtrace_event_start(struct perf_event *event, int flags)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct gtrace_event_data *event_data;
+	int cpu = smp_processor_id();
+	struct gtrace_path *path;
+
+	if (WARN_ON(ctxt->event_data))
+		goto fail;
+
+	/*
+	 * Deal with the ring buffer API and get a handle on the
+	 * session's information.
+	 */
+	event_data = perf_aux_output_begin(handle, event);
+	if (!event_data)
+		goto fail;
+
+	if (!cpumask_test_cpu(cpu, &event_data->mask))
+		goto out;
+
+	event_data->buf.pos = handle->head % event_data->buf.length;
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (gtrace_path_start(path)) {
+		pr_err("Error. Tracing not started\n");
+		return;
+	}
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+		perf_report_aux_output_id(event, cpu);
+	}
+
+out:
+	/* Tell the perf core the event is alive */
+	event->hw.state = 0;
+	ctxt->event_data = event_data;
+	return;
+fail:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static void gtrace_event_stop(struct perf_event *event, int mode)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct gtrace_event_data *event_data;
+	int ret, cpu = smp_processor_id();
+	struct gtrace_path *path;
+	size_t size;
+	u64 format;
+
+	if (event->hw.state == PERF_HES_STOPPED)
+		return;
+
+	if (handle->event &&
+	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
+		return;
+
+	event_data = ctxt->event_data;
+	ctxt->event_data = NULL;
+
+	if (WARN_ON(!event_data))
+		return;
+
+	if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
+		event->hw.state = PERF_HES_STOPPED;
+		perf_aux_output_end(handle, 0);
+		return;
+	}
+
+	/* stop tracing */
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (gtrace_path_stop(path)) {
+		pr_err("Error. Tracing not stopped\n");
+		return;
+	}
+
+	event->hw.state = PERF_HES_STOPPED;
+	if (handle->event && (mode & PERF_EF_UPDATE)) {
+		if (WARN_ON_ONCE(handle->event != event))
+			return;
+		spin_lock(&perf_buf_lock);
+		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
+		spin_unlock(&perf_buf_lock);
+		WARN_ON_ONCE(ret);
+		if (READ_ONCE(handle->event)) {
+			/* Tag the AUX data with the format reported by the sink. */
+			perf_aux_output_flag(handle, format);
+			if (size > handle->size) {
+				size = handle->size;
+				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+			}
+			perf_aux_output_end(handle, size);
+		} else
+			WARN_ON(size);
+	}
+}
+
+static int gtrace_event_add(struct perf_event *event, int mode)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int ret = 0;
+
+	if (mode & PERF_EF_START) {
+		gtrace_event_start(event, 0);
+		if (hwc->state & PERF_HES_STOPPED)
+			ret = -EINVAL;
+	} else {
+		hwc->state = PERF_HES_STOPPED;
+	}
+
+	return ret;
+}
+
+static void gtrace_event_del(struct perf_event *event, int mode)
+{
+	gtrace_event_stop(event, PERF_EF_UPDATE);
+}
+
+PMU_FORMAT_ATTR(event, "config:0-0");
+
+static struct attribute *gtrace_pmu_formats_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group gtrace_pmu_format_group = {
+	.name = "format",
+	.attrs = gtrace_pmu_formats_attr,
+};
+
+static const struct attribute_group *gtrace_pmu_attr_groups[] = {
+	&gtrace_pmu_format_group,
+	NULL,
+};
+
+int __init gtrace_perf_init(void)
+{
+	gtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
+	gtrace_pmu.attr_groups		= gtrace_pmu_attr_groups;
+	gtrace_pmu.task_ctx_nr		= perf_sw_context;
+	gtrace_pmu.read		= gtrace_event_read;
+	gtrace_pmu.event_init		= gtrace_event_init;
+	gtrace_pmu.setup_aux		= gtrace_setup_aux;
+	gtrace_pmu.free_aux		= gtrace_free_aux;
+	gtrace_pmu.start		= gtrace_event_start;
+	gtrace_pmu.stop		= gtrace_event_stop;
+	gtrace_pmu.add			= gtrace_event_add;
+	gtrace_pmu.del			= gtrace_event_del;
+	gtrace_pmu.module		= THIS_MODULE;
+
+	return perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
+}
+
+void __exit gtrace_perf_exit(void)
+{
+	perf_pmu_unregister(&gtrace_pmu);
+}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index bc82814e2738..439e2f091d4d 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -317,4 +317,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
 		driver_unregister(&gtdrv->driver);
 }
 
+int gtrace_perf_init(void);
+void gtrace_perf_exit(void);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
