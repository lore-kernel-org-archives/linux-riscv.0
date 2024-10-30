Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EF5D6B6A7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4gONC6UlkEfDK5/Fasp1+KPxDL1keGvdrKoVxKlz5nA=; b=bQ0x5rfYPV4RsDEnv1E5fc+VlL
	EnP+dc44GB/YIS5owEgpFH5pZmjDMIzBERj5eX6wjyQS0hvuxxKMICpWvqAro6M1Of0mkHy5rXEjn
	dz7RcIwEUqmXxZ5wuPl7YpSWc1Uhm4vj0fYOtRCETmHXiQwiS4gFIV0dDKMj7dC7DUgBsTZgofsgL
	dMVn2MHTtKwAtj4fEGnmCr7zqyHwllIbVmQ/XTEgJ7/YyatjzWyz3rMrU2lDzhScceKxVEZFMp2tF
	SDdSeDHm/ZvRT3jnblylUaDN6VKWY8vP3VEBN2OHfTU3rJM2FqhVrTqBJ1jxFKB02vGTesQ9wm4mY
	6H18P9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BQH-000000013Jf-2xAh;
	Wed, 30 Oct 2024 16:19:53 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BBz-000000010No-1yYg
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 16:05:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4315d98a873so45409765e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304305; x=1730909105; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKiYiMZSv/wKH/IY2uWJCz4bmXKvljXWgWXOs9047A=;
        b=GCIqagsKAhb8+HScTmYMESWH/UiVo2H6uhwQ6+himgEsRRRoMX14lENWNLi3CBbDfj
         uJFjEas64AD6EhF8BM7hlIVh9lOiveDp3yN+5GFddUVIK7LamnSCdzXParoZWufl3ZMF
         kg+hyFce4QokjE8EFj6MGT+oieBViOGZHOxD6b6zJtYX1q7epZ4SIamZ/NzatUUHpibw
         HAy/MT0e0Xa9y909lgxlDwoQqwBbps/uUjq41rNtjyFQYCHKO/3l1eFEQXZfrVVNUkxC
         4JhYGb+KAskM9iAxPRUXRpiYvtnS3dZLmheBfvg9KcBKJcewWtVvnlf8XN5hPNCuec/4
         3Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304305; x=1730909105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKiYiMZSv/wKH/IY2uWJCz4bmXKvljXWgWXOs9047A=;
        b=ihy0ZsuPDg85gMnRwJyo93B/xYzdzIwdjA64mdFn3V4OStx3uNBBi7M8+NBlotK654
         5etdKzR0TLziNaz7u6d4jcOYLtSgpbB1iPczOEKU4BCIS/3I0EPH5KK/9sZqIB01Z1L/
         lFyS4MzTl65kpj+lDsqUj8N9HRQ9v/0wVPTMLReDDliT3nTjHPwHUVWUAz+Wppm+730c
         NRgCvHc8ArfzWg7YIEvHhfZXzXnJLkNo7XHgfCUO3NRtuuytD82+fVlIQqydqK5GDGxT
         xAxDNJbKayvOpZMQ3Br+VB5G/xJ3+O0GYo571QbRqt9PsVwDajrIoTVjs4Sd2BxVC0Qd
         1VZg==
X-Forwarded-Encrypted: i=1; AJvYcCUwEM0ZO5Xw/rtDCKZl4ynqXNqLJ//v7GA5YV/vjzMf+vYId2htH1moS35irw+2flQfoA1igxwUvpIuJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqzfc7vUy/cDkw3chgwzQLvhyAau3FuJsZrlg1WW1wDoq9oiHs
	pm+VIwLePuDBoL/KdX2V4ScAY/Bl2pKzt3XzxX8QMEfznO2JHo3I/o0fLptUk3oZm9EBcI6x1SK
	ov958OLb6e80Pow==
