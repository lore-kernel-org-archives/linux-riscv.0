Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB17BEEE272
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW16TeNxapRxtMgKGuodTOfB4geiey8rq0IXdmFc91o=; b=uutAllcX72LqnX
	MiUbZhV8EGTZuTrKTz8oxad9xJU/Cqw1jHduV0t3aojPVJbZPcAoAs1hbAStQC+LZRBmSHuOGu6AQ
	Oeui6E01KLJPIvTE0D0a7sbn8EY4Xqr2ua2fw3nv+KTe2xcDjjQKwG9uI6kCxx32wzjuz55rQki1Y
	bkFytaZ8VBDKYxcdbd3/H8Prk/2bSBtEIyY05ntRT/LMQ1Jkjgaz7z4eNvKdjRw0gEdLoX1HGG2dL
	cJbUkDAA7e44ugd4llTrtLY4A11DDsIKaItET9jF1pmB+jSXBrQg9DOBHkKSa8TnBZoQ8yqZmxf+X
	IACbnuMLQSt8Qzavr22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot51-0000000ERxJ-2zJF;
	Thu, 12 Sep 2024 23:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4z-0000000ERvQ-2Njf
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IdMH+b8hMWx7M6md7N6CXtcv0PrleWKto++QHl76wt4=; b=LCN/ZVhWKDj1Q/kgcGAJYNTP4g
	sIc6NWV8qWAeEijmjuqj5gp3VpnibdryDjhUa2ND1M4w/N8KSgkDuroI851gJeriiNRoqdi1+g/ZQ
	yTyq9GsHBRQR++Q+b9QQRGqpIggxWlfYvM8DznBWdlKQnbGvF+igisPQRSWbsaT/ZyKVxU7BXzsty
	JyZfVk2oII9ZG5jDpJYjtPyuxSD8GEsTO1QOJ0OBAjlNjkFXfULwNqxCSSmz2Xk+y7FuXrJZrdZEQ
	8tq0y9oAnssm+SRDvTte1HaVJGRtBO+7SFUmhMtBqXV1ilydXuUgACLD/5JCbvFQ8uDcSlR+RI71m
	UX5pwv8g==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot4T-00000000Y7y-2REC
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2d8881850d9so1256156a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183070; x=1726787870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdMH+b8hMWx7M6md7N6CXtcv0PrleWKto++QHl76wt4=;
        b=VO5rmpOKCV2gYU3yE4cPtYqxhE1F1DFOjTYcToOmle9V8+FpbYaphu7FqMBoMRX6HH
         yfwbOdro503/E8/rr6NxoH+MvulApSYKmghh97UnC7ytT/9V4w5XYHSOlx+tPGxwdqLk
         +kbWqrkzunJBkyte09ei7XDKrRNXmYSaPMYqf0qXoRS5dAmBqGTFXbDNgs3UmJa526Z6
         N3/LwFYk1sISt8Xqih+0ePg4rHMUFT+N2jdRffRQcLdKZdWHYn01gjgluCZxc77GR4Rw
         hgd9V7kZ4HzW5FcoXPEG0tHfsCW8VYy9GIb8gmIJcxAslmnB++/iZ0mGMMlpICNNia1w
         MduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183070; x=1726787870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdMH+b8hMWx7M6md7N6CXtcv0PrleWKto++QHl76wt4=;
        b=BVbqoi+mREhmqI7O3/ygoAtMADwxXpI+OZiN1y69pLgu3kZdKQRTKyWGKVl8wAH17S
         Sm9BZOSDdr+PS2OX2TxhHL2GbBuzAF79v0Iyyq4XuP+lgY0zs9u4HB6KaNXpvGoA4+sd
         gbIxvbQGqUhrdAhoe+FYM7+P1L2fzwEiBjScYbmgqyJZcTfp9CMfTNbOEuA3+2ju3GrK
         xZ0kuE/teoSceooboo02vwnRInvlDOF28tsVAlWEBdSZQ+ovCyPPuuMouCehQHYeQjGl
         WKO5Cy4vVfbRLfnGROySVY6PL1K+e/lOmRx6g8aAgY8LVaoQHCFx1wIP3EyemSIZTAiT
         X3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXJpz6FFCSpmHVF/Kw2gBQn4eSo/HLvB9ebkXkIJkRtZaCPeI/Xbb9ZMFH1RMa1iGLSE5f9ZyLKDXMSTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFGcxSXVIQKRGNmqyldo/FH5QyvBIrKdDpNXviqSS5QnK4pbN4
	tXLw161j3KhbvGhOFZ26Co9Vuv6Va/spRMAz2lOGSFZvyYjAhm9CzE+C65tPZVo=
