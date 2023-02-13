Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5B2C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoOcwEyoTIZfhOiJQQbQCan1CjA6lorGcPzxfQ877rg=; b=N7IWEtNYAJUAev
	lFz3u+7+GFjSrbzIHjFLT0ZUMwkNyNqKmjrpFGyZ+ChsR1k7zoRUmAcxBIlO95BBpygoyRonsguTx
	bvAKbPpZlQ1y0e+4XiId9du1WDlLA17gDo7RaWaabnUznE6Q5gWBfHokl7VWSYEzq77coQ2ysLZFZ
	qrCSHVvgn3ZV49raSIRNNpfoSJlDrQMJA6nFCz8kWiCdTYlqXeqgppj0JjDMuqGu6mn36iROY+GbJ
	HPMKw2Sn2V/XdNzZqb2DS8H73nhxA5sU3fCzocjVb9Sdom13jLf0R3+lP/l6LMBPYPRlcIibF0sOr
	IGsgi5nF702t34Bv1HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr1-00D9Ma-OB; Mon, 13 Feb 2023 04:54:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqv-00D9I5-7g
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id w14-20020a17090a5e0e00b00233d3b9650eso3255522pjf.4
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPcTKWGDPVSnaGv0xj2Ptv0rfddqsVuLBZ9aJFRMto4=;
        b=ubuWRUQI6DO7BXFrAM9O2TncXqmRilKXfzowXV5xcve/F4+hWvI8bU1bI5sCYwrNov
         xWzsT6/qXeY2wz5ryX3qVeyqTsqVrRn/s3UW2DoOrYNf3MiUDDNou9CMk6L1/oz6H6WB
         dU9WOxrHlhzoqkkzZ3zk/+UppeNZ3tzBybM7gU1o59qToIXc3KlDQVgPX9EVQHkcfv8P
         pLfafwQFE3MEzcXXtOJWy7Ic+zdkXeZoKdOzIMMSnWK/NlAKj/jwFBpv0hi/KY5NiGY8
         s+1hNqY4Wfbk6uEa34IyNOF/CuCjhHIbS4gNTmG0iU8hA3c/pOm7STbsvA06gX1ZwHSz
         TN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPcTKWGDPVSnaGv0xj2Ptv0rfddqsVuLBZ9aJFRMto4=;
        b=ESEvb26GhN06zi2N952KvhTW1kXlJPDNJlyzPSElIEpd8HCLv+beMq6xgj+bODBbfO
         Z6d+C/RBk1PdrgFaItk9o7YXYVqAe2qmMI8jnUBXrXckddlxWTb4OU9lAWM6SPH35LEz
         6ZDd9teNr7RomQhi9o4Wk4ydu8d3nfYJq1BlhtTNAgE4u17yi7sMsQK5kgDEGm5K5HAv
         ORxnFeD/bY9f6wgzMA88kB4NrDf0Rtqx0ZuQnYKOVHBDlrzNxEoe/XrewMAQh4Xfrp6Q
         vc3dsq5nNCt7vcXETQp7YWLevm7xrG54GkBYR5aJFIb92zvRI30yewh/bMpYisWLBuoV
         lT/w==
X-Gm-Message-State: AO0yUKUY8rCfRpI8y0+2vK0ekwjyMEEMvlGURHws/hzhgNR6FEhBD46A
	SJs75Y6Y0IB59SzW2Zx8a3WmMKMFV/QV01M+
X-Google-Smtp-Source: AK7set8wsluuoT60XcCmUYhbCv4YoEM/b0+zhHi0Xb0+nvF6B/eyE34xZth1kgXw3SU6JZ4UKZal8w==
X-Received: by 2002:a17:903:22c9:b0:198:fded:3b69 with SMTP id y9-20020a17090322c900b00198fded3b69mr25993049plg.53.1676264047642;
        Sun, 12 Feb 2023 20:54:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:07 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 04/20] riscv: kernel enabling user code for shadow stack and landing pad
Date: Sun, 12 Feb 2023 20:53:33 -0800
Message-Id: <20230213045351.3945824-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205409_308467_906D8E3B 
X-CRM114-Status: GOOD (  14.54  )
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

