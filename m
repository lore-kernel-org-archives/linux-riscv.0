Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1899D7494F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7X9klqYs5gq98WmPMluy7nmRPVafri5Yj4MajMYNJ4=; b=Qo46oVK2glnGWm
	q5FNyU2ty7Vhd7V5FzDxGvCRjRlLQEeT3YCHJ4CYG5UG1Kmrfci29OHjJs7NNl1KlyooNEnTbGOzY
	gTRcyflal0LCUNdoGKjipD0yLwJM07+Po0xuVcF+fGq3vSiaRAYwgPTcjaQlj/hnO4ymN28s69PJo
	uIEiuj3AzvEg3N0bj7oeojI6+Z4m1laYPy64yuhJYUd7QSo2TXr4+apAT3rG4W+N8KJFEiv+X0CrG
	/fnhXD68/waAQQPoYAVDgDj1j/w5mNE26+F9X3ErwNujBufRo/l02ol0vPb1XOPPmaJmboDCssFxF
	x2vN+Np0a26REe1ezZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vum-0000000GEud-0u2B;
	Tue, 29 Oct 2024 23:46:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vu5-0000000GEK3-3uwu
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CTbsvOHRfAmS9fg/eDt9XRAZ9JnlumsLrbz7p3xsVRs=; b=MJ1q5SenR2K5U2+jlTxiMcZfl0
	N1ZMqibTUBiAYvn3d6enAGiIoClv+mRGtmYnMKI5DlMpmUcgY5yc+jZRX9lbbfxNruDU6igqk3YpT
	iaPNgQObiNA2g2P6u2+FUx4j5iHGiPs68aSb8/zkWc8JXn7mpShXaz1oOYMPnOnsVQHqQZJo1aCAj
	ViOGw06mglSmsgTUmrszHlw3LHd9tOTRGIX9HXx/eVrtJQu60xoElYw9Tm0Ey8lxwoKmbnEA1Gsot
	7JUe7IjWJFbK/Z761mvEWnDuZtecT/FHR8Y4cinpNH6T1Tdwe8rJm0mz+naF8HA9Z/k27Fr+0tBM+
	Jm9YJ9mQ==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vte-0000000A1LJ-0BlL
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:31 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e467c3996so4617726b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245508; x=1730850308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTbsvOHRfAmS9fg/eDt9XRAZ9JnlumsLrbz7p3xsVRs=;
        b=AG47Vkts5Flfs2TbG68r0lW+t3u0Q3/b7NHg9KZksyCZDP+cSIiFVOLl2Jh5dYZ1SU
         m1dpcsrzU9S9syL2vQGW5AiLJ+/rIEElKwKQVqJ+z3YD9QG0PnAcnSTbCcv1wX8LbCFy
         nujzL50ca88m0anOHIekT1N7f/dPnn1gef1h7Iah8R7aCcxFWLB4VJYHeJZ7Hoy4RJAt
         b/dVjYITsuMaW6IeKo/KBHgfb/dCC14I2rOoPNuf0Xvlj7p1t0k9iHgGvNkWPRUw+dPV
         Xf0zF97RJcl7o1r7Sg8bqdsBdujmobUUnLUyf/FErLAU5P1d2G6LXcUeg+1CE6YqgMZw
         hURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245508; x=1730850308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTbsvOHRfAmS9fg/eDt9XRAZ9JnlumsLrbz7p3xsVRs=;
        b=Ayq1eIwAQ4HUXq3mDQjxvQaOQraDhUiQ9MY1kZw6iDRCmVWyG2FLJO7pn7oeJ2DtAW
         yNW8okm2S/TmSWOoEvrbCWqzkMFWunCt1aULhoUEe/BaAit4r3zadfOY/i1V/7ihzfrB
         x77nnxCLiyBjy6W2CYEQABZtHuin6lvh/YaDWlaVFUR5BAQYom8vXZfl59zW23g7RePM
         h9Y2/RdL8aQlKkbdrZycLNojF3s83LAzOJDURJdWnwhhrKsm46LeGM2m94+GMSFKbJbL
         74ejTUzBkNPyL5nNFrK5jg84uqSXNtVFJ+fLcFigYVbp3/YSYgDCkR8/YoY4eRQYd28X
         UC5g==
X-Forwarded-Encrypted: i=1; AJvYcCVHXy7sFDMhxaUvt5uOC3UoMoWqOr2WEEifMfwDJsmvVoSRI0Jp8rKFYIXynAed75Uv49SAcbKolavTgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5vfvJyyjqzQfi7pUOuUjKkXlaEsSEJOGxSRRI7defSZSZJH6/
	NXxH7mw7WbDDYj0C8MvsqDNGd7eKfWVHcrvRg+RkptV+vs0QBpuLN+wsypIU0mI=
X-Google-Smtp-Source: AGHT+IGGDI9GHaayPj4Cs7Vha9dStUeFmWxlHEYmFUmhCBfJrJaPT/+XmpxPiVHSTz0RAhEYFmvh6w==
X-Received: by 2002:a05:6a00:1892:b0:71e:4c20:75fc with SMTP id d2e1a72fcca58-72062f67d62mr19737734b3a.10.1730245508363;
        Tue, 29 Oct 2024 16:45:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:07 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:20 -0700
Subject: [PATCH v7 20/32] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-20-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241029_234525_350241_2C766CB2 
X-CRM114-Status: GOOD (  18.49  )
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

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

Additionally it implements a cfi violation handler which checks for code
in xtval. If xtval=2, it means that sw check exception happened because of
an indirect branch not landing on 4 byte aligned PC or not landing on
`lpad` instruction or label value embedded in `lpad` not matching label
value setup in `x7`. If xtval=3, it means that sw check exception happened
because of mismatch between link register (x1 or x5) and top of shadow
stack (on execution of `sspopchk`).

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
SEGV_CPERR was introduced by x86 shadow stack patches.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 42 +++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..4068c7e5452a 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -39,4 +39,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index a1f258fd7bbc..aaef4604d841 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -471,6 +471,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..225b1d198ab6 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,48 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if (((tval == CFI_TVAL_FCFI_CODE) && cpu_supports_indirect_br_lp_instr()) ||
+		((tval == CFI_TVAL_BCFI_CODE) && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+					  "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
+}
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		irqentry_enter_from_user_mode(regs);
+
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+
+		irqentry_exit_to_user_mode(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
