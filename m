Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60242EF5865
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 04:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnCMWcwDcJgw02aYH/pZB1o4l70/Y8Cd+FsZQvrkW9c=; b=zzugTYAirr99Fb
	Wo0w7k1vIWUNpHP5W8DQc7IK6g2ve3HZ99QQfTbrOYbtWTE8IFfZWn8CQmh7oQ7jX8dhBUtls1Xno
	DHQWZL3mlVIVNTaZbDqF2aI55e5NI5R/m5er26hgGxOepcqzdlyzMGgzXzXfAF7VHGWd54XxCtB04
	T/OxaI2GiI0FTEpMu2kqx/lrEmTmJakvFrSsPkW6/6S+KJybqTG4P6sUV/MwVotBhsZ8l4Z/Y9VgX
	e1VdG0S4xdfs1AUHkFNss7Z8dFvjW3u6C9AX19d3uXfREnNAeSKXxwqLAQwgJSAvNc+pidNTncwDD
	doJc+E0vNtCyQX0pN+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNt3-0000000HDvw-0vPu;
	Mon, 23 Feb 2026 04:49:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNsz-0000000HDv9-3fZ4
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 04:49:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MGepk91543248
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iezB5NU89Y1
	1WXNNTyuFXuWQgOt6KQWiiGHfO2dtrWs=; b=k2c9Fd2tFHJo13W7WfhL9AQizt7
	WZpY8GfbNVwxl5lTjVPnqrrQFYOwT7PXZsaBWlCZ4QAHKH/vzmZCBr4LqlUOwXnR
	JVTW9G4FOyLQ6Apn3buRX/me7jJ4BxBXFDom3vgeP0WHEVU1POz5Mw/pMa92i4hW
	QK1qj/lUIhkVBjQ+t5AMr0u2iMyKd2W67t/bLGluqRzLT3i/hyGhqXsS0QUkbo7f
	XY8HUqLCaS2Ab05ZG3isQVNrXuV+SRoMDTUjBnTk7ADNHeCuYzvSkdl1vzjFgLQW
	gSdeY/eULFNCPJ4CLK6qmFctRkKLc+byXWp5hhQNbvQHDS/kTQtAOvFPqfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3ubxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so4076769a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Feb 2026 20:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771822172; x=1772426972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iezB5NU89Y11WXNNTyuFXuWQgOt6KQWiiGHfO2dtrWs=;
        b=RURcZVfd+l3M+7UJOGq5JAyrzpWoCTLkieud0Y9p7+pY+f0l4ivkJs5/TYOp2HvdZN
         ODkejZDmmAwou5zQEHtIxGZWKJU/HMRPFEEV7jOXntzOQHf6vfdqSC0TE0SSTm0T7+eC
         dwB5d6rD60wKojJCBvOCXJ7Mu4tDEH2ZVMeVxzSMhyalP/McvKjlYc78qfBjDEcz1fQl
         t5XD/aYfPO3MEbIGYkof3QJGwOhsfBW0m2e+a6EZEGqCaRccGUDOhyXdEOxcxYekVhwr
         5OMNzk9ZGmo+l53X6ADakfM/YqW7zYCMPMrH8uhcINxkkQNoG2YBX3nvMcTZhFm53V8e
         2GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822172; x=1772426972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iezB5NU89Y11WXNNTyuFXuWQgOt6KQWiiGHfO2dtrWs=;
        b=KKA0Axsu8nhbu7NWYH887jFxbM+pF2x8hw8TyEZyDyfyNuQXrUftDLMazmdoa+uKTk
         O3YyKMxysiJ/ECSSEE2xEAzkfFbXvwOjsh89X8gMVdBSu2iafbNylURAsPllvCqYQ8HT
         WTquIKqKQMthVn83Y1yeUZhbD2x9uiqge0hh8pwvHRpHxzxsaNEAaUfgVJQ3qPoaPhSd
         cWhJjeOygIu9NbgpfEf+s4Eeo7TR3KOgpcokX0J0vhg7fYHC4nfvRrLs9H4Ck37ldftm
         3EfY1ql7B/K+A9QAR5KR4kthCE0IY4D2jRBrsHsPR+FfkbaTZl7mFPWSkaawV36aP9dV
         tusg==
