Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DE606A32F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xej5p5PK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ba1yRdRP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HI3cg07k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8iyx3d3f/x769J4b/gE7e9xkJtA4sfujsrMSXhZs92w=; b=Xej5p5PKKx0BCY7xWbxXFzw/h/
	kFtyxxCqbaWrXB9wxo/xNOYUOKpZWkKEPQsHvw2Mq/avTlBwy9GoQzZFPyqpJCvKZeZJvnctrtTHH
	kvb76H+LsxnOCMHKgxaoVBUieEi4sVKad8Jp1/iswDvmIBBX2hctbTNce+2C1cOGC39W8IZqud9JW
	yDxWC/QG7pXlAX2RXMywvCa0/pRuvF8OnOP4RfCDUy/yabsnJ+LJoZn9E1pSWEBagUk1MbrEq2IKZ
	ahoTWBa5ll7FsMnd8sqNQzBFowvi1WQeaxIjiYa8wuTRy+PbjcUWExo1Ej1QXZP17le6MKYCATchR
	H5oGwrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLw-0000000E5VZ-0J0k;
	Sat, 07 Nov 2026 02:40:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLV-0000000E5PN-00Wa
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 02:40:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Xun11237688
	for <linux-riscv@lists.infradead.org>; Sat, 7 Nov 2026 02:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FtJbi3TLd6U
	zkLX1SyCMRPTJn7wcbqfY9cqjaOspDjk=; b=Ba1yRdRPm31IuQ/0NDxRWHBNdCu
	QQTW5Pi0gPLVfCmSxZpy31SZOsXuc39z/164Cj0hvtPOFPypGUoJsljC5ElSpchm
	NYod7pwBoKcdXlxwh9dsDzpTkkAPXGVhmIBxZOo2hH1VCkwvjKcLpwN2RVRYzqAY
	vAiU5knJ4vv2pGp4p0/iiYi/Tu+E4XKdlJzz3Xqyny6iPweXa7JH/su1A7aitSeQ
	IjNvZ4Hgqlo1EqUmNbM22dXMxh+pVr1F56s8dSNTdWiL/owlzhSkriDcZzzmn3Nz
	eqoyoZpZbukHailS6OeGs9Qj1jKr3Jah5eqTVLGxzkvJEvAWMYkzydYS4LQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagr0fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 02:39:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso1883375eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 18:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019195; x=1794623995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtJbi3TLd6UzkLX1SyCMRPTJn7wcbqfY9cqjaOspDjk=;
        b=HI3cg07kBT2ltEiAjfBCcFBNJKjPPWtvScg5F3wbEZlxzks6Ya/idTT0+7OpnKeOlg
         JMcX7S5lrKDePWKGlO1OBimQrq71x44Hz1GcW5GTMwr/P4vos/GPRK/GDbDt3XK5dzPG
         CMOYXAv1EgV/peqFHKZr+gIObJrN/dmDkc5jHQoo1BzehF6DWfp4bwi8UjNMY5Nq2OQG
         B8BZ88kGyoVlE8/QAnGCGvPzQYhV8MIVXGDjFTaQuIa0pMhuO7NAqibLNB4787Mbu93L
         v1VS3AFcRrGrAYtt8nlUpYIL6JR0k852kTgm9k9MJr+cGv0t3w36Z5x5FfQC2gictyHw
         MHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019195; x=1794623995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtJbi3TLd6UzkLX1SyCMRPTJn7wcbqfY9cqjaOspDjk=;
        b=ZJ+GFPZAPexKXpDv/O5/djyhy4G6301mUfba7CZ3sKnCNwwBzrXIkfygru0QVDoy1w
         giSuMj6guGjF6U7ds6nGCo+16dXnik+kATXqkG6Dy/okJ1D8sKoHZxlatvyLm2PArwY0
         bwNqY+yxr+Y3VPrR2JdDc1pQiJPh+NnKafs5SnkMx9hZSoJ8g51KAflyiHKDofsBxISx
         +KMYXe8m+yZUlAxwDIsg1MJXfRIb8gVwS/ioyRGN/dbe57OkAUK0atNkOvWRclGyi0jS
         l+5lqLyj2fV8rD5UDwQQwG3/6q+p6k8hMxd1X6jfy62RAQowRIgU8YVe2KaoscqBjZe3
         mOig==
X-Forwarded-Encrypted: i=1; AL+hErGQ+eRhVb7Pib0xytWNjXisvmgGSq5V0w4XySBZSeu5TWcvCguaUu75BejpVAgoqHPlSfM5qJdtfEJDMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z96zzKbGC48FEG76gD6CSN8PdR5G2LgK4L9SqwLOXqh+kZt0fHd
	ssHoj8QZsMeq5iX0xjw5ko1AX3pfPDGdY0WTBjsMEGnYtgL96p7lTfw5bb6SKl8/X+ed+oru5A1
	l/bnc0QTwSdS58zYMVCPdQsAxKP2+d/dTfXotdM4SdaPrGYapXxytZPRPfuFljF5Se3NTh1k=
