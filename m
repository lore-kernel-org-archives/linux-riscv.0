Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E263CF64BE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wiZ/3piSCF5FODhR23C7RVC0c2ydy0VxV52iBxTF5+w=; b=g/ekfhI0g2mIVQtE430gy20OPB
	Cpx4tiuAunbQBLnPoAsIF04TZA4xq0RICKqDAdUeT7stMSrZia7h2gzg2dVju77PmOsNCs7K2+3vX
	HgX9RjR05q+xTLeWVbaLj7NWDXFPUn2CPL7btJ9f6Hn0YYrU1djI83fam7/uTqE9gUfl5liKrAMn1
	V23Rlv63UE7ZOCPPbhQRLL/4p95xT8j4RqgpDURpjSfQhTR12HD8v5AKFBW0DjQqc7j1Swsg9sSzs
	pK/bQOSWbNRJA7w9CHRj4OTQ/RfyTuzYRftudAYxza4c+pHgZwgPQ4sgnRcICzERikJvZ9dzH57Em
	0Hyv1bFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxk-00000002wYn-3Vjm;
	Tue, 01 Oct 2024 13:30:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxf-00000002wTS-37D6
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:30:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0353b731b8so7958908276.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789442; x=1728394242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=olXUlrdi/nz0nOHZ/AvYtKp2YQWJmsFP4oPaErFpY5E=;
        b=qLndezV9i5GN4dLl/Z3VDCIG3htDVNiOZ6J+ELw+7gjPrPdiiHUqaWDe6dGLF5UuMW
         /5GWHgGLdgZwGgcj4/zydWpyIlZ3ArQ0BZlRJsmJeQ7sB51n63h830bf8itNkFPJJgsw
         qU5bbl7yCeJ/WPICk+LWb2V3R1Uw3gFKd9rwVnUWPq6gQAS1QZppYJialCnY0TF+ce8G
         TOBuFvU6ioyvDXs9XJJ0lcRsUMqLr4s66fnTv/0R39jPhIMrkKr9dFEMlHY9oz84Z2AX
         1rhdPAUROwkq1hZyzXBtFeJBkZGCXCo7AznyDXF78iOQ9Llo7aQ238aAAhKR7zNPdysS
         WABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789442; x=1728394242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olXUlrdi/nz0nOHZ/AvYtKp2YQWJmsFP4oPaErFpY5E=;
        b=WLe8GAq/EY97JHxFZokO+AgJndMmhFDprTAVRfva/Mfa6YrQ0a7xGhH0X/ezJRObnR
         qEgeuBvnaFm+eUjRWaeOkukwNoJX3g35cIWSgwnGfobmSWC99UbNHk4tSkc7N3NuyHZx
         9/VtTsFQgGKpnUr+Hixku/KTTLD2IPyZiV62jkaOVa7LWwUvu0RT8LuZg/fATj5KdrJh
         YgDp+zC369up2tw8o5+TbArNbbykYgIXoq6a7fc58V4ksL4gB42CXlcTL//0FEkT66rK
         M3KKP0cXVEXmFRyvZ1T5cZgcidrGVxByFBxLVM+9qRIKZic9eSGaON9uxmQXDlpMNW3u
         AwvA==
X-Forwarded-Encrypted: i=1; AJvYcCW9BwiJ9bkA4XAGqASvivQFahffBvXAoV+Fw1z/j/FhGiOd998U7KDKiO1lKx6vOjmZgNkGlJGDgN1ggw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Qzydz/rf0BfXDClpIPwihwnpfg4uwY+lr/Z6LORZS3ZpoLCs
	uHqZU44VPa+Nq65aZ0UNiiM5svAzf3qMQmJN18zOhjM7AXBVjQj4vff67UaXpaBxk/l6CPsSnVK
	iapHT7x+N2mAoaQ==
X-Google-Smtp-Source: AGHT+IGXMSmR9tUOXy3jDwtrnaVHFTjyw2Rte+yvJh1ufczYgFKCKfYOH4n1ufOUBJAb23e/2z0m5y/fQ6YZfIY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:ce4f:0:b0:e22:5bdf:39c1 with SMTP id
 3f1490d57ef6-e2604c883d4mr11214276.10.1727789441208; Tue, 01 Oct 2024
 06:30:41 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:30:01 +0000
In-Reply-To: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
Mime-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9372; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sLUHlSyC2EqYvVOyetWqSigN1sJyjMhs3a8R4LFtn9I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+/lyFHY2O6VQre0mj/jV5ALg+wxdcErPZc9Ns
 wtLhtPfTGSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvv5cgAKCRAEWL7uWMY5
 RoYbEAC5if5x80NiwTtpU9LeC4+oAi1q5MHgnTGm68dIhGpYCOoeG1ea1oiYjhlLQ0h5aeMOWDq
 GL4oyLEBn4vIKh3GxvtqCxY6fPwPuwvLJxJMmmVjS6jKmnXT7exM6pnaxl4UGlCpcG6mT+FHJMy
 l+Mu9CRNp/MEYFFazkQuAzRjifpW5vTH/09vvghWKJsiOTJhCZQDru/mCL6WrpBSFIDvrWy4z4W
 ubUt1jPZhK1x4teTN6Ud/lVUWAggku2oHPZGzsoFIy/HouPG8gclU+QLzkMPYNNQHaW3pOa0Z1O
 J193KVWf5SrBPxEFZ7d4FYFf1wzDgkHwaNhD+Ii+Pz+Jxb5w90Wh0xHS/OGeKecwYFY8fEfnMug
 7whg7BEInzPsDgeQ7YlYYsagCiJWZeL15JjdaRU5C0Ia/xpfpEYanMwRbvj7EPJxcEbmJ2IMnYX
 IRxQBPv3HM0wYyELTuvMbr1pXyUl/iwwT2CT16kpRxJrx26uhxxU7rkyvh5vgvnpYGxJHXxBz7O
 JcjxhGXJdN+6X8kmOSnGoNeWpaKxseawbxKhbRC0W1E5YHvMDy91yStaghZxgFCa+AykTYPRQhw
 fsy97qMvgB4Lkx1GfsLrjFA5QX7Z8ZAV/AQZHLt0CyNngyFZ2J0DBStkA5Fxw7FsLbdzSEAcdz1 03ykKfQkxk4YDtw==
X-Mailer: b4 0.13.0
Message-ID: <20241001-tracepoint-v9-4-1ad3b7d78acb@google.com>
Subject: [PATCH v9 4/5] jump_label: adjust inline asm to be consistent
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
	Alice Ryhl <aliceryhl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_063043_865614_8A4F82E4 
X-CRM114-Status: GOOD (  14.34  )
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
2.46.1.824.gd892dcdcdd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
