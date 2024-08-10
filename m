Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E7C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 21:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GeITLH2GWwPnTCdURZ7pcy6mGVra3vLz51iPAlBKko=; b=GOxTXFdEf43fnb
	pN26kfb8MlumQl1+uapF/Qk7LlOQV1uWpuw3M5YrmMNvGvlHAIwDJHdX6j0YZ6UtHU3LyCjKNHEWL
	v+3hoDjedjy7d3kb5TwnFRDpExHtw26rjnqeRXaKITZviI/m8G37Sx/Phu92j6sKte6n66sQ9Q4+0
	DwKqJNBL4X25HTRQubMc3jmSZT9SAkhQjvpFQZB7Xm6dJBqIhtSiInduWDSrRjRRl7svMYWdHRmEG
	9gp5/F+1U3meExfRKEhnMG/RdUcAknaokdwbIeQMEgnX1/M+bnBRXLNQOYRDA2wyXHeJgTSEr2p5G
	8NN45Sq/p3XrrxY5PU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sctcE-0000000Ecdn-3urS;
	Sat, 10 Aug 2024 21:27:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sctcC-0000000EcdU-1pRX;
	Sat, 10 Aug 2024 21:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QS4maoDE9j0FPQOAXgzzsa6/fUJQHH67QENNS+2ljQI=; b=SlodpyVHbHOHc5JsqYBNEK43LL
	xWYoqz26t8JR2c+GPCw5A3SN/gWdzaf9NYgioguHIg8/Ppvyj603Ac8juUxZo2TFtxlGC+GXUq/v/
	AvmyS9U25DC+acTebH9fSQIAhq28P7tudVeZu/8+pfKCTZtUdfn29A/vlGks5kVY/A+64Otsp/J5F
	BQ1viAkQnQrBxjJhgcEczOTZY8T8w1SCs1E2D4yCr/RMADTmF+a9Y1yPlh8fXZWyzEx29ceU6m+lK
	eziSg60W10jAC+fiWNbEtYlOMHfdJEbSMjq2vPgLRbu965BE+0Aw/Jm5A6oyOvU6F94pfgTz2mlmG
	S9UHZ2fg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sctbx-00000007Fnm-43XW;
	Sat, 10 Aug 2024 21:26:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 041B7300729; Sat, 10 Aug 2024 23:26:53 +0200 (CEST)
Date: Sat, 10 Aug 2024 23:26:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 4/5] jump_label: adjust inline asm to be consistent
Message-ID: <20240810212652.GE11646@noisy.programming.kicks-ass.net>
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-4-a23f800f1189@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240808-tracepoint-v6-4-a23f800f1189@google.com>
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

On Thu, Aug 08, 2024 at 05:23:40PM +0000, Alice Ryhl wrote:
> To avoid duplication of inline asm between C and Rust, we need to
> import the inline asm from the relevant `jump_label.h` header into Rust.
> To make that easier, this patch updates the header files to expose the
> inline asm via a new ARCH_STATIC_BRANCH_ASM macro.
> 
> The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
> takes the same arguments in a consistent order so that Rust can use the
> same logic for every architecture.
> 
> Link: https://lore.kernel.org/r/20240725183325.122827-7-ojeda@kernel.org [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I can't help but notice your risc-v conversion is much nicer than the
one you did for ARM. But I'm not going to complain too loudly about
that.

It's a shame about that 2 for JUMP_LABEL_HACK, having to lift that
nonsense all the way to Rust, but alas.