X-Google-Smtp-Source: AGHT+IFFLSdBWtF2TFEc0MNeO8MBZSGLro8EZzW5E3fSn2Pc5KYqBR0cHiRpYxrN8cHcKSAWR1r/XQ==
X-Received: by 2002:a17:90a:9a86:b0:2d8:8818:4d53 with SMTP id 98e67ed59e1d1-2dba0090ccbmr4436318a91.41.1726183069691;
        Thu, 12 Sep 2024 16:17:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 10/30] riscv: usercfi state for task and save/restore of CSR_SSP on trap entry/exit
Date: Thu, 12 Sep 2024 16:16:29 -0700
Message-ID: <20240912231650.3740732-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001804_461563_A75CF1F9 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Carves out space in arch specific thread struct for cfi status and shadow
stack in usermode on riscv.

This patch does following
- defines a new structure cfi_status with status bit for cfi feature
- defines shadow stack pointer, base and size in cfi_status structure
- defines offsets to new member fields in thread in asm-offsets.c
- Saves and restore shadow stack pointer on trap entry (U --> S) and exit
  (S --> U)

Shadow stack save/restore is gated on feature availiblity and implemented
using alternative. CSR can be context switched in `switch_to` as well but
soon as kernel shadow stack support gets rolled in, shadow stack pointer
will need to be switched at trap entry/exit point (much like `sp`). It can
be argued that kernel using shadow stack deployment scenario may not be as
prevalant as user mode using this feature. But even if there is some
minimal deployment of kernel shadow stack, that means that it needs to be
supported. And thus save/restore of shadow stack pointer in entry.S instead
of in `switch_to.h`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/asm/thread_info.h |  3 +++
 arch/riscv/include/asm/usercfi.h     | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  4 ++++
 arch/riscv/kernel/entry.S            | 26 ++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 arch/riscv/include/asm/usercfi.h

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index d61587964bd7..83d6ca4e0bba 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,6 +14,7 @@
 
 #include <asm/ptrace.h>
 #include <asm/hwcap.h>
+#include <asm/usercfi.h>
 
 /*
  * addr is a hint to the maximum userspace address that mmap should provide, so
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index c74536194626..cb694aef337d 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -58,6 +58,9 @@ struct thread_info {
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 	unsigned long envcfg;
+#ifdef CONFIG_RISCV_USER_CFI
+	struct cfi_status       user_cfi_state;
+#endif
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
new file mode 100644
index 000000000000..4fa201b4fc4e
--- /dev/null
+++ b/arch/riscv/include/asm/usercfi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Copyright (C) 2024 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+#ifndef _ASM_RISCV_USERCFI_H
+#define _ASM_RISCV_USERCFI_H
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_USER_CFI
+struct cfi_status {
+	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 1);
+	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
+	unsigned long shdw_stk_base; /* Base address of shadow stack */
+	unsigned long shdw_stk_size; /* size of shadow stack */
+};
+
+#endif /* CONFIG_RISCV_USER_CFI */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_USERCFI_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..5457f9070cff 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -45,6 +45,10 @@ void asm_offsets(void)
 #endif
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
+#ifdef CONFIG_RISCV_USER_CFI
+	OFFSET(TASK_TI_CFI_STATUS, task_struct, thread_info.user_cfi_state);
+	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
+#endif
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ac2e908d4418..ca9203e6d76d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -60,6 +60,20 @@ SYM_CODE_START(handle_exception)
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
+	/*
+	 * If previous mode was U, capture shadow stack pointer and save it away
+	 * Zero CSR_SSP at the same time for sanitization.
+	 */
+	ALTERNATIVE("nop; nop; nop; nop",
+				__stringify(			\
+				andi s2, s1, SR_SPP;	\
+				bnez s2, skip_ssp_save;	\
+				csrrw s2, CSR_SSP, x0;	\
+				REG_S s2, TASK_TI_USER_SSP(tp); \
+				skip_ssp_save:),
+				0,
+				RISCV_ISA_EXT_ZICFISS,
+				CONFIG_RISCV_USER_CFI)
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
@@ -149,6 +163,18 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+
+	/*
+	 * Going back to U mode, restore shadow stack pointer
+	 */
+	ALTERNATIVE("nop; nop",
+				__stringify(					\
+				REG_L s3, TASK_TI_USER_SSP(tp); \
+				csrw CSR_SSP, s3),
+				0,
+				RISCV_ISA_EXT_ZICFISS,
+				CONFIG_RISCV_USER_CFI)
+
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