X-Gm-Gg: AYBFou0M1DBqCoEMkSNzJwYKxPomXOoGHwPAPWoFuZGl73vw5GVWCLwRMpTNx4GWV9E
	LOG2tS6o+kvtmPb9bdf1f+LkCe6wZ2cOOEngVsSHRAyE97120oPJBkZ1KtCgbqGe0DyqAvtIyG0
	uwaAC5+PTVk1t+BpdMavqqIoBMjznVmAqy/Kc2gxcHLsw1KGtZeXMUsvWoA1v++yaR+kp2Z5g4d
	dKMkD2+A/3bsbrhhdryin/UxSSYJRX7QjcER2cU1kY0D/sGCyFDCO3TjmaNLWAJyERQVkZNarcG
	ffZQdtOnL8i7BC2uCQXEx1JpBkpyMliX9Ld6JJpmg2LXNOmKNbyEnabcez7QsjB/3SptHeuKohj
	O/JTQ+4Jb3dLXPkyroQdKGiRYe7SQnSJY/8Bnom+U7xnhSvctorDGhlEfpkSzlxmDFNQe76SvjN
	ncXJuhmJEt/Rftg1fNwxpZBMROYS+HudEzjdKWxSeylOkwRrQ4fIOW99vnxJFAvT9XMnXrCF9Bd
	A==
X-Received: by 2002:a05:7301:78c3:b0:36a:1904:60a3 with SMTP id 5a478bee46e88-36f75a2ae65mr5260144eec.15.1794019194674;
        Fri, 06 Nov 2026 18:39:54 -0800 (PST)
X-Received: by 2002:a05:7301:78c3:b0:36a:1904:60a3 with SMTP id 5a478bee46e88-36f75a2ae65mr5260125eec.15.1794019194141;
        Fri, 06 Nov 2026 18:39:54 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:53 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 3/8] riscv: add ptrace requests for hardware breakpoints
Date: Sat,  7 Nov 2026 08:09:12 +0530
Message-ID: <20261107023917.40606-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfX+eU1hHiy+bra
 SWcppT6Ew7HWixGxfOVTLytpKmVojY4oBMLPbJ3TE7MEBoE/UivWozxCSlqaVaJrelm2X7Jh6Bf
 0ojKH/nYZnIlFk9a0MGCveTtzJcqE/wEoGwmqYPe3/GpYkSNsNuzXJzokOLea7MCdgoL2mPKht+
 gh5tanEmpNHRKCm8Nv//Or8XyKTNkCY+dSA8bvPy1XXPz8doj+aqdT+mM7AvEu3ttpeqmeNIlSw
 KnJCld0S1H4bWYNjjPWJCdw/RupdLolmxn9bYYLJsDTXDudKUVz+4smxsiqQz2kAJypniwAvFyP
 9hbiTCDPbVVbdM+5YZD0GZsPcydv+GrI+i7eVndLU7b1vJD5tpMzstvXDzw/JgwBQM8ZH5T3cuV
 IIf1pR24nT2Oy3qe9sbebqLpZjyVI2rOO29gI/dWMnwkFcaWFPPJvmpmdJVTSNJrQDVVElmlE/d
 4WwNvLK+ZggWQPevrZg==
X-Proofpoint-ORIG-GUID: dPg5waYyCCpmnAM8h30gT_eg-ujY33gQ
X-Proofpoint-GUID: dPg5waYyCCpmnAM8h30gT_eg-ujY33gQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfXxnu1Z9+JR1EP
 KnJL2c09RtPdLu4Q13ZZK3IL93g3dfV/Nc4eFczkRIyYxf+fPbQqIjzrp8i0FQXw8F3u38KycY0
 PxGcwZY920vghR88zOVhdQvCv3eDD0o=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6aee8f7b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4WprEUycQGGDspryc_kA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_184003_127391_BCFBE39B 
X-CRM114-Status: GOOD (  28.52  )
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

Add support for the RISC-V PTRACE_GETHBPREGS and PTRACE_SETHBPREGS
requests. A tracer can use these requests to read or program one
hardware breakpoint or watchpoint slot at a time.

Store the ptrace-owned breakpoints in the traced task and use perf
hardware breakpoint events to program the trigger. Report hits as
SIGTRAP/TRAP_HWBKPT. Clear the events when a thread is flushed or copied
so breakpoints do not survive execve() or fork().

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/hw_breakpoint.h |  13 +
 arch/riscv/include/asm/processor.h     |  15 ++
 arch/riscv/include/uapi/asm/ptrace.h   |   9 +
 arch/riscv/kernel/hw_breakpoint.c      |   2 -
 arch/riscv/kernel/process.c            |   2 +
 arch/riscv/kernel/ptrace.c             | 321 +++++++++++++++++++++++++
 6 files changed, 360 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index dcce20ba3faa..6e8913d69df2 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -12,10 +12,17 @@ struct task_struct;
 
 #include <uapi/linux/hw_breakpoint.h>
 
