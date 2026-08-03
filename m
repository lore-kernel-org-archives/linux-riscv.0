Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABCDC55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVWBAYlzHyrkBh9MLxbIphff3G9Az/j1uKUGdZFSbIo=; b=piVfNR0CgCbBak
	7bJcNFKuAtpsHudcPgj2l49fMpy49Mmqge8nxQNYLbV9xuVxMsPEUv9OzeTAEAxLtYU5IcY4gg+fa
	XFayqyc1UJPl+9FzQMZkRz2ETTcKcKFZDUa0VOIo5uUg09EWtakQUQaOs5SIn9fR4i31e3pOYtyOY
	oNJq4tMmBjoSJE0L/SXpYPs3TFHPgEq/AnyiX3CNhIMDayTyBmegtpmmKTzseYWrE/SbfjL1YzvLV
	2vw8pIn7YITte5QsEVxzuGLTw+TCuFsyB+kx5Dh2N1ov4trrQ9ARNE9rAkHQ27xaLB7NESRs0QHm9
	oJWxUCPuEFSKgum+Cuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2w-0000000HFWy-04y5;
	Mon, 03 Aug 2026 13:49:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2s-0000000HFVL-0GU4
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:49:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRp3K1047165
	for <linux-riscv@lists.infradead.org>; Mon, 3 Aug 2026 13:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GogFcmZK3QU
	pvZPf6ymol9rMA8EmMthoUGmNFn2L0U4=; b=nWoFRdBFKUcubw0LUMPqLvCOCS+
	EbBeBz3nCq4SrrCVLsjnJwhHe3ExuQOP7V9rXjBZU0Qq8Yt2X6Fr13mZEES6OeeK
	++xCM358wYcB+2KNlnxqNPvXNsHF7VAxLFYanpOA5FXrOPbRbNnrNAP6odp++YcH
	9t73jGSBGDRdGbSlvIcjR2VWjgsgXbDfqHoq1COIDRU0NdBMOS8A6QyC+ijAKuAc
	Yv84aPcyQiJwky7dlTb+KsYZveP8t+2B0ZD7zC2yCbIBUkWCmQaoFRHX/ZDCbZTz
	watDlnDSIl23DjmYMHfZCiSTNfZcp3RofOGNBIezkVdHl+1Ph7zdoeMdOZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9td5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 13:49:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so4421565a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785764972; x=1786369772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GogFcmZK3QUpvZPf6ymol9rMA8EmMthoUGmNFn2L0U4=;
        b=ScWZOQSoP3w4T/UfjA4RKTlTSBDYZgjCBnLlfreFJ1J0jgP9qPoxk9mbBx0wjRAc9G
         4fRTmBh66Do/Ul+xlRXQBjbDrwaArlfQR0VbFDI8D8Z1pQmuxGjihoov92k8tNf9GWGl
         iqK/ebtdcOwKzaWpmKVIL7UY/ktRFK87PQrzk2jx/keOky6w1UybdpIz2krxrnngVgiZ
         bdLLcGwa2QPXGLMgSYNErZCh5mEsxovDOJhgDOHbD0q9QkX/tLqw2SMKBxBaRLjS3043
         dkd31tH3/nytSAT8ypEbzV74n6eKGR+Op+XuZa1hzXS/x22FjcpFawj6jeyOLmCZ/Bzu
         brbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764972; x=1786369772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GogFcmZK3QUpvZPf6ymol9rMA8EmMthoUGmNFn2L0U4=;
        b=rg+zhJ3ahV59emjrFoZ1X1eX7W1U553kZcfVm6jHUu846QG1SSlasvZcCztyc0A75V
         wX+Z6VSp5/2BgR7pDwbY527K6ccw8TLPUtzRe7fBAn4Qld0j855N+zX/IPYH71VDyYzl
         GAFdz3erM1L7rFw3z4iS2nfIdRY0qg15D8c9fp1WSxIm9x9IEocveRn8ZBcK8EO0YXAy
         1Y3ixXzFJFKbw19Zq7RRi+vMqEa3FFkfBHOyO6PGyCtvw+KUvGEtQcSFIWbwEXowBCuX
         2eMXm7AiQOAebj0xXEAsA6kba6Yn00LMtJ/mlOr0xXauMbDAIlcuf30bM+U/CV4NqPSZ
         hMYQ==
