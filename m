Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD53CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Twotu/Kbft0QblCdj70F5KdSPJn0P6DXhBVmYcQUyWM=; b=P6nEEYYyD8GQb+
	T6mgd16ECNNMB278UNTnax7UPT1yvXXif/imoYmPqQS7zKuydRfXGKPZUFfA8z+ajVJ272OaJM637
	oAlKrXklJM9D4joAAP6q+tecBxmfgQZa9u5Oqmo54+VIucTjEzFHCfLx5Jh5yFmjHKBmeDXB8bBT7
	V3KzpumgYVzGm7NgKg1aUuMLbQddTuv9n8jhDOJ0OZqYOYI4H63gr0GGSduCqHmMp6pCoT9xe78la
	v7V+3GhlgnuMcFh59nztd8JG9bHINJ5h8CKyFjSgGjgm4bxwYM+1DtU8C4f+BeeXlJTPA1VKq6S8J
	19FPkU76IxWtwIIlYLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWy-0000000EbB3-2g6y;
	Mon, 13 Oct 2025 21:56:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWv-0000000Eb2i-0uq5
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so6023755a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392592; x=1760997392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJ8YuZo0JJXCWTlV3c5ln2FfCDj9ZwahQ+XrbVt5Sig=;
        b=JesIGqfn0S1g7zvj8WAl6tEBRbIh6yqASbYj/OC1SUFX2zCWEhp0kkOpoMOjWQxRHk
         XxfH5H3AN+F2zQaZ4aMQitYA3EE0y3M2Akm2HWk0mtU+FA799CFzC7XsxrZOOhmJM0P5
         UdwDVQwQhVVRsgVD8j78RqOfRG/bnMWaCUqSZNPOeLV+QZIX+V0ov5hYQPaRQOTUg/3z
         g7PFRLCl1lpS82hq/5zZojANJCSSdMt2lUEBZDR0Hg91SzC0jRUqoAodFqsoyL0cvQYO
         oyPYWahwt5RiYxn9FvRHVReVxKGVzfCv0gk1qjJpsm02KY7+KLBXbUVC9YO4zczXwe45
         /jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392592; x=1760997392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ8YuZo0JJXCWTlV3c5ln2FfCDj9ZwahQ+XrbVt5Sig=;
        b=u32V8i16vBMTsyjGILciRoyXrVl29KNzF9ptSnv3cDxpA+/UGUzEORUFfBA0Dnfu4C
         h2hoMAuF9RYO0fxeJdaBJLWFuswFsrDERKrHMLjsUufbYObXDThV7bm2ePZGTib1XhRr
         aqXtmVdzuhxcBRGblx0pMiiY6T/P781x5KJnWCTN0nDUwlh2Isli3Hi1DBGQcD5GHq8m
         vNXFR6oi5eCxf/RMMLBZcXzBW9ymqnF9UVF7oAsuP4w6dxnw9+KYpzxydxAHbdnQeDmS
         zupfekFsCJLB/3UfbxJOtxSGfNfB7U+zcKuTy/4COFz10pB02dRPDM3nIBmEadQWDoH5
         SRgg==
X-Forwarded-Encrypted: i=1; AJvYcCWFuHhaEUD/FPDZWmb3+YL0byIUQl4UjleQ3ogavWfC8YlabOLzWqPmckbN8S+xJ3DuF1hcNUy/AzgL6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs747OMxPpn3eVNuBMr8m2ip5e3aIAVCZ9kBhgmNu/OYaXHTkj
	MKqRTXPDZYrlFx6Z4kw0Tuil+Bk+H4WD5RYUhQnfZkJBkn2QNwd1mZsYNfmXdNk0hTo=
X-Gm-Gg: ASbGncu4+JekqU0a82m0sgiBq8hiIpKcFURLmgz1vVQsM665hEZRE2ZB8sO5rGDLcaE
	IFN0RE77ua06zxWCh7rISZkE+S5u3p8lXDNgp7XxwlRAs1Jmy9BvuLSCnbPLZM6eN6ePrsP5rDL
	2Zzs0HLfbLCqy7oZEuQRILYHL05/WMuXCIztVkwPE3NMPmL6c6sOjhx4p3PDEyX9GtkY1zV0Aim
	ltuMwU3hezINnOOzp8M8upLTSbdYr+5b6iH9+OA6XkwJSPjNf1EVu9Qh7bk3ow6YszOWaFwOgcu
	jVgjqL2QX1f5MlXst+ZBHnm+rBlc3pTtWBYk1+pJ/xc8fmAaZ+QAMg1QLbYCuZt0+KdZIUzYmtK
	16bCD71fPKIKAFRHJCgtMgIw5l/xUc3qfLbH5pyEYVy0A2jL7ArE6AkljjvXvIg==
X-Google-Smtp-Source: AGHT+IE4VGn07elYQKVEUQYU44OBV+76pji2Yc6kXyu+BJcDVImYjZ5tvzToR33l15+3FSGsJYkKNA==
X-Received: by 2002:a17:90b:1a86:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-33b510f907amr31855639a91.5.1760392592510;
        Mon, 13 Oct 2025 14:56:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:07 -0700
Subject: [PATCH v20 15/28] riscv/traps: Introduce software check exception
 and uprobe handling
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-15-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_145633_280339_ECEBE3D4 
X-CRM114-Status: GOOD (  20.70  )
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

To keep uprobes working, handle the uprobe event first before reporting
the CFI violation in software-check exception handler. Because when the
landing pad is activated, if the uprobe point is set at the lpad
instruction at the beginning of a function, the system triggers a software
-check exception instead of an ebreak exception due to the exception
priority, then uprobe can't work successfully.

Co-developed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 ++
 arch/riscv/kernel/traps.c               | 54 +++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index a9988bf21ec8..41ec5cdec367 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
 asmlinkage void ret_from_fork_user(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index b28ccc6cdeea..34ed149af5d1 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -40,4 +40,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 036a6ca7641f..53c5aa0b6a16 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -495,6 +495,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..d939a8dbdb15 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -366,6 +366,60 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	unsigned long tval = csr_read(CSR_TVAL);
+	bool is_fcfi = (tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr());
+	bool is_bcfi = (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack());
+
+	/*
+	 * Handle uprobe event first. The probe point can be a valid target
+	 * of indirect jumps or calls, in this case, forward cfi violation
+	 * will be triggered instead of breakpoint exception. Clear ELP flag
+	 * on sstatus image as well to avoid recurring fault.
+	 */
+	if (is_fcfi && probe_breakpoint_handler(regs)) {
+		regs->status &= ~SR_ELP;
+		return true;
+	}
+
+	if (is_fcfi || is_bcfi) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+			      "Oops - control flow violation");
+		return true;
+	}
+
+	return false;
+}
+
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
