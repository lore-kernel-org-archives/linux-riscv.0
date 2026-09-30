Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2525FCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRevSMZ8o65Mr3qs3RkOg/2KqiA3cKc13UXdaVpM6PU=; b=I8qdSsf0JAKfwW
	E6SDStHgBgxxrpZmSz3biXeLTYa4mv5itFAEYLH0EZKvFyGa9Tus+sYsaYKbtS8C7oXtOWz1QRNgH
	IONp0qrjCaPtLP3/rWf70ke6+QoJ1/Adjp7Vo/eeuHrk8hs0SYk2ur8QlmQUpTFqhXlNDLYKKRsWT
	56kOIQ4t9IQrJ2k6RmfGo8ED+BnDfcXJOTChzKV3NJnkQyy1vmtq3H0fgCpgt0okJaYd2RSW8WY+G
	6F/oI/a9KyV2bEQ4VyKx+FvvNolGjtAv7R3xd3riiHXsEXF009QxMZHD4J+k6g51KjxPNVLtuuwf+
	Ytid+ng01yY9EFsr79DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyp-00000005AAq-1Huo;
	Wed, 30 Sep 2026 06:39:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnym-00000005A9f-1mjD
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:39:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1BnBU1967401
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=psYL54jmN9y
	cKhx2nDLaiBlGWatC/van2qwJIYKlQKQ=; b=FuOPjh3xNxFutzUopAcP299xbR4
	8/1FNHNEp22sspN0N2/Vlq44e0P4Bdlwt6zZ6JWz88mmoav4BEotJ6u52Iu8SMhK
	gu/3ihPgHQOret7hiIoWkme9e0/UEuJ+LrZsKswNXz8m3Cm6sPu4W5JMK0fuf/MU
	O2pv4zRGbXKHRcpO15KsvqK5ewqLYmCPTGu/4OJhxCQvAClnZWY//sa7D2bSzNeY
	rN8Dnxia5mZdFmw7AobVjeQpvyGIiXHM+DlfiAqe6cQpDPLK4r0gsBRtZsXsXi7o
	MqCQs/lefKrHwOht9Pcp0CRkyw7GAn2P96okgJRBlStT9+qTbUDl2BrNgDg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2s921-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ceac22194so323051eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750386; x=1791355186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psYL54jmN9ycKhx2nDLaiBlGWatC/van2qwJIYKlQKQ=;
        b=O0nYOnxkBN+Ce4ZTnOoCrxqQGxrbVo02WOiQYcNlaSXeZPkrg86jmCcDKpMmKMHNv+
         97Wygai3VXCjTvOSXsdVJJlY9CeCJ6bGKr/Rv0yoDaL7Xxs+xU55akcwB8ATN6JCtvrQ
         MHu8z1CGKs2tjXH6yXNPtebVtjbVrjra0x5DyKN82mmtDtEgB9wexE7AfMOewTTI6rPq
         6DR77p/BbNN2QlJwsF15Hij98qzUSVP1QH7p1Z8DVH5PAt0Dm5hWmXS40ie1JRJpbH2T
         dIfLbC3yIp9lRUpd1vujrnDAkHN52mEoF1xOKLhwKSxVSbRdQAYScDiWbNt+tI0Cw+GT
         FIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750386; x=1791355186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psYL54jmN9ycKhx2nDLaiBlGWatC/van2qwJIYKlQKQ=;
        b=fME1EMfLSaiN7odPOvoCFbTPYMdAbEWItKS/vgYDcWVCtWLRe5d8m8xP6+FU8b229K
         IiOYqmV0uUOfArIjD+DYaANEqKAY3FDjFJW9aOZ1qdSlVG59q4CX4B4PG2DMrwv0WkR1
         8kIXSgyYrlLUl2XoJ3h7UruIpqaeo9v6R8rJoiP72Hqm4cRwbNLQf17uzjFBiUEBXi3o
         i75FlZc0aSDvFz0H5BTqoX6gqzHPKyVIVS2R0t5zra1rX2YjZqM7tsq8cKZiF1QlA2x1
         xzmCvicNHeLTCKad4vOWsZdZZ3jtR0pRQ5ss3bkcHj8MwrtLWA1zcjSA/CnICpeL22pG
         R1Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwgxASQvj8gFf1SBtro2GPDc/CN83cIvClu8unaFGOrqCFPxCg7XvwaWtBO4J2Hgr7WC8LJsOwH2/Xk6w==@lists.infradead.org