X-Gm-Message-State: AOJu0Ywt4pWJcJYybmzRYfwuCDCfExvgRjS1YLFgP8WY1YtMX4tu4WLD
	jIbvHHWXs46dwznkq6ImD76nfbkRElJz0NymK7iUhcKKcdxUp95LMw8ran54v4SIu8qjG51HPWd
	b6fqfb8+s0m4Lz5kq3c0f5kyVgHDA+hidk7aXzsaTJQQAA+2vJluoKatO5RLfzzHSg28gHGqBYo
	Ql62k=
X-Gm-Gg: AR+sD11nEhXAWEeL4AGiIwP/IMUarYzq4eDVuu0CLHXB5b1sen7XqMmv+EULeEcpRmG
	HqS69yWQHoziLSAj/6UfSuUklFLqBG+MNSz2zK307DmvXIo5Nr5aqVOi+qTwxM5VWnPSo8Hf+KQ
	jZLIs/IEpOdHipEjwTlz/FOaKtcrB+6VpPTOHc5GJu6EfM0VfbeWlo7UzJRTcQv3qwHg0dlIZzb
	4YH/gfZ5chZQuoQK0+JLC3zELh57W1AUdwUfUj/eXtepQaE/TYJkdSogamXe3BesFfpjTPJyJMl
	j3iaW4kzKUUW9Xv957JIeM3lXz9ZckVQWmT37KMQz+pLjgIuf6sUeHPqdCCW+9N5O6UBBrQVVop
	I3Ix7PaqKaVebR04+aRqS1oDiwOK7yWFKfl1TsEQpjDfbv/r+Fq4N/t7dTPs/zLTW67MkKWpmOv
	J9TdGHoIMueMIGYjfKsxT2qMOt
X-Received: by 2002:a05:6a21:7a46:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c92a8139c6mr10068302637.38.1785764971543;
        Mon, 03 Aug 2026 06:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c92a8139c6mr10068233637.38.1785764970753;
        Mon, 03 Aug 2026 06:49:30 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm39278870eec.30.2026.08.03.06.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:30 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
        jtaubepe@redhat.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v6 1/5] riscv: Introduce support for hardware break/watchpoints
Date: Mon,  3 Aug 2026 19:19:09 +0530
Message-ID: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX8kArOng+2vi8
 XMueH5+uFldBWG6Po/tBX4d+qOtLtQ5BXRRhWs/xYjgcGQgmv8HQZ5cAY9picv46a8h8+peD9yj
 /C5YusdOVnMzQhk5A4/0CW4Y8u6TOMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfXwRohgRTlKr8t
 gLeWdPE0VHH1MkLmXBV6dcPZRg3mpzSTQ789zoshjxOgsV0BCZb0dv66XvV2eh5UbR+shf4X7w2
 JLCCJkLwyAXW8uE3BCMcEScPcn7plcwSr+KHs1s5J9M7+sBrr/nBSeH2iKSHPa1Vo3O2LIi+Bw0
 iCDrHzLPOESIR1V80GeZsFYpGCU59ecRRPwFH6pEg7ZmqU68QamWD5wZryOX07tvPgptp9WwHmy
 es+JkKYQAi2+nsChbEJunbde+dxZ2f4yAOjOK64Ns9zguM0jhG3NtEP8FcPogpQOaN+H7nbva/3
 9b0Mnhpnrfd+C9w0Flx8Npc6DV4pd3o+/TqCrir458xYvlW/mvmyOirQouqEu0GmWoK9+Gn5pPu
 TRDcIRI8b1Cq60ovDsUg/fHzC7rpZe3Z+ZV9rVIEMxy5HL0yXaWHR11lLWtCoBk+eSuGJKWOLli
 ofTmHtsWhBvn7/iBvLg==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a709c6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HQMOZhRFWg9NeK7U6LwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: WUp9T7Iz3Vc-D2EvqmDPPPU50HXxOqYN
X-Proofpoint-ORIG-GUID: WUp9T7Iz3Vc-D2EvqmDPPPU50HXxOqYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064934_231167_83EC816B 
X-CRM114-Status: GOOD (  16.96  )
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

