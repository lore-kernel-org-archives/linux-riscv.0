Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A6DC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4uuZq99Ufaad8BLKJrTzzogd2beY56K1YuKlagegZc=; b=sQ/SPm4WEKNv8f
	weIqDu5nOs7qsFM0ch7ZFdiM9ADJZKeIacQQytfi3XtDryC1bqencnZri1/psqhTFqT3c2+KPKNIj
	IWAyUTikRNHdKIv7cH7PbQJVFpQunQMC1B5B7ua6dg/KyABcIwwVFpy3b4q8s1g7kpKVHpf6V8ECS
	Vq5xizLH5llM6CfPmnlLsKoDTxFDeOEOGl7kSnOIldYq+MsdWpoPBDPVj5R+004eoomFXyX7Kwna3
	+Wbd6FfCq4ZuiYvkd3V9fNQucm41h5fdu5DG3Q8g0ieHzvi3WlMAe6NM+TGCfRznbDgmrrNCciMKu
	XhtUmQsU8b5WqLoQQSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBz1-00000001pku-2hOV;
	Wed, 31 Jul 2024 16:15:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZByp-00000001phB-2lru;
	Wed, 31 Jul 2024 16:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95945624BC;
	Wed, 31 Jul 2024 16:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC10C116B1;
	Wed, 31 Jul 2024 16:15:04 +0000 (UTC)
Date: Wed, 31 Jul 2024 12:15:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Ard Biesheuvel
 <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, linux-trace-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, linux-arch@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradaed.org>, Sean Christopherson <seanjc@google.com>, Uros
 Bizjak <ubizjak@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
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
 loongarch@lists.linux.dev
Subject: Re: [PATCH v4 2/2] rust: add tracepoint support
Message-ID: <20240731121539.0888738b@gandalf.local.home>
In-Reply-To: <20240730113527.5c9896db@eugeo>
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
	<20240628-tracepoint-v4-2-353d523a9c15@google.com>
	<20240730113527.5c9896db@eugeo>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_091511_848878_A744C3AC 
X-CRM114-Status: GOOD (  21.73  )
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

On Tue, 30 Jul 2024 11:35:27 +0100
Gary Guo <gary@garyguo.net> wrote:

> > +/*
> > + * Declare an exported function that Rust code can call to trigger this
> > + * tracepoint. This function does not include the static branch; that is done
> > + * in Rust to avoid a function call when the tracepoint is disabled.
> > + */
> > +#define DEFINE_RUST_DO_TRACE(name, proto, args)
> > +#define DEFINE_RUST_DO_TRACE_REAL(name, proto, args)			\
> > +	notrace void rust_do_trace_##name(proto)			\
> > +	{								\
> > +		__DO_TRACE(name,					\
> > +			TP_ARGS(args),					\
> > +			cpu_online(raw_smp_processor_id()), 0);		\  
> 
> I guess this doesn't support conditions. Currently the conditions are
> specified during declaration and not during definition.
> 
> Would it make sense to have
> 
> 	static inline void do_trace_##name(proto)
> 	{
> 		__DO_TRACE(name, TP_ARGS(args), TP_CONDITION(cond), 0);

But where is the "cond" passed in from?

I guess in the future if you want to add conditions, you would then just
add:

#define DEFINE_RUST_DO_TRACE_REAL_CONDITION(name, proto, args, cond)			\
	notrace void rust_do_trace_##name(proto)			\
	{								\
		__DO_TRACE(name,					\
			TP_ARGS(args),					\
			cpu_online(raw_smp_processor_id()) &&		\
			TP_CONDITION(cond), 0);				\  

-- Steve

> 	}
> 
> in `__DECLARE_TRACE` and then simply call it in `rust_do_trace_##name`?
> 
> > +	}
> > +
> >  /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
