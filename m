Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ADBCF042B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91zE6EieRGig2aOVEqreU72DXXsKSs7zo/r6VjHqU/0=; b=WD6iRAVDDA1B1n
	RU6bsCFNVXnrODHqzb9kPGf5PjU7W04a8G98zCAG23ciG/IwxzT+Q281s4VmZhTUhyBmnLyDJGKNx
	jikMI0yNSivJmEdGsV0odkzDEXfNq0YvVGEGIWnV53V/WLNFI1QLDd+1X7LWTh0KyOmdzTGUORfjR
	r7xXMG5G7rTFzt0waz16CmohwwNqzPK1nJDC0pgxAG0nNFoaeZt7ESrMIclfEDXWHuEWJF1llYyrf
	adz9e4/iAulwZJ5f21/vfHgEGQ5sRm9YfDHoXiXv9sXtndNOvGS3tGruW1LS1qPgDxvltlKL+Hbl/
	Ghiixpo020U3x2YtNblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtj-00000007SH7-0bqJ;
	Tue, 08 Oct 2024 23:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIr6-00000007J9T-11x8
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j4AiFsRLeV62lBIMG1PY0Kuggf3Da9jB0k3/CgFujB4=; b=CeCK5NKx+YI4NVX6P090ld5Lvt
	2vWonbUKrvLC805ZqxEjSows8Z0mqLlZ3KNfMPIAySpEDSJBPwYlhYkCQto4v7iVKWwop1cCyLmLz
	kiMhCVosUfO+RI0NmnCXTOeq/ZWT2A875nROD355a7yyFWv4cdDmYKljA0q0iHkuLJbNNeHzaejd4
	bt6/XvHflKHb15OmhQXCo1kXDnPljAOfydJKIk6MhPeQRESpEbvJz7fcXhxDCkqyOqQYcOx4kCTVw
	nyD5XI48Qx0QkI3QcMMWva5b5gyxqZ53oouQmESfb1t463aN3YjGTPjOGQRjtc5s0hganNTs59z9c
	fNg0JDSw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqx-00000004hc1-3hhQ
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e029efecdso2302454b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427126; x=1729031926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4AiFsRLeV62lBIMG1PY0Kuggf3Da9jB0k3/CgFujB4=;
        b=HmwiECXRwKR4kuh20UquoaaRfHQUR1IvTTsyElOm5SMvaGuCrRdZTm7fqGb8GjM7RL
         FnLjcu+zgP5nIRrM/NxZNXXyntQGTV0S69yTdOls0cfyc/zjBepnPm7Nug0p8fZHlAQ/
         fgQgekoXrztX3ZahBohfUO43iHi0qoKBtoHMJ6ya0rrZJll9RP0ZhdDO3mPhwf4gy23X
         LuMBHWJ42mTdhoZgj0MN9PXmVUi/u5YVtvVVI0PkCYxBEsqLzO/QXSVh8h/o/prugCq2
         zvZNW4e03p0clJypCeygPCC5n7Ppg3bfIFV6FjRgjsvDxI704sRj+AcIIcoTZVZhs5El
         LYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427126; x=1729031926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4AiFsRLeV62lBIMG1PY0Kuggf3Da9jB0k3/CgFujB4=;
        b=ZMhIUgML/kol5JxvrUrwg7cLRwZImEOO809rhVvX0Sm4it5PAfJxlYEj3ZrqbZ3EW+
         Gd7K5rT5QufuC7ZxHQ256tcidT+KY5y2kK+WgDYIuanLCzINHaQ86fG0ijDhmlHtQShm
         YcmYYKcJdOH6iG49iLbTnLXt/udAEMj5vjCKujnQ2XVlhJu6uGyg3+UQMu9l4YbhV1R4
         YT+B0fq8Gu110CRehTBBTzaZnSvmUdXg2OBzzZTOvJcUyyUbvegjlL3HV5yqSE9yHK/y
         tSlWMXn/RCBTystpM9dNauuhCIcSxtsuwGMNc4dZZjKkJ5BYVkl9y7EbNynW913Sc/38
         HJCA==
X-Forwarded-Encrypted: i=1; AJvYcCXERLCf5lM+zEhMCZJ8e1tIfMLwljK/kxsVWdYepgus/ECYef6opX2krfHAxR2D6TUHo1AByyWgzK4j7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8V/GCdZgKST/9XwEikiZlRpme26MNTfTeq+FMEoi7HanGthXI
	AD7eky7JvfXe706wYyp8AavW8PQVl2gmshKoqDRvQiuLwSn5GFUQdx70hN4URQ8=
X-Google-Smtp-Source: AGHT+IHj+wxxQcaXZGibjg+ho7ihWvomHSyh8+LLrL/jLeKQmqCGUMNbfsMhMaogGrs0QJ7WN9Lawg==
X-Received: by 2002:a05:6a00:198b:b0:71e:135a:ae5d with SMTP id d2e1a72fcca58-71e1db7555emr586407b3a.10.1728427126363;
        Tue, 08 Oct 2024 15:38:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:03 -0700
Subject: [PATCH v6 21/33] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-21-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233853_865758_88690BA5 
X-CRM114-Status: GOOD (  18.59  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
