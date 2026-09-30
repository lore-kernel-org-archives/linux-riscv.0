Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB1CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7zHTT1qksIe5DC2jV/6XJIYfuCtwMp9Tvs0pXOFkvA=; b=uF+qowNIai13ys
	pOLX66qxAwosG1g9lUlcBOQ/44lYBr8b9imFvWg+fZDw6Mp06jvP8z+1eFxNqWmHPEnAh9YmdeCvb
	6QIQTnEaFgsQd68Gk703xrbf+/bzVAR4h71Ncz81ru2DjccEmcfG5sgsPYRaL3APnwBPPMkRN9GDJ
	4qQL80yUnUjRkkQiA1UE2C7eODRzLYgD5u4FQPSdPyKjdGSg0X6QEIB3A1rJFebjzBcGpMrLCfLKI
	HbfFWlQJ7r6ULAzWhf0FMgMNgcytWlJP1hGi5QLTl81DU2QxcK9/hE1xuzISfHc9HvOBysiKvNYkG
	4Y35F8NIdNMX76Hns+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyf-00000005A6b-0F6D;
	Wed, 30 Sep 2026 06:39:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyc-00000005A5g-0GGs
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:39:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1Brmh1967455
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5ZZaESGLKRG
	RLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=; b=DU6cKpdr9JziYA+f/jMU6sxrjNr
	G+Zn1PF8FFEJYjeog0vm5jW/Pw6vh3UIO5Oc9OKjUzIYw/7U18E3F3MdPtxifPwP
	wiKiORPmUoyZ3BPJYyURQGd8tDFAcZI0JbTpB1zOnRln0JqqH23GfoAVphGxZTKZ
	Z7MqSDk7odbAC1/OQBpN1GU25b/JOflPjQYMu5Xp2F4BpD1RpM3BhNJEF1diXjqr
	MelEXljKSFk7DLOqfsO9HT9U39Mvu3Slyw2HtbRWXEI0N+x/KdhayFSiXTvaIuVf
	MJCD0lrWLtxKcXgpuwv/xib9cnd+Hwr3/CaWzPn5tDrgwHGwpSCYHUMsBLg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2s917-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d18eee3dfso322473eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750376; x=1791355176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZZaESGLKRGRLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=;
        b=jzfVi3lVwJlY4JC30VqSfLRPS06UzdvQqBTEwRh2g10PBAKLQDJrY8EFbFOR+jWLf6
         6kSarzMBQVfxbyUtQ018s+zBY9UuGfbxZJR+DQrkhZCG3UeG8AcsJb6Fh7JjPFI5SZkV
         ND9I/XHonUcj8I0FxoS1t/GuHGvFmXiF5a4BBcSl1WrTFly76OzeTeDTyBcV25aI8vyO
         PSyW+16sp/P9qNb6yljFodGr8dzsckETUSzxz8ie2UTaMwR3Pl7yK+xqpksCsheTQR/Q
         enemu4BFDFn8N9CHjDDfWGuls3XJGuSicbKuTWMrmqV32lHqrdeQXBqJmj+w5YDYqMIR
         N/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750376; x=1791355176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZZaESGLKRGRLOjYU42IQLznpJTnyGsm5Bd30n0iDFk=;
        b=XWXcKxPVts+xrjts8hm6GumUHBvSu89Sfdaq4NHVTinOabiILjrpmpr5Ej84qCMMRJ
         ydgMSdJxLeV+xsT8L+3A1ctzWrNHkuIQfgCpVlGcEo5asPaX5t8THLSR6mwbvT9+9LXO
         l2Lfl6i7IEn7z8mthuZjMCjkNVC0Qr3rpEcMg8geAAaN6lcejuH43scC0Lr/qQI03W5C
         MgfCw2LrcWCdZie4j8dRbQh7ZA/Sexe0ljEsf3Whz2VUtz4DBN0v1Gar/oTp/gbFuYaL
         C9bTECqPxgjHKsmIaWjHHomoX7hhXS24hPx1z4QQArV6p5l8ekq6erVh6z9mPbxgclg6
         jUBA==
X-Forwarded-Encrypted: i=1; AKwUvBy5fT9iu8+1f6n1BKpJGN9KQjwa8MBGvPhS+w6XkkqZ2xtr6NKZy6nstTnyUT2oGN7iDcxlaL32YRT7cw==@lists.infradead.org
X-Gm-Message-State: AFuF++nh6FEjL7d7x6uYEptLhlT3eBQ5t49ZOoptOtq5qGQ+vYKgoHHS
	iI8IEZ05TWDN3R2EyYkMfHGnfBPaue1g2wBykBXFdreMpY0NESuCm5NwpX5tnk7bIEfanVKO41l
	ZMuWvrku9EzXBNLT8mbLkzO2ZBjo537ngkK+Ll7ULpaGSNMRH6LXSnj2Q871LQhXJZRYD5MU=
