Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E5BCCD188
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2nheoIUOMqDzK5y/D+05PRImkg9ERz8meO0T2meIzA=; b=WvIORYaDppMHhF
	NchTkaxj2CdEB7d0IUZIV+fbTJqGahpY7NdsJ2SFxlHRZpKLdB+PXCgaEDSXef8cWj8Wksyxq72c1
	6Jwb+bNrEwcE4wkr1ri07QWgeW0I2I1XHdM36Q4OQpXjftFq66IDeiYep5t9BpC7D3+bA3toZ6aoA
	Mg/Mw6gvAybjbQWrxZWOxMntM9SMcx8lgm5I2XkDA3vOmDKrVLpEcHIcF9BCmxFAPFuzuxeP3immH
	1VAVFka0yTBHReDI+9cAyMOSw3TsgRR1Dg8QbYADKDqfF0eD+EhTkodZAbDL1//jpcZqIG4oxSWpb
	jSQbpnvuqt30f1315TTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LH-00000001w35-1A4B;
	Tue, 07 Oct 2025 11:58:55 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LF-00000001w0m-1SsB
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so6962896e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838331; x=1760443131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLmsg/56sZrz4BdDAhOz8lvZvUVWtSQgVDQGJvDc9c8=;
        b=EvHy7DP5IJdRtFFkWeiXw74IPKxIe7XpuzNxzQDWNIUsYxspECQ3sZWsGGEEpzMumm
         wuBHa9Yg7BMsP853YkXPzNZihjY5BrApeP7+8UvmVMO8OTcBCQaRPbgebqjTiN9wERk3
         OXA+Isfc932bGpwcPzxsxmG2jK5O8Sbs1fD2q/JmGDPEEYCGOmw2JKg3aAelAEttu6hq
         tiDHMfuftwspySwpdwaJ9HQn4fJN7IcCOnFAC58OO12zR/p+GzH1ZBsUpg4y7Oz+dxbU
         82EZdKQ03083rbp/C5zs2yRJSMYAbUsx+W7YqmPqzC9BryXRM/hVSCpUo9zeAojTtQtN
         xXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838331; x=1760443131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLmsg/56sZrz4BdDAhOz8lvZvUVWtSQgVDQGJvDc9c8=;
        b=NghX8zNuD21Qlb8cKvJfvCdcPSKvNi4CJK+12ocVmVK32KMixlUblIbfwDnVg0clXw
         hGja2r82fuTAKgCInhgmvuLyv3Pqfm56ExZbVmMdLuU7iTYf21RXPxd1yHLOx612Yq/2
         mHiGYcaA3gPXQOK8ePGt9eB4U6dyngBov1Bd+evDHngOcMQAqoIn32Sy7ovgbx0aBTGY
         l7Nyo/Zm4jvoNG9UBAWVet4apFDBCrIJgY43EbO1D4DvQ18mPu85w0+mTp/g5sWI3sMD
         fGyR75e7ObjJzbRXagSgaZixsEh0mCGC21wDjfqZNNqLPiBoaOiXfrZ7HvWyHbW52Rmj
         K/vg==
X-Gm-Message-State: AOJu0Yz5tEshvHzRvsIS2KQm2ktSfSoykpLbDPQlaHmGw8chAij2FA6j
	AlqiEag7KWrqbssGiHsyf/19GdwD8HD79Y9rhHkEdlY50pbFzaEUPSejYGeSzWbj
X-Gm-Gg: ASbGncsHcX4LezG/xqVpmmv1FNuY7bsWkIxarkfF30dYuw0rD8QZtbxbo5DysowXPC5
	RhJCCv2cGBYke6SqSWBBmRGvgfK1iyVXPfMoCT2yvQgCFI71yFfUAUB3aZZaJJC3s0cZkxAMILc
	i3JcPRmjLRe3eS6i3Dvvwv6L39plVv6n9zse+TtGlEyNFfDQCaV/K3Tpl0zfDn4iANH21QsK4i/
	peKVHr8TMufZ0gplkeDDa0chO4JogYdjyNxTrebJNMuqIHoBMnv07dFnhfMfYSWMfPWmtn8ACH1
	ne82J+UKjVsUoWAZcnjYmeKoza4lIobWUc5N0biucTxkK1mKMGy8BDYwCHjg+XGbqZ75i6Xz3Yg
	S/jUyZcJzKNX6xG5VwtXUaQ/tbSWv7smhP5UMZw==
