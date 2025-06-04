Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953FC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/unvtbucP4feZT8XW6wmmhQO4LZ5uJQTI1rPxq9v2M=; b=xOF0uz+1BtZi1E
	/p4aLaimjyYYCHZjkQlsAwZwRbsjD4YImLpryYutSTWMt4S+IUSsc7hPa1r4kll5e+3Q3b0Kffa2e
	HJhsW3Ddan2G3pj44UvTmwEeUgeKAqtO9C3ZkcK63xxOcnUj3UoDVeS5ljZgR10TiqHrS4jziXCWE
	aWwusBl4Bjd9y35RzhDXaO0jAyE0J91yah380sitLZSWqhQM5iUBwd6CmvOzPK2epbCAoZv9rsU8l
	u9RmNK4G6C8MXDGq7lVtk+JoGbXu5+AhW5pqi8HdAIXDvgQZlN97n1fZO2ZMyLzDe/BiI59hLOkAK
	VwoDp8PcV19xhiiz1NTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrlW-0000000Dtur-1XrX;
	Wed, 04 Jun 2025 17:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrje-0000000Dt1t-2C62
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4Ps8NKTexRvfBcPPDMVIyCvPCvYZAn4HwKLuefOdoqE=; b=HCSisCxsMp9GuAGymK2i1yVlqY
	TI1T7azdjloj6RFYLfZ4BQnJT7hpZfuljVC7kthnkBE/io4314Kj1CGx6Es+bYXpf1fnmnz24Lsi7
	ogEES6V96fUxEM8cD89xlM+afmCFt3DbTUeEwoyQWp2ym7O5TwxR1yDKqxKTh8SDsnHqYOJsrDJub
	+fRFbzudaA2P0GjCZAhaFpXZrXqEueci/3DPoa9CLhUW4EglLGACzb8DayQZFz4hZwLPYkO6KwdQT
	LAm2D8HX9vw4Zhzet9gWruyfZcR9cv6w73GUTgydTneD0bybt3Ztcd4udu5+91iJigwTCbj4BrT8S
	Ue/rjU4g==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjb-00000000v7Q-31FF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:17:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-312b0d83a10so77944a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057420; x=1749662220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ps8NKTexRvfBcPPDMVIyCvPCvYZAn4HwKLuefOdoqE=;
        b=P06j+498y7CRqHipMZ21SdjlA5sNWMrmIeo7cE2gBgcpw8+rS+E2af0piy5edsnvia
         jzX6jdhVQ7tkw1ru+TinZmgMG33Lsuoy1dfUEUMjR0eIBQmchx0CSVqwJnbI0J7ioRro
         ZicB2M0/LFP1qAJKaamxFXtW15SpTio3/tFpjC/APoJJTHM8WPEQRmMz2Ect/j0s+pMB
         sfzL28nR9Ct3+mQGb1qNXE8oVobzZNj+hTZUeT30CpwupdIzRFIUU/5uj4lvVzI9OFcK
         8Vwxi3rduK2bMdGn96n9wDi7fiRcn3fts67J9q3Mn7UAuZTpEXr2i5IzcSJtVg93JtXA
         PTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057420; x=1749662220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ps8NKTexRvfBcPPDMVIyCvPCvYZAn4HwKLuefOdoqE=;
        b=CKGVyvVNJk8Tvrqvhiq0V3eMHNIqnoG9xqNX5kmVorsiEsdPTUjQtK0eCMrSDUZ95R
         OMHGqoED5PUrQF4bL+c7xKpGRWM5tQ9YBZataVI9yZ9ykM8W0OFBOV1ciKF3og34ICNm
         qCmHYMDy2WHOXUF22tsR8hGXDB2qABgDzm92LfYFeLLHyojRJ4PcAtAeKKB1xpAhaH/o
         /94krtfWXjNWInx63JZjgfPB1xQEaVhl1ZtRsJ12sv1pNq/yeEaamDZV7gyrPM1wTT05
         2GbaSst8Jv0PcyQv7U3AX7idlYWauAlp2pXk0UXN/cpOofeRDgx6WnvksV31KLfvrTbw
         26fg==
X-Forwarded-Encrypted: i=1; AJvYcCWfpetU94Hh+hTaQHachxIxwVLfiWyhQi7oksVL91bcKMJxQhXvG+2x5qOzqm5lq4a7T/w3V732ncyRWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYUIrVo91+YjMG8/Sx8+nxAIPzbqatsE4VhYaKP+Q/KO1AFl//
	pqsYwPbwPvASdGXJpbNJ/F8UMj3bD7E/4aWteJPvYqGvhFTzXvVnvaZmcHfUXLdO4BE=
X-Gm-Gg: ASbGncsTkUFCKVt3YzIxXZinWK/UL3mKtqt0tEyFAJw5r5mlc39W725fnBTWIZtiutR
	pJSmWowGG6NM+6HuAvVOzs+pCw2FA3oJbVmKz2b72S7vwFd4Wb9l3ls/kvT65jM5VdWgIfBnzzG
	Hu2epIhRyFKTTJEQ6S8b4w2T8E/UCu6wwwrqtYyYOkcMIPat3DlLl7lyQ9I5GC1BNRYuPv/IaQZ
	p4nUIdwrF9yfI8wFULGkslQI1ft06wpzKM4QC+BmfH9345GYjVzQg5V3dIP3hv12im+fEOmLSXc
	bwz2NoWs3wmXGPF44Kh9xCV47v9eJrcTjVmzkcrQmXGgiYxmW5n/jnYYOpFxkCQx6SVUp14Z
X-Google-Smtp-Source: AGHT+IEP2bk43fPAFF7uUJX75rcN5qw/Z+TfMZHF8o/fNykZeh+3oEly2k/Cb3HM5oBmyE9aSHSFyQ==
X-Received: by 2002:a17:90b:2681:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-3130ccbf58fmr5616146a91.14.1749057419811;
        Wed, 04 Jun 2025 10:16:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:59 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:39 -0700
Subject: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250604_181703_873873_F0299927 
X-CRM114-Status: GOOD (  20.90  )
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
 arch/riscv/kernel/traps.c               | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

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
index 978115567bca..8d25837a9384 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -474,6 +474,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8ff8e8b36524..64388370e1ad 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,57 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
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
+	 * will be triggered instead of breakpoint exception.
+	 */
+	if (is_fcfi && probe_breakpoint_handler(regs))
+		return true;
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
