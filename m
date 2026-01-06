Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7935EC47BC4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuHymVmAe1CiE4oshMuvOpSyHgwuGjHzjS+iqYyhxlw=; b=zjnFB+by3X9MIT
	71eK3qTVp77W8qlrHPgYN4EJDLwc0nL2tldJhcbrQDnDukjG394jFXgJmrCmODMMHK+0U2K5YoOcl
	BMwSEVPQg9culMQPLht2cmiTZzygr1Yo+RQo/pbvbHDJDAoRkq8k89P5UECWl3thuxwj17u/5jQY3
	TaWAeHJEVrchSHRIQin4/nDHYSBzU+jerrNgy2IEHRkB6usRWbon3yLLduthwaj+datTF9i7rcotK
	ag1fsXPKP68ZUFE0t8JBNvi8JmMnPT/PF+YPTLpK5XXSqf0nUOExZ2m45u07+RlLu+oj2G9z7rVob
	10c6AC2ghR8XZxu4Lqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2Iy-0000000CbOE-3mKg;
	Tue, 06 Jan 2026 08:20:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2Iw-0000000CbNL-0QpC
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 08:20:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QABw3214047
	for <linux-riscv@lists.infradead.org>; Tue, 6 Jan 2026 08:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/8xr4d82DPf
	XPywn43EU8d0O8/KNcU86MOBhky+5HbM=; b=cZE0bcQj9YaptYGA3MAdL1USKrN
	GJfex4F6l9mTUbLy1YQEGk+l2YKen8GZNZjQGTC2puHEiRuoftWkHMoD91bNRKgn
	LYdNi4wlihCnrki+HQR6oJuGGjPKU4zjA1M2lw/ZiKFcsliRg/2ePAa4jJL7+gBj
	WM3gmUdlELGsSCaG1XCWLO0KPBL4iggagzpmBuVihmK3wpyCUz41Ig5ilGEmTKMp
	0xvsWcWGBzdKizYNGtW6zpMU2w71A6Fs1FpTzyxcyT0SyArrmVbQE7whaYCAT534
	6ErJPE4J1uhlWX2BMKIxd5Bk22c367GXVY99mMoH9V7CG1fsicI1j0qYL+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9bec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 08:20:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13cd9a784so8041655ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 00:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767687635; x=1768292435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8xr4d82DPfXPywn43EU8d0O8/KNcU86MOBhky+5HbM=;
        b=Dor9rggz/8pUahWxjsKITLPdA+X+G//RjAq5Aa7wPi4vEEfkUxybIU8mideBbCrZuM
         MY8XO2te2bvDpWNbhxUlnwuYoM2ryYQkYhd3A/fpc8E9efPYDKaCGcQWiaxODqOXoqgy
         SoOq2Qgemc/YWLyGHPqCvpsHH+ZktSJnxRukyKk3wEfNkJkFE71/o8WrFXnD1dc3L0Pv
         CA5MlCPRIC0iNYoFjMoj18J3sU3kG1NdIUODaOXIwbH1uD82D6O9eFc1OmSydp+xjL1b
         jtwzmuB2qA8jyjF0KeHmCX8qvSBNYddL4CCnAPgPqIjAV7mmpfKJpHGJFKBskpCS71WP
         IeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767687635; x=1768292435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8xr4d82DPfXPywn43EU8d0O8/KNcU86MOBhky+5HbM=;
        b=teeaJVSEH1OTwSLmGWB86d5GfoA9MI840co1Pca+ZLk/w3Px1CVnbWBvxJ+h8a0M3M
         vWAY7Qhvme+oAkIqqKVceBBBfLjyYCWcUMNp49sqiEO50KYQTK6VJnkpY9bEU5PVbcj0
         O5c6xF8HPUHoWKamqOOIreUUbEicAPHkmOorR0Xoa5wuL80aTT8rojaAzV/tyyrZJ9LV
         OUDBZbgSw3L6b48EIS+EGkSCHcGVVH3tAaIx2+iG+hzB23X+QftkW/9AETsxA2L9TqtQ
         DWKtrd8Xr+efkmtztgrFmzyDPIqr7/bnRnAsNOgqZYUvl5oKqRyMwWegh2HrA9WAsbB+
         sObA==
