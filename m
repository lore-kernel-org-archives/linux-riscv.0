Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B22EC28B30
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7oMGkwksoVWvKOiLEIAGf58GuiXh3e0pgo2muQfouI=; b=jeU1vsiIGeWM5t
	YBIY2jNCJ3XAIV6+sZ9bpvFpsucXarZTMDnZY+eon1aVP3Ue2nwSqEZoEPkQ8mRCkP+7AwZlJYT8n
	BweK3Rb73f6DA8HuqbeQfnuLbXyeA4A5Bkrb8wTISrVnoHsQBNViv2ayBJOnE5/smhICVozssF/7/
	LXyahFc7OVIJG5gx3qaItzDCVjdGhQA6Qcv6IUQBPv1ZqIGMuoRmYtvdGb2qtrJXhO1Bhnd3p5XAG
	2p8qXy6Uu3KbzJcW4y+18yN/VGswywusYSOA8IkWnQnUqoWwow2dsRaq4wfXTTDCbKrQJUWAsBzwq
	6dezfx9lJ1EnmsfcgpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDrx-0000000FSsu-3J7f;
	Fri, 14 Mar 2025 22:51:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClQ-0000000FL9d-2k94
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rWrKgiNxYfbME3P70C/T1Lq76CoQh/bECvkoPEvcu2k=; b=YrDshwGDjY0nyhfDjdkpfm/Nru
	BNogjnMVAbHWMXIzYG0TwWAGZ17po8APbSbO2PGGrICeC2cpoYWbpO+SdU3g6+zdsYX7sx+9KP1xK
	GzDsN/pa37dg3KAux3qolhOl+hURSmIDQKG5XtxftsKnyWpWnbTC8wIVWRM6QvyxCuCY/ZH9QPxaW
	seGF2M7+N+a/xOpbICbB4X++EoZWavu+3GElDjXQ5DHrSK8jpbfM0uGSUrPXkyqSfbS+FftsoF5la
	2cPMMAx50+Lypxr8yht9TbucoPIE4UqYPBjvtKJgaUjZMJKXp2USMtGYH/QuC/u3Q491a2rnJtm5b
	0aIlFeCw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClH-00000002x86-2Xzq
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223f4c06e9fso47193665ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988404; x=1742593204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWrKgiNxYfbME3P70C/T1Lq76CoQh/bECvkoPEvcu2k=;
        b=1pP0Saj+QfVERmdVbx2n+I2aEj5WA2m+R5+8/TXNQfYRKgnytbbS+PUR/H5XLQh57M
         6Xlvxj9GsYLieF7/BqkyWnf+xytfhwMl+KjgeiOLcQh+jX61DIiczKPz0caP2LQy89aK
         H8pWSN1bxYjbVyllbPivYXKZ7KIgLL+oxH2ZFXn6na7SGp0WYTr9lR9ZCrGIpk47C1Eu
         3vIvuq/gbnVsTU6TSfuz7FGLsSNoCKunlumH9ro5a229Iy+vS3mFc4zif1iracXMprrP
         FQHlKVsId2cs9y/Y28duhvr+5s33xlkVvmadsWKYtV2pmEYuOandhV8/i0rqSPEI0K7e
         ILWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988404; x=1742593204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWrKgiNxYfbME3P70C/T1Lq76CoQh/bECvkoPEvcu2k=;
        b=WpinF7rl/lmfdwWhrv3O366CKieq7jQlrYkPrMwqvK8qEOjDocmPnRuwwQ0GbCWPiB
         MJEj+3DSTY51vlMMNNgbX7uNdSZiTWcknrz4DKyPjUoM2REUgSI6+74sN3khxDSYQ9l2
         ZontxRwL1cvTN3Fxs1+++bW8k16pgEED0pNbXiBdogX4/hjAAaeBuLLyox6V07X1NcRy
         7CDXNBQT+jq+y88mlcuWpQH2aBL77gfepw055+n+rUfxPdBpd285d965TE8PH9gAVrqK
         Ap22Ze8CmmuR92nFtt2inmsrgAnF1FZBBh4Iufkr6J9dEkKdLtHJJyTLfWFiyzyZn7TR
         7MfA==
X-Forwarded-Encrypted: i=1; AJvYcCVHUTCz8sgkIZ+0DzhJcCavHCNVplYN0FHa8rqMhRMw3FXseEIXtPqEUZqLRPOflCdUQwW2X80b47W2lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5W8ZM6T12CnL5G6x2A9IHRMDexso+P2YjiIFXt32AD7cR+to
	eNz0m6DTzqf7ry7cwauaOESm9GJDQgry92ZqrxT7o1wnA3UfAMTCV8FbEbDVjA8=
X-Gm-Gg: ASbGncu5rixRqDPMdY1ajBgb/LoZEG7fKZ4w4i6EPCR/3oBNwarhxMV2wtSIx71qcoJ
	DmCE5oCOXFGuMo0qPLwODXiqBKk5/3ldMe4t+W48pthRR/Q5Gz/Zp9YKEegRSRNleWXGe0TfQf/
	mnVzL0/Z8YYJLGxz747DULFHY5SLPhDwK51RiO7UQ8RDX7emX1HuszHwW6iDqWHHkTRsxOuFuw7
	WVQdxTnt+TjLpDJ3oz8lO8cwW6VfUC+1o95qITCxmPRI3I3rQKhnUyW05IWF9A914Oolc8P5btW
	C+0+iSB+h2FzOkn2CLkwbHBAJbmFL7TBMLcJ5ZNMX6PsNfOwhmsp61o=