Enables architectural support for shadow stack and landing pad instr
for user mode on riscv.

This patch does following
- Defines a new structure cfi_status
- Includes cfi_status in thread_info
- Defines offsets to new member fields in thread_info in asm-offsets.c
- Saves and restore cfi state on trap entry (U --> S) and exit (S --> U)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/processor.h   | 11 ++++++++
 arch/riscv/include/asm/thread_info.h |  5 ++++
 arch/riscv/kernel/asm-offsets.c      |  5 ++++
 arch/riscv/kernel/entry.S            | 40 ++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index bdebce2cc323..f065309927b1 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -41,6 +41,17 @@ struct thread_struct {
 	unsigned long bad_cause;
 };
 
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+struct cfi_status {
+	unsigned int ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
+	unsigned int ubcfi_en : 1; /* Enable for backward cfi. */
+	unsigned int rsvd1 : 30;
+	unsigned int lp_label; /* saved label value (25bit) */
+	long user_shdw_stk; /* Current user shadow stack pointer */
+	long shdw_stk_base; /* Base address of shadow stack */
+};
+#endif
+
 /* Whitelist the fstate from the task_struct for hardened usercopy */
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
 						unsigned long *size)
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 67322f878e0d..f74b8bd55d5b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -65,6 +65,11 @@ struct thread_info {
 	 */
 	long			kernel_sp;	/* Kernel stack pointer */
 	long			user_sp;	/* User stack pointer */
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	/* cfi_state only if config is defined */
+	/* state of user cfi state. note this includes LPLR and SSP as well */
+	struct cfi_status       user_cfi_state;
+#endif
 	int			cpu;
 };
 
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..340e6413cf3c 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -38,6 +38,11 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
 
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	OFFSET(TASK_TI_USER_CFI_STATUS, task_struct, thread_info.user_cfi_state);
+	OFFSET(TASK_TI_USER_LPLR, task_struct, thread_info.user_cfi_state.lp_label);
+	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
+#endif
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 99d38fdf8b18..f283130c81ec 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -73,6 +73,31 @@ _save_context:
 	REG_S x30, PT_T5(sp)
 	REG_S x31, PT_T6(sp)
 
+#if	defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	/*
+	* If U --> S, CSR_SCRATCH should be holding U TP
+	* If S --> S, CSR_SCRATCH should be holding S TP
+	* s2 == tp means, previous mode was S
+	* else previous mode U
+	* we need to save cfi status only when previous mode was U
+	*/
+	csrr s2, CSR_SCRATCH
+	xor s2, s2, tp
+	beqz s2, skip_bcfi_save
+	/* load cfi status word */
+	lw s2, TASK_TI_USER_CFI_STATUS(tp)
+	andi s3, s2, 1
+	beqz s3, skip_fcfi_save
+	/* fcfi is enabled, capture ELP and LPLR state and record it */
+	csrr s3, CSR_LPLR /* record label register */
+	sw s3, TASK_TI_USER_LPLR(tp) /* save it back in thread_info structure */
+skip_fcfi_save:
+	andi s3, s2, 2
+	beqz s3, skip_bcfi_save
+	csrr s3, CSR_SSP
+	REG_S s3, TASK_TI_USER_SSP(tp) /* save user ssp in thread_info */
+skip_bcfi_save:
+#endif
 	/*
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
@@ -283,6 +308,21 @@ resume_userspace:
 	 */
 	csrw CSR_SCRATCH, tp
 
+#if	defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	lw s2, TASK_TI_USER_CFI_STATUS(tp)
+	andi s3, s2, 1
+	beqz s3, skip_fcfi_resume
+	xor s3, s3, s3
+	lw s3, TASK_TI_USER_LPLR(tp)
+	csrw CSR_LPLR, s3
+skip_fcfi_resume:
+	andi s3, s2, 2
+	beqz s3, skip_bcfi_resume
+	REG_L s3, TASK_TI_USER_SSP(tp) /* save user ssp in thread_info */
+	csrw CSR_SSP, s3
+skip_bcfi_resume:
+#endif
+
 restore_all:
 #ifdef CONFIG_TRACE_IRQFLAGS
 	REG_L s1, PT_STATUS(sp)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
