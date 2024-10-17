Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2020D3C52C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Y2hKFRzGGNaAwQq91y8d7d4x8Q6bbUiXvSxxW4Sc+Z4=; b=VB1wHTxXRZLRHW68Nj9MSZi/3Z
	Ptcs8InxyK+t+lgUqh2uyH4/RFh175vTWbFvWavrwMRhVNn/EAhUD+7sj/c3MA3Iy6f+KYG1UutOB
	H7376HRq822L4w1e6KRjAoSNEACkPEnsBg2HYU8R2nyhthdiQHNkcReP4w0LJwUI+Hitevz/kXS4b
	kR3R6Wuq5sMnpQG0Mfvcze9i781OZFfTR+7Usyr9y1pJXr04b/vCjZp3B7zu233hLoObm19hqGe4x
	KVTVsaYLIgWxIALN6fSTan33jiP1Nh3tw5EQsLaeFESjNooxupa6Miygjuu1KfMvcUjzBBG+gwHlz
	cxphCL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WEO-0000000G2TJ-1yR4;
	Thu, 17 Oct 2024 19:32:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WEJ-0000000G2RO-302X
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:32:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso957196b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729193535; x=1729798335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfCj0XZYQNwVFG9YcnvaiklTwIyQ/GhWVOU/ROFZAio=;
        b=edxUFuRnE50MnrFDTnj2J3LIKo9QKgw/cHsCvEFEz3GnAAtWW78Wi89lBXVw9Wmcj0
         SWrVwu/Ua1EU+d8xEkOVn544+pazT7gHIHu37Db0ZNCZlvSBC7VgNiRlj8HXTxELHx6C
         7CBBLROcsRoWZzrmudoTwLG/Ovz8ROUs0RzH/njMPme/fcwYthLXJsT6ockpjOULe3uu
         mQAQEary8hM6kNLlZOy5XQLj7GCCtHS5x1Qetc4d3PD/Ag67qi2ukeMnooXqudlh2zYe
         EfDjI7zGwu9BNlpMGTawHus9pX9NZyRnDw9OZa7dDCePEOd1MKi/4kDX1ccWY4Mo9Cdo
         Di1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729193535; x=1729798335;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfCj0XZYQNwVFG9YcnvaiklTwIyQ/GhWVOU/ROFZAio=;
        b=TTJemJrtl78kvsu4vtCtVUMOaQuczytlypVKm1vlaV1RP/u9jqih2ODb1VKQM54u36
         ESgzADIYYnwT7L/6hT1YrejQj/MuefLqupBLMtiwRrUfFUbvXfj7vKYpif84ZMD6HkRw
         xXFGAM6TO+xHHndfZM0Ule0P2vaiwlM1yTEwNtKuHEVVoD0EWdnuwuXNpgWoMs1ExkI4
         w5SPss1h1b5rcusvL9+HAjxJi17Zs5f+Ew58rfiWxg8LuGrJ0mJ6thGTNLhkjZ1FA4e+
         2VKZNpLNhCMbuF8/ufGmpZo3PFOXD0dvFKWTSxMRC/VfWVdXbiWWdTCSRqUhLU9CzTt7
         OE7A==
X-Forwarded-Encrypted: i=1; AJvYcCWXpDE9kp5LUytikx8ycnGi1uDBj/8U6z4vy7PKTZEvZLno+M7wjU63nh++F4vaam7hpk7aQwVgDfdLyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg4UizEZ2gk47h24N6MBOZj8kPWPsHpjci1QNDzm6XZYfm6u2C
	Y26vPT1hv1udRzDXm2ZtMygskiSBPWd4RwhJZcLqq0+Fx6UFjuSor8f/TwEO6u0=
X-Google-Smtp-Source: AGHT+IEYQqSWyT9DM1JblvCRXie6c7wEQ7WCCMd8WOwGbnCY29CemQ9nchGTw3++94PPWZqamrgDPA==
X-Received: by 2002:a05:6a00:2d25:b0:71e:5950:97d2 with SMTP id d2e1a72fcca58-71ea3328e08mr68611b3a.17.1729193534443;
        Thu, 17 Oct 2024 12:32:14 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34a7fa8sm9965b3a.184.2024.10.17.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:32:13 -0700 (PDT)
Date: Thu, 17 Oct 2024 12:32:13 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Oct 2024 12:32:02 PDT (-0700)
Subject: Re: [PATCH v11 4/5] jump_label: adjust inline asm to be consistent
In-Reply-To: <20241015-tracepoint-v11-4-cceb65820089@google.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
  peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, Ard Biesheuvel <ardb@kernel.org>,
  ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
  gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
  linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
  Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, ubizjak@gmail.com,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
  oliver.upton@linux.dev, Mark Rutland <mark.rutland@arm.com>, ryan.roberts@arm.com, tabba@google.com,
  linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, ajones@ventanamicro.com, alexghiti@rivosinc.com,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
  chenhuacai@kernel.org, kernel@xen0n.name, maobibo@loongson.cn, yangtiezhu@loongson.cn,
  akpm@linux-foundation.org, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, aliceryhl@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aliceryhl@google.com
Message-ID: <mhng-0614da52-c420-4be1-a5b9-64dacae91d0e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_123215_983170_A5ED09D7 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Oct 2024 06:14:58 PDT (-0700), aliceryhl@google.com wrote:
> To avoid duplication of inline asm between C and Rust, we need to
> import the inline asm from the relevant `jump_label.h` header into Rust.
> To make that easier, this patch updates the header files to expose the
> inline asm via a new ARCH_STATIC_BRANCH_ASM macro.
>
> The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
> takes the same arguments in a consistent order so that Rust can use the
> same logic for every architecture.
>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  arch/arm/include/asm/jump_label.h       | 14 +++++----
>  arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
>  arch/loongarch/include/asm/jump_label.h | 16 +++++++----
>  arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
>  arch/x86/include/asm/jump_label.h       | 35 +++++++++--------------
>  5 files changed, 73 insertions(+), 62 deletions(-)

[...]

> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 1c768d02bd0c..87a71cc6d146 100644
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
> +	"1:	nop				\n\t"	\
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
> +	"1:	j	" label "		\n\t" \
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