X-Gm-Message-State: AOJu0YxBbjfFKEFT+cU1Iaywm3hUW3iObec4Pc328CocnClHVAT7fOwU
	R26w3j8shKmCdKaCqd1Sl9BmTAa65M6U+M3qGVU+bSIAUjxUa291XB/YPpxE0XG2ef3WmjFKh25
	Ph6RjrHBPG60nNqdVaXccpXnaTN4JhEHgb8nrJORLkw7RxPPKGIqq/0Qm9/bGtdizGeqR5XsWJe
	Q9/JU=
X-Gm-Gg: ATEYQzxQeQWn6bxwvZI5wZQEycJCy8JXz9PKDZ1ckCGH5TVdTWjdSKUoKhONBJZvJ3f
	sMVtg9CQzHe0h9Zn47/C8wo4ieis0TcBaHDDhJC35TGcXLBo7QbFD79FR/SNU4qlaM43hIu9B80
	rYH34pJng5gwxUyu+Xm/wUjMfUTTnZfhC/AYmiDHa5d20wWpfp7z1n86eOpEKcp0mMfoh1MW+iX
	MMO5nBoLOguV0vROtN6hyXCTTTsn0zfJRuq0rcSLVScNexuELTuR93yTbrJdyd+RZIA/WsKhcwm
	Ti8Epr4vluNZqpAVcKxaCujQw3hwYjTn7duOxtWXZa/Jzcv00a21SRUjwA6WqqEtWb+jcf15vZf
	xwKgSn0U3Uvj15js81v//negz3Symt3x8eRC0iW4pM9lyrHbSd/A4/T/I6IxohwOuYzm7afNc3p
	wGZGTUDELQw+VXm30C7Rlcd/DBhehO3iJxFyP+wG3KySwFww==
X-Received: by 2002:a17:90b:6cf:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-358ae80c232mr7460517a91.14.1771822171296;
        Sun, 22 Feb 2026 20:49:31 -0800 (PST)
X-Received: by 2002:a17:90b:6cf:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-358ae80c232mr7460495a91.14.1771822170658;
        Sun, 22 Feb 2026 20:49:30 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2a768bcsm5623954a91.4.2026.02.22.20.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:49:30 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
Date: Mon, 23 Feb 2026 10:19:17 +0530
Message-ID: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699bdc5c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NdCxyxYjUNQXf4Wx1tIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: j2pIRxl8CYF3W4Bk5ui48gxFJ1G3RcG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA0MCBTYWx0ZWRfX4mgqYLSkvhPW
 CIzyx15lJpRt1fMm6sYKRGhgxt4+UuAJAW1euwS8IULzy4UX6IuNOKvmAYMNvk+UpKG8o8zacF2
 dnBVGtoqh4FTA+jiqMrbuqabDxDGNYdQblDE41XSyuj30YhH+XQ3OPgx1p/2VJhWaHcDXWgyzg7
 sswmobEnwoJpvuLqbXwIyfPiNjm3e+xHaHs+slvSGK59KB2vsuagl84VtzS1uEaNTE9dBccDOV/
 1NXnPUvrwq+eSMUjDz8sg2MhCooe7Wftp6E64DlCw+9e3/YSo0ZlyGYLY8QglUHKzr2MLzV0Utl
 5l6ONUs6EUoZkE/MPdrmq1uU5gmhMEYtnLi4lmSbxglMT1EEm1/T+8/jAPjy58gDjBQ5wHQrAap
 vdvrUEgSBj7sDXp5LZtq8bCjm4PiYqzY2QChGNsH7d+xXhWs9tSa1oFDDMdapWib+XIdVjoOlkL
 voag6QykCe8MMnarmKQ==