X-Google-Smtp-Source: AGHT+IG/v66X5/sNRf0N46LwSlUWGFX5ZXleN+ktqgGoUyfaArdYbWLHHKWwb2NH1SWWJLhii4RCDid8Ewha+T0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:499a:b0:431:47fc:92ab with SMTP
 id 5b1f17b1804b1-431bb9778d9mr40575e9.1.1730304304891; Wed, 30 Oct 2024
 09:05:04 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:27 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9457; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vyyYul6wy7jKaMGtrgdBnkT/egAvdduh9xveUZb63Jc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkjbodLH5bNx0hTlA6MfMQ91BcxuqHvIYjmG
 IvSEx9d2tGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIwAKCRAEWL7uWMY5
 RsXDD/0bATrvOML+C3wKiReydF6ngt8WuAWiWyT/iX2SO6bmWxevBm8AmGLMMK1yvo2x4CjezNB
 /8LN7KPzVQHI8KFi1l9i6mNZjoL506Hafo6/tHAGaPX4Mox/7sIpkhyxsV9z67YAfvGMwgM0Ovn
 uKcayN1MqVxUGirVSwkep6HjDlohBXcGmRESXdTFLLMajgsi3WVdYvc0uotTlCEWykt9TcsG0uA
 +KmN0G0TT3+/a5FNvLjnkFnOvuBtHMngQ2fAy8v8I8OJzlGECjdqkkSt37Ix9y4ZzjpKrQGT7QH
 Uckq6N6MWMIQ2DYO+5yW5Tsd/YfBItVvq9nJKscaalKNrzbYRQzc1LXgxnl/2dueWpalDamhzvu
 4YOvfSZaX6KiaEbZD5ErPYzWTL6NRA+rgmtiCGSyJuCRdoGzDH8SXfZlOfQaWcmcg0FTq0TEDgh
 S1nGCgLav4ydlteSpC9w1H1ts9tMiajjxTXbIwoJDO0CxyaB3dUSnl6Cb0KvTw4/j5FDYKa8Ys+
 +nbC5RO0huA81UyPZ87wPm/Qcxq1wa9Gm/F5rGm+j7utiSpKDB0T9XYr98aZu2EdSAPbWVvch8w
 2GU4Zq620iSxN+26x4YiLGQFAEcSYlh80Ksbz9r6fzIHirOXIJ+0CQ/YXrtdnf+8h2bgGBVtl5y Sp1we2VNV3c67nQ==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-4-eec7f0f8ad22@google.com>
Subject: [PATCH v12 4/5] jump_label: adjust inline asm to be consistent
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090508_292792_25397D22 
X-CRM114-Status: GOOD (  13.62  )
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

To avoid duplication of inline asm between C and Rust, we need to
import the inline asm from the relevant `jump_label.h` header into Rust.
To make that easier, this patch updates the header files to expose the
inline asm via a new ARCH_STATIC_BRANCH_ASM macro.

The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
takes the same arguments in a consistent order so that Rust can use the
same logic for every architecture.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm/include/asm/jump_label.h       | 14 +++++----
 arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
 arch/loongarch/include/asm/jump_label.h | 16 +++++++----
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
 arch/x86/include/asm/jump_label.h       | 35 +++++++++--------------
 5 files changed, 73 insertions(+), 62 deletions(-)

diff --git a/arch/arm/include/asm/jump_label.h b/arch/arm/include/asm/jump_label.h
index e4eb54f6cd9f..a35aba7f548c 100644
--- a/arch/arm/include/asm/jump_label.h
+++ b/arch/arm/include/asm/jump_label.h
@@ -9,13 +9,17 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:\n\t"					\
+	WASM(nop) "\n\t"				\
+	".pushsection __jump_table,  \"aw\"\n\t"	\
+	".word 1b, " label ", " key "\n\t"		\
+	".popsection\n\t"				\
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 WASM(nop) "\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".word 1b, %l[l_yes], %c0\n\t"
-		 ".popsection\n\t"
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
 
 	return false;
diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index a0a5bbae7229..424ed421cd97 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -19,10 +19,14 @@
 #define JUMP_TABLE_ENTRY(key, label)			\
 	".pushsection	__jump_table, \"aw\"\n\t"	\
 	".align		3\n\t"				\
-	".long		1b - ., %l["#label"] - .\n\t"	\
-	".quad		%c0 - .\n\t"			\
-	".popsection\n\t"				\
-	:  :  "i"(key) :  : label
+	".long		1b - ., " label " - .\n\t"	\
+	".quad		" key " - .\n\t"		\
+	".popsection\n\t"
+
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop\n\t"				\
+	JUMP_TABLE_ENTRY(key, label)
 
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
@@ -30,8 +34,8 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 	char *k = &((char *)key)[branch];
 
 	asm goto(
-		"1:	nop					\n\t"
-		JUMP_TABLE_ENTRY(k, l_yes)
+		ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
+		:  :  "i"(k) :  : l_yes
 		);
 
 	return false;
