Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F0AC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TotpTXkbr1QbQI1QwISMKifp/f9ecAbbYroSbm6asI=; b=vDRwCPGoA6W+JI
	GSmjvXwhMN0GNmMEOJh9BN9QW+fIEJxzSrhCpKPcwVKRaWWjUS66KE+jyV4ISpJOTOvou1Q6pa2XI
	LfNo3C+1nfADqIjnAoiP6QCSoMtPEQ9wjsPVjZtaASxQ+Y4ORja9tpAC2hVPz81QQn1pN6pZA/o7b
	AMYtOTrxdZ+O9Dt7uz1KtvfdF9jUqrbQmIuLyO/D090G+kmjUB44mS8e+vkbD4whedeOchsZ2WoXt
	xpFBBR1MM4ksujMDf0rbgkl0fmwOc3i9sEx54dlvweKHdMO9bDlpL5xYaOh76YZEGCsU6a+ypHHz2
	ouBlbfuZnnrbHNVkqTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEX6-00000002C2f-0G0a;
	Wed, 31 Jul 2024 18:58:44 +0000
Received: from mail-40131.protonmail.ch ([185.70.40.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZEX1-00000002C1j-0mM1;
	Wed, 31 Jul 2024 18:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722452314; x=1722711514;
	bh=Ok2jcwhhpJcH2GHlECFhqT7lAO056VLfnNsP0CYcDJg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b1nTHKn2T1dmR8vteP/M2sWrDZnltmVMV+WeJpQaWHdshFgouh8mtm6NWkSOyvsxv
	 zbvWJCt5CARyolCYp8jYPTiMMC2/kamd6t1bN+hVlgjMjCiCQAFbJEnz1IMoa3ET7b
	 dv/+gkT8NoDZWbongMdRmVuvEm5gxl2UjI9LZZyU/hVmY7z8FZclgaMloojKNlSXGl
	 3JDlf6u0EO7lKkTxR5KncuBvKc2QYLLC9GUUqnUn8OIok9sbIj5OjDnyv1rHUrCrft
	 30wBI2Y8WrNCEUZoxCwk/KYw5Ic9fuzfIcT71pq+GI6qDGIg08sGLP7pGBPC44S4xU
	 28vEKBj2xRsUw==
Date: Wed, 31 Jul 2024 18:58:28 +0000
To: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 2/2] rust: add tracepoint support
Message-ID: <b675e620-6a20-496a-8d23-8e184d7bde6b@proton.me>
In-Reply-To: <20240628-tracepoint-v4-2-353d523a9c15@google.com>
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com> <20240628-tracepoint-v4-2-353d523a9c15@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8ba1730ad398f749464698fd1f1be0f27b26c0d0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_115839_394367_F28C514B 
X-CRM114-Status: GOOD (  17.38  )
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

On 28.06.24 15:23, Alice Ryhl wrote:
> diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
> new file mode 100644
> index 000000000000..1005f09e0330
> --- /dev/null
> +++ b/rust/kernel/tracepoint.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Logic for tracepoints.
> +
> +/// Declare the Rust entry point for a tracepoint.
> +#[macro_export]
> +macro_rules! declare_trace {
> +    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
> +        $( #[$attr] )*
> +        #[inline(always)]
> +        $pub unsafe fn $name($($argname : $argtyp),*) {
> +            #[cfg(CONFIG_TRACEPOINTS)]
> +            {
> +                use $crate::bindings::*;

Why is this needed, can't you put this into the invocation of `paste!`?
ie `[< $crate::bindings::__tracepoint_ $name >]`?

> +
> +                // SAFETY: It's always okay to query the static key for a tracepoint.
> +                let should_trace = unsafe {
> +                    $crate::macros::paste! {
> +                        $crate::static_key::static_key_false!(
> +                            [< __tracepoint_ $name >],
> +                            $crate::bindings::tracepoint,
> +                            key
> +                        )
> +                    }
> +                };
> +
> +                if should_trace {
> +                    $crate::macros::paste! {
> +                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.

Can you add this on the docs of `$name`? ie add a Safety section.
The docs should still appear when creating them/when LSPs show them to
you.

---
Cheers,
Benno

> +                        unsafe { [< rust_do_trace_ $name >]($($argname),*) };
> +                    }
> +                }
> +            }
> +
> +            #[cfg(not(CONFIG_TRACEPOINTS))]
> +            {
> +                // If tracepoints are disabled, insert a trivial use of each argument
> +                // to avoid unused argument warnings.
> +                $( let _unused = $argname; )*
> +            }
> +        }
> +    )*}
> +}
> +
> +pub use declare_trace;
> 
> --
> 2.45.2.803.g4e1b14247a-goog
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