X-Gm-Gg: AYBFou2l3cmpwrVxJdMMvqSahgzIfC5GLJQ24q098pNuKOzGkNqe7z9Ts1F83dGlFdW
	zXbPojYlSZLymF3PmIh0FXJj6sL8XtKivmm3xcrhbRBwLgXGBNtUq/6TainLqeFsBolJSKGb34C
	nPblcbF5lg47fFyLcFXmnEhgnKlzqCoYAGE/NCIXaE62IqVRvWMSY2mmlBWemB/IFKxzghYHxM8
	CoBe9j+V2E3zJELdqdPU2nK/QNyDSgbByRQU36G9JO8zo6LxZOWHkgDQz2M79iZ+hXQIUurpfbg
	qpbsqanllhucsdrE4yF3bpb6IsmVKk+E03Zlib7HAopTbcODqC/1tUjUAwl1I197ONWgrk9lN2Q
	mw9XI69shuH/7Ri9ac+L/40xgMBMf+YvdiEUMsaFVmXGHBNoLL9ax9txjm6AhkhQ8tH5f85XoFN
	eNp0Uv8CXKFEydQEXQ8J4G9x9X
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr230598c88.36.1790750375504;
        Tue, 29 Sep 2026 23:39:35 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr230562c88.36.1790750374688;
        Tue, 29 Sep 2026 23:39:34 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:34 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 1/8] riscv: Introduce support for hardware break/watchpoints
Date: Wed, 30 Sep 2026 12:09:12 +0530
Message-ID: <20260930063919.608911-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: JN8-TJMEylAA3UUcR5yTyQ_Nr9VFV9Jt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX1FgfSk6X1Kvl
 Wu0IPMNvp1GzeF2xedvAUgG2b+p8sk4AIZsZzyNFP0LmvFBym/SHfq/rLwpuY3EaQbhreog0IyN
 AauOIABolRwP3+sI31BngLl/YcZ/f0usr/FH5Jkr6GHEUq5x0MnIQOaxkO/XK08jG1jahpWbib5
 Z3rkOoaW3qc5a6hkGsbHg30bqME/Yzb387KYsMF4qlIbx6q8QRVpAT0M4FiVDXZTmexCxh3c2rG
 zhzPuXU6HLr8jbSFJ2Xw6L2RaRVzV87CWtKBgPjBfaqeOfvTtOIhI3juHCQpl2ALUJHe379Db6q
 17r0FQhssYLczjgdMNuB9LMANJ/chJk84jH5QiyyCa+U1HPFR7jRUBwwvho2nlnF+eIBEfGoVGZ
 OekQZFzh26cC2RcDU8rmrEEIlNZJQitH4eGoPeH/sFjX/6ht5jvfc491TNXsgGg7YcewSTk4RSx
 3LuXZVpu5aYSxc+zz9g==
X-Proofpoint-GUID: JN8-TJMEylAA3UUcR5yTyQ_Nr9VFV9Jt
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abcaea9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oxkvXMDg2opwoU6JHakA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX2JyJftBZEsHx
 k7N7UXy1qsDGAWaBnrdpSlY2kLZ4FdBzXLZyQrt+5PqK2SI/dCqRhsolv2jq1p/iOmiBqf1OWEH
 lQy0vvRGzu3OcPB0Qkp1I84VjIcuOok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_233938_257375_216B627F 
X-CRM114-Status: GOOD (  19.84  )
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
and uses SBI debug trigger extension to install/uninstall/update/enable/disable
hardware triggers as specified in Sdtrig ISA extension.

