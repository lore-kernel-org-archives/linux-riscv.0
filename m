Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVoEb0frnA1mEqdRCCfqVsyUFuNOt6SMPWrzT77xREw=; b=ndJa40VutPpTR1
	mevZ8GNJkDwGUp0YNclGTckQoqvFCSE4txUsh4EJrvdFzJaS9IspyKtCTUqvvihMV6ZtJQO4qhukF
	P6+Zwe5+JDMa0C1wmhOCKgyJbAP+DZXmJwcqZg2Pl0S4UVQKpe5mPmSER8Nml99X4v+onoXTbo8Ox
	Vyx3wflcUwvixJIMX3mNmkhpLQYMidNIei8Qynqgbz9VTVlBGSbf0CdpkWmPnFi+wpEXbsYXmC8Mu
	pkc9Dwh/kwmh2fq0R2kZcUIMe29DfL5qezVduaa0Sa4H2rjsBo8LvQUKQLgwBNAmFUi/GTaoL0TU6
	grBncPnZUex2OLMS/qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZw0j-00000009aX8-3iDo;
	Fri, 02 Aug 2024 17:24:14 +0000
Received: from mail-40134.protonmail.ch ([185.70.40.134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZw0f-00000009aW4-1BqB;
	Fri, 02 Aug 2024 17:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722619446; x=1722878646;
	bh=KYJ880DzvybbissblwMCNzUlLxxe1Ktl0TOAACRRXAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NvaGzkysirXcjizn6Jo4e4bFXgCgbyugGW/9RojsJdsReD3ddkqxDsLLila/aLRf6
	 zAbt4EB/1Gu795L1QQ/3CavkmtMHt7uIFQq8t2ItVC3iOl9fwTeC1AthRSX4z+8iNe
	 oTr8wCRurge3wMmBL2CzZSMR6HFHR48iZ/RMDQcD0zhPEJL/htJer4r63YJ548B1tb
	 J6FK0Z9l/PtQc892UbtZkC+5Plst5EtSJMIYvNubk7qKCDAz8J/AnUw2YqS/s397gC
	 G+gnJ0EzhLYfOWcLjc7ypKcE9FOL5T0G59OgxWS4zTsdbw3CdY61bx6jAIVXRefpsV
	 feUbG72Eojoow==
Date: Fri, 02 Aug 2024 17:23:59 +0000
To: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, Carlos Llamas <cmllamas@google.com>
Subject: Re: [PATCH v5 2/2] rust: add tracepoint support
Message-ID: <a381ef22-96f4-4a72-8e3a-cc023dee111a@proton.me>
In-Reply-To: <20240802-tracepoint-v5-2-faa164494dcb@google.com>
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com> <20240802-tracepoint-v5-2-faa164494dcb@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d47c8e3b3391333c5a5926396deb7ee3ad135f33
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_102409_505716_430214B0 
X-CRM114-Status: GOOD (  18.00  )
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

On 02.08.24 11:31, Alice Ryhl wrote:
> diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
> new file mode 100644
> index 000000000000..69dafdb8bfe8
> --- /dev/null
> +++ b/rust/kernel/tracepoint.rs
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Logic for tracepoints.
> +
> +/// Declare the Rust entry point for a tracepoint.
> +///
> +/// This macro generates an unsafe function that calls into C, and its safety requirements will be
> +/// whatever the relevant C code requires. To document these safety requirements, you may add
> +/// doc-comments when invoking the macro.

I think we should mandate safety documentation for the function.

> +#[macro_export]
> +macro_rules! declare_trace {
> +    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(

Can you add an `unsafe` in front of `fn`, since this macro generates an
`unsafe` function? Otherwise I don't see how the SAFETY comment below is
correct.

---
Cheers,
Benno

> +        $( #[$attr] )*
> +        #[inline(always)]
> +        $pub unsafe fn $name($($argname : $argtyp),*) {
> +            #[cfg(CONFIG_TRACEPOINTS)]
> +            {
> +                // SAFETY: It's always okay to query the static key for a tracepoint.
> +                let should_trace = unsafe {
> +                    $crate::macros::paste! {
> +                        $crate::static_key::static_key_false!(
> +                            $crate::bindings::[< __tracepoint_ $name >],
> +                            $crate::bindings::tracepoint,
> +                            key
> +                        )
> +                    }
> +                };
> +
> +                if should_trace {
> +                    $crate::macros::paste! {
> +                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
> +                        unsafe { $crate::bindings::[< rust_do_trace_ $name >]($($argname),*) };
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
> 2.46.0.rc2.264.g509ed76dc8-goog
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
