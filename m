Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ACDD3ABF6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUIux5k65jBrMPrJ9R/00D6KQsNby57VdrPxd3y46Tk=; b=Q5PFotCxp7RoYO
	QbMMLJkOZ94tyFopOrNn94tsbi3hz6JbjUUiy9snt3BFybnnnFyo55r+6pveQPMOpVlzq2ERiUTWh
	bvmIr1boIPyNSCMeYIv0pICBOAYStzZpFyVSxMgmFgs9beOAvmHaYEa6vyyCM7hdJu7nKVyfKJU0q
	lGwx9+ugyQXFaVl1+54Zd3bqdmmjjSXIAQ8ZkJ65cC6upkGeH8ejD8kep/zz+xq9MXgDHWWopGscl
	591wPKL2jBD3wO3UMAfxUqFn715d20UQWhXZ2sPhmgULfuJBoA/SFDqwE/5ckI0JzFPYgBKciWMQH
	Ee/Jmp7PO76GJokWcsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbcH-00000001JEK-0yC0;
	Mon, 11 Nov 2024 21:06:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQn-00000001G7d-37f3
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so3942924a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358481; x=1731963281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXq9FOpnEwBGdDHGF4C6R3WEUyw3maf3vhv8uLPc14I=;
        b=w6KzAwzf1wsmRBGYHf1Ir+J22AbzTzrBz091q/JDwR4OvGyvpsQj9jPpMftAzeiXMp
         CcZr70zsvR/+lQZGWQR5oGLVaZH6pmA4n9laZUl2Xfs3rktTOXZECmHxu2bAkKuUjcqx
         xJhu+mc37+sqLQDHnnjU3E3tElyHU+qJlhH4PCMm1SuInR6kajjB8im/PZ9No3BbYqdX
         SJ7i/xk+OeWjjZeO/FuJUklCgBIa9iDiP3lbQPpIp1wnBuStRljmDFjU9/UUWGnCbck+
         t0yL74zeiIzZ3jGEMTBB+1NxcQ+6CSZbkpG25dW1bGhkIiM8su3tmImO5q9kp/Whmm4b
         VFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358481; x=1731963281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXq9FOpnEwBGdDHGF4C6R3WEUyw3maf3vhv8uLPc14I=;
        b=XiG23tbDoBS3lmm/aZRBl5Z2AtdCdT37NRpq+8lP1hC//1kCx14+30s5NEpQa1unV4
         rmiWtQzSZSzax9g6zG1kSRVbjHUaqtAci0dud1r43vJ+z9drc2q8nXkhKjOTMJv7oi9t
         oKuzJumgyLJWzXxCYegFwa4/72V+F2dvSISJYWBaQyM/HN8D0h+gCY4MMCvQ6YFFWpWZ
         eHe4CndhkpKGVvoeGsJ5IvCEwBI570S9ih5mOJq2P2JDVp3v3i3wVYkLuMCRtr48X0vT
         pZdYu8UjpGksH3VueTZ5Dync/Xe95QJ7nPn6WmT+J7Uj0aEmWOQIwA9D9/j3Zk28RDgd
         OIXg==
X-Forwarded-Encrypted: i=1; AJvYcCUscE5bCjhLjVxx+Q5fO2iUIJHFCbRfs+V/uxOMtEtKPVUOY9AmWetNLT/WYzZkbYmJI5P2EntLTlkPcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjkmWxtnZHjOcrS4Q1e5mfW2H90VJkDBAl5ls8UE1NeZV04ZDo
	djFQ9Uk6LOUdtppf+UT6wqd9Q6IiBRhCCMdanmxfUwGcaDgUR7TfOYdiJ6DKL5o=
X-Google-Smtp-Source: AGHT+IGuaCu5TPxyLG+pHWtm3gJIshsFTNXGOdv+oe4DDvgdaliGfH59bsMMSDiiU80wx6Lj9jjwkA==
X-Received: by 2002:a17:90b:2251:b0:2e2:b64e:f501 with SMTP id 98e67ed59e1d1-2e9b1740f12mr19141587a91.30.1731358480687;
        Mon, 11 Nov 2024 12:54:40 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:40 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:54:02 -0800
Subject: [PATCH v8 17/29] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-17-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241111_125441_845977_AA20FF4D 
X-CRM114-Status: GOOD (  18.09  )
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
index 7b32d2b08bb6..0f6448583a87 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -28,4 +28,6 @@ void handle_break(struct pt_regs *regs);
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