X-Gm-Message-State: AFuF++ly3Jh1M0m/4jqgOwSc03iZVBwLGfm0KQ+ZwVE83kAYaSSzGvzg
	6AOc42k2oYDudgSVQHakwPjbHt8K14uUaORD+yXMiBBDggAbU89lojiPOZL5yv/SmT0zzHQn8pI
	Rkk1mBWAA2AXxZ5yjBkqnVej8mUtK0O7QdcbUmg7v8hN4XqsPRqPOd8FtyxtBlTnD3PSgxNo=
X-Gm-Gg: AYBFou1kBI3CtBgubPLEMUfIyMYsnRkgT220HMU2+CSs4TAaK1F+on2Kd2LJj4rW5Bw
	G0YCnmGK4blq9kd/XgH8vyEW0UtW6NQF6xekmQSMiHDluhPvv39ZdQ+m/86Gfpi4Sk3gKntL2lU
	KskDJCfh4fYdzSWuKr26uBpVcZ85ewI0ZaNOKeMH420eh0FYMEr9+I5L+ZNUiyKxC+vUOSYs9eY
	rSQ6zw79GXxdX/0UQtHwLA3W+7+FEqZ8KupJjyUXydNEFSvfdpiXRbTs7c06F4Xkf8cHHpU6LoE
	UrQNFc7N7vthUS11VLqcSTc9ZcIVDrfVZqofltJ3VOH/Bv+z9O92d9/+/vmjBG9Ta/ll/q3NDC+
	NfL1pKzZPKYIPBG1RPi7ucMMPi6mtBcIk0ycOxRXJ/H/wmHbWNi1rscn0lwT9rFeAlVNplws+ZY
	L9CoDnu52tk5umB4ycN5liVweq
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr254904c88.45.1790750385901;
        Tue, 29 Sep 2026 23:39:45 -0700 (PDT)
X-Received: by 2002:a05:701b:2906:b0:143:298c:924e with SMTP id a92af1059eb24-14d359570f3mr254865c88.45.1790750385147;
        Tue, 29 Sep 2026 23:39:45 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:44 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 3/8] riscv: ptrace support for hardware break/watchpoints
Date: Wed, 30 Sep 2026 12:09:14 +0530
Message-ID: <20260930063919.608911-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: LkkkF0dlaAqAdrMBu2gp7D7FTqWfK_tS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX2DEs/k3dFbBU
 pKvaR4y+iSs/TpwqKpXSKtxvhoC6Pm8RxZQNkCj/xMjgA8tufXmFMgbCONVe0ew4j4Z9W7GVfxV
 c9oN6HrUX7O01CXn9CZvZfINbVWQEdKdKbhB+mwVPLYm27VmBzgPxHZIxSwB0CwEEM7vWtG/hSh
 JtJLpuezzlOahIa15pibufQlKT4PH499v3NVIZFgDIwguDuDIRb20QndYCVXj4hAGBEEFG36bkb
 X6Y23Y9ZugrChBF+/gwTh0LnkzTNTG817KVB37RGlVJT3ipZrQu+nLTK7Zt+kBRk1LRd67IqZ43
 qoBuWssKyHWuE7UL8yV4F2RPWwKII92i5cvo5iiG0nM71UbZnLddM4PX3yzJF60SmtXrvlOdqqF
 X8rLP5g8PprDIamkhIU1rtqqX4l4CT4IgbPrvhjxOysvNRzMjnegqn8DStsir/MtFsVnfIhFhCy
 D4Wty46QV2iOjyK0Hrw==