While handling breakpoints, trust the hardware record, (hit[0-1]) bits, when deciding
if a trigger fired, and by clearing it once it's been read.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig                     |   2 +
 arch/riscv/include/asm/hw_breakpoint.h | 312 +++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 746 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 1069 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..17fa7d4f9729 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -174,6 +174,8 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_VDSO if MMU
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..a165bb9636de
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,312 @@
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
+/*
+ * mcontrol6 hit1:hit0 (ratified Debug spec v1.0). RISCV_DBTR_MC6_HIT_BIT
+ * above is hit0 (bit 22); hit1 (bit 25) is not adjacent to it but combines
+ * with it into a single 2-bit field, hit1 as MSB.
+ */
+#define RISCV_DBTR_MC6_HIT1_BIT		25
+#define RISCV_DBTR_MC6_HIT1_BIT_MASK		BIT(RISCV_DBTR_MC6_HIT1_BIT)
+
+#define RISCV_DBTR_MC6_HIT_FALSE	0	/* trigger did not fire */
+#define RISCV_DBTR_MC6_HIT_BEFORE	1	/* fired before the instruction */
+#define RISCV_DBTR_MC6_HIT_AFTER	2	/* fired after, epc has moved past */
+#define RISCV_DBTR_MC6_HIT_IMM_AFTER	3	/* fired immediately after */
+
+#define RISCV_DBTR_MC6_GET_HIT(_t1)					\
+	({								\
+		typeof(_t1) __t1 = (_t1);				\
+		(((__t1) & RISCV_DBTR_MC6_HIT1_BIT_MASK) ? 2 : 0) |	\
+			(((__t1) & RISCV_DBTR_MC6_HIT_BIT_MASK) ? 1 : 0); \
+	})
+
+#define RISCV_DBTR_MC6_CLEAR_HIT(_t1)					\
+	((_t1) &= ~(RISCV_DBTR_MC6_HIT1_BIT_MASK | RISCV_DBTR_MC6_HIT_BIT_MASK))
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
index ebe1c3588177..a4197c3c36e8 100644
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
index 000000000000..c2ab5e6008e7
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,746 @@
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
+#define MEM_HI(_m)		(0UL)
+#define MEM_LO(_m)		((unsigned long)(_m))
+
+static int arch_smp_setup_sbi_shmem(unsigned int cpu)
+{
+	union sbi_dbtr_shmem_entry *dbtr_shmem;
+	phys_addr_t shmem_pa;
+	struct sbiret ret;
+
+	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
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
+		dbtr_total_num = min_t(unsigned long, ret.value,
+				       RISCV_HW_BP_NUM_MAX);
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
+		dbtr_total_num = min_t(unsigned long, ret.value,
+				       RISCV_HW_BP_NUM_MAX);
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
+	/*
+	 * Match only the trigger's actual privilege-mode target. Setting
+	 * both bits makes the kernel's own S-mode uaccess (e.g. SUM-enabled
+	 * loads in strncpy_from_user()) spuriously fire a user-space watch.
+	 */
+	if (arch_check_bp_in_kernelspace(hw))
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_S_BIT);
+	else
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC_U_BIT);
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
+	/* See rv_init_mcontrol_trigger() for rationale. */
+	if (arch_check_bp_in_kernelspace(hw))
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_S_BIT);
+	else
+		SET_DBTR_BIT(hw->tdata1, RISCV_DBTR_MC6_U_BIT);
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
+ * Read mcontrol6's hit1:hit0 field for trigger @idx. If either bit is set,
+ * clear it in hardware (the Debug spec requires the trigger user to do
+ * this; hardware only ever sets it). Returns the RISCV_DBTR_MC6_HIT_*
+ * value read (RISCV_DBTR_MC6_HIT_FALSE if unimplemented or unfired).
+ */
+static unsigned int mc6_read_and_clear_hit(int idx)
+{
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	unsigned long tdata1, tdata2, tdata3;
+	struct sbiret ret;
+	unsigned int hit;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ, idx, 1, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to read trigger %d. error: %ld\n", idx, ret.error);
+		hit = RISCV_DBTR_MC6_HIT_FALSE;
+		goto out;
+	}
+
+	tdata1 = le_to_cpu(shmem->data.tdata1);
+	hit = RISCV_DBTR_MC6_GET_HIT(tdata1);
+	if (hit == RISCV_DBTR_MC6_HIT_FALSE)
+		goto out;
+
+	tdata2 = le_to_cpu(shmem->data.tdata2);
+	tdata3 = le_to_cpu(shmem->data.tdata3);
+	RISCV_DBTR_MC6_CLEAR_HIT(tdata1);
+
+	xmit = &shmem->data;
+	xmit->tdata1 = cpu_to_le(tdata1);
+	xmit->tdata2 = cpu_to_le(tdata2);
+	xmit->tdata3 = cpu_to_le(tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE, idx, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("Failed to clear hit bits on trigger %d. error: %ld\n",
+			idx, ret.error);
+
+out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	return hit;
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
+		case HW_BREAKPOINT_X:
+		{
+			bool hit = bp->address == args->regs->epc;
+
+			if (!hit && dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
+				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+
+			if (hit) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+		}
+
+		/* Watchpoint */
+		case HW_BREAKPOINT_W:
+		case HW_BREAKPOINT_R:
+		case HW_BREAKPOINT_RW:
+		{
+			unsigned long stval = args->regs->badaddr;
+			unsigned long bp_start = bp->address;
+			unsigned long bp_len = bp->len ?: 1;
+			unsigned long bp_end = bp_start + bp_len - 1;
+			unsigned long stval_end = stval + sizeof(long) - 1;
+			bool hit = false;
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
+			if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL) {
+				unsigned long tdata1;
+				struct sbiret sret;
+				union sbi_dbtr_shmem_entry *shmem;
+
+				raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+						      *this_cpu_ptr(&ecall_lock_flags));
+				shmem = this_cpu_ptr(sbi_dbtr_shmem);
+				sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+						 i, 1, 0, 0, 0, 0);
+				if (!sret.error) {
+					tdata1 = le_to_cpu(shmem->data.tdata1);
+					hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
+				}
+				raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+							   *this_cpu_ptr(&ecall_lock_flags));
+			} else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6) {
+				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+			}
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
+	struct sbi_dbtr_id_msg *id;
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
+	id = &shmem->id;
+	xmit = &shmem->data;
+	id->idx = cpu_to_le(i);
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
+			1, 0, 0, 0, 0, 0);
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
index f8292adda099..1b9ccc0b6b8d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -287,6 +287,12 @@ void handle_break(struct pt_regs *regs)
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