This will do, thanks!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  arch/arm/include/asm/jump_label.h       | 14 +++++----
>  arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
>  arch/loongarch/include/asm/jump_label.h | 16 +++++++----
>  arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
>  arch/x86/include/asm/jump_label.h       | 38 ++++++++++---------------
>  5 files changed, 75 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/arm/include/asm/jump_label.h b/arch/arm/include/asm/jump_label.h
> index e4eb54f6cd9f..a35aba7f548c 100644
> --- a/arch/arm/include/asm/jump_label.h
> +++ b/arch/arm/include/asm/jump_label.h
> @@ -9,13 +9,17 @@
>  
>  #define JUMP_LABEL_NOP_SIZE 4
>  
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	WASM(nop) "\n\t"				\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".word 1b, " label ", " key "\n\t"		\
> +	".popsection\n\t"				\
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>  {
> -	asm goto("1:\n\t"
> -		 WASM(nop) "\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".word 1b, %l[l_yes], %c0\n\t"
> -		 ".popsection\n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
>  
>  	return false;
> diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
> index a0a5bbae7229..424ed421cd97 100644
> --- a/arch/arm64/include/asm/jump_label.h
> +++ b/arch/arm64/include/asm/jump_label.h
> @@ -19,10 +19,14 @@
>  #define JUMP_TABLE_ENTRY(key, label)			\
>  	".pushsection	__jump_table, \"aw\"\n\t"	\
>  	".align		3\n\t"				\
> -	".long		1b - ., %l["#label"] - .\n\t"	\
> -	".quad		%c0 - .\n\t"			\
> -	".popsection\n\t"				\
> -	:  :  "i"(key) :  : label
> +	".long		1b - ., " label " - .\n\t"	\
> +	".quad		" key " - .\n\t"		\
> +	".popsection\n\t"
> +
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:	nop\n\t"				\
> +	JUMP_TABLE_ENTRY(key, label)
>  
>  static __always_inline bool arch_static_branch(struct static_key * const key,
>  					       const bool branch)
> @@ -30,8 +34,8 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
>  	char *k = &((char *)key)[branch];
>  
>  	asm goto(
> -		"1:	nop					\n\t"
> -		JUMP_TABLE_ENTRY(k, l_yes)
> +		ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> +		:  :  "i"(k) :  : l_yes
>  		);
>  
>  	return false;
> @@ -43,9 +47,11 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
>  						    const bool branch)
>  {
>  	char *k = &((char *)key)[branch];
> +
>  	asm goto(
>  		"1:	b		%l[l_yes]		\n\t"
> -		JUMP_TABLE_ENTRY(k, l_yes)
> +		JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
> +		:  :  "i"(k) :  : l_yes
>  		);
>  	return false;
>  l_yes:
> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
> index 29acfe3de3fa..8a924bd69d19 100644
> --- a/arch/loongarch/include/asm/jump_label.h
> +++ b/arch/loongarch/include/asm/jump_label.h
> @@ -13,18 +13,22 @@
>  
>  #define JUMP_LABEL_NOP_SIZE	4
>  
> -#define JUMP_TABLE_ENTRY				\
> +/* This macro is also expanded on the Rust side. */
> +#define JUMP_TABLE_ENTRY(key, label)			\
>  	 ".pushsection	__jump_table, \"aw\"	\n\t"	\
>  	 ".align	3			\n\t"	\
> -	 ".long		1b - ., %l[l_yes] - .	\n\t"	\
> -	 ".quad		%0 - .			\n\t"	\
> +	 ".long		1b - ., " label " - .	\n\t"	\
> +	 ".quad		" key " - .		\n\t"	\
>  	 ".popsection				\n\t"
>  
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:	nop				\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +
>  static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
>  {
>  	asm goto(
> -		"1:	nop			\n\t"
> -		JUMP_TABLE_ENTRY
> +		ARCH_STATIC_BRANCH_ASM("%0", "%l[l_yes]")
>  		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
>  
>  	return false;
> @@ -37,7 +41,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
>  {
>  	asm goto(
>  		"1:	b	%l[l_yes]	\n\t"
> -		JUMP_TABLE_ENTRY
> +		JUMP_TABLE_ENTRY("%0", "%l[l_yes]")
>  		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
>  
>  	return false;
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 1c768d02bd0c..f6342d456372 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -16,21 +16,28 @@
>  
>  #define JUMP_LABEL_NOP_SIZE 4
>  
> +#define JUMP_TABLE_ENTRY(key, label)			\
> +	".pushsection	__jump_table, \"aw\"	\n\t"	\
> +	".align		" RISCV_LGPTR "		\n\t"	\
> +	".long		1b - ., " label " - .	\n\t"	\
> +	"" RISCV_PTR "	" key " - .		\n\t"	\
> +	".popsection				\n\t"
> +
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"	.align		2		\n\t"	\
> +	"	.option push			\n\t"	\
> +	"	.option norelax			\n\t"	\
> +	"	.option norvc			\n\t"	\
> +	"1:	j	" label "		\n\t" \
> +	"	.option pop			\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +
>  static __always_inline bool arch_static_branch(struct static_key * const key,
>  					       const bool branch)
>  {
>  	asm goto(
> -		"	.align		2			\n\t"
> -		"	.option push				\n\t"
> -		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> -		"1:	nop					\n\t"
> -		"	.option pop				\n\t"
> -		"	.pushsection	__jump_table, \"aw\"	\n\t"
> -		"	.align		" RISCV_LGPTR "		\n\t"
> -		"	.long		1b - ., %l[label] - .	\n\t"
> -		"	" RISCV_PTR "	%0 - .			\n\t"
> -		"	.popsection				\n\t"
> +		ARCH_STATIC_BRANCH_ASM("%0", "%l[label]")
>  		:  :  "i"(&((char *)key)[branch]) :  : label);
>  
>  	return false;
> @@ -38,21 +45,20 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
>  	return true;
>  }
>  
> +#define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)		\
> +	"	.align		2		\n\t"	\
> +	"	.option push			\n\t"	\
> +	"	.option norelax			\n\t"	\
> +	"	.option norvc			\n\t"	\
> +	"1:	nop				\n\t"	\
> +	"	.option pop			\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +
>  static __always_inline bool arch_static_branch_jump(struct static_key * const key,
>  						    const bool branch)
>  {
>  	asm goto(
> -		"	.align		2			\n\t"
> -		"	.option push				\n\t"
> -		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> -		"1:	j		%l[label]		\n\t"
> -		"	.option pop				\n\t"
> -		"	.pushsection	__jump_table, \"aw\"	\n\t"
> -		"	.align		" RISCV_LGPTR "		\n\t"
> -		"	.long		1b - ., %l[label] - .	\n\t"
> -		"	" RISCV_PTR "	%0 - .			\n\t"
> -		"	.popsection				\n\t"
> +		ARCH_STATIC_BRANCH_JUMP_ASM("%0", "%l[label]")
>  		:  :  "i"(&((char *)key)[branch]) :  : label);
>  
>  	return false;
> diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
> index cbbef32517f0..87a3a0f5bd22 100644
> --- a/arch/x86/include/asm/jump_label.h
> +++ b/arch/x86/include/asm/jump_label.h
> @@ -12,49 +12,41 @@
>  #include <linux/stringify.h>
>  #include <linux/types.h>
>  
> -#define JUMP_TABLE_ENTRY				\
> +#define JUMP_TABLE_ENTRY(key, label)			\
>  	".pushsection __jump_table,  \"aw\" \n\t"	\
>  	_ASM_ALIGN "\n\t"				\
>  	".long 1b - . \n\t"				\
> -	".long %l[l_yes] - . \n\t"			\
> -	_ASM_PTR "%c0 + %c1 - .\n\t"			\
> +	".long " label "- . \n\t"			\
> +	_ASM_PTR " " key " - . \n\t"			\
>  	".popsection \n\t"
>  
> +/* This macro is also expanded on the Rust side. */
>  #ifdef CONFIG_HAVE_JUMP_LABEL_HACK
> -
> -static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
> -{
> -	asm goto("1:"
> -		"jmp %l[l_yes] # objtool NOPs this \n\t"
> -		JUMP_TABLE_ENTRY
> -		: :  "i" (key), "i" (2 | branch) : : l_yes);
> -
> -	return false;
> -l_yes:
> -	return true;
> -}
> -
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1: jmp " label " # objtool NOPs this \n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
>  #else /* !CONFIG_HAVE_JUMP_LABEL_HACK */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1: .byte " __stringify(BYTES_NOP5) "\n\t"	\
> +	JUMP_TABLE_ENTRY(key, label)
> +#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
>  
>  static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
>  {
> -	asm goto("1:"
> -		".byte " __stringify(BYTES_NOP5) "\n\t"
> -		JUMP_TABLE_ENTRY
> -		: :  "i" (key), "i" (branch) : : l_yes);
> +	int hack_bit = IS_ENABLED(CONFIG_HAVE_JUMP_LABEL_HACK) ? 2 : 0;
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0 + %c1", "%l[l_yes]")
> +		: :  "i" (key), "i" (hack_bit | branch) : : l_yes);
>  
>  	return false;
>  l_yes:
>  	return true;
>  }
>  
> -#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
> -
>  static __always_inline bool arch_static_branch_jump(struct static_key * const key, const bool branch)
>  {
>  	asm goto("1:"
>  		"jmp %l[l_yes]\n\t"
> -		JUMP_TABLE_ENTRY
> +		JUMP_TABLE_ENTRY("%c0 + %c1", "%l[l_yes]")
>  		: :  "i" (key), "i" (branch) : : l_yes);
>  
>  	return false;
> 
> -- 
> 2.46.0.76.ge559c4bf1a-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