X-Google-Smtp-Source: AGHT+IGfT8s7layBTVcGXA6YfBl09MAMt5tdhMpUSEGyHeuPqtgVVg9HtsIeoOOkz2owLe0BeMm1lQ==
X-Received: by 2002:a05:6512:3e27:b0:55f:6db5:748d with SMTP id 2adb3069b0e04-58cb956b71amr5116109e87.4.1759838330577;
        Tue, 07 Oct 2025 04:58:50 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:49 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 4/6] riscv: vector: allow to force vector context save
Date: Tue,  7 Oct 2025 14:58:20 +0300
Message-ID: <20251007115840.2320557-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045853_421084_66B2D906 
X-CRM114-Status: GOOD (  13.98  )
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

When ptrace updates vector CSR registers for a traced process, the
changes may not be immediately visible to the next ptrace operations
due to vector context switch optimizations.

The function 'riscv_v_vstate_save' saves context only if mstatus.VS is
'dirty'. However mstatus.VS of the traced process context may remain
'clean' between two breakpoints, if no vector instructions were executed
between those two breakpoints. In this case the vector context will not
be saved at the second breakpoint. As a result, the second ptrace may
read stale vector CSR values.

Fix this by introducing a TIF flag that forces vector context save on
the next context switch, regardless of mstatus.VS state. Set this
flag on ptrace oprations that modify vector CSR registers.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/include/asm/thread_info.h | 2 ++
 arch/riscv/include/asm/vector.h      | 3 +++
 arch/riscv/kernel/process.c          | 2 ++
 arch/riscv/kernel/ptrace.c           | 5 +++++
 4 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 836d80dd2921..e05e9aa89c43 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -118,7 +118,9 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 #define TIF_32BIT			16	/* compat-mode 32bit process */
 #define TIF_RISCV_V_DEFER_RESTORE	17	/* restore Vector before returing to user */
+#define TIF_RISCV_V_FORCE_SAVE		13	/* force Vector context save */
 
 #define _TIF_RISCV_V_DEFER_RESTORE	BIT(TIF_RISCV_V_DEFER_RESTORE)
+#define _TIF_RISCV_V_FORCE_SAVE		BIT(TIF_RISCV_V_FORCE_SAVE)
 
 #endif /* _ASM_RISCV_THREAD_INFO_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index b61786d43c20..d3770e13da93 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -370,6 +370,9 @@ static inline void __switch_to_vector(struct task_struct *prev,
 {
 	struct pt_regs *regs;
 
+	if (test_and_clear_tsk_thread_flag(prev, TIF_RISCV_V_FORCE_SAVE))
+		__riscv_v_vstate_dirty(task_pt_regs(prev));
+
 	if (riscv_preempt_v_started(prev)) {
 		if (riscv_v_is_on()) {
 			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 31a392993cb4..47959c55cefb 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -183,6 +183,7 @@ void flush_thread(void)
 	kfree(current->thread.vstate.datap);
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
 	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
+	clear_tsk_thread_flag(current, TIF_RISCV_V_FORCE_SAVE);
 #endif
 #ifdef CONFIG_RISCV_ISA_SUPM
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
@@ -205,6 +206,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
 	memset(&dst->thread.kernel_vstate, 0, sizeof(struct __riscv_v_ext_state));
 	clear_tsk_thread_flag(dst, TIF_RISCV_V_DEFER_RESTORE);
+	clear_tsk_thread_flag(dst, TIF_RISCV_V_FORCE_SAVE);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 906cf1197edc..569f756bef23 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -148,6 +148,11 @@ static int riscv_vr_set(struct task_struct *target,
 	if (vstate->vlenb != ptrace_vstate.vlenb)
 		return -EINVAL;
 
+	if (vstate->vtype != ptrace_vstate.vtype ||
+	    vstate->vcsr != ptrace_vstate.vcsr ||
+	    vstate->vl != ptrace_vstate.vl)
+		set_tsk_thread_flag(target, TIF_RISCV_V_FORCE_SAVE);
+
 	vstate->vstart = ptrace_vstate.vstart;
 	vstate->vl = ptrace_vstate.vl;
 	vstate->vtype = ptrace_vstate.vtype;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