X-Gm-Message-State: AOJu0YzdI0TK/ZqyfE0jpSQEF7n135Lk9soLKOnxAMa710PytG5XZaxV
	2rz3Fjp7csJCsvznVDxNWfMdOvdhyg7KTaQMsE2w5aTXQm//yinT7hIbvcNWmMXEy3OD50AY7ar
	+uGflNmJMoeh6uRE8J/sn24Z1yFNdlaG44xkDZ+E6onyG7KYRPjCvmofgssDJOxRMZrULQCGvqI
	PbX5I=
X-Gm-Gg: AY/fxX6ay6Ru+N9v985uBpyEImZz0q9puc8mSZeSAXMSAfhd2E4U1WZ1CI8e5z5mhT9
	LXqeiUohGAMdqBfbPA4eqSN4v92uRJsrVdflRhM1HjQtt/2gNcSqcOXybmf3eXJHbGE/GY5Lfm9
	7yM8ALYXDiyj8Qp/GoO4fDrcKhlFeawWPEgZ2kMJstzLWnIgicxlxZz9DGVBnqF08HnzhtIt7u4
	/Pm/SgVogKeMGSWd32FwCRHXSt9JnOY/Y5kbA5VXu9X2mZZ2LyPlae1+Lukn4CASAfIX5rm9rOL
	ZU0MbMIXiaG9oa5255/AufuQ+ycc9FchAE07eeDBCXOWBEh0NXV9vyPfQvhp9+YFg4BSUmEgUon
	HTT9uIcUM80eG01/snL2pGYsncNgN1VdRAeMsm5SbY4P5td+B/jvpQIIIVvqlbjjOSOrWIQCDTI
	FGZr1Uj5od7Fxpjz1qwghwJEYXHzIP01MN0g==
X-Received: by 2002:a17:903:b4f:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a3e2df522bmr19112225ad.33.1767687634579;
        Tue, 06 Jan 2026 00:20:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC1dxNysbpxWcsdiD1ZGU+/ujOg32J0kfd0+TtIRDShoS0bVovrWj8huZyhl/46U3XOwRvqw==
X-Received: by 2002:a17:903:b4f:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a3e2df522bmr19111875ad.33.1767687633870;
        Tue, 06 Jan 2026 00:20:33 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3284sm14545575ad.91.2026.01.06.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:20:33 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] riscv: Introduce support for hardware break/watchpoints
Date: Tue,  6 Jan 2026 13:50:20 +0530
Message-ID: <20260106082021.2680658-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: lmG-MMHpQhq2ACa0xKhYhrqeUkzFfKFW
X-Proofpoint-GUID: lmG-MMHpQhq2ACa0xKhYhrqeUkzFfKFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2OSBTYWx0ZWRfXxxpeBpbjjkcK
 HIOt6EPDPe1aP0MSCb8AQFBgXizaOA31409ivBFqE5tfaVV5jTb0+bAcm5Ks1chXCKtnr5s8LUD
 0ySpcj/ZH1sG8nfPtr4m7mvFHzC2nk2hgmrq4rIoHC1eQ4szIY6tHHPpJjzg2InHfn5ROvtyDeA
 Ic3WKtBMn/fPLxQbPTEy9CzMLWEujJwzjBxjrUCdKU6Q2wdzhPYcPLZuIWs/szgU8NTOU9u+TGU
 xCHWpfCDYi445Yu56xmMT4Khc89mpfKXqLiNImXib2QJSpjfPdD3AsrXolxw3SsLMjZB6MtQbZV
 ZLAdfsN03AsPg9Q6fbN4BwdMGiHtLv76okFjdJX8TDwkP8epZGo2tajhNpkMG16HCoc2V8jLLPu
 1s68sdHg8Is7FRUcS2W1XHy5V+sLR5eib6oZwALoifCsvAs5TNX2cu+7cpC47lZIqHSwp8Xpwte
 CKjRU/v3AczhbPW2QJQ==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cc5d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NdCxyxYjUNQXf4Wx1tIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_002038_344837_9DF7CF5F 
