Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49248C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6H1VEo432GhcW1Csa25qR2loRvUT5T8LoHcF08xUf8=; b=ht/e0SoVt+p9vS
	YcytY8NfWP2slS1zcBznIui3FfTusP+rVeU22OhGbJP9eofca/aIHVV61PUNPkD9mnqHiwP7cln13
	uC1/JzKESL9w4/InkDhqTcEgXbM/BA2+BiX39+Sq3PRlFSoGtFo96a3yX7038yxxWhaYTSLDyrIb9
	ShJlmIAZTyF+iYQFCrkRA7jKULT0fakjipc1wjX+mz6528iUQDwHXeHqPlxFemjL39bWrGq29jeNj
	6W/SCUyFImeBVggQKfsh0g8AiLQmNH92ev1Vbfs2ZPhAFiJB+iRZu1k6Lx0rTqUqX53/hDi5BJ/iO
	6GwzkAkZIROoas2oSrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUd-0000000EMmJ-2WBA;
	Tue, 19 Mar 2024 21:59:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUV-0000000EMfM-3wbW
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso4651426a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885564; x=1711490364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9YnfDFlIzM6IgPNouej5vSECO3AYIq38694OD5b58U=;
        b=RQYBd2ibWTBCp4EAQntVubKy2BcjgC2JKzvpM30BIDEZouJErAigJt+e8485OswShg
         kjd4Vii72PiYW0Kj3OS6G1Pr+wb5wbZUg0NzRRAGLs3DazAZ8SyG/KJNg6x0m3B5wI3v
         SgMcctMUweJZyPEFtH1ANx9FAon4A/rKJPBtqwhxwIr3rdPsK2lU8bfrcK/Wn01uvEwO
         aZakJJ/QgkLelqnOq1qkM4KfKsA6SKkdHN5O/tqBhWEI2yI+6bcedYjBCKpPw36Mdytr
         Yel+WdANyW9CknXdzRIKIcXl4kSCJcRW83mL8K2SUE5VgNPJ3+jSDXmUE5dAkYu2Nerr
         fEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885564; x=1711490364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9YnfDFlIzM6IgPNouej5vSECO3AYIq38694OD5b58U=;
        b=QbUL3a1HtqZRhRefIaxgyaOfJ3ParvaccIJEidS32tz1giOMuTU7vkup+8e8h3CrLF
         Fhiu0xZGB5+pTnwNBVuJeOank9mndoFzJ1ljXRgzAk2ZPFH7fKBWVVVIJcihDRGmEtBc
         s0dT8helhRfFgGMmsmuVFthWzNQ9LBW12EW5iNk2n71g3KjA4AV1rJFuN1njvQ2PTRgi
         Mqr53292DLd6sNvAw+fcJAyx6FQfjJbu/Ny6xup3NXa6dP8ijqaZ14Zh+oxXGNTO7zGT
         sjBtrUoVMb4T6cAzaj/IibeICZbR8avRo5WrerQ+XUf80tuJ3iCVTLTVCfhhrSOWz6H6
         0Icg==
X-Forwarded-Encrypted: i=1; AJvYcCWjhT7P01XOA1fVXZNyOeC/zyL1rSOSvDxs/KMMxbJXu4vXficVg/nc359DLUeTwHZ9m2qUW77VE+cXr+5Cv6Hu1a3TcF/BcPPTaGTaPib6
X-Gm-Message-State: AOJu0YxtJKGwPVND/fI8HeDs9XHafYKIEUlZgYbPQ9ZuWbTmLGZESRcF
	1Z2KOp95cHmfkqK+pnbc1UwY1yKG37RvzZq4xxmLUHAwh0NiFiZ9RRhEsbOnFtY=
X-Google-Smtp-Source: AGHT+IHrqGWm4HKmgxz4QikODSsEmQwi2ndyv1CO9uxCpMgdQukkIvJsZM3/zryU+sLiBqD988H0gQ==
X-Received: by 2002:a05:6a21:350d:b0:1a3:7efc:81f4 with SMTP id zc13-20020a056a21350d00b001a37efc81f4mr1954693pzb.16.1710885564420;
        Tue, 19 Mar 2024 14:59:24 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stefan Roesch <shr@devkernel.io>
Subject: [RFC PATCH 6/9] riscv: Add support for userspace pointer masking
Date: Tue, 19 Mar 2024 14:58:32 -0700
Message-ID: <20240319215915.832127-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145928_172875_0FD0A960 
X-CRM114-Status: GOOD (  21.33  )
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

RISC-V supports pointer masking with a variable number of tag bits
("PMLEN") and which is configured at the next higher privilege level.

Wire up the PR_SET_TAGGED_ADDR_CTRL and PR_GET_TAGGED_ADDR_CTRL prctls
so userspace can request a minimum number of tag bits and determine the
actual number of tag bits. As with PR_TAGGED_ADDR_ENABLE, the pointer
masking configuration is thread-scoped, inherited on clone() and fork()
and cleared on exec().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig                 |   8 +++
 arch/riscv/include/asm/processor.h |   8 +++
 arch/riscv/kernel/process.c        | 107 +++++++++++++++++++++++++++++
 include/uapi/linux/prctl.h         |   3 +
 4 files changed, 126 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..a1a1585120f0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -479,6 +479,14 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_POINTER_MASKING
