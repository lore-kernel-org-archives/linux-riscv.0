Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63463CE837A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPMSwekmxESDygXRrIANRfRAMFOj51COMaM3Twn2BIk=; b=d6HOxryyW0XHTn
	M+vGQoZ90VJSVVqB/KAzWm/4/yMvVJPeVd7bi7hKzjMC6y7ttJheooR2Gj+A8NZT3hPwtuOLPnKKR
	zOM+z0Hw8OfBaO1NOXSJG0PU7VFwK7FBChj1hOAKcsuk9R5Z1oIAFKeCPHvbKIjvaRcTQKVe8qOur
	PwDME2MPwjLwMfSB8VtGvPMu3eB0fbE1H0gteKrcwcdX/x/BnQrON3bNsdkDqugxWV4E50CM6vNso
	jqNEBxeDeH/gCiql7qBkJW8n6iEUdtfwzJPTBmajS9zybrFMpu8uNUV616inEqLx6Mm5ufSoVcHq5
	2cjErmD1WXEUxX7yapmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svciI-00000002sQW-1Vzv;
	Tue, 01 Oct 2024 13:14:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svciD-00000002sNq-40oL;
	Tue, 01 Oct 2024 13:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9E04A43662;
	Tue,  1 Oct 2024 13:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6112CC4CEC6;
	Tue,  1 Oct 2024 13:14:38 +0000 (UTC)
Date: Tue, 1 Oct 2024 09:15:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard
 Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak
 <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Conor
 Dooley <conor.dooley@microchip.com>, Samuel Holland
 <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Bibo Mao
 <maobibo@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton
 <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 loongarch@lists.linux.dev, Carlos Llamas <cmllamas@google.com>
Subject: Re: [PATCH v8 0/5] Tracepoints and static branch in Rust
Message-ID: <20241001091527.2fe4e039@gandalf.local.home>
In-Reply-To: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_061446_162796_2FFD87B1 
X-CRM114-Status: GOOD (  41.14  )
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


Hi Alice,

Can you rebase this series on v6.12-rc1?

Thanks,

-- Steve