X-CRM114-Status: GOOD (  17.52  )
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
 arch/riscv/include/asm/hw_breakpoint.h | 320 ++++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 657 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 987 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b39f37f769a..cb8b41afa31b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -170,6 +170,7 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..dcea3a278809
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,320 @@
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
+#define RV_DBTR_BIT(_prefix, _name)		\
+	RV_DBTR_##_prefix##_##_name##_BIT
+
+#define RV_DBTR_BIT_MASK(_prefix, _name)		\
+	RV_DBTR_##_prefix##_name##_BIT_MASK
+
+#define RV_DBTR_BIT_MASK_VAL(_prefix, _name, _width)	\
+	(((1UL << _width) - 1) << RV_DBTR_BIT(_prefix, _name))
+
+#define CLEAR_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__clear_bit(RV_DBTR_BIT(_prefix, _bit_name), &_target)
+
+#define SET_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__set_bit(RV_DBTR_BIT(_prefix, _bit_name), &_target)
+
+enum {
+	RV_DBTR_BP	= 0,
+	RV_DBTR_WP	= 1,
+};
+
+enum {
+	RV_DBTR_TRIG_NONE = 0,
+	RV_DBTR_TRIG_LEGACY,
+	RV_DBTR_TRIG_MCONTROL,
+	RV_DBTR_TRIG_ICOUNT,
+	RV_DBTR_TRIG_ITRIGGER,
+	RV_DBTR_TRIG_ETRIGGER,
+	RV_DBTR_TRIG_MCONTROL6,
+};
+
+/* Trigger Data 1 */
+enum {
+	RV_DBTR_BIT(TDATA1, DATA)   = 0,
+#if __riscv_xlen == 64
+	RV_DBTR_BIT(TDATA1, DMODE)  = 59,
+	RV_DBTR_BIT(TDATA1, TYPE)   = 60,
+#elif __riscv_xlen == 32
+	RV_DBTR_BIT(TDATA1, DMODE)  = 27,
+	RV_DBTR_BIT(TDATA1, TYPE)   = 28,
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+};
+
+enum {
+#if __riscv_xlen == 64
+	RV_DBTR_BIT_MASK(TDATA1, DATA) = RV_DBTR_BIT_MASK_VAL(TDATA1, DATA, 59),
+#elif __riscv_xlen == 32
+	RV_DBTR_BIT_MASK(TDATA1, DATA) = RV_DBTR_BIT_MASK_VAL(TDATA1, DATA,  27),
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+	RV_DBTR_BIT_MASK(TDAT1, DMODE) = RV_DBTR_BIT_MASK_VAL(TDATA1, DMODE, 1),
+	RV_DBTR_BIT_MASK(TDATA1, TYPE) = RV_DBTR_BIT_MASK_VAL(TDATA1, TYPE,  4),
+};
+
+/* MC - Match Control Type Register */
+enum {
+	RV_DBTR_BIT(MC, LOAD)     = 0,
+	RV_DBTR_BIT(MC, STORE)    = 1,
+	RV_DBTR_BIT(MC, EXEC)     = 2,
+	RV_DBTR_BIT(MC, U)        = 3,
+	RV_DBTR_BIT(MC, S)        = 4,
+	RV_DBTR_BIT(MC, RES2)     = 5,
+	RV_DBTR_BIT(MC, M)        = 6,
+	RV_DBTR_BIT(MC, MATCH)    = 7,
+	RV_DBTR_BIT(MC, CHAIN)    = 11,
+	RV_DBTR_BIT(MC, ACTION)   = 12,
+	RV_DBTR_BIT(MC, SIZELO)   = 16,
+	RV_DBTR_BIT(MC, TIMING)   = 18,
+	RV_DBTR_BIT(MC, SELECT)   = 19,
+	RV_DBTR_BIT(MC, HIT)      = 20,
+#if __riscv_xlen >= 64
+	RV_DBTR_BIT(MC, SIZEHI) = 21,
+#endif
+#if __riscv_xlen == 64
+	RV_DBTR_BIT(MC, MASKMAX) = 53,
+	RV_DBTR_BIT(MC, DMODE)   = 59,
+	RV_DBTR_BIT(MC, TYPE)    = 60,
+#elif __riscv_xlen == 32
+	RV_DBTR_BIT(MC, MASKMAX) = 21,
+	RV_DBTR_BIT(MC, DMODE)   = 27,
+	RV_DBTR_BIT(MC, TYPE)    = 28,
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+enum {
+	RV_DBTR_BIT_MASK(MC, LOAD) = RV_DBTR_BIT_MASK_VAL(MC, LOAD, 1),
+	RV_DBTR_BIT_MASK(MC, STORE) = RV_DBTR_BIT_MASK_VAL(MC, STORE, 1),
+	RV_DBTR_BIT_MASK(MC, EXEC) = RV_DBTR_BIT_MASK_VAL(MC, EXEC, 1),
+	RV_DBTR_BIT_MASK(MC, U) = RV_DBTR_BIT_MASK_VAL(MC, U, 1),
+	RV_DBTR_BIT_MASK(MC, S) = RV_DBTR_BIT_MASK_VAL(MC, S, 1),
+	RV_DBTR_BIT_MASK(MC, RES2) = RV_DBTR_BIT_MASK_VAL(MC, RES2, 1),
+	RV_DBTR_BIT_MASK(MC, M) = RV_DBTR_BIT_MASK_VAL(MC, M, 1),
+	RV_DBTR_BIT_MASK(MC, MATCH) = RV_DBTR_BIT_MASK_VAL(MC, MATCH, 4),
+	RV_DBTR_BIT_MASK(MC, CHAIN) = RV_DBTR_BIT_MASK_VAL(MC, CHAIN, 1),
+	RV_DBTR_BIT_MASK(MC, ACTION) = RV_DBTR_BIT_MASK_VAL(MC, ACTION, 4),
+	RV_DBTR_BIT_MASK(MC, SIZELO) = RV_DBTR_BIT_MASK_VAL(MC, SIZELO, 2),
+	RV_DBTR_BIT_MASK(MC, TIMING) = RV_DBTR_BIT_MASK_VAL(MC, TIMING, 1),
+	RV_DBTR_BIT_MASK(MC, SELECT) = RV_DBTR_BIT_MASK_VAL(MC, SELECT, 1),
+	RV_DBTR_BIT_MASK(MC, HIT) = RV_DBTR_BIT_MASK_VAL(MC, HIT, 1),
+#if __riscv_xlen >= 64
+	RV_DBTR_BIT_MASK(MC, SIZEHI) = RV_DBTR_BIT_MASK_VAL(MC, SIZEHI,  2),
+#endif
+	RV_DBTR_BIT_MASK(MC, MASKMAX) = RV_DBTR_BIT_MASK_VAL(MC, MASKMAX, 6),
+	RV_DBTR_BIT_MASK(MC, DMODE) = RV_DBTR_BIT_MASK_VAL(MC, DMODE, 1),
+	RV_DBTR_BIT_MASK(MC, TYPE) = RV_DBTR_BIT_MASK_VAL(MC, TYPE, 4),
+};
+
+/* MC6 - Match Control 6 Type Register */
+enum {
+	RV_DBTR_BIT(MC6, LOAD)    = 0,
+	RV_DBTR_BIT(MC6, STORE)   = 1,
+	RV_DBTR_BIT(MC6, EXEC)    = 2,
+	RV_DBTR_BIT(MC6, U)       = 3,
+	RV_DBTR_BIT(MC6, S)       = 4,
+	RV_DBTR_BIT(MC6, RES2)    = 5,
+	RV_DBTR_BIT(MC6, M)       = 6,
+	RV_DBTR_BIT(MC6, MATCH)   = 7,
+	RV_DBTR_BIT(MC6, CHAIN)   = 11,
+	RV_DBTR_BIT(MC6, ACTION)  = 12,
+	RV_DBTR_BIT(MC6, SIZE)    = 16,
+	RV_DBTR_BIT(MC6, TIMING)  = 20,
+	RV_DBTR_BIT(MC6, SELECT)  = 21,
+	RV_DBTR_BIT(MC6, HIT)     = 22,
+	RV_DBTR_BIT(MC6, VU)      = 23,
+	RV_DBTR_BIT(MC6, VS)      = 24,
+#if __riscv_xlen == 64
+	RV_DBTR_BIT(MC6, DMODE)   = 59,
+	RV_DBTR_BIT(MC6, TYPE)    = 60,
+#elif __riscv_xlen == 32
+	RV_DBTR_BIT(MC6, DMODE)   = 27,
+	RV_DBTR_BIT(MC6, TYPE)    = 28,
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+enum {
+	RV_DBTR_BIT_MASK(MC6, LOAD) = RV_DBTR_BIT_MASK_VAL(MC6, LOAD, 1),
+	RV_DBTR_BIT_MASK(MC6, STORE) = RV_DBTR_BIT_MASK_VAL(MC6, STORE,  1),
+	RV_DBTR_BIT_MASK(MC6, EXEC) = RV_DBTR_BIT_MASK_VAL(MC6, EXEC, 1),
+	RV_DBTR_BIT_MASK(MC6, U) = RV_DBTR_BIT_MASK_VAL(MC6, U, 1),
+	RV_DBTR_BIT_MASK(MC6, S) = RV_DBTR_BIT_MASK_VAL(MC6, S, 1),
+	RV_DBTR_BIT_MASK(MC6, RES2) = RV_DBTR_BIT_MASK_VAL(MC6, RES2, 1),
+	RV_DBTR_BIT_MASK(MC6, M) = RV_DBTR_BIT_MASK_VAL(MC6, M, 1),
+	RV_DBTR_BIT_MASK(MC6, MATCH) = RV_DBTR_BIT_MASK_VAL(MC6, MATCH, 4),
+	RV_DBTR_BIT_MASK(MC6, CHAIN) = RV_DBTR_BIT_MASK_VAL(MC6, CHAIN, 1),
+	RV_DBTR_BIT_MASK(MC6, ACTION) = RV_DBTR_BIT_MASK_VAL(MC6, ACTION, 4),
+	RV_DBTR_BIT_MASK(MC6, SIZE) = RV_DBTR_BIT_MASK_VAL(MC6, SIZE, 4),
+	RV_DBTR_BIT_MASK(MC6, TIMING) = RV_DBTR_BIT_MASK_VAL(MC6, TIMING, 1),
+	RV_DBTR_BIT_MASK(MC6, SELECT) = RV_DBTR_BIT_MASK_VAL(MC6, SELECT, 1),
+	RV_DBTR_BIT_MASK(MC6, HIT) = RV_DBTR_BIT_MASK_VAL(MC6, HIT, 1),
+	RV_DBTR_BIT_MASK(MC6, VU) = RV_DBTR_BIT_MASK_VAL(MC6, VU, 1),
+	RV_DBTR_BIT_MASK(MC6, VS) = RV_DBTR_BIT_MASK_VAL(MC6, VS, 1),
+#if __riscv_xlen == 64
+	RV_DBTR_BIT_MASK(MC6, DMODE) = RV_DBTR_BIT_MASK_VAL(MC6, DMODE, 1),
+	RV_DBTR_BIT_MASK(MC6, TYPE) = RV_DBTR_BIT_MASK_VAL(MC6, TYPE, 4),
+#elif __riscv_xlen == 32
+	RV_DBTR_BIT_MASK(MC6, DMODE) = RV_DBTR_BIT_MASK_VAL(MC6, DMODE, 1),
+	RV_DBTR_BIT_MASK(MC6, TYPE) = RV_DBTR_BIT_MASK_VAL(MC6, TYPE, 4),
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+#define RV_DBTR_SET_TDATA1_TYPE(_t1, _type)				\
+	do {								\
+		_t1 &= ~RV_DBTR_BIT_MASK(TDATA1, TYPE);			\
+		_t1 |= (((unsigned long)_type				\
+			 << RV_DBTR_BIT(TDATA1, TYPE))			\
+			& RV_DBTR_BIT_MASK(TDATA1, TYPE));		\
+	} while (0)
+
+#define RV_DBTR_SET_MC_TYPE(_t1, _type)				\
+	do {							\
+		_t1 &= ~RV_DBTR_BIT_MASK(MC, TYPE);		\
+		_t1 |= (((unsigned long)_type			\
+			 << RV_DBTR_BIT(MC, TYPE))		\
+			& RV_DBTR_BIT_MASK(MC, TYPE));		\
+	} while (0)
+
+#define RV_DBTR_SET_MC6_TYPE(_t1, _type)			\
+	do {							\
+		_t1 &= ~RV_DBTR_BIT_MASK(MC6, TYPE);		\
+		_t1 |= (((unsigned long)_type			\
+			 << RV_DBTR_BIT(MC6, TYPE))		\
+			& RV_DBTR_BIT_MASK(MC6, TYPE));		\
+	} while (0)
+
+#define RV_DBTR_SET_MC_EXEC(_t1)		\
+	SET_DBTR_BIT(_t1, MC, EXEC)
+
+#define RV_DBTR_SET_MC_LOAD(_t1)		\
+	SET_DBTR_BIT(_t1, MC, LOAD)
+
+#define RV_DBTR_SET_MC_STORE(_t1)		\
+	SET_DBTR_BIT(_t1, MC, STORE)
+
+#define RV_DBTR_SET_MC_SIZELO(_t1, _val)			\
+	do {							\
+		_t1 &= ~RV_DBTR_BIT_MASK(MC, SIZELO);		\
+		_t1 |= ((_val << RV_DBTR_BIT(MC, SIZELO))	\
+			& RV_DBTR_BIT_MASK(MC, SIZELO));	\
+	} while (0)
+
+#define RV_DBTR_SET_MC_SIZEHI(_t1, _val)			\
+	do {							\
+		_t1 &= ~RV_DBTR_BIT_MASK(MC, SIZEHI);		\
+		_t1 |= ((_val << RV_DBTR_BIT(MC, SIZEHI))	\
+			& RV_DBTR_BIT_MASK(MC, SIZEHI));	\
+	} while (0)
+
+#define RV_DBTR_SET_MC6_EXEC(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, EXEC)
+
+#define RV_DBTR_SET_MC6_LOAD(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, LOAD)
+
+#define RV_DBTR_SET_MC6_STORE(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, STORE)
+
+#define RV_DBTR_SET_MC6_SIZE(_t1, _val)				\
+	do {							\
+		_t1 &= ~RV_DBTR_BIT_MASK(MC6, SIZE);		\
+		_t1 |= ((_val << RV_DBTR_BIT(MC6, SIZE))	\
+			& RV_DBTR_BIT_MASK(MC6, SIZE));		\
+	} while (0)
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
+/* Maximum number of hardware breakpoints supported */
+#define HW_BP_NUM_MAX 32
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
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
+
+#else
+
+int hw_breakpoint_slots(int type)
+{
+	return 0;
+}
+
+static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_update_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_disable_hw_breakpoint(struct perf_event *bp)
+{
+}
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
index f60fce69b725..486ba6a12664 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
new file mode 100644
index 000000000000..bf26ba6d9a19
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
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
+static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[HW_BP_NUM_MAX]);
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
+#if __riscv_xlen == 64
+#define MEM_HI(_m)	0
+#define MEM_LO(_m)	((u64)_m)
+#elif __riscv_xlen == 32
+#define MEM_HI(_m)	((u64)_m >> 32)
+#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
+#else
+#error "Unknown __riscv_xlen"
+#endif
+
+static int arch_smp_setup_sbi_shmem(unsigned int cpu)
+{
+	union sbi_dbtr_shmem_entry *dbtr_shmem;
+	unsigned long shmem_pa;
+	struct sbiret ret;
+	int rc = 0;
+
+	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
+	if (!dbtr_shmem) {
+		pr_err("Invalid per-cpu shared memory for debug triggers\n");
+		return -ENODEV;
+	}
+
+	shmem_pa = __pa(dbtr_shmem);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
+
+	if (ret.error) {
+		switch (ret.error) {
+		case SBI_ERR_DENIED:
+			pr_warn("%s: Access denied for shared memory at %lx\n",
+				__func__, shmem_pa);
+			rc = -EPERM;
+			break;
+
+		case SBI_ERR_INVALID_PARAM:
+		case SBI_ERR_INVALID_ADDRESS:
+			pr_warn("%s: Invalid address parameter (%lu)\n",
+				__func__, ret.error);
+			rc = -EINVAL;
+			break;
+
+		case SBI_ERR_ALREADY_AVAILABLE:
+			pr_warn("%s: Shared memory is already set\n",
+				__func__);
+			rc = -EADDRINUSE;
+			break;
+
+		case SBI_ERR_FAILURE:
+			pr_err("%s: Internal sdtrig state error\n",
+			       __func__);
+			rc = -ENXIO;
+			break;
+
+		default:
+			pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
+			rc = -ENXIO;
+			break;
+		}
+	}
+
+	pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
+
+	return rc;
+}
+
+static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
+{
+	struct sbiret ret;
+
+	/* Disable shared memory */
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			-1UL, -1UL, 0, 0, 0, 0);
+
+	if (ret.error) {
+		switch (ret.error) {
+		case SBI_ERR_DENIED:
+			pr_err("%s: Access denied for shared memory.\n",
+			       __func__);
+			break;
+
+		case SBI_ERR_INVALID_PARAM:
+		case SBI_ERR_INVALID_ADDRESS:
+			pr_err("%s: Invalid address parameter (%lu)\n",
+			       __func__, ret.error);
+			break;
+
+		case SBI_ERR_ALREADY_AVAILABLE:
+			pr_err("%s: Shared memory is already set\n",
+			       __func__);
+			break;
+		case SBI_ERR_FAILURE:
+			pr_err("%s: Internal sdtrig state error\n",
+			       __func__);
+			break;
+		default:
+			pr_err("%s: Unknown error %lu\n", __func__, ret.error);
+			break;
+		}
+	}
+
+	pr_warn("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
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
+		pr_warn("%s: SBI_EXT_DBTR is not supported\n", __func__);
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			0, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: Failed to detect triggers\n", __func__);
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	tdata1 = 0;
+	RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL6);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect mcontrol6 triggers\n", __func__);
+	} else if (!ret.value) {
+		pr_warn("%s: type 6 triggers not available\n", __func__);
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RV_DBTR_TRIG_MCONTROL6;
+		pr_warn("%s: mcontrol6 trigger available.\n", __func__);
+		goto done;
+	}
+
+	/* fallback to type 2 triggers if type 6 is not available */
+
+	tdata1 = 0;
+	RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect mcontrol triggers\n", __func__);
+	} else if (!ret.value) {
+		pr_warn("%s: type 2 triggers not available\n", __func__);
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RV_DBTR_TRIG_MCONTROL;
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
+		hw->type = RV_DBTR_BP;
+		RV_DBTR_SET_MC_EXEC(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_LOAD(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_STORE(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_LOAD(hw->tdata1);
+		RV_DBTR_SET_MC_STORE(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		RV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		RV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		RV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
+		break;
+#if __riscv_xlen >= 64
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		RV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+		RV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
+		break;
+#endif
+	default:
+		return -EINVAL;
+	}
+
+	RV_DBTR_SET_MC_TYPE(hw->tdata1, RV_DBTR_TRIG_MCONTROL);
+
+	CLEAR_DBTR_BIT(hw->tdata1, MC, DMODE);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, TIMING);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, SELECT);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, ACTION);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, CHAIN);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, MATCH);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, M);
+
+	SET_DBTR_BIT(hw->tdata1, MC, S);
+	SET_DBTR_BIT(hw->tdata1, MC, U);
+
+	return 0;
+}
+
+static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
+				     struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RV_DBTR_BP;
+		RV_DBTR_SET_MC6_EXEC(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_LOAD(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_STORE(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_STORE(hw->tdata1);
+		RV_DBTR_SET_MC6_LOAD(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		RV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		RV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		RV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
+		break;
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		RV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	RV_DBTR_SET_MC6_TYPE(hw->tdata1, RV_DBTR_TRIG_MCONTROL6);
+
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, DMODE);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, TIMING);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, SELECT);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, ACTION);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, CHAIN);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, MATCH);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, M);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, VS);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, VU);
+
+	SET_DBTR_BIT(hw->tdata1, MC6, S);
+	SET_DBTR_BIT(hw->tdata1, MC6, U);
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
+	case RV_DBTR_TRIG_MCONTROL:
+		ret = rv_init_mcontrol_trigger(attr, hw);
+		break;
+	case RV_DBTR_TRIG_MCONTROL6:
+		ret = rv_init_mcontrol6_trigger(attr, hw);
+		break;
+	default:
+		pr_warn("unsupported trigger type\n");
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
+		case RV_DBTR_BP:
+			if (bp->address == args->regs->epc) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+
+		/* Watchpoint */
+		case RV_DBTR_WP:
+			if (bp->address == csr_read(CSR_STVAL)) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+
+		default:
+			pr_warn("%s: Unknown type: %u\n", __func__, bp->type);
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
+		pr_warn("%s: failed to install trigger\n", __func__);
+		err = -EIO;
+		goto done;
+	}
+
+	idx = le_to_cpu(recv->idx);
+	if (idx >= dbtr_total_num) {
+		pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
+		err = -EINVAL;
+		goto done;
+	}
+
+	slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
+	if (*slot) {
+		pr_warn("%s: slot %lu is in use\n", __func__, idx);
+		err = -EBUSY;
+		goto done;
+	}
+
+	pr_debug("Trigger %lu installed at index 0x%lx\n", bp->tdata2, idx);
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
+		pr_warn("%s: Breakpoint not installed.\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("%s: Failed to uninstall trigger %d.\n", __func__, i);
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+	struct perf_event **slot;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: Breakpoint not installed.\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("%s: Failed to install trigger %d\n", __func__, i);
+		return;
+	}
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
+		pr_warn("%s: Breakpoint not installed.\n", __func__);
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
+		pr_warn("%s: Failed to update trigger %d.\n", __func__, i);
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
+
+void arch_disable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: Breakpoint not installed.\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("%s: Failed to uninstall trigger %d.\n", __func__, i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
+
+void hw_breakpoint_pmu_read(struct perf_event *bp)
+{
+	/* TODO */
+}
+
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	/* TODO */
+}
+
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	/* TODO */
+}
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
+		pr_info("%s: total number of type %d triggers: %u\n",
+			__func__, dbtr_type, dbtr_total_num);
+	} else {
+		pr_info("%s: No hardware triggers available\n", __func__);
+		goto out;
+	}
+
+	/* Allocate per-cpu shared memory */
+	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
+					PAGE_SIZE);
+
+	if (!sbi_dbtr_shmem) {
+		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
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
+		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
+		free_percpu(sbi_dbtr_shmem);
+		return rc;
+	}
+ out:
+	return rc;
+}
+arch_initcall(arch_hw_breakpoint_init);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..d6e37f06dc29 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -288,6 +288,12 @@ void handle_break(struct pt_regs *regs)
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