X-Proofpoint-GUID: j2pIRxl8CYF3W4Bk5ui48gxFJ1G3RcG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_204934_205422_4295FC15 
X-CRM114-Status: GOOD (  16.29  )
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
 arch/riscv/include/asm/hw_breakpoint.h | 332 +++++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 657 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 999 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..ac4b4175763e 100644
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
index 000000000000..a5ef70fa14a1
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,332 @@
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
+	(((1UL << (_width)) - 1) << RV_DBTR_BIT(_prefix, _name))
+
+#define CLEAR_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__clear_bit(RV_DBTR_BIT(_prefix, _bit_name), &(_target))
+
+#define SET_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__set_bit(RV_DBTR_BIT(_prefix, _bit_name), &(_target))
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
+	({								\
+		typeof(_t1) (td1t1) = (_t1);				\
+		(td1t1) &= ~RV_DBTR_BIT_MASK(TDATA1, TYPE);		\
+		(td1t1) |= (((unsigned long)(_type)			\
+			     << RV_DBTR_BIT(TDATA1, TYPE))		\
+			    & RV_DBTR_BIT_MASK(TDATA1, TYPE));		\
+		(td1t1);						\
+	})
+
+#define RV_DBTR_SET_MC_TYPE(_t1, _type)				\
+	({							\
+		typeof(_t1) (mct1) = (_t1);			\
+		(mct1) &= ~RV_DBTR_BIT_MASK(MC, TYPE);		\
+		(mct1) |= (((unsigned long)(_type)		\
+			    << RV_DBTR_BIT(MC, TYPE))		\
+			   & RV_DBTR_BIT_MASK(MC, TYPE));	\
+		(mct1);						\
+	})
+
+#define RV_DBTR_SET_MC6_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mc6t1) = (_t1);				\
+		(mc6t1) &= ~RV_DBTR_BIT_MASK(MC6, TYPE);		\
+		(mc6t1) |= (((unsigned long)(_type)			\
+			     << RV_DBTR_BIT(MC6, TYPE))			\
+			    & RV_DBTR_BIT_MASK(MC6, TYPE));		\
+		(mc6t1);						\
+	})
+
+#define RV_DBTR_SET_MC_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, EXEC)
+
+#define RV_DBTR_SET_MC_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, LOAD)
+
+#define RV_DBTR_SET_MC_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, STORE)
+
+#define RV_DBTR_SET_MC_SIZELO(_t1, _val)			\
+	({							\
+		typeof(_t1) (mcslt1) = (_t1);			\
+		mcslt1 &= ~RV_DBTR_BIT_MASK(MC, SIZELO);	\
+		mcslt1 |= (((_val) << RV_DBTR_BIT(MC, SIZELO))	\
+			   & RV_DBTR_BIT_MASK(MC, SIZELO));	\
+		(mcslt1);					\
+	})
+
+#define RV_DBTR_SET_MC_SIZEHI(_t1, _val)			\
+	({							\
+		typeof(_t1) (mcsht1) = (_t1);			\
+		mcsht1 &= ~RV_DBTR_BIT_MASK(MC, SIZEHI);	\
+		mcsht1 |= (((_val) << RV_DBTR_BIT(MC, SIZEHI))	\
+			    & RV_DBTR_BIT_MASK(MC, SIZEHI));	\
+		(mcsht1);					\
+	})
+
+#define RV_DBTR_SET_MC6_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, EXEC)
+
+#define RV_DBTR_SET_MC6_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, LOAD)
+
+#define RV_DBTR_SET_MC6_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, STORE)
+
+#define RV_DBTR_SET_MC6_SIZE(_t1, _val)					\
+	({								\
+		typeof(_t1) (mc6szt1) = (_t1);				\
+		(mc6szt1) &= ~RV_DBTR_BIT_MASK(MC6, SIZE);		\
+		(mc6szt1) |= (((_val) << RV_DBTR_BIT(MC6, SIZE))	\
+			      & RV_DBTR_BIT_MASK(MC6, SIZE));		\
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
index 000000000000..8076829d23d3
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
+#define MEM_LO(_m)	((u64)(_m))
+#elif __riscv_xlen == 32
+#define MEM_HI(_m)	((u64)(_m) >> 32)
+#define MEM_LO(_m)	((u64)(_m) & 0xFFFFFFFFUL)
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
+	tdata1 = RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL6);
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
+	tdata1 = RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL);
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
+		RV_DBTR_SET_MC_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		RV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		hw->tdata1 = RV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		hw->tdata1 = RV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		hw->tdata1 = RV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
+		break;
+#if __riscv_xlen >= 64
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		hw->tdata1 = RV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+		hw->tdata1 = RV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
+		break;
+#endif
+	default:
+		return -EINVAL;
+	}
+
+	hw->tdata1 = RV_DBTR_SET_MC_TYPE(hw->tdata1, RV_DBTR_TRIG_MCONTROL);
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
+		RV_DBTR_SET_MC6_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RV_DBTR_WP;
+		RV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		RV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		hw->tdata1 = RV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		hw->tdata1 = RV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		hw->tdata1 = RV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
+		break;
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		hw->tdata1 = RV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	hw->tdata1 = RV_DBTR_SET_MC6_TYPE(hw->tdata1, RV_DBTR_TRIG_MCONTROL6);
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
index 5fb57fad188a..3024abd26952 100644
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
