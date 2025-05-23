Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE779C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc48imhmTtiTSmkWxGbZdaHZwxonWAVF53J9Y3t1gmY=; b=cNinCtDg58p0L2
	ZR657mSCoZsgHLF0UI6hQSONsY7lHzaqmntBuKidmOPZbnTUNnL0TwvNNxeYEBEQ1ACXN2Q9/TX+D
	StQlsUK7cHq9VbxxUp6ndPdVmwkWF6jxYDauIUeIB70OuNjR0AWRdCT4r5A1Y3Uy7A13ZK3u9DhZS
	o+NDXRDFeSmz6Lb3alkUEyE4XMKrpyYCqJ1I/i0ShqXFlFP1X0RJWW+qOGOjOY3n4D2MbFK507gNd
	PdSlh0sdhODM18l0H0YjFQsiGvG5qwOpDu+r8iej7GpCEhyV4uIjyANf26vKK+sFMvL07baOsDOco
	P0T2Nz8E4hz5N4R4VEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0q-000000030Ht-3o0O;
	Fri, 23 May 2025 05:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0p-000000030Fo-17WV
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zzG5aBj4uT4Cxy0Ye5VbMroQI6g4J7udAW2U71MrLVg=; b=piOpXXa/WYTn8N6AP2EfoPezV2
	R7sK3AdI0wR0Lt8qArrlL+ErtoI+1tvETj0eAVycK4qtRNIv4Yo9tHiNMPO+Ub/OkgrFY57skvYVJ
	7tT1HKP0/8o2mnBDdSV1g9hPBAkVM1ODQ5wcHFpQ38V3Fi2oeJUuKZ7Gp/pXqU6ILAC9J1mIB55tv
	cs5HBpGLEEbCxyWktFqSaBD4naRbG73G5rAK23S9Vqi6D3x8mFlQ9t3aPedNoGLec+Ytt3tsWiZmi
	jxUkYWCP1OAYCqWQAZ/Tu+MoyPSitNn+ILZceCXcKK59CuucP5VFovHplQKxjIYIZ9sjDt5NEPXrz
	KCObKgNQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0m-000000018l1-0xW5
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7398d65476eso420057b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978323; x=1748583123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzG5aBj4uT4Cxy0Ye5VbMroQI6g4J7udAW2U71MrLVg=;
        b=jLcsVv/cmizkghsRGuY/Xp+kjsfIrxHdqPakqvGHMfrDFeFRUoYcX2OF4GbVweNeRX
         TKRlVG0rg7V/Q21aoMFnzGwDCv4Fr8zRC1MHBEWIOpYwt/7mwvn5kMkNvmCcgC5/V2RE
         TAgce32KtvGTMqlgKC0Ji/5x+rpZ0kauyLYL4JnNz8+tS+L54OYJoKKUPcrQ4sh9Oe3S
         ZTvY6FCEFph4TlvrctuASI4XhdGnatm0puw8yilO+mDSEj1mOR8fLYJM9d3IwJR6bjx8
         4xee265hQsHLmbbK9Oy7qd4nvEHBNfzpWhsVp9SCGUpjPQCx6A1RNj3AUd3NYPkRAvYa
         qJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978323; x=1748583123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzG5aBj4uT4Cxy0Ye5VbMroQI6g4J7udAW2U71MrLVg=;
        b=dzzaj9laZ5s5aqkZG8cbtkL5Z+htAJ4w8ZKNbnQKLG87iT7YDo51zmSWWBGsg7zzAN
         45yopyJ1vpRVRVo+QP9Vr8SWysDQ6otVPk/tPjwjWeJP1f4zaCavO/GEDK03K3NZvffC
         nvoAP1k14t3+fROuEXaGXP6y56cCPM/L8cGykOt28IpTj3drs7R8eGM7irtF1CPn9F5x
         EiZ4qW582ZmSbmyodp76/8B81vwV8PqQakZjPoz4JL4fJq9lAaZh0l5DaFg4HQhj/rk7
         xbvlRznxgq2qF0uuqL3xV6jehAUIyq9MTYaeTGKhYSZ+6YeA8KvC8gYo//FEnXmhCzF7
         kT3A==
X-Forwarded-Encrypted: i=1; AJvYcCXUT7b8ZTr/MwetvRgZMUKk5vpmQYsasEyVqi3Guhd1LJXAbDrKQ4ly9WNpv1amAq5oYvwq8CzrM6iCbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL4MfFEX3630491ozvyAcPGDAORM/SEVaLOoL/aG4pUVq2jMeS
	VhSa87Edn5Z6qqXmhNH/5CTZEGQdf0ApcokrexHoy+zhE1MJ4oeOKoFPOTRKy4W4UCE=
X-Gm-Gg: ASbGncuovwuSbLBFOnP4O5nGtBixth+UdchrKRlASjR8hk/iY6V1V+uvDPICBL2NB2t
	tNFo5fpN3L5/BUlpIHvKHCuB7vd3F06e9a0equARGdR9pBf+F+EvNwgBTxFFLZS5kxV1e5oLbil
	6Mj2RyHfx00nD6d0wI0po+Q1k8x+IC7EJp4T6LVGjCIP1hiUWRFrBztulqauzQZklKD6bGuQFx7
	IhOrbt8+GMv04tcrZamfoWBFhSpgPCbtKgXx97BUPH2sVsr7DaSGjBd8LuQI41UFzE+IQfvuFmH
	z/uoIg9dBN+/Gr+yBCDq9TV/wit0QUH6q+Y0155qd8AsSC81T2HBN5VDF4GNVw==
X-Google-Smtp-Source: AGHT+IF1RjEUzefPwiQ1kAsNbNi7ztuTv0w6and+LKuuSIHiE7eCfoV9bmUDF/5BN7/EfBUJa5esFQ==
X-Received: by 2002:a05:6a00:3cc1:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-745ece323edmr3025586b3a.10.1747978322627;
        Thu, 22 May 2025 22:32:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:18 -0700
Subject: [PATCH v16 15/27] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-15-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063204_344805_2058234B 
X-CRM114-Status: GOOD (  18.16  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 43 +++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

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
index 8ff8e8b36524..3f7709f4595a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,49 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
+	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+			      "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
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