On Thu, 22 Aug 2024 12:04:12 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> An important part of a production ready Linux kernel driver is
> tracepoints. So to write production ready Linux kernel drivers in Rust,
> we must be able to call tracepoints from Rust code. This patch series
> adds support for calling tracepoints declared in C from Rust.
> 
> This series includes a patch that adds a user of tracepoits to the
> rust_print sample. Please see that sample for details on what is needed
> to use this feature in Rust code.
> 
> This is intended for use in the Rust Binder driver, which was originally
> sent as an RFC [1]. The RFC did not include tracepoint support, but you
> can see how it will be used in Rust Binder at [2]. The author has
> verified that the tracepoint support works on Android devices.
> 
> This implementation implements support for static keys in Rust so that
> the actual static branch happens in the Rust object file. However, the
> __DO_TRACE body remains in C code. See v1 for an implementation where
> __DO_TRACE is also implemented in Rust.
> 
> When compiling for x86, this patchset has a dependency on [3] as we need
> objtool to convert jmp instructions to nop instructions. This patchset
> is based on top of the series containing [3].
> 
> There is also a conflict with splitting up the C helpers [4]. I've
> included an alternate version of the first patch that shows how to
> resolve the conflict. When using the alternate version of the first
> patch, this series applies cleanly on top of rust-next.
> 
> Both [3] and [4] are already in rust-next.
> 
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
> Link: https://r.android.com/3119993 [2]
> Link: https://lore.kernel.org/all/20240725183325.122827-7-ojeda@kernel.org/ [3]
> Link: https://lore.kernel.org/all/20240815103016.2771842-1-nmi@metaspace.dk/ [4]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v8:
> - Use OBJTREE instead of SRCTREE for temporary asm file.
> - Adjust comments on `asm!` wrapper to be less confusing.
> - Include resolution of conflict with helpers splitting.
> - Link to v7: https://lore.kernel.org/r/20240816-tracepoint-v7-0-d609b916b819@google.com
> 
> Changes in v7:
> - Fix spurious file included in first patch.
> - Fix issue with riscv asm.
> - Fix tags on fourth patch to match fifth patch.
> - Add Reviewed-by/Acked-by tags where appropriate.
> - Link to v6: https://lore.kernel.org/r/20240808-tracepoint-v6-0-a23f800f1189@google.com
> 
> Changes in v6:
> - Add support for !CONFIG_JUMP_LABEL.
> - Add tracepoint to rust_print sample.
> - Deduplicate inline asm.
> - Require unsafe inside `declare_trace!`.
> - Fix bug on x86 due to use of intel syntax.
> - Link to v5: https://lore.kernel.org/r/20240802-tracepoint-v5-0-faa164494dcb@google.com
> 
> Changes in v5:
> - Update first patch regarding inline asm duplication.
> - Add __rust_do_trace helper to support conditions.
> - Rename DEFINE_RUST_DO_TRACE_REAL to __DEFINE_RUST_DO_TRACE.
> - Get rid of glob-import in tracepoint macro.
> - Address safety requirements on tracepoints in docs.
> - Link to v4: https://lore.kernel.org/rust-for-linux/20240628-tracepoint-v4-0-353d523a9c15@google.com
> 
> Changes in v4:
> - Move arch-specific code into rust/kernel/arch.
> - Restore DEFINE_RUST_DO_TRACE at end of define_trace.h
> - Link to v3: https://lore.kernel.org/r/20240621-tracepoint-v3-0-9e44eeea2b85@google.com
> 
> Changes in v3:
> - Support for Rust static_key on loongarch64 and riscv64.
> - Avoid failing compilation on architectures that are missing Rust
>   static_key support when the archtectures does not actually use it.
> - Link to v2: https://lore.kernel.org/r/20240610-tracepoint-v2-0-faebad81b355@google.com
> 
> Changes in v2:
> - Call into C code for __DO_TRACE.
> - Drop static_call patch, as it is no longer needed.
> - Link to v1: https://lore.kernel.org/r/20240606-tracepoint-v1-0-6551627bf51b@google.com
> 
> ---
> Alice Ryhl (5):
>       rust: add generic static_key_false
>       rust: add tracepoint support
>       rust: samples: add tracepoint to Rust sample
>       jump_label: adjust inline asm to be consistent
>       rust: add arch_static_branch
> 
>  MAINTAINERS                             |  1 +
>  arch/arm/include/asm/jump_label.h       | 14 +++--
>  arch/arm64/include/asm/jump_label.h     | 20 +++++---
>  arch/loongarch/include/asm/jump_label.h | 16 +++---
>  arch/riscv/include/asm/jump_label.h     | 50 ++++++++++--------
>  arch/x86/include/asm/jump_label.h       | 38 ++++++--------
>  include/linux/tracepoint.h              | 22 +++++++-
>  include/trace/define_trace.h            | 12 +++++
>  include/trace/events/rust_sample.h      | 31 +++++++++++
>  rust/Makefile                           |  5 +-
>  rust/bindings/bindings_helper.h         |  3 ++
>  rust/helpers.c                          |  9 ++++
>  rust/kernel/.gitignore                  |  3 ++
>  rust/kernel/arch_static_branch_asm.rs.S |  7 +++
>  rust/kernel/jump_label.rs               | 91 +++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs                      | 37 ++++++++++++++
>  rust/kernel/tracepoint.rs               | 49 ++++++++++++++++++
>  samples/rust/Makefile                   |  3 +-
>  samples/rust/rust_print.rs              | 18 +++++++
>  samples/rust/rust_print_events.c        |  8 +++
>  scripts/Makefile.build                  |  9 +++-
>  21 files changed, 379 insertions(+), 67 deletions(-)
> ---
> base-commit: 88359b25b950670432ef1da4352eb6cc62e0fa9f
> change-id: 20240606-tracepoint-31e15b90e471
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
