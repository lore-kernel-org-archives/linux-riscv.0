Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wxjxFHCXKRsZUF7piqLhJRqqd2+5a0hn64MPqXZaytY=; b=mpiyU8TIQpRkV5zJ37wbDJipz2
	fdj6M4yfvs0jBFGB30p1jsNI2cY8sqoci7zk06AH+FUyVKR1sU8DDOY8MTTe3KLHMpcuWdryxjGev
	T/7QHIZFDvXkquZFJfQbuHX38LQZdXOsjuw8YAXGdPJ68OTSFFH8zFKFOyl0xpH1Zj3ygXmiI3LUr
	Rr/mi8e0jJlhJeuMgeIWO6w/NOjrvBkCZ1AJhWfSrYC4BQC+QhFi3nSQPbZtM7sV9A1o6a2tssMni
	ToussatxFg9KjM0gpcJqRijxefTMgOgLQPKmXAlPackG4bHq7DTXeGD1WVW20yduWJjdfrqNlSCkd
	fmMC+Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seup1-0000000Chav-1DtF;
	Fri, 16 Aug 2024 11:08:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuop-0000000ChRe-1NvU
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 11:08:33 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ad660add0fso23450217b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723806509; x=1724411309; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q375QRvUD5Wva8hc3MN+sMayJuBnYHhQhae9RWdaskQ=;
        b=qqknZqtlxckmwFzxZh1NBb6JlOW4Ks5giJi18un0dOaq5glFlZ8DK2pArJUmGNlevo
         7u1e0lUHcciC94cNHT2f4AxRHGq/beNmgoN97OxQ2eiQ1L8bNwC9RNdNBvjowa0wIAd7
         Vwe4fJtagYY0IELCuBZkdKdCbKw2jANhNqc+P7g9Ho27ykOiUGvKFml/hC4eGGUtSoXi
         jvEO6LTdWyMvSyHddh/RubfACBGUD9zeMJaHswNEhmpcR1YAXxB/nsxiwVGT/CHB/5dx
         cfqn1gTZoHGx8LE5pdLzZwe5HD7iaW+N0fYuIy8qktwbe+t9K0kKmx1mu9epolquqwIv
         s00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806509; x=1724411309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q375QRvUD5Wva8hc3MN+sMayJuBnYHhQhae9RWdaskQ=;
        b=F/aipDCfrEkuDzQKBYSznlHbV1yA7U5juhuERvDkf8MzeEwD5eW9ligDIumEGNyfkv
         HUjSVjdEEw4fMzew2TmPwxSJcJ1sxkkBQVdAgDTxyxkCzIjNepghg5tyMTMXdW9nXX2V
         hWWg674By87OVRUrQmGMOLtZSrh5TOxFlHIZjGMkJvt4LZmzirFF5QkrhpT3OjDEt9M7
         iZaG+SXyeSS3yZx7uw00zMcaHIgimM2FQBzgwpA9NvISW8ZWJnqQ0GgNQQwqu/TyPhQy
         b064x7UlqIrPyvoBcCTM/gH6rMt7nA5U6Em0kmeFgmScPn9bIWZ3giFKQVZqX9bS83dG
         W6nA==
X-Forwarded-Encrypted: i=1; AJvYcCX3uQxNriZD344J+cQD66+ot7ZEpo2ft9rd32rDUgwF9vB4c0YdzN4ZAZ5NXmEMPhgvLJqf6vOMO75VAN+vJR3+bUBXqyQZitkndzxgUHAE
X-Gm-Message-State: AOJu0Yxht2SlzdHMjYQ6WnBPuYYLqPl9DNG+l1pwwdHwqHlbaRfvGfIq
	zaumzst8zUVr97Bjv35DwYJO2/fpghuyB75ZbxgI8BIYc3zs5gx+zQTwXfxW7+6+R4Vk9bsO4I5
	uBsGnEU44UtM/JA==
X-Google-Smtp-Source: AGHT+IH0LQKf5808EUgr6iBkW6cUdKRyYRkb+ZU2dUSvXkgXGEj9sYf8m7CVk20xNtxPiBWbabelC/a7Yk1YS98=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:b8e:b0:648:2f1d:1329 with SMTP
 id 00721157ae682-6b1d38cac51mr1920947b3.1.1723806508961; Fri, 16 Aug 2024
 04:08:28 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:41 +0000
In-Reply-To: <20240816-tracepoint-v7-0-d609b916b819@google.com>
Mime-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9372; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=NCijnrFVATFS0Jb3tHGcAM6xeWG4d78Efm1z0mpVoWk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvzMe9Qsdoi2s5idl4F4MxYG7XPSkLKE9NF+bM
 rMy4FJDPcSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZr8zHgAKCRAEWL7uWMY5
 RhosD/9CWTEswpwOORoAMxjPJfw2m2DPxDoZQ5oIsQ9CKyp1rwE9hTQCVA/fGaVVTShlLkjoK+q
 NZyUmLLmYc315k1Bu529ZqzCoF4zJSW/Sa1x9thP9lTL7p4alaSIfPqRun9jtok+SQrc1Wo3uRM
 hS0BX3NmrGLzIW3afnMh0PnwGYAnSMTKP+s8oqDoz0z3GVE8xDK+eeD4ebneMeBwBpsBHVg9l+f
 ljSZ3aWPRWjNyM2K96CKfmt2zYEnz5nfYpRi434H8SPSxgWFLU2LLHsXGGyJmCytCLP6Cxnld9E
 OhFUnVogiVcV6pTrK5xRpOYTYB4PvzlXFzRMSq5uqjH+gzojo8oeZ535Wx0F0Ec9GxofWQ3OIsE
 9lFjxyJOBeAPt57y3Z6TrvG4W6mMCKJB9unla7TRlVvkM2o0x+oMTXrm+7lhk4GPKZt55eZf0/s
 akOZmHVyHA/81TpTvknraSwXVnLI4v4Fb82bg7S36ND7dyYcYPp3znFC4OXE2nUG9+A30SUVrU/
 MgKJVKIlF9vmUZCWfgOnmdCBFzl8UpXvAGeLYB5SFCu29cdOR2xKZHBQSYHJvFMan9ehxfOKO1a
 CE4TXfhDn+sPoqlVSEZ3m2OW0aIlKNwsEZ8CfapSA8WUVdmx6B0W1LY+oxkB0BDoUxiaMDwPW2Z xHo/VQDSQIKngSg==
X-Mailer: b4 0.13.0
Message-ID: <20240816-tracepoint-v7-4-d609b916b819@google.com>
Subject: [PATCH v7 4/5] jump_label: adjust inline asm to be consistent
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
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
	Alice Ryhl <aliceryhl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_040831_443072_E4FCF928 
X-CRM114-Status: GOOD (  14.02  )
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm/include/asm/jump_label.h       | 14 +++++----
 arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
 arch/loongarch/include/asm/jump_label.h | 16 +++++++----
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
 arch/x86/include/asm/jump_label.h       | 38 ++++++++++---------------
 5 files changed, 75 insertions(+), 63 deletions(-)

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
index cbbef32517f0..fb79fa1cf70a 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -12,49 +12,41 @@
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
+	JUMP_TABLE_ENTRY(key, label)
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
-		: :  "i" (key), "i" (branch) : : l_yes);
+	int hack_bit = IS_ENABLED(CONFIG_HAVE_JUMP_LABEL_HACK) ? 2 : 0;
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0 + %c1", "%l[l_yes]")
+		: :  "i" (key), "i" (hack_bit | branch) : : l_yes);
 
 	return false;
 l_yes:
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
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