RISC-V hardware breakpoint framework is built on top of perf subsystem
and uses SBI debug trigger extension to
install/uninstall/update/enable/disable hardware triggers as specified
in Sdtrig ISA extension.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig                     |   1 +
 arch/riscv/include/asm/hw_breakpoint.h | 289 +++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 678 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 977 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7028caaeae0..a624dacdaf12 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -172,6 +172,7 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..4df1bfe0507e
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __RISCV_HW_BREAKPOINT_H
+#define __RISCV_HW_BREAKPOINT_H
+
+struct task_struct;
+
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+
+#include <uapi/linux/hw_breakpoint.h>
+
+/* Maximum number of hardware breakpoints supported */
+#define RISCV_HW_BP_NUM_MAX 32
+
+#if __riscv_xlen == 64
+#define cpu_to_le cpu_to_le64
+#define le_to_cpu le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_le cpu_to_le32
+#define le_to_cpu le32_to_cpu
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define CLEAR_DBTR_BIT(_target, _bit)	((_target) &= ~BIT(_bit))
+#define SET_DBTR_BIT(_target, _bit)	((_target) |= BIT(_bit))
+
+#define RISCV_DBTR_EXEC		BIT(0)
+#define RISCV_DBTR_LOAD		BIT(1)
+#define RISCV_DBTR_STORE	BIT(2)
+#define RISCV_DBTR_LDST		(RISCV_DBTR_LOAD | RISCV_DBTR_STORE)
+
+enum {
+	RISCV_DBTR_TRIG_NONE = 0,
+	RISCV_DBTR_TRIG_LEGACY,
+	RISCV_DBTR_TRIG_MCONTROL,
+	RISCV_DBTR_TRIG_ICOUNT,
+	RISCV_DBTR_TRIG_ITRIGGER,
+	RISCV_DBTR_TRIG_ETRIGGER,
+	RISCV_DBTR_TRIG_MCONTROL6,
+};
+
+/* Trigger Data 1 */
+#define RISCV_DBTR_TDATA1_DATA_BIT	0
+#if __riscv_xlen == 64
+#define RISCV_DBTR_TDATA1_DMODE_BIT	59
+#define RISCV_DBTR_TDATA1_TYPE_BIT	60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_TDATA1_DMODE_BIT	27
+#define RISCV_DBTR_TDATA1_TYPE_BIT	28
+#else
+#error "Unknown __riscv_xlen"
+#endif
+
+#if __riscv_xlen == 64
+#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(58, RISCV_DBTR_TDATA1_DATA_BIT)
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_TDATA1_DATA_BIT_MASK		GENMASK(26, RISCV_DBTR_TDATA1_DATA_BIT)
+#else
+#error "Unknown __riscv_xlen"
+#endif
+#define RISCV_DBTR_TDATA1_DMODE_BIT_MASK	BIT(RISCV_DBTR_TDATA1_DMODE_BIT)
+#define RISCV_DBTR_TDATA1_TYPE_BIT_MASK		\
+	GENMASK(RISCV_DBTR_TDATA1_TYPE_BIT + 3, RISCV_DBTR_TDATA1_TYPE_BIT)
+
+/* MC - Match Control Type Register */
+#define RISCV_DBTR_MC_LOAD_BIT		0
+#define RISCV_DBTR_MC_STORE_BIT		1
+#define RISCV_DBTR_MC_EXEC_BIT		2
+#define RISCV_DBTR_MC_U_BIT		3
+#define RISCV_DBTR_MC_S_BIT		4
+#define RISCV_DBTR_MC_RES2_BIT		5
+#define RISCV_DBTR_MC_M_BIT		6
+#define RISCV_DBTR_MC_MATCH_BIT		7
+#define RISCV_DBTR_MC_CHAIN_BIT		11
+#define RISCV_DBTR_MC_ACTION_BIT	12
+#define RISCV_DBTR_MC_SIZELO_BIT	16
+#define RISCV_DBTR_MC_TIMING_BIT	18
+#define RISCV_DBTR_MC_SELECT_BIT	19
+#define RISCV_DBTR_MC_HIT_BIT		20
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_MC_SIZEHI_BIT	21
+#endif
+#if __riscv_xlen == 64
+#define RISCV_DBTR_MC_MASKMAX_BIT	53
+#define RISCV_DBTR_MC_DMODE_BIT		59
+#define RISCV_DBTR_MC_TYPE_BIT		60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_MC_MASKMAX_BIT	21
+#define RISCV_DBTR_MC_DMODE_BIT		27
+#define RISCV_DBTR_MC_TYPE_BIT		28
+#else
+#error "Unknown riscv xlen"
+#endif
+
+#define RISCV_DBTR_MC_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC_LOAD_BIT)
+#define RISCV_DBTR_MC_STORE_BIT_MASK	BIT(RISCV_DBTR_MC_STORE_BIT)
+#define RISCV_DBTR_MC_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC_EXEC_BIT)
+#define RISCV_DBTR_MC_U_BIT_MASK	BIT(RISCV_DBTR_MC_U_BIT)
+#define RISCV_DBTR_MC_S_BIT_MASK	BIT(RISCV_DBTR_MC_S_BIT)
+#define RISCV_DBTR_MC_RES2_BIT_MASK	BIT(RISCV_DBTR_MC_RES2_BIT)
+#define RISCV_DBTR_MC_M_BIT_MASK	BIT(RISCV_DBTR_MC_M_BIT)
+#define RISCV_DBTR_MC_MATCH_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_MATCH_BIT + 3, RISCV_DBTR_MC_MATCH_BIT)
+#define RISCV_DBTR_MC_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC_CHAIN_BIT)
+#define RISCV_DBTR_MC_ACTION_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_ACTION_BIT + 3, RISCV_DBTR_MC_ACTION_BIT)
+#define RISCV_DBTR_MC_SIZELO_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_SIZELO_BIT + 1, RISCV_DBTR_MC_SIZELO_BIT)
+#define RISCV_DBTR_MC_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC_TIMING_BIT)
+#define RISCV_DBTR_MC_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC_SELECT_BIT)
+#define RISCV_DBTR_MC_HIT_BIT_MASK	BIT(RISCV_DBTR_MC_HIT_BIT)
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_MC_SIZEHI_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_SIZEHI_BIT + 1, RISCV_DBTR_MC_SIZEHI_BIT)
+#endif
+#define RISCV_DBTR_MC_MASKMAX_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC_MASKMAX_BIT + 5, RISCV_DBTR_MC_MASKMAX_BIT)
+#define RISCV_DBTR_MC_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC_DMODE_BIT)
+#define RISCV_DBTR_MC_TYPE_BIT_MASK	GENMASK(RISCV_DBTR_MC_TYPE_BIT + 3, RISCV_DBTR_MC_TYPE_BIT)
+
+/* MC6 - Match Control 6 Type Register */
+#define RISCV_DBTR_MC6_LOAD_BIT		0
+#define RISCV_DBTR_MC6_STORE_BIT	1
+#define RISCV_DBTR_MC6_EXEC_BIT		2
+#define RISCV_DBTR_MC6_U_BIT		3
+#define RISCV_DBTR_MC6_S_BIT		4
+#define RISCV_DBTR_MC6_RES2_BIT		5
+#define RISCV_DBTR_MC6_M_BIT		6
+#define RISCV_DBTR_MC6_MATCH_BIT	7
+#define RISCV_DBTR_MC6_CHAIN_BIT	11
+#define RISCV_DBTR_MC6_ACTION_BIT	12
+#define RISCV_DBTR_MC6_SIZE_BIT		16
+#define RISCV_DBTR_MC6_TIMING_BIT	20
+#define RISCV_DBTR_MC6_SELECT_BIT	21
+#define RISCV_DBTR_MC6_HIT_BIT		22
+#define RISCV_DBTR_MC6_VU_BIT		23
+#define RISCV_DBTR_MC6_VS_BIT		24
+#if __riscv_xlen == 64
+#define RISCV_DBTR_MC6_DMODE_BIT	59
+#define RISCV_DBTR_MC6_TYPE_BIT		60
+#elif __riscv_xlen == 32
+#define RISCV_DBTR_MC6_DMODE_BIT	27
+#define RISCV_DBTR_MC6_TYPE_BIT		28
+#else
+#error "Unknown riscv xlen"
+#endif
+
+#define RISCV_DBTR_MC6_LOAD_BIT_MASK	BIT(RISCV_DBTR_MC6_LOAD_BIT)
+#define RISCV_DBTR_MC6_STORE_BIT_MASK	BIT(RISCV_DBTR_MC6_STORE_BIT)
+#define RISCV_DBTR_MC6_EXEC_BIT_MASK	BIT(RISCV_DBTR_MC6_EXEC_BIT)
+#define RISCV_DBTR_MC6_U_BIT_MASK	BIT(RISCV_DBTR_MC6_U_BIT)
+#define RISCV_DBTR_MC6_S_BIT_MASK	BIT(RISCV_DBTR_MC6_S_BIT)
+#define RISCV_DBTR_MC6_RES2_BIT_MASK	BIT(RISCV_DBTR_MC6_RES2_BIT)
+#define RISCV_DBTR_MC6_M_BIT_MASK	BIT(RISCV_DBTR_MC6_M_BIT)
+#define RISCV_DBTR_MC6_MATCH_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_MATCH_BIT + 3, RISCV_DBTR_MC6_MATCH_BIT)
+#define RISCV_DBTR_MC6_CHAIN_BIT_MASK	BIT(RISCV_DBTR_MC6_CHAIN_BIT)
+#define RISCV_DBTR_MC6_ACTION_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_ACTION_BIT + 3, RISCV_DBTR_MC6_ACTION_BIT)
+#define RISCV_DBTR_MC6_SIZE_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_SIZE_BIT + 3, RISCV_DBTR_MC6_SIZE_BIT)
+#define RISCV_DBTR_MC6_TIMING_BIT_MASK	BIT(RISCV_DBTR_MC6_TIMING_BIT)
+#define RISCV_DBTR_MC6_SELECT_BIT_MASK	BIT(RISCV_DBTR_MC6_SELECT_BIT)
+#define RISCV_DBTR_MC6_HIT_BIT_MASK	BIT(RISCV_DBTR_MC6_HIT_BIT)
+#define RISCV_DBTR_MC6_VU_BIT_MASK	BIT(RISCV_DBTR_MC6_VU_BIT)
+#define RISCV_DBTR_MC6_VS_BIT_MASK	BIT(RISCV_DBTR_MC6_VS_BIT)
+#define RISCV_DBTR_MC6_DMODE_BIT_MASK	BIT(RISCV_DBTR_MC6_DMODE_BIT)
+#define RISCV_DBTR_MC6_TYPE_BIT_MASK	\
+	GENMASK(RISCV_DBTR_MC6_TYPE_BIT + 3, RISCV_DBTR_MC6_TYPE_BIT)
+
+#define RISCV_DBTR_SET_TDATA1_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (td1t1) = (_t1);				\
+		(td1t1) &= ~RISCV_DBTR_TDATA1_TYPE_BIT_MASK;		\
+		(td1t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_TDATA1_TYPE_BIT)		\
+			    & RISCV_DBTR_TDATA1_TYPE_BIT_MASK);		\
+		(td1t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mct1) = (_t1);				\
+		(mct1) &= ~RISCV_DBTR_MC_TYPE_BIT_MASK;			\
+		(mct1) |= (((unsigned long)(_type)			\
+			    << RISCV_DBTR_MC_TYPE_BIT)			\
+			   & RISCV_DBTR_MC_TYPE_BIT_MASK);		\
+		(mct1);							\
+	})
+
+#define RISCV_DBTR_SET_MC6_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mc6t1) = (_t1);				\
+		(mc6t1) &= ~RISCV_DBTR_MC6_TYPE_BIT_MASK;		\
+		(mc6t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_MC6_TYPE_BIT)		\
+			    & RISCV_DBTR_MC6_TYPE_BIT_MASK);		\
+		(mc6t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_EXEC_BIT(_t1)			\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_EXEC_BIT)
+
+#define RISCV_DBTR_SET_MC_LOAD_BIT(_t1)			\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_LOAD_BIT)
+
+#define RISCV_DBTR_SET_MC_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC_STORE_BIT)
+
+#define RISCV_DBTR_SET_MC_SIZELO(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcslt1) = (_t1);				\
+		mcslt1 &= ~RISCV_DBTR_MC_SIZELO_BIT_MASK;		\
+		mcslt1 |= (((_val) << RISCV_DBTR_MC_SIZELO_BIT)		\
+			   & RISCV_DBTR_MC_SIZELO_BIT_MASK);		\
+		(mcslt1);						\
+	})
+
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcsht1) = (_t1);				\
+		mcsht1 &= ~RISCV_DBTR_MC_SIZEHI_BIT_MASK;		\
+		mcsht1 |= (((_val) << RISCV_DBTR_MC_SIZEHI_BIT)		\
+			   & RISCV_DBTR_MC_SIZEHI_BIT_MASK);		\
+		(mcsht1);						\
+	})
+#else
+/* SIZEHI does not exist in the rv32 mcontrol layout; nothing to set. */
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val) ((void)(_val), (_t1))
+#endif
+
+#define RISCV_DBTR_SET_MC6_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_EXEC_BIT)
+
+#define RISCV_DBTR_SET_MC6_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_LOAD_BIT)
+
+#define RISCV_DBTR_SET_MC6_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, RISCV_DBTR_MC6_STORE_BIT)
+
+#define RISCV_DBTR_SET_MC6_SIZE(_t1, _val)				\
+	({								\
+		typeof(_t1) (mc6szt1) = (_t1);				\
+		(mc6szt1) &= ~RISCV_DBTR_MC6_SIZE_BIT_MASK;		\
+		(mc6szt1) |= (((_val) << RISCV_DBTR_MC6_SIZE_BIT)	\
+			      & RISCV_DBTR_MC6_SIZE_BIT_MASK);		\
+		(mc6szt1);						\
+	})
+
+struct arch_hw_breakpoint {
+	unsigned long address;
+	unsigned long len;
+	unsigned int type;
+
+	/* Trigger configuration data */
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct perf_event_attr;
+struct notifier_block;
+struct perf_event;
+struct pt_regs;
+
+int hw_breakpoint_slots(int type);
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw);
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data);
+
+void arch_enable_hw_breakpoint(struct perf_event *bp);
+void arch_update_hw_breakpoint(struct perf_event *bp);
+void arch_disable_hw_breakpoint(struct perf_event *bp);
+int arch_install_hw_breakpoint(struct perf_event *bp);
+void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+void hw_breakpoint_pmu_read(struct perf_event *bp);
+
+#else
+
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+#endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
index 85ac00411f6e..53e989781aa1 100644
--- a/arch/riscv/include/asm/kdebug.h
+++ b/arch/riscv/include/asm/kdebug.h
@@ -6,7 +6,8 @@
 enum die_val {
 	DIE_UNUSED,
 	DIE_TRAP,
-	DIE_OOPS
+	DIE_OOPS,
+	DIE_DEBUG
 };
 
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index cabb99cadfb6..590a280762c9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
new file mode 100644
index 000000000000..fc54a1a897c5
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,678 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/spinlock.h>
+#include <linux/percpu.h>
+#include <linux/kdebug.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
+
+#include <asm/sbi.h>
+
+/* Registered per-cpu bp/wp */
+static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[RISCV_HW_BP_NUM_MAX]);
+static DEFINE_PER_CPU(unsigned long, ecall_lock_flags);
+static DEFINE_PER_CPU(raw_spinlock_t, ecall_lock);
+
+/* Per-cpu shared memory between S and M mode */
+static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
+
+/* number of debug triggers on this cpu . */
+static int dbtr_total_num __ro_after_init;
+static int dbtr_type __ro_after_init;
+static int dbtr_init __ro_after_init;
+
+#define MEM_HI(_m)	((unsigned long)upper_32_bits(_m))
+#define MEM_LO(_m)	((unsigned long)lower_32_bits(_m))
+
+static int arch_smp_setup_sbi_shmem(unsigned int cpu)
+{
+	union sbi_dbtr_shmem_entry *dbtr_shmem;
+	phys_addr_t shmem_pa;
+	struct sbiret ret;
+
+	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
+	if (!dbtr_shmem) {
+		pr_err("Invalid per-cpu shared memory for debug triggers\n");
+		return -ENODEV;
+	}
+
+	shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("%s: failed to setup shared memory. error: %ld\n",
+			__func__, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
+
+	return 0;
+}
+
+static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
+{
+	struct sbiret ret;
+
+	/* Disable shared memory */
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
+
+	if (ret.error)
+		pr_warn("%s: failed to disable shared memory. error: %ld\n",
+			__func__, ret.error);
+	else
+		pr_info("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
+
+	return 0;
+}
+
+static void init_sbi_dbtr(void)
+{
+	unsigned long tdata1;
+	struct sbiret ret;
+
+	if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
+		pr_warn("SBI_EXT_DBTR is not supported\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			0, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect triggers\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol6 triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 6 triggers not available\n");
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
+		pr_warn("Mcontrol6 trigger available.\n");
+		goto done;
+	}
+
+	/* fallback to type 2 triggers if type 6 is not available */
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 2 triggers not available\n");
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
+		goto done;
+	}
+
+done:
+	dbtr_init = 1;
+}
+
+int hw_breakpoint_slots(int type)
+{
+	/*
+	 * We can be called early, so don't rely on
+	 * static variables being initialised.
+	 */
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	return dbtr_total_num;
+}
+
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
+{
+	unsigned int len;
+	unsigned long va;
+
+	va = hw->address;
+	len = hw->len;
+
+	return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);
+}
+
+static int rv_init_mcontrol_trigger(const struct perf_event_attr *attr,
+				    struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/*
+		 * Userspace debuggers can request execute breakpoints with
+		 * bp_len == 2 for compressed/non-aligned instruction
+		 * addresses. Program execute triggers with "match any size"
+		 * to avoid missing valid instruction fetches.
+		 */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+			break;
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_DMODE_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_TIMING_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_SELECT_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_ACTION_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_CHAIN_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_MATCH_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_M_BIT);
+
+	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_S_BIT);
+	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_U_BIT);
+
+	return 0;
+}
+
+static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
+				     struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC6_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/* See rv_init_mcontrol_trigger() for rationale. */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC6_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_DMODE_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_TIMING_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_SELECT_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_ACTION_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_CHAIN_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_MATCH_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_M_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VS_BIT);
+	CLEAR_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_VU_BIT);
+
+	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
+	SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);
+
+	return 0;
+}
+
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	int ret;
+
+	/* Breakpoint address */
+	hw->address = attr->bp_addr;
+	hw->tdata2 = attr->bp_addr;
+	hw->tdata3 = 0x0;
+
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+		ret = rv_init_mcontrol_trigger(attr, hw);
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		ret = rv_init_mcontrol6_trigger(attr, hw);
+		break;
+	default:
+		pr_warn("Unsupported trigger type\n");
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * HW Breakpoint/watchpoint handler
+ */
+static int hw_breakpoint_handler(struct die_args *args)
+{
+	int ret = NOTIFY_DONE;
+	struct arch_hw_breakpoint *bp;
+	struct perf_event *event;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		event = this_cpu_read(pcpu_hw_bp_events[i]);
+		if (!event)
+			continue;
+
+		bp = counter_arch_bp(event);
+		switch (bp->type) {
+		/* Breakpoint */
+		case RISCV_DBTR_EXEC:
+			if (bp->address == args->regs->epc) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+
+		/* Watchpoint */
+		case RISCV_DBTR_LOAD:
+		case RISCV_DBTR_STORE:
+		case RISCV_DBTR_LDST:
+		{
+			unsigned long stval = args->regs->badaddr;
+			unsigned long bp_start = bp->address;
+			unsigned long bp_len = bp->len ?: 1;
+			unsigned long bp_end = bp_start + bp_len - 1;
+			unsigned long stval_end = stval + sizeof(long) - 1;
+			unsigned long tdata1;
+			bool hit = false;
+			struct sbiret sret;
+			union sbi_dbtr_shmem_entry *shmem;
+
+			if (bp_end < bp_start)
+				bp_end = ~0UL;
+			if (stval_end < stval)
+				stval_end = ~0UL;
+
+			/*
+			 * Prefer tdata1.hit from SBI trigger readout whenever
+			 * possible. Fall back to address-based matching if HIT
+			 * isn't observed/supported.
+			 */
+			raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+					      *this_cpu_ptr(&ecall_lock_flags));
+			shmem = this_cpu_ptr(sbi_dbtr_shmem);
+			sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+					 i, 1, 0, 0, 0, 0);
+			if (!sret.error) {
+				tdata1 = le_to_cpu(shmem->data.tdata1);
+
+				if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL)
+					hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
+				else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
+					hit = !!(tdata1 & RISCV_DBTR_MC6_HIT_BIT_MASK);
+			}
+			raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+						   *this_cpu_ptr(&ecall_lock_flags));
+
+			/*
+			 * Sdtrig may report STVAL as the lowest accessed
+			 * address while the watchpoint can match a higher byte
+			 * in the same access.
+			 */
+			if (hit ||
+			    (stval >= bp_start && stval <= bp_end) ||
+			    (bp_start >= stval && bp_start <= stval_end)) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+		}
+
+		default:
+			pr_warn("Unknown type: %u\n", bp->type);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data)
+{
+	if (val != DIE_DEBUG)
+		return NOTIFY_DONE;
+
+	return hw_breakpoint_handler(data);
+}
+
+/* atomic: counter->ctx->lock is held */
+int arch_install_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct sbi_dbtr_id_msg *recv;
+	struct perf_event **slot;
+	unsigned long idx;
+	struct sbiret ret;
+	int err = 0;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	xmit = &shmem->data;
+	recv = &shmem->id;
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
+			1, 0, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger\n");
+		err = sbi_err_map_linux_errno(ret.error);
+		goto done;
+	}
+
+	idx = le_to_cpu(recv->idx);
+	if (idx >= dbtr_total_num) {
+		pr_warn("Invalid trigger index %lu\n", idx);
+		err = -EINVAL;
+		goto done;
+	}
+
+	slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
+	if (*slot) {
+		pr_warn("Slot %lu is in use\n", idx);
+		err = -EBUSY;
+		goto done;
+	}
+
+	/* Save the event - to be looked up in handler */
+	*slot = event;
+
+done:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	return err;
+}
+
+/* atomic: counter->ctx->lock is held */
+void arch_uninstall_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event) {
+			*slot = NULL;
+			break;
+		}
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+	struct perf_event **slot;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger %d\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
+
+void arch_update_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	xmit = &shmem->data;
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("Failed to update trigger %d.\n", i);
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
+
+void arch_disable_hw_breakpoint(struct perf_event *event)
+{
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
+
+void hw_breakpoint_pmu_read(struct perf_event *bp) { }
+
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
+
+static int __init arch_hw_breakpoint_init(void)
+{
+	unsigned int cpu;
+	int rc = 0;
+
+	for_each_possible_cpu(cpu)
+		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	if (dbtr_total_num) {
+		pr_info("Total number of type %d triggers: %u\n",
+			dbtr_type, dbtr_total_num);
+	} else {
+		pr_info("No hardware triggers available\n");
+		goto out;
+	}
+
+	/* Allocate per-cpu shared memory */
+	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
+					PAGE_SIZE);
+
+	if (!sbi_dbtr_shmem) {
+		pr_warn("Failed to allocate shared memory.\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Hotplug handler to register/unregister shared memory with SBI */
+	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			       "riscv/hw_breakpoint:prepare",
+			       arch_smp_setup_sbi_shmem,
+			       arch_smp_teardown_sbi_shmem);
+
+	if (rc < 0) {
+		pr_warn("Failed to setup CPU hotplug state\n");
+		free_percpu(sbi_dbtr_shmem);
+		return rc;
+	}
+ out:
+	return rc;
+}
+arch_initcall(arch_hw_breakpoint_init);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..029fd66a285e 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -286,6 +286,12 @@ void handle_break(struct pt_regs *regs)
 	if (probe_breakpoint_handler(regs))
 		return;
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+	    == NOTIFY_STOP)
+		return;
+#endif
+
 	current->thread.bad_cause = regs->cause;
 
 	if (user_mode(regs))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