@@ -43,9 +47,11 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 						    const bool branch)
 {
 	char *k = &((char *)key)[branch];
+
 	asm goto(
 		"1:	b		%l[l_yes]		\n\t"
-		JUMP_TABLE_ENTRY(k, l_yes)
+		JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
+		:  :  "i"(k) :  : l_yes
 		);
 	return false;
 l_yes:
diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
index 29acfe3de3fa..8a924bd69d19 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -13,18 +13,22 @@
 
 #define JUMP_LABEL_NOP_SIZE	4
 
-#define JUMP_TABLE_ENTRY				\
+/* This macro is also expanded on the Rust side. */
+#define JUMP_TABLE_ENTRY(key, label)			\
 	 ".pushsection	__jump_table, \"aw\"	\n\t"	\
 	 ".align	3			\n\t"	\
-	 ".long		1b - ., %l[l_yes] - .	\n\t"	\
-	 ".quad		%0 - .			\n\t"	\
+	 ".long		1b - ., " label " - .	\n\t"	\
+	 ".quad		" key " - .		\n\t"	\
 	 ".popsection				\n\t"
 
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
 {
 	asm goto(
-		"1:	nop			\n\t"
-		JUMP_TABLE_ENTRY
+		ARCH_STATIC_BRANCH_ASM("%0", "%l[l_yes]")
 		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
@@ -37,7 +41,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 {
 	asm goto(
 		"1:	b	%l[l_yes]	\n\t"
-		JUMP_TABLE_ENTRY
+		JUMP_TABLE_ENTRY("%0", "%l[l_yes]")
 		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 1c768d02bd0c..87a71cc6d146 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -16,21 +16,28 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection	__jump_table, \"aw\"	\n\t"	\
+	".align		" RISCV_LGPTR "		\n\t"	\
+	".long		1b - ., " label " - .	\n\t"	\
+	"" RISCV_PTR "	" key " - .		\n\t"	\
+	".popsection				\n\t"
+
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"	.align		2		\n\t"	\
+	"	.option push			\n\t"	\
+	"	.option norelax			\n\t"	\
+	"	.option norvc			\n\t"	\
+	"1:	nop				\n\t"	\
+	"	.option pop			\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
 	asm goto(
-		"	.align		2			\n\t"
-		"	.option push				\n\t"
-		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
-		"1:	nop					\n\t"
-		"	.option pop				\n\t"
-		"	.pushsection	__jump_table, \"aw\"	\n\t"
-		"	.align		" RISCV_LGPTR "		\n\t"
-		"	.long		1b - ., %l[label] - .	\n\t"
-		"	" RISCV_PTR "	%0 - .			\n\t"
-		"	.popsection				\n\t"
+		ARCH_STATIC_BRANCH_ASM("%0", "%l[label]")
 		:  :  "i"(&((char *)key)[branch]) :  : label);
 
 	return false;
@@ -38,21 +45,20 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 	return true;
 }
 
+#define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)		\
+	"	.align		2		\n\t"	\
+	"	.option push			\n\t"	\
+	"	.option norelax			\n\t"	\
+	"	.option norvc			\n\t"	\
+	"1:	j	" label "		\n\t" \
+	"	.option pop			\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch_jump(struct static_key * const key,
 						    const bool branch)
 {
 	asm goto(
-		"	.align		2			\n\t"
-		"	.option push				\n\t"
-		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
-		"1:	j		%l[label]		\n\t"
-		"	.option pop				\n\t"
-		"	.pushsection	__jump_table, \"aw\"	\n\t"
-		"	.align		" RISCV_LGPTR "		\n\t"
-		"	.long		1b - ., %l[label] - .	\n\t"
-		"	" RISCV_PTR "	%0 - .			\n\t"
-		"	.popsection				\n\t"
+		ARCH_STATIC_BRANCH_JUMP_ASM("%0", "%l[label]")
 		:  :  "i"(&((char *)key)[branch]) :  : label);
 
 	return false;
diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index cbbef32517f0..3f1c1d6c0da1 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -12,35 +12,28 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 
-#define JUMP_TABLE_ENTRY				\
+#define JUMP_TABLE_ENTRY(key, label)			\
 	".pushsection __jump_table,  \"aw\" \n\t"	\
 	_ASM_ALIGN "\n\t"				\
 	".long 1b - . \n\t"				\
-	".long %l[l_yes] - . \n\t"			\
-	_ASM_PTR "%c0 + %c1 - .\n\t"			\
+	".long " label " - . \n\t"			\
+	_ASM_PTR " " key " - . \n\t"			\
 	".popsection \n\t"
 
+/* This macro is also expanded on the Rust side. */
 #ifdef CONFIG_HAVE_JUMP_LABEL_HACK
-
-static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
-{
-	asm goto("1:"
-		"jmp %l[l_yes] # objtool NOPs this \n\t"
-		JUMP_TABLE_ENTRY
-		: :  "i" (key), "i" (2 | branch) : : l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1: jmp " label " # objtool NOPs this \n\t"	\
+	JUMP_TABLE_ENTRY(key " + 2", label)
 #else /* !CONFIG_HAVE_JUMP_LABEL_HACK */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1: .byte " __stringify(BYTES_NOP5) "\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
 
 static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
 {
-	asm goto("1:"
-		".byte " __stringify(BYTES_NOP5) "\n\t"
-		JUMP_TABLE_ENTRY
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0 + %c1", "%l[l_yes]")
 		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;
@@ -48,13 +41,11 @@ static __always_inline bool arch_static_branch(struct static_key * const key, co
 	return true;
 }
 
-#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
-
 static __always_inline bool arch_static_branch_jump(struct static_key * const key, const bool branch)
 {
 	asm goto("1:"
 		"jmp %l[l_yes]\n\t"
-		JUMP_TABLE_ENTRY
+		JUMP_TABLE_ENTRY("%c0 + %c1", "%l[l_yes]")
 		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;

-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