X-Proofpoint-GUID: LkkkF0dlaAqAdrMBu2gp7D7FTqWfK_tS
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abcaeb3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QnrZwGvzMrCbM2MBBQkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX2vHB69lTi3oa
 2N6RNsx0qQ1KBMIcBdiEr+VaVwZK2JqCWvxtWga+9Cz5gRRxwXvAPJ6kIisOIfm6k+E+JmIaV2n
 bT1V9VcEtBAnsZcsdvUbVQKSYYfN/Bk=
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
X-CRM114-CacheID: sfid-20260929_233948_586568_7EFFFA7E 
X-CRM114-Status: GOOD (  25.12  )
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

Add ptrace support for hardware breakpoints and watchpoints on
RISC-V. Debuggers can now set and query hardware debug triggers
through the standard PTRACE_GETREGSET/SETREGSET interface using new
NT_RISCV_HW_BREAK/WATCH note types, backed by
register_user_hw_breakpoint()/modify_user_hw_breakpoint() and
delivering SIGTRAP/TRAP_HWBKPT to the tracee when a trigger fires.

For convenience, also add a simpler PTRACE_GETHBPREGS/SETHBPREGS
request pair that lets a tracer read or write a single breakpoint or
watchpoint directly, without going through the regset machinery.
These request numbers live in the arch-specific ptrace range
(0x4210/0x4211) so they don't collide with the generic
PTRACE_PEEKDATA/PTRACE_PEEKUSR codes.

Breakpoints and watchpoints share the same trigger pool on this
architecture, so select HAVE_MIXED_BREAKPOINTS_REGS. Hook up
thread flush/copy so per-task breakpoints are cleaned up and cleared
across fork/exec.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig                     |   1 +
 arch/riscv/include/asm/hw_breakpoint.h |  10 +
 arch/riscv/include/asm/processor.h     |  18 +
 arch/riscv/include/uapi/asm/ptrace.h   |  50 +++
 arch/riscv/kernel/hw_breakpoint.c      |   1 -
 arch/riscv/kernel/process.c            |   5 +
 arch/riscv/kernel/ptrace.c             | 507 +++++++++++++++++++++++++
 include/uapi/linux/elf.h               |   4 +
 tools/include/uapi/linux/elf.h         |   2 +
 9 files changed, 597 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 17fa7d4f9729..d382f5d7b6a7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -176,6 +176,7 @@ config RISCV
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
+	select HAVE_MIXED_BREAKPOINTS_REGS if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index a165bb9636de..ca2ef93c020c 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -14,6 +14,7 @@ struct task_struct;
 
 /* Maximum number of hardware breakpoints supported */
 #define RISCV_HW_BP_NUM_MAX 32
+#define RISCV_MAX_BP		16
 
 #if __riscv_xlen == 64
 #define cpu_to_le cpu_to_le64
