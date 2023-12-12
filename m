Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BC3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 23:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/MHYtKegJ5HbFslEsvfYcBJ05l4A/6vuqu36x4evkk=; b=feEDsU7w5lztV0
	Q13BzCO/onswHsihFzvByStOZY+ebra2y5jglK2fkeyklAyuOa5uYuIDug6CmeaIowTVq4r+bGv4E
	fLGC6CYKwskO8q1kPW/faekHyTFMTp/yB5W1aa9cfS7zLnTm8e7Gu+wayB8e+GkXJDx/1b/wcOCdY
	uNEZe3t/9ZiYL7/3DbRplkS6E/tfdvf/ef1OcAt4KY7vpwratqDbtdOaEebiMT6BRiBVw/XW3BrC5
	vgak/h2nbYMKUldUTGOin5bxBG1NQ+NW7BsdWuJZvgCDk7W89u4CzO2etFVV3FZxWwg6J/lNMwwpP
	Yn4cKK4TdVmJAWP0V2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCWb-00D4qT-2b;
	Tue, 12 Dec 2023 23:50:53 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCWY-00D4pu-2N
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 23:50:52 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6da2e360861so352208a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 15:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702425046; x=1703029846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDRVUnCHqVBNMGZhqCPohfXcgegTHPBlvp76ltshrAo=;
        b=01lsyurGWQkh7d+NBCwBnJQyeMT8uDeyYDBIs0blM/B4aAR7d0GwwfRt+HO+fl7CbT
         stx2eIlb/1+gqXGTnIugE/N4KVAFcsIFPmN8pzw91VSKQD4LSc2hUmaMtCVid2GuU7gW
         kF5AFPqBPu8N/pa1STmB62dqRCFJYAG9q+IwClbDOrhzb9fIMalocQFD4Y9M3AF4d5Cj
         HqFa4cVlX1ELBFIy9fCngbuZZgv46FVYrhO8V65BCOZLUjoDhZ9ECPdCx/1KOGPKHA6O
         VEjFXFvGJ6Q8ewq6yaay8m71EWuPw0/mB5ylBk3CLTB65zRA/clEIQzAoZysRCsphR0p
         trQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702425046; x=1703029846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDRVUnCHqVBNMGZhqCPohfXcgegTHPBlvp76ltshrAo=;
        b=eqd0uvYN9BnZwspEhfyNNdQuwGO8y/D9LvPiaV8hanIIYFSl3FmAjvZzme5PD+WYWu
         Mbqycx4VE1aFKePIJzODDg+te39wzAZPOxcU5vvlX+r8iot5R45TXSezzab/2LXQb1Ts
         677xMwnRd8U8wskhVCGf7MZiUteauHofisFuRj+aXvwQ/UTfhaNRkf10rfQH/+2wu05/
         fcNQCGlAO/+uI3IsgB79iXPPDg0TPW/TU8nbeDIEwbn5Qj4qtcWFhe7KlUnEFxeXFrIe
         urhU2NP7SsVSta1OQF7qxST2XShCyHiXSCfyJUnaE5u48uFEWvMfPNkvH3r8e79t7yHb
         VN5A==
X-Gm-Message-State: AOJu0YxYAlwAVFyhWbtXPMDttFdWn5vmkt3gE6F59Jp5DOt2AIFZzJXH
	YSh81BlaLFjYV+UhjP+t2k2zjg==
X-Google-Smtp-Source: AGHT+IEOA9OOk1W/KojXDfb3Ais4G9s15fdKp+IHUP8pXH3qypddUDcMFyI9c1zXKiioXpSIJUHSJg==
X-Received: by 2002:a05:6830:1b65:b0:6ce:271a:5fd0 with SMTP id d5-20020a0568301b6500b006ce271a5fd0mr3948835ote.4.1702425046465;
        Tue, 12 Dec 2023 15:50:46 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m19-20020a0568301e7300b006b9cc67386fsm2487295otr.66.2023.12.12.15.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:50:46 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: 
Cc: Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Evan Green <evan@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] riscv: envcfg save and restore on trap entry/exit
Date: Tue, 12 Dec 2023 15:49:25 -0800
Message-ID: <20231212235003.2036221-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_155050_780581_8E8AEF42 
X-CRM114-Status: GOOD (  10.16  )
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

envcfg CSR defines enabling bits for cache management instructions and soon
will control enabling for control flow integrity and pointer masking features.

Control flow integrity and pointer masking features need to be enabled on per
thread basis. Additionally, I believe cache management instructions need to be
enabled on per thread basis. As an example a seccomped task on riscv may be
restricted to not use cache management instructions

This patch creates a place holder for envcfg CSR in `thread_info` and adds
logic to save and restore on trap entry and exits. This allows such isa feature
to be enabled on per thread basis.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/asm-offsets.c      | 1 +
 arch/riscv/kernel/entry.S            | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 574779900bfb..320bc899a63b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..cdd8f095c30c 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,7 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..a1d87013f15a 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -64,12 +64,14 @@ SYM_CODE_START(handle_exception)
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
 	csrr s5, CSR_SCRATCH
+	csrr s6, CSR_ENVCFG
 	REG_S s0, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
 	REG_S s2, PT_EPC(sp)
 	REG_S s3, PT_BADADDR(sp)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
+	REG_S s6, TASK_TI_ENVCFG(tp)
 
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
@@ -129,6 +131,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
+	/* restore envcfg bits for current thread */
+	REG_L s0, TASK_TI_ENVCFG(tp)
+	csrw CSR_ENVCFG, s0
+
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
