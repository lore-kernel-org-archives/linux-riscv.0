Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A38DCFD31D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IJbVLtPSJu9mHvy5zKziJQ8a10xfH3ojpELEuDRGw54=; b=IyYdc1KxoNZtLEYLmcF+wVz7x/
	CmNZE4pXllrA/+kUkEoTN1b1fbGlfjbljJubgp2tBhLaqiuNIkYAj7iuol6XMYQ7cGROqH6Soi+Ga
	qdGW4RS1U7l5/V53iFGR2EjF8xbJDYIkSTB9TVixvqY1mJF4hhKgsPWe9bgxWj0accudvIKGgJWOP
	XFIvHtqmnYA1Y256ISnLy0Xoi62Oz0F+/d8CT+wg1vqeGqXVm7uCmBEYMLefLF2b6alfwukn5QsdX
	YJnnsBTX1ZJotG0vrApdHJBfpLwM1I1WrdhgDo8OgFW8zIfmGhYlDB9ORdTKbR6YPLehnUX6y3nDU
	WT3UUF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szCfG-0000000FvyW-3Esc;
	Fri, 11 Oct 2024 10:14:30 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCfA-0000000FvsT-240M
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 10:14:28 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3231725c9so33555747b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641663; x=1729246463; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzMQG0VAhnXz5sWFufxYB1YE8eJN4onDe7TcZljM5AU=;
        b=HOFXFRV3eKcdDz7r9bhTOJ1q6DBCC2hVH612vIfWKFt6UoxVRZgcBXCa9QLHKDoFN/
         5RNomsat8f0ATBQzvaNC4fiEhsRVHUHNeBfP5t6L5UgVL2qzt8Y3afQ5zy3CtXWQs2cm
         ADmlJKWwAo3ISFVbrjGY1V7IrJtPqTINIAJHXvvaGuz18zZHJoMbzPZGfnDmDmhn+LM1
         6Jri/+P4VmKl+CUEC3AR3qD+asVNqAzgKAmDJn089rHnqpBl25CutmOG2Ull3YtpYcRK
         Fx32mQFpZBG/N7DQBw6huSSmKkiPdTy3xq3hEOpA5By45ZEI99kIwW949/Q2iAFYqW4X
         QSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641663; x=1729246463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzMQG0VAhnXz5sWFufxYB1YE8eJN4onDe7TcZljM5AU=;
        b=MSqaiUZ0zCS7+frrWU0JbIq4BHJHA90JlmkUDmb4cNIqj7RzCHGPXCC8wq2G9KiFf2
         gmLtly0HiTw7CaSvb71bf7diiiMCNOmvDlh3TafDYojJKFm/2jyYoJGxSrNqYuIX716/
         tM0yLACcYYos1YgC9TIWRvjBkmTnm4lS+qZzj7UTgLs9fp5BDJ1oEWybdli038zHkyrk
         BlWM03npkKeyct/RO7rXugPtxJhta9Llq2p67rsA+9VTdl4H8kRtc6+21xPHOmp6kY4E
         HKNxTukRdVU0U2nwwdVSpo2+isRE67ztgj15hVTUfu61su/hnAuBJCG3QHdSR8E8ISqI
         Y+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUDGa0XIZx2sdLRNsXCyreVYanoZE21iQzqfDcKhdEnruxlmSl6Ao3wQUbVIoVO3Fj0UEYgAUXsIVNS7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Wqy596UNOZTvkbe0vdV7+JcInG/gYpgxKn762e91KYBqDa5c
	8Hu5BTAJ2mTkId6ul0fU6j7OnZCFpIN0Nkkt0WvIw9IUR6q62BbSZ9C8wLzobPRhAZZziEeSy6D
	Htbs1X5LsrEEOSg==
X-Google-Smtp-Source: AGHT+IHsv8sEJN4AIiET5JbLxpm+hFJMNSEGzbjaN8LZvGlycWMyxdCfV9eP/NWSkHk7nBBqlH0pGInTOOmCZuc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:48c1:b0:6e3:14c3:379f with SMTP
 id 00721157ae682-6e3471eaeb7mr409527b3.0.1728641662754; Fri, 11 Oct 2024
 03:14:22 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:13:37 +0000
In-Reply-To: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
Mime-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9432; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x+2TpPh6Q9mhzvH+1qwbasEJPp51grTVVIsRN6jzHM0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnCPpw3rfTwqfruL8nYs7nQbcxxYzY32CMbXSgd
 7b1T97skFCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwj6cAAKCRAEWL7uWMY5
 RpKOD/9f5yHmrNaDpJ6gfWbhjcjirp2P/xWrPzug/BSW3T+7qd2gMXen9+5ya6ts/D1qfZFRNhS
 RkII9zBitOiGgLUGB40HsQUH0CqcF6MjVo/J+/vmUP0KiwGUJtI6MSgW6yRqthrcm18akgIeIIa
 lIjoDMcqsmIDc/lJ7yzOQkPBKtt7N+1gFeHC8OngnDTgCI5HYc//XIfobPYEMVzt5UeYtd9canc
 csKoOkY85I+yEK+HsG04++GBytxTWr2w8nn0oRzb6lp1IDEynjS+CA+syA8fh6d4P2mhzLTJQEv
 OB18Vkpp8LBBJFBRxZit+uTNSKYzONTcauAvlpaMi2itmNY5GrfWpXHzyJiDue3McadOYVkNz5W
 P9Cit4G25moS7I2hgLRNrYXJ3N4nuWnsKwLzxHFGagGq+acWggZIa75VTQ+vNXRcpjOEou2hv0p
 6uY/iPIckhMbtt3+0akbAReELFDCHs35x3/EOA2jsWfTxMVOJO6yLO8Pjw82FG2Ragffu70gQth
 UcrymhiEd8JbqhwZ9l7hCBblbrqMuptLRXWjfvfCZU+JgCAMTuB/dweCdf8SGBBR5PNMFHRgw0s
 xn6sLDcGUhSRTTPgCsWJyzjJooS2pyEaR+UhYoYN/kcGBpPdf5Xbz6FdQye+Ej/bSxVYsZuu4Qe VpUL7D6t4ePwVXQ==
X-Mailer: b4 0.13.0
Message-ID: <20241011-tracepoint-v10-4-7fbde4d6b525@google.com>
Subject: [PATCH v10 4/5] jump_label: adjust inline asm to be consistent
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
X-CRM114-CacheID: sfid-20241011_031424_720074_23791579 
X-CRM114-Status: GOOD (  13.25  )
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
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm/include/asm/jump_label.h       | 14 +++++----
 arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
 arch/loongarch/include/asm/jump_label.h | 16 +++++++----
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
 arch/x86/include/asm/jump_label.h       | 39 +++++++++++--------------
 5 files changed, 76 insertions(+), 63 deletions(-)

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
index cbbef32517f0..ffd0d1a1a4af 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -12,49 +12,42 @@
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
+
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
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