X-Google-Smtp-Source: AGHT+IFB7KLzuKm3iRuPqbgCrAWr33vleUkeuBdLiqwVXE3Idc26W6StRutTcYSVfvNmBJhH5yZY7A==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id d9443c01a7336-225e177d49amr54022925ad.21.1741988403722;
        Fri, 14 Mar 2025 14:40:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:33 -0700
Subject: [PATCH v12 14/28] riscv: Implements arch agnostic indirect branch
 tracking prctls
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-14-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214012_931212_DAC63242 
X-CRM114-Status: GOOD (  19.28  )
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

prctls implemented are:
PR_SET_INDIR_BR_LP_STATUS, PR_GET_INDIR_BR_LP_STATUS and
PR_LOCK_INDIR_BR_LP_STATUS

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h | 16 +++++++-
 arch/riscv/kernel/entry.S        |  2 +-
 arch/riscv/kernel/process.c      |  5 +++
 arch/riscv/kernel/usercfi.c      | 79 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index c4dcd256f19a..a8cec7c14d1d 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -16,7 +16,9 @@ struct kernel_clone_args;
 struct cfi_status {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
 	unsigned long ubcfi_locked : 1;
-	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 2);
+	unsigned long ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
+	unsigned long ufcfi_locked : 1;
+	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 4);
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -33,6 +35,10 @@ bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
 void set_shstk_lock(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+bool is_indir_lp_enabled(struct task_struct *task);
+bool is_indir_lp_locked(struct task_struct *task);
+void set_indir_lp_status(struct task_struct *task, bool enable);
+void set_indir_lp_lock(struct task_struct *task);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -58,6 +64,14 @@ void set_shstk_status(struct task_struct *task, bool enable);
 
 #define set_shstk_status(task, enable)
 
+#define is_indir_lp_enabled(task) false
+
+#define is_indir_lp_locked(task) false
+
+#define set_indir_lp_status(task, enable)
+
+#define set_indir_lp_lock(task)
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68c99124ea55..00494b54ff4a 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -143,7 +143,7 @@ SYM_CODE_START(handle_exception)
 	 * Disable the FPU/Vector to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS_VS | SR_ELP
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index cd11667593fe..4587201dd81d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -160,6 +160,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	set_shstk_status(current, false);
 	set_shstk_base(current, 0, 0);
 	set_active_shstk(current, 0);
+	/*
+	 * disable indirect branch tracking on exec.
+	 * libc will enable it later via prctl.
+	 */
+	set_indir_lp_status(current, false);
 
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index b93b324eed26..7937bcef9271 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -72,6 +72,35 @@ void set_shstk_lock(struct task_struct *task)
 	task->thread_info.user_cfi_state.ubcfi_locked = 1;
 }
 
+bool is_indir_lp_enabled(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_en ? true : false;
+}
+
+bool is_indir_lp_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_locked ? true : false;
+}
+
+void set_indir_lp_status(struct task_struct *task, bool enable)
+{
+	if (!cpu_supports_indirect_br_lp_instr())
+		return;
+
+	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
+
+	if (enable)
+		task->thread.envcfg |= ENVCFG_LPE;
+	else
+		task->thread.envcfg &= ~ENVCFG_LPE;
+
+	csr_write(CSR_ENVCFG, task->thread.envcfg);
+}
+
+void set_indir_lp_lock(struct task_struct *task)
+{
+	task->thread_info.user_cfi_state.ufcfi_locked = 1;
+}
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
  * regular stack. Else PAGE_ALIGN it and return back
@@ -372,3 +401,53 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 
 	return 0;
 }
+
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long fcfi_status = 0;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is enabled on the task or not */
+	fcfi_status |= (is_indir_lp_enabled(t) ? PR_INDIR_BR_LP_ENABLE : 0);
+
+	return copy_to_user(status, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	bool enable_indir_lp = false;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is locked and further can't be modified by user */
+	if (is_indir_lp_locked(t))
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (status & ~PR_INDIR_BR_LP_ENABLE)
+		return -EINVAL;
+
+	enable_indir_lp = (status & PR_INDIR_BR_LP_ENABLE) ? true : false;
+	set_indir_lp_status(t, enable_indir_lp);
+
+	return 0;
+}
+
+int arch_lock_indir_br_lp_status(struct task_struct *task,
+				 unsigned long arg)
+{
+	/*
+	 * If indirect branch tracking is not supported or not enabled on task,
+	 * nothing to lock here
+	 */
+	if (!cpu_supports_indirect_br_lp_instr() ||
+	    !is_indir_lp_enabled(task) || arg != 0)
+		return -EINVAL;
+
+	set_indir_lp_lock(task);
+
+	return 0;
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