+/* Maximum number of hardware breakpoints supported */
+#define RISCV_MAX_BP		16
+
 struct arch_hw_breakpoint {
 	unsigned long address;
 	unsigned long len;
 	unsigned int type;
+	unsigned int match;
+	unsigned int chain;
+	unsigned int select;
+	unsigned int time;
 
 	/* Trigger configuration data */
 	unsigned long tdata1;
@@ -42,8 +49,14 @@ void arch_disable_hw_breakpoint(struct perf_event *bp);
 int arch_install_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
+void ptrace_hw_copy_thread(struct task_struct *task);
 
 #else
 
+static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
+static inline void ptrace_hw_copy_thread(struct task_struct *task) { }
+
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index e9d339bcb7e9..a124ea48d805 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -15,6 +15,7 @@
 #include <asm/ptrace.h>
 #include <asm/insn-def.h>
 #include <asm/alternative-macros.h>
+#include <asm/hw_breakpoint.h>
 #include <asm/hwcap.h>
 #include <asm/usercfi.h>
 #include <asm/errata_list.h>
@@ -111,6 +112,19 @@ struct pt_regs;
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
@@ -135,6 +149,7 @@ struct thread_struct {
 #ifdef CONFIG_RISCV_ISA_SSQOSID
 	u32 srmcfg;
 #endif
+	struct debug_info debug;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 3de2b7124aff..373a1c14f207 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -15,6 +15,8 @@
 
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
+#define PTRACE_GETHBPREGS	0x4210
+#define PTRACE_SETHBPREGS	0x4211
 
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
@@ -164,6 +166,13 @@ struct user_cfi_state {
 	__u64 shstk_ptr;
 };
 
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
index 421ecd8549d9..4231170d4901 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -846,8 +846,6 @@ EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
 
 void hw_breakpoint_pmu_read(struct perf_event *bp) { }
 
-void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
-
 static int __init arch_hw_breakpoint_init(void)
 {
 	unsigned int cpu;
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1ca..083c45e657b6 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -204,6 +204,7 @@ void flush_thread(void)
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
 		envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
 #endif
+	flush_ptrace_hw_breakpoint(current);
 }
 
 void arch_release_task_struct(struct task_struct *tsk)
@@ -283,6 +284,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.riscv_v_flags = 0;
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
+	ptrace_hw_copy_thread(p);
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index a0055743d3ba..be076865d02d 100644
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
@@ -380,6 +382,152 @@ static int riscv_cfi_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+enum riscv_hbp_type {
+	RISCV_HBP_BREAK,
+	RISCV_HBP_WATCH,
+};
+
+/*
+ * Handle hitting a HW-breakpoint.
+ */
+static void riscv_ptrace_hbptriggered(struct perf_event *bp,
+				      struct perf_sample_data *data,
+				      struct pt_regs *regs)
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
+static struct perf_event *ptrace_hbp_get_event(enum riscv_hbp_type hbp_type,
+					       struct task_struct *tsk,
+					       unsigned long idx)
+{
+	struct perf_event *bp = ERR_PTR(-EINVAL);
+
+	switch (hbp_type) {
+	case RISCV_HBP_BREAK:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		bp = tsk->thread.debug.hbp_break[idx];
+		break;
+	case RISCV_HBP_WATCH:
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
+static int ptrace_hbp_set_event(enum riscv_hbp_type hbp_type,
+				struct task_struct *tsk,
+				unsigned long idx,
+				struct perf_event *bp)
+{
+	int err = -EINVAL;
+
+	switch (hbp_type) {
+	case RISCV_HBP_BREAK:
+		if (idx >= RISCV_MAX_BP)
+			goto out;
+		idx = array_index_nospec(idx, RISCV_MAX_BP);
+		tsk->thread.debug.hbp_break[idx] = bp;
+		err = 0;
+		break;
+	case RISCV_HBP_WATCH:
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
+static struct perf_event *ptrace_hbp_create(enum riscv_hbp_type hbp_type,
+					    struct task_struct *tsk,
+					    unsigned long idx)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	int err, type;
+
+	switch (hbp_type) {
+	case RISCV_HBP_BREAK:
+		type = HW_BREAKPOINT_X;
+		break;
+	case RISCV_HBP_WATCH:
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
+	err = ptrace_hbp_set_event(hbp_type, tsk, idx, bp);
+	if (err) {
+		/* Drop the event if it cannot be published in the task slot. */
+		unregister_hw_breakpoint(bp);
+		return ERR_PTR(err);
+	}
+
+	return bp;
+}
+
+#endif	/* CONFIG_HAVE_HW_BREAKPOINT */
+
 static struct user_regset riscv_user_regset[] __ro_after_init = {
 	[REGSET_X] = {
 		USER_REGSET_NOTE_TYPE(PRSTATUS),
@@ -549,12 +697,173 @@ void ptrace_disable(struct task_struct *child)
 {
 }
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static int riscv_ptrace_bp_type_to_hbp(u64 type, enum riscv_hbp_type *hbp_type)
+{
+	switch (type) {
+	case HW_BREAKPOINT_X:
+		*hbp_type = RISCV_HBP_BREAK;
+		return 0;
+	case HW_BREAKPOINT_R:
+	case HW_BREAKPOINT_W:
+	case HW_BREAKPOINT_RW:
+		*hbp_type = RISCV_HBP_WATCH;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int riscv_ptrace_bp_clear_event(struct task_struct *child,
+				       enum riscv_hbp_type hbp_type,
+				       unsigned long idx)
+{
+	struct perf_event *bp = ptrace_hbp_get_event(hbp_type, child, idx);
+
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+	if (!bp)
+		return 0;
+
+	unregister_hw_breakpoint(bp);
+	return ptrace_hbp_set_event(hbp_type, child, idx, NULL);
+}
+
+static int riscv_ptrace_bp_get(struct task_struct *child, unsigned long idx,
+			       struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+
+	if (idx >= RISCV_MAX_BP)
+		return -EINVAL;
+
+	idx = array_index_nospec(idx, RISCV_MAX_BP);
+
+	/*
+	 * PTRACE_GETHBPREGS is a compact view keyed only by index.  The real
+	 * storage is split by type, so search both arrays.
+	 */
+	bp = ptrace_hbp_get_event(RISCV_HBP_BREAK, child, idx);
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+	if (!bp) {
+		bp = ptrace_hbp_get_event(RISCV_HBP_WATCH, child, idx);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+	}
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
+			       struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	enum riscv_hbp_type hbp_type, other_hbp_type;
+	int ret;
+	bool created = false;
+
+	if (idx >= RISCV_MAX_BP)
+		return -EINVAL;
+
+	idx = array_index_nospec(idx, RISCV_MAX_BP);
+
+	ret = riscv_ptrace_bp_type_to_hbp(state->type, &hbp_type);
+	if (ret)
+		return ret;
+
+	/* The legacy request exposes ctrl as a disabled/enabled boolean. */
+	if (state->ctrl > 1)
+		return -EINVAL;
+
+	other_hbp_type = hbp_type == RISCV_HBP_BREAK ?
+			 RISCV_HBP_WATCH : RISCV_HBP_BREAK;
+
+	bp = ptrace_hbp_get_event(hbp_type, child, idx);
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+	if (!bp) {
+		bp = ptrace_hbp_create(hbp_type, child, idx);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+		created = true;
+	}
+
+	attr = bp->attr;
+
+	attr.bp_addr = state->addr;
+	attr.bp_len  = state->len;
+	attr.bp_type = state->type;
+	/* Enable or disable as requested by ctrl (0 = enabled, 1 = disabled) */
+	attr.disabled = state->ctrl == 1;
+	ret = modify_user_hw_breakpoint(bp, &attr);
+	if (ret) {
+		/* Drop only events allocated by this failed request. */
+		if (created)
+			riscv_ptrace_bp_clear_event(child, hbp_type, idx);
+		return ret;
+	}
+
+	/*
+	 * If the same index changed from breakpoint to watchpoint, or back,
+	 * clear the old opposite-type slot after the new event is valid so a
+	 * failed update does not destroy the previous state.
+	 */
+	return riscv_ptrace_bp_clear_event(child, other_hbp_type, idx);
+}
+
+static long riscv_ptrace_gethbpregs(struct task_struct *child, unsigned long idx,
+				    unsigned long __user *datap)
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
+				    unsigned long __user *datap)
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
@@ -623,8 +932,20 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			compat_ulong_t caddr, compat_ulong_t cdata)
 {
 	long ret = -EIO;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	/* cdata is a compat user pointer for the legacy HBP requests. */
+	unsigned long __user *datap = compat_ptr(cdata);
+#endif
 
 	switch (request) {
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	case PTRACE_GETHBPREGS:
+		ret = riscv_ptrace_gethbpregs(child, caddr, datap);
+		break;
+	case PTRACE_SETHBPREGS:
+		ret = riscv_ptrace_sethbpregs(child, caddr, datap);
+		break;
+#endif
 	default:
 		ret = compat_ptrace_request(child, request, caddr, cdata);
 		break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
