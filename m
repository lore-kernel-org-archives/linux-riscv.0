Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC9C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3SxqvYvVBQwyWBMIhnAZNdqfjozmXNXLN2wXqqv0ts=; b=uxnyBm26PVrahp
	q8Nomq6CvWPXzpOw2mvr8aEyuhk0kzAseAcc0SZLBPMES9cCRDTzIktmkMKKoLs3wIbZaS+kmHMHP
	KpCg491ALu7r9ePTQzx7Xy8+ZRCB9YKEsrBUbb+x50EWC1HIXua5chuqbpmZUopU1aLjkSnNvjnJj
	30plE39fxQAW5qp59HMjY9p5IjHqG4Y6mpBXJ/hO+Yk7c5PL4B1UyvdrRrx0AvDFA8kDdJvH/xXKd
	uZCsUf72rcVG5joNR0I26Y9GhCF6RNIneDRrDxJmFY+s/pUpadgjF3ekJ1IoYfNC5AccADQQsqOmh
	i1vMkDDQRP5iO6ITquAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZold-00000008JM5-05OT;
	Fri, 02 Aug 2024 09:40:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZola-00000008JLA-15jT;
	Fri, 02 Aug 2024 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Z+aZs0SZ0YC0bCCXeGs8Vm6t97KZ36rxeFA4yv6VTs=; b=Zw/KFesVnIdv3zfmHq5Lgrs5Kv
	latri07BG8i4S1nwE+kxVm9CRqcaJllTU0uxtIwT+uKPxG/dphWK7zASeRnTfEmWTLCOvBAx4B+z1
	Ern+lvCmTDVXbcv1dPN0zqMgMzI33TKcRsu4+hzgnhPyCmKqs/Bp988YBtzUM25rpb14ipJQ85AVw
	A1qBCb2qKv9XsTXMMRilLG3dSTaFmu2TAPcrSPMf3fgPRaPA0fNV8MXpDhCO0KnujT0DRLJAQNj5X
	5mfm7dVDr1DErxLIcmXKv4X2gk+qdWI705etIfroB8ccBkAw6pd1ol+D+g0iBbcD4UIEBWrLj46po
	txqO3NeQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZolO-00000005g5O-43JP;
	Fri, 02 Aug 2024 09:39:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7E0F230088D; Fri,  2 Aug 2024 11:39:54 +0200 (CEST)
Date: Fri, 2 Aug 2024 11:39:54 +0200
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev,
	WANG Rui <wangrui@loongson.cn>
Subject: Re: [PATCH v5 1/2] rust: add static_key_false
Message-ID: <20240802093954.GH39708@noisy.programming.kicks-ass.net>
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
 <20240802-tracepoint-v5-1-faa164494dcb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802-tracepoint-v5-1-faa164494dcb@google.com>
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

On Fri, Aug 02, 2024 at 09:31:27AM +0000, Alice Ryhl wrote:
> Add just enough support for static key so that we can use it from
> tracepoints. Tracepoints rely on `static_key_false` even though it is
> deprecated, so we add the same functionality to Rust.
> 
> It is not possible to use the existing C implementation of
> arch_static_branch because it passes the argument `key` to inline
> assembly as an 'i' parameter, so any attempt to add a C helper for this
> function will fail to compile because the value of `key` must be known
> at compile-time.
> 
> One disadvantage of this patch is that it introduces a fair amount of
> duplicated inline assembly. However, this is a limited and temporary
> situation:
> 
> 1. Most inline assembly has no reason to be duplicated like this. It is
>    only needed here due to the use of 'i' parameters.
> 
> 2. Alice will submit a patch along the lines of [1] that removes the
>    duplication. This will happen as a follow-up to this patch series.

You're talking about yourself in the 3rd person?

What's the rush, why not do it right first?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
