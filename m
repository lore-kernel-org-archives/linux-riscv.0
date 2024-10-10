Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C0D24452
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg6SxQSpOMVFYHms0d4h4q1qvRqkndtISWnGuHrjIck=; b=Xn5+AtyRw9ptdc
	U2SfOMpIdN8Sw22vc8m/OauY8CmixIypp1UrXUH73mlq46Sz4IBOcLDNqp4ieaTxvkXKAh27Ha8Rw
	zQlyd0Ul55zUb7jA6nN9hlN/dPugnQwQKp4CWq3y3+u5hWHIzbr775hYRGUICd3nJgZtp/HrBd+JY
	SJHLVdA6fj5oE9eudbyX3akA+6SyUOn6T7CgXyzjuZoX9CSVYApGoP6G/m31Ohr9wCkdt4Dsbf2/V
	qTw9rMQIDF+Y1KUcP5lim6glUVaAdsiM488FQNeeUBZrJ9ZT4xCwJ6LXOToVCEZNDtph2yxjNSz5a
	6vsyp5xEy5g/XFGocmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxb-0000000EILl-3wRw;
	Thu, 10 Oct 2024 20:40:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz4I-0000000E9kS-3N7o;
	Thu, 10 Oct 2024 19:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e3g0H0pWDxY1RdjyOjVymNiFnLweAMLRfn8+Dky36xo=; b=PzJwfThm8l7APK0X5IoREibIV/
	M4ZvUTiO8x07dKMbmhUZ9Y4FJywIIm3f9yNXCgs6n2CHkPYsPDKORCSc1Egs6MxwO5sp8iPajU2LB
	Kg79RUhWjxFtFz4hN6EriViNuJNbBdmMXD80sQyx3LgKk304BmVp8+gIr/G4W0V4vzpIH4eEHyrw/
	n4TzL5jL0wzAgitsC7pp72YaYQPG1hPrloDGadEsX/om8rwWBGGD0+5EsLtYCYsBBWe4wmNrJUBpY
	XDnpRZpJaqyzQy/AvkxW7Pehp+XvIHTK6Uw5HUmhiLLTgQYes63+mrqvE8uvuKFx0OQV3vNAcpV1W
	FsPeLFig==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz4E-00000005a2Y-2P9a;
	Thu, 10 Oct 2024 19:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17041A4119A;
	Thu, 10 Oct 2024 19:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75495C4CECF;
	Thu, 10 Oct 2024 19:43:12 +0000 (UTC)
Date: Thu, 10 Oct 2024 15:43:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Baron <jbaron@akamai.com>, Ard
 Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
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
 loongarch@lists.linux.dev
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
Message-ID: <20241010154320.6d17ba69@gandalf.local.home>
In-Reply-To: <20241001211543.qdjl4pyfhehxqfk7@treble>
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
	<20241001-tracepoint-v9-1-1ad3b7d78acb@google.com>
	<20241001211543.qdjl4pyfhehxqfk7@treble>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_204323_639878_A0EC37BB 
X-CRM114-Status: GOOD (  17.85  )
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

On Tue, 1 Oct 2024 14:15:43 -0700
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Tue, Oct 01, 2024 at 01:29:58PM +0000, Alice Ryhl wrote:
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.  
> 
> Instead of extending the old deprecated static key interface into Rust,
> can we just change tracepoints to use the new one?
> 
> /me makes a note to go convert the other users...
> 
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Subject: [PATCH] tracepoints: Use new static branch API
> 
> The old static key API based on 'struct static_key' is deprecated.
> Convert tracepoints to use the new API.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Alice,

Can you send a v10 with the added acks and whitespace fixes as well as
using static_branch_unlikely(), and I'll pull it into my tree.

Base it off of v6.12-rc2.

Thanks,

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
