Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97620C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc48imhmTtiTSmkWxGbZdaHZwxonWAVF53J9Y3t1gmY=; b=O1EToRQHN9a/LC
	CeSZuZ53vwCrtCxJw7de/yo6GINaEAtlM55L6HzoBeuMkVqvNDVp7sRHyZcstg9JFU62m0VYhV1sp
	WAd4MZJN1cOjODMCgpvsSTVPfD6ngrdvtUuo8sdqSVXUkbvzlLBLI0V4If4mlRXfPZqVJX1sNIjgO
	VmoXa9kN64zuE6eQcwKFkezhbnEsU6gTkLzLD74gDC0RJwPskmONlnxuZxITeCEk84Yj44PRNIj+m
	ch3giupZnPgqZSeAIkgtPYfAW/fr6RNhFduDfjn+LfBRmE3ZbvbgoU8N9q6z2USCD/icU/QDuAoFd
	H6+W2i1XMJM/mjObUM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqr-00000003F1m-0KrJ;
	Fri, 02 May 2025 23:31:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqo-00000003Exs-3WcU
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:31:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-227a8cdd241so33326955ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228686; x=1746833486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzG5aBj4uT4Cxy0Ye5VbMroQI6g4J7udAW2U71MrLVg=;
        b=PsMNVtXryciECZkhvSTGPN/z9kA9aSnVeLuqVg6WFWqwAAtBJsv85FqMRtZKr4bkOI
         t0Sc87a5QzuyNvdpM6VF2dffMYyIN/sQ/v0ZNQhA/CIDrlcvMlWF7HrRbLeCy1h09bnN
         1FPL46NWMuerjphqKjpSGsEBn08p2ZutLHU0/MxN4IlZT0vYDauEMtYKeNnbDKHQ0uQj
         wAAlwB73hFpEQtzfTDmvf7TG2W/oR9FUJth0FjolTZCTr1W64W0Q3fsSdFshgYIaCYsR
         V9e+0rl9yHzIkDLsi/Lq0UndrDAR45RZ9ubQxD+pN4hDS807ZnjrNRY7iS6x5Qszv3zK
         mYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228686; x=1746833486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzG5aBj4uT4Cxy0Ye5VbMroQI6g4J7udAW2U71MrLVg=;
        b=A67sb87my+K+23OB1FATCj8mwt0U/fUfoXdvJ9KNEni6Df2Nm8FIjsa4BkeW/W33lE
         Ekdhq+9qJm7IcfvuKtjMbEKjOjyEzxofXlPDzTulSjvuGO3ChDA5iMqCldoUhUGzbPBy
         x9KYSiy/+TAfzXKyLB83EKoXXA9Ac1IdH2Tx1CbWSsGwyKypLZh2uBcMmrAyriQ1hG7T
         32RIlH4ZU8ppoDkBYnjYJz9OHBY5V2llNK54AVFDxhu20qWnGrHzEWxdCO8O0tA4RfBB
         SL6DYGZaXxBmJZIZRl+HsggpindFDawli+4LkZyIyXvI9uQ443WqqxJ8i3WTY9D1RWBh
         Zu7g==
X-Forwarded-Encrypted: i=1; AJvYcCWyL0+Yd4SqKU+Y8zkhnjLRtDJE4wSVaWprMpyHYGeWlMzI6MJTWMHeVHB8tZpQbNpC7w/gEag8HvhhGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX2Gk7yFih7EKwOgo2XKZwYpnSZbXZQ/yZfpHtaeq2Dgd6KzDD
	FosFH4KTtW49veJqfeBaZRJ7NMSWeh4qvESz7BrqkI0h0ONbFConUgKHqhiuAV4=
X-Gm-Gg: ASbGncuX1oiX/PU++htlyGov+4FHOq6G4gj2VlSJk+QGeUuGXfE1DgTJZWWRWZVVGpn
	e5jPojjXCW/eSWcS0h8cqa7PGtpKooJnErnv0IuTDN3EBUzhA0p3NmkMyrkWwjuuBVfqtOWevge
	xj1nFncCPnz4kigjmKe4Hx/vziUKhUt42KXI/DpiUeKnxZBJVoJI/WceUd0O4pA6+oVsdQE98Te
	h2lTDZsTj1Z+vIzU37PO10AGmBqnut1G63W0FGCLc63u9GCzDqb5tO1dcAgWS/42z8iSwdWvqZC
	tb4cDKGpOwU0ui1NGWaSrp46Q4YQICkXvyus6b5wy0WOw1JdJ439Ci7b2mWwPA==
X-Google-Smtp-Source: AGHT+IF32JcuU/UOpoww4jQ7Vp+ZM8BNKMHRFkoqxGXs1BOMEDJfAXLOyJDQfQMNdHJqaOQDtkiE4Q==
X-Received: by 2002:a17:902:ea10:b0:215:9642:4d7a with SMTP id d9443c01a7336-22e18ac8366mr15406295ad.0.1746228686087;
        Fri, 02 May 2025 16:31:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:46 -0700
Subject: [PATCH v15 15/27] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-15-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250502_163126_882947_0B928941 
X-CRM114-Status: GOOD (  18.34  )
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