+	bool "Smmpm, Smnpm, and Ssnpm extensions for pointer masking"
+	depends on 64BIT
+	default y
+	help
+	  Add support to dynamically detect the presence of the Smmpm, Smnpm,
+	  and Ssnpm extensions (pointer masking) and enable their usage.
+
 config RISCV_ISA_SVNAPOT
 	bool "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 06b87402a4d8..64b34e839802 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -185,6 +185,14 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+/* PR_{SET,GET}_TAGGED_ADDR_CTRL prctl */
+long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
+long get_tagged_addr_ctrl(struct task_struct *task);
+#define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
+#define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..3578e75f4aa4 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/bitfield.h>
 #include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
@@ -154,6 +155,18 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 #endif
 }
 
+static void flush_tagged_addr_state(void)
+{
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SxNPM))
+		return;
+
+	current->thread.envcfg &= ~ENVCFG_PMM;
+
+	sync_envcfg(current);
+#endif
+}
+
 void flush_thread(void)
 {
 #ifdef CONFIG_FPU
@@ -173,6 +186,7 @@ void flush_thread(void)
 	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
 	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
 #endif
+	flush_tagged_addr_state();
 }
 
 void arch_release_task_struct(struct task_struct *tsk)
@@ -236,3 +250,96 @@ void __init arch_task_cache_init(void)
 {
 	riscv_v_setup_ctx_cache();
 }
+
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+static bool have_user_pmlen_7;
+static bool have_user_pmlen_16;
+
+long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
+{
+	unsigned long valid_mask = PR_PMLEN_MASK;
+	struct thread_info *ti = task_thread_info(task);
+	u8 pmlen;
+
+	if (is_compat_thread(ti))
+		return -EINVAL;
+
+	if (arg & ~valid_mask)
+		return -EINVAL;
+
+	pmlen = FIELD_GET(PR_PMLEN_MASK, arg);
+	if (pmlen > 16) {
+		return -EINVAL;
+	} else if (pmlen > 7) {
+		if (have_user_pmlen_16)
+			pmlen = 16;
+		else
+			return -EINVAL;
+	} else if (pmlen > 0) {
+		/*
+		 * Prefer the smallest PMLEN that satisfies the user's request,
+		 * in case choosing a larger PMLEN has a performance impact.
+		 */
+		if (have_user_pmlen_7)
+			pmlen = 7;
+		else if (have_user_pmlen_16)
+			pmlen = 16;
+		else
+			return -EINVAL;
+	}
+
+	task->thread.envcfg &= ~ENVCFG_PMM;
+	if (pmlen == 7)
+		task->thread.envcfg |= ENVCFG_PMM_PMLEN_7;
+	else if (pmlen == 16)
+		task->thread.envcfg |= ENVCFG_PMM_PMLEN_16;
+
+	if (task == current)
+		sync_envcfg(current);
+
+	return 0;
+}
+
+long get_tagged_addr_ctrl(struct task_struct *task)
+{
+	struct thread_info *ti = task_thread_info(task);
+	long ret = 0;
+
+	if (is_compat_thread(ti))
+		return -EINVAL;
+
+	switch (task->thread.envcfg & ENVCFG_PMM) {
+	case ENVCFG_PMM_PMLEN_7:
+		ret |= FIELD_PREP(PR_PMLEN_MASK, 7);
+		break;
+	case ENVCFG_PMM_PMLEN_16:
+		ret |= FIELD_PREP(PR_PMLEN_MASK, 16);
+		break;
+	}
+
+	return ret;
+}
+
+static bool try_to_set_pmm(unsigned long value)
+{
+	csr_set(CSR_ENVCFG, value);
+	return (csr_read_clear(CSR_ENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
+}
+
+static int __init tagged_addr_init(void)
+{
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SxNPM))
+		return 0;
+
+	/*
+	 * envcfg.PMM is a WARL field. Detect which values are supported.
+	 * Assume the supported PMLEN values are the same on all harts.
+	 */
+	csr_clear(CSR_ENVCFG, ENVCFG_PMM);
+	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
+	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+
+	return 0;
+}
+core_initcall(tagged_addr_init);
+#endif	/* CONFIG_RISCV_ISA_POINTER_MASKING */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..488b0d8e8495 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -244,6 +244,9 @@ struct prctl_mm_map {
 # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
 /* Unused; kept only for source compatibility */
 # define PR_MTE_TCF_SHIFT		1
+/* RISC-V pointer masking tag length */
+# define PR_PMLEN_SHIFT			24
+# define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
 
 /* Control reclaim behavior when allocating memory */
 #define PR_SET_IO_FLUSHER		57
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