@@ -279,6 +280,10 @@ struct arch_hw_breakpoint {
 	unsigned long address;
 	unsigned long len;
 	unsigned int type;
+	unsigned int match;
+	unsigned int chain;
+	unsigned int select;
+	unsigned int time;
 
 	/* Trigger configuration data */
 	unsigned long tdata1;
@@ -305,8 +310,13 @@ void arch_disable_hw_breakpoint(struct perf_event *bp);
 int arch_install_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
+void ptrace_hw_copy_thread(struct task_struct *task);
 
 #else
 
+static inline void ptrace_hw_copy_thread(struct task_struct *task) { }
+
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 815715c67f94..6f6186b9663e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -15,6 +15,7 @@
 #include <asm/ptrace.h>
 #include <asm/insn-def.h>
 #include <asm/alternative-macros.h>
+#include <asm/hw_breakpoint.h>
 #include <asm/hwcap.h>
 #include <asm/usercfi.h>
 
@@ -110,6 +111,19 @@ struct pt_regs;
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
 #define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
 
+struct debug_info {
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	/* Have we suspended stepping by a debugger? */
+	int			suspended_step;
+	/* Allow breakpoints and watchpoints to be disabled for this thread. */
+	int			bp_disabled;
+	int			wp_disabled;
+	/* Hardware breakpoints pinned to this task. */
+	struct perf_event	*hbp_break[RISCV_MAX_BP];
+	struct perf_event	*hbp_watch[RISCV_MAX_BP];
+#endif
+};
+
 /* CPU-specific state of a task */
 struct thread_struct {
 	/* Callee-saved registers */
@@ -133,6 +147,10 @@ struct thread_struct {
 #endif
 #ifdef CONFIG_RISCV_ISA_SSQOSID
 	u32 srmcfg;
+#endif
+	struct debug_info debug;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	struct perf_event	*ptrace_bps[RISCV_HW_BP_NUM_MAX];
 #endif
 };
 
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 3de2b7124aff..83e073dbbf6d 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -10,11 +10,14 @@
 
 #include <linux/types.h>
 #include <linux/const.h>
+#include <linux/bits.h>
 
 #define PTRACE_GETFDPIC		33
 
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
+#define PTRACE_GETHBPREGS	0x4210
+#define PTRACE_SETHBPREGS	0x4211
 
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
@@ -164,6 +167,53 @@ struct user_cfi_state {
 	__u64 shstk_ptr;
 };
 
+/*
+ * bit[3:0]        Match
+ * bit[8:4]        Size
+ * bit[11:9]       When
+ * bit[12]         Select
+ * bit[13]         Chain
+ * bit[16:14]      Type
+ * bit[XLEN-1:17]  Reserved
+ */
+#define HWDEBUG_MATCH_MASK	__GENMASK(3, 0)
+#define HWDEBUG_SIZE_MASK	__GENMASK(8, 4)
+#define HWDEBUG_WHEN_MASK	__GENMASK(11, 9)
+#define HWDEBUG_SELECT_MASK	_BITUL(12)
+#define HWDEBUG_CHAIN_MASK	_BITUL(13)
+#define HWDEBUG_TYPE_MASK	__GENMASK(16, 14)
+
+#define HWDEBUG_MATCH(_ctrl)	(((_ctrl) & HWDEBUG_MATCH_MASK) >> 0)
+#define HWDEBUG_SIZE(_ctrl)	(((_ctrl) & HWDEBUG_SIZE_MASK) >> 4)
+#define HWDEBUG_WHEN(_ctrl)	(((_ctrl) & HWDEBUG_WHEN_MASK) >> 9)
+#define HWDEBUG_SELECT(_ctrl)	(((_ctrl) & HWDEBUG_SELECT_MASK) >> 12)
+#define HWDEBUG_CHAIN(_ctrl)	(((_ctrl) & HWDEBUG_CHAIN_MASK) >> 13)
+#define HWDEBUG_TYPE(_ctrl)	(((_ctrl) & HWDEBUG_TYPE_MASK) >> 14)
+
+#define HWDEBUG_MK_MATCH(_match)	((_match << 0) & HWDEBUG_MATCH_MASK)
+#define HWDEBUG_MK_SIZE(_sz)		((_sz << 4) & HWDEBUG_SIZE_MASK)
+#define HWDEBUG_MK_WHEN(_when)		((_when << 9) & HWDEBUG_WHEN_MASK)
+#define HWDEBUG_MK_SELECT(_sel)		((_sel << 12) & HWDEBUG_SELECT_MASK)
+#define HWDEBUG_MK_CHAIN(_chain)	((_chain << 13) & HWDEBUG_CHAIN_MASK)
+#define HWDEBUG_MK_TYPE(_type)		((_type << 14) & HWDEBUG_TYPE_MASK)
+
+struct user_hwdebug_state {
+	__u32 info;
+	__u32 pad;
+	struct {
+		__u64 addr;
+		__u32 control;
+		__u32 pad;
+	} dbg_regs[16];
+};
+
+struct __riscv_hwdebug_state {
+	__u64 addr;
+	__u64 type;
+	__u64 len;
+	__u64 ctrl;
+};
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index c2ab5e6008e7..dd6f63953969 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -698,7 +698,6 @@ EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
 
 void hw_breakpoint_pmu_read(struct perf_event *bp) { }
 
-void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
 
 static int __init arch_hw_breakpoint_init(void)
 {
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..bdcb0386cd0d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -204,6 +204,7 @@ void flush_thread(void)
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
 		envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
 #endif
+	flush_ptrace_hw_breakpoint(current);
 }
 
 void arch_release_task_struct(struct task_struct *tsk)
@@ -283,6 +284,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.riscv_v_flags = 0;
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
+	ptrace_hw_copy_thread(p);
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
+#endif
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index f336a183667e..2d4ee51e6859 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -18,8 +18,10 @@
 #include <linux/elf.h>
 #include <linux/regset.h>
 #include <linux/sched.h>
+#include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
 #include <asm/usercfi.h>
+#include <linux/hw_breakpoint.h>
 
 enum riscv_regset {
 	REGSET_X,
@@ -35,6 +37,10 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_USER_CFI
 	REGSET_CFI,
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	REGSET_RISCV_HW_BREAK,
+	REGSET_RISCV_HW_WATCH,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -372,6 +378,397 @@ static int riscv_cfi_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+/*
+ * Handle hitting a HW-breakpoint.
+ */
+static void riscv_ptrace_hbptriggered(struct perf_event *bp,
+				struct perf_sample_data *data,
+				struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bkpt = counter_arch_bp(bp);
+
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)bkpt->address);
+}
+
+/*
+ * Unregister breakpoints from this task and reset the pointers in
+ * the thread_struct.
+ */
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	int i;
+	struct thread_struct *t = &tsk->thread;
+
+	for (i = 0; i < RISCV_MAX_BP; i++) {
+		if (t->debug.hbp_break[i]) {
+			unregister_hw_breakpoint(t->debug.hbp_break[i]);
+			t->debug.hbp_break[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < RISCV_MAX_BP; i++) {
+		if (t->debug.hbp_watch[i]) {
+			unregister_hw_breakpoint(t->debug.hbp_watch[i]);
+			t->debug.hbp_watch[i] = NULL;
+		}
+	}
+}
+
+void ptrace_hw_copy_thread(struct task_struct *tsk)
+{
+	memset(&tsk->thread.debug, 0, sizeof(struct debug_info));
+}
+
+static struct perf_event *ptrace_hbp_get_event(unsigned int note_type,
+					       struct task_struct *tsk,
+					       unsigned long idx)
+{
+	struct perf_event *bp = ERR_PTR(-EINVAL);
+
+	switch (note_type) {
+	case NT_RISCV_HW_BREAK:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		bp = tsk->thread.debug.hbp_break[idx];
+		break;
+	case NT_RISCV_HW_WATCH:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		bp = tsk->thread.debug.hbp_watch[idx];
+		break;
+	}
+
+out:
+	return bp;
+}
+
+static int ptrace_hbp_set_event(unsigned int note_type,
+				struct task_struct *tsk,
+				unsigned long idx,
+				struct perf_event *bp)
+{
+	int err = -EINVAL;
+
+	switch (note_type) {
+	case NT_RISCV_HW_BREAK:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		tsk->thread.debug.hbp_break[idx] = bp;
+		err = 0;
+		break;
+	case NT_RISCV_HW_WATCH:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		tsk->thread.debug.hbp_watch[idx] = bp;
+		err = 0;
+		break;
+	}
+
+out:
+	return err;
+}
+
+static struct perf_event *ptrace_hbp_create(unsigned int note_type,
+					    struct task_struct *tsk,
+					    unsigned long idx)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	int err, type;
+
+	switch (note_type) {
+	case NT_RISCV_HW_BREAK:
+		type = HW_BREAKPOINT_X;
+		break;
+	case NT_RISCV_HW_WATCH:
+		type = HW_BREAKPOINT_RW;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	ptrace_breakpoint_init(&attr);
+
+	/*
+	 * Initialise fields to sane defaults
+	 * (i.e. values that will pass validation).
+	 */
+	attr.bp_addr	= 0;
+	attr.bp_len	= HW_BREAKPOINT_LEN_4;
+	attr.bp_type	= type;
+	attr.disabled	= 1;
+
+	bp = register_user_hw_breakpoint(&attr, riscv_ptrace_hbptriggered, NULL, tsk);
+	if (IS_ERR(bp))
+		return bp;
+
+	err = ptrace_hbp_set_event(note_type, tsk, idx, bp);
+	if (err)
+		return ERR_PTR(err);
+
+	return bp;
+}
+
+static int ptrace_hbp_fill_attr_ctrl(unsigned int note_type,
+				     struct arch_hw_breakpoint *bpctrl,
+				     struct perf_event_attr *attr)
+{
+	int len, type;
+
+	attr->disabled = 0;
+	type = bpctrl->type;
+	len = bpctrl->len;
+
+	switch (note_type) {
+	case NT_RISCV_HW_BREAK:
+		if ((type & HW_BREAKPOINT_X) != type)
+			return -EINVAL;
+		break;
+	case NT_RISCV_HW_WATCH:
+		if ((type & HW_BREAKPOINT_RW) != type)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	attr->bp_len	= len;
+	attr->bp_type	= type;
+	attr->bp_addr	= bpctrl->address;
+
+	return 0;
+}
+
+static int ptrace_hbp_get_resource_info(unsigned int note_type, u32 *info)
+{
+	u8 num;
+
+	switch (note_type) {
+	case NT_RISCV_HW_BREAK:
+		num = hw_breakpoint_slots(TYPE_INST);
+		break;
+	case NT_RISCV_HW_WATCH:
+		num = hw_breakpoint_slots(TYPE_DATA);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*info = num;
+
+	return 0;
+}
+
+static u32 encode_ctrl_reg(struct perf_event *bp)
+{
+	struct arch_hw_breakpoint *bpctrl = counter_arch_bp(bp);
+	u32 ctrl = 0;
+
+	/* Expose the generic UAPI bp_type values in ptrace control bits. */
+	ctrl |= HWDEBUG_MK_TYPE(bp->attr.bp_type);
+	ctrl |= HWDEBUG_MK_MATCH(bpctrl->match);
+	ctrl |= HWDEBUG_MK_SELECT(bpctrl->select);
+	ctrl |= HWDEBUG_MK_WHEN(bpctrl->time);
+	ctrl |= HWDEBUG_MK_SIZE(bp->attr.bp_len);
+	ctrl |= HWDEBUG_MK_CHAIN(bpctrl->chain);
+
+	return ctrl;
+}
+
+static int ptrace_hbp_get_ctrl(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u32 *ctrl)
+{
+	struct perf_event *bp = ptrace_hbp_get_event(note_type, tsk, idx);
+
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+
+	*ctrl = bp ? encode_ctrl_reg(bp) : 0;
+	return 0;
+}
+
+static int ptrace_hbp_get_addr(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u64 *addr)
+{
+	struct perf_event *bp = ptrace_hbp_get_event(note_type, tsk, idx);
+
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+
+	*addr = bp ? counter_arch_bp(bp)->address : 0;
+	return 0;
+}
+
+static struct perf_event *ptrace_hbp_get_initialised_bp(unsigned int note_type,
+							struct task_struct *tsk,
+							unsigned long idx)
+{
+	struct perf_event *bp = ptrace_hbp_get_event(note_type, tsk, idx);
+
+	if (!bp)
+		bp = ptrace_hbp_create(note_type, tsk, idx);
+
+	return bp;
+}
+
+static void decode_ctrl_reg(u32 uctrl, struct arch_hw_breakpoint *bpctrl)
+{
+	bpctrl->type = HWDEBUG_TYPE(uctrl);
+	bpctrl->match = HWDEBUG_MATCH(uctrl);
+	bpctrl->select = HWDEBUG_SELECT(uctrl);
+	bpctrl->time = HWDEBUG_WHEN(uctrl);
+	bpctrl->len = HWDEBUG_SIZE(uctrl);
+	bpctrl->chain = HWDEBUG_CHAIN(uctrl);
+}
+
+static int ptrace_hbp_set_ctrl(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u32 uctrl)
+{
+	int err;
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	struct arch_hw_breakpoint bpctrl;
+
+	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
+	if (IS_ERR(bp)) {
+		err = PTR_ERR(bp);
+		return err;
+	}
+
+	attr = bp->attr;
+	decode_ctrl_reg(uctrl, &bpctrl);
+	bpctrl.address = attr.bp_addr;
+	err = ptrace_hbp_fill_attr_ctrl(note_type, &bpctrl, &attr);
+	if (err)
+		return err;
+
+	return modify_user_hw_breakpoint(bp, &attr);
+}
+
+static int ptrace_hbp_set_addr(unsigned int note_type,
+			       struct task_struct *tsk,
+			       unsigned long idx,
+			       u64 addr)
+{
+	int err;
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+
+	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
+	if (IS_ERR(bp)) {
+		err = PTR_ERR(bp);
+		return err;
+	}
+
+	attr = bp->attr;
+	attr.bp_addr = addr;
+	err = modify_user_hw_breakpoint(bp, &attr);
+	return err;
+}
+
+#define PTRACE_HBP_ADDR_SZ	sizeof(u64)
+#define PTRACE_HBP_CTRL_SZ	sizeof(u32)
+#define PTRACE_HBP_PAD_SZ	sizeof(u32)
+
+static int riscv_hw_break_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	unsigned int note_type = regset->core_note_type;
+	int ret, idx, num_slots;
+	u32 info, ctrl;
+	u64 addr;
+
+	/* Resource info: number of available slots */
+	ret = ptrace_hbp_get_resource_info(note_type, &info);
+	if (ret)
+		return ret;
+
+	membuf_write(&to, &info, sizeof(info));
+	membuf_zero(&to, sizeof(u32));
+
+	/* Emit one (address, ctrl, pad) entry per available slot */
+	num_slots = (int)info;
+	for (idx = 0; idx < num_slots; idx++) {
+		ret = ptrace_hbp_get_addr(note_type, target, idx, &addr);
+		if (ret)
+			return ret;
+		ret = ptrace_hbp_get_ctrl(note_type, target, idx, &ctrl);
+		if (ret)
+			return ret;
+		membuf_store(&to, addr);
+		membuf_store(&to, ctrl);
+		membuf_zero(&to, sizeof(u32));
+	}
+	return 0;
+}
+
+static int riscv_hw_break_set(struct task_struct *target,
+			const struct user_regset *regset,
+			unsigned int pos, unsigned int count,
+			const void *kbuf, const void __user *ubuf)
+{
+	unsigned int note_type = regset->core_note_type;
+	int ret, idx = 0, offset, limit;
+	u32 ctrl;
+	u64 addr;
+
+	/* Resource info and pad */
+	offset = offsetof(struct user_hwdebug_state, dbg_regs);
+	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
+
+	/* (address, ctrl) registers */
+	limit = regset->n * regset->size;
+	while (count && offset < limit) {
+		if (count < PTRACE_HBP_ADDR_SZ)
+			return -EINVAL;
+
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
+					 offset, offset + PTRACE_HBP_ADDR_SZ);
+		if (ret)
+			return ret;
+
+		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
+		if (ret)
+			return ret;
+
+		offset += PTRACE_HBP_ADDR_SZ;
+
+		if (!count)
+			break;
+
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl,
+					 offset, offset + PTRACE_HBP_CTRL_SZ);
+		if (ret)
+			return ret;
+
+		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
+		if (ret)
+			return ret;
+
+		offset += PTRACE_HBP_CTRL_SZ;
+
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					  offset, offset + PTRACE_HBP_PAD_SZ);
+		offset += PTRACE_HBP_PAD_SZ;
+		idx++;
+	}
+
+	return 0;
+}
+#endif	/* CONFIG_HAVE_HW_BREAKPOINT */
+
 static struct user_regset riscv_user_regset[] __ro_after_init = {
 	[REGSET_X] = {
 		USER_REGSET_NOTE_TYPE(PRSTATUS),
@@ -421,6 +818,24 @@ static struct user_regset riscv_user_regset[] __ro_after_init = {
 		.set = riscv_cfi_set,
 	},
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	[REGSET_RISCV_HW_BREAK] = {
+		USER_REGSET_NOTE_TYPE(RISCV_HW_BREAK),
+		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
+		.size = sizeof(u32),
+		.align = sizeof(u32),
+		.regset_get = riscv_hw_break_get,
+		.set = riscv_hw_break_set,
+	},
+	[REGSET_RISCV_HW_WATCH] = {
+		USER_REGSET_NOTE_TYPE(RISCV_HW_WATCH),
+		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
+		.size = sizeof(u32),
+		.align = sizeof(u32),
+		.regset_get = riscv_hw_break_get,
+		.set = riscv_hw_break_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
@@ -541,12 +956,104 @@ void ptrace_disable(struct task_struct *child)
 {
 }
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static int riscv_ptrace_bp_get(struct task_struct *child, unsigned long idx,
+			  struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+
+	if (idx >= RISCV_HW_BP_NUM_MAX)
+		return -EINVAL;
+
+	bp = child->thread.ptrace_bps[idx];
+	if (!bp)
+		return -ENOENT;
+
+	state->addr = bp->attr.bp_addr;
+	state->len  = bp->attr.bp_len;
+	state->type = bp->attr.bp_type;
+	state->ctrl = bp->attr.disabled == 1;
+
+	return 0;
+}
+
+static int riscv_ptrace_bp_set(struct task_struct *child, unsigned long idx,
+			  struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+
+	if (idx >= RISCV_HW_BP_NUM_MAX)
+		return -EINVAL;
+
+	bp = child->thread.ptrace_bps[idx];
+	if (bp)
+		attr = bp->attr;
+	else
+		ptrace_breakpoint_init(&attr);
+
+	attr.bp_addr = state->addr;
+	attr.bp_len  = state->len;
+	attr.bp_type = state->type;
+	/* Always register disabled; enable below if requested */
+	attr.disabled = 1;
+
+	if (!bp) {
+		bp = register_user_hw_breakpoint(&attr, riscv_ptrace_hbptriggered, NULL, child);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+		child->thread.ptrace_bps[idx] = bp;
+	}
+
+	/* Enable or disable as requested by ctrl (0 = enabled, 1 = disabled) */
+	attr.disabled = state->ctrl == 1;
+	return modify_user_hw_breakpoint(bp, &attr);
+}
+
+static long riscv_ptrace_gethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct __riscv_hwdebug_state state;
+	long ret;
+
+	ret = riscv_ptrace_bp_get(child, idx, &state);
+	if (ret)
+		return ret;
+	if (copy_to_user(datap, &state, sizeof(state)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long riscv_ptrace_sethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct __riscv_hwdebug_state state;
+
+	if (copy_from_user(&state, datap, sizeof(state)))
+		return -EFAULT;
+
+	return riscv_ptrace_bp_set(child, idx, &state);
+}
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
 	long ret = -EIO;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	unsigned long __user *datap = (unsigned long __user *)data;
+#endif
 
 	switch (request) {
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	case PTRACE_GETHBPREGS:
+		ret = riscv_ptrace_gethbpregs(child, addr, datap);
+		break;
+	case PTRACE_SETHBPREGS:
+		ret = riscv_ptrace_sethbpregs(child, addr, datap);
+		break;
+#endif
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index ee30dcd80901..1315ac35157c 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -547,6 +547,10 @@ typedef struct elf64_shdr {
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
 #define NN_RISCV_USER_CFI	"LINUX"
 #define NT_RISCV_USER_CFI	0x903		/* RISC-V shadow stack state */
+#define NN_RISCV_HW_BREAK	"LINUX"
+#define NT_RISCV_HW_BREAK	0x904		/* RISC-V hardware breakpoint registers */
+#define NN_RISCV_HW_WATCH	"LINUX"
+#define NT_RISCV_HW_WATCH	0x905		/* RISCV-V hardware watchpoint registers */
 #define NN_LOONGARCH_CPUCFG	"LINUX"
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NN_LOONGARCH_CSR	"LINUX"
diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/elf.h
index 5834b83d7f9a..21f225502051 100644
--- a/tools/include/uapi/linux/elf.h
+++ b/tools/include/uapi/linux/elf.h
@@ -460,6 +460,8 @@ typedef struct elf64_shdr {
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NT_RISCV_HW_BREAK	0x904
+#define NT_RISCV_HW_WATCH	0x905
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
