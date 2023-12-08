Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE57C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYld7wZQxQLbv+Tpt9wOlKGLhC1WSI0JNcZCO3zMJ6s=; b=J5dkYL2VtQr9k4
	RmbbA2curBr5bHhHhLAzW8/hMBhESFOT+x8FEZYQMTwyUzQeSKu2aUmenvecRzBf+CVEl59OUwIph
	fsPs7tfMQiWgCGHJW6nD0quKZ5VpAM4EMiKkt+ckNIaLb55pfvnpMq59ETFR6/48ZKwDv+aaig86Y
	PBS8Q6YpGXrqlIJaXBjMNP5DDGxp9ohY41SbR8CpEB05yPrPa37YZMIMt61SI65cBXBjjZwdNpeYZ
	KTHgObATwtivdYs6tcJaNUGBEKBbLRPwUUlbS2dNksHmmWg7BYS/n9JpNGQid5JAd/o20GhDVirte
	5TsIr6rs2tvssePSAVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhRi-00GUSY-0H;
	Fri, 08 Dec 2023 20:27:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhRh-00GUS2-0i
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 20:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JEaruMuB4Tlqt0BFZFCjzDOPeC0+ZhBXuiC6tNuESkE=; b=oz3bCKHbBr+1i7AwlkU2bW8Cqa
	fholQKO6Zp3YpCPRXSWI5rxDyivDmwxbDxZBBDM2Ssv89zNbOFqaWoxUsLTzzOAnNUgyvJ4g4USwF
	eG+movaebo/2MUs/btQCZ2t/mvdVUv6L7vmw4/fSiDopqEA+7Frtmtsnjlaa2orWePsxhlpt73OLE
	elw/iRqBA0vjTIbd3gZIWPVL2BQTI8M3iA1KA7pJQIA2V17zdx3Y/BEG41NFkgHe6O622279bc1h6
	8DrPXnGmpn+YHXoYZtSJoiHBNcAr+At1J1GbouwOpW7CY3gCF3VAvkm+ERrBWLaTXxrto7kX4kVqM
	XnUF7hpQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rBhRb-006Vhh-O8; Fri, 08 Dec 2023 20:27:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5B7EB3003F0; Fri,  8 Dec 2023 21:27:31 +0100 (CET)
Date: Fri, 8 Dec 2023 21:27:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>,
	Song Liu <songliubraving@meta.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Joao Moreira <joao@overdrivepizza.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231208202731.GF36716@noisy.programming.kicks-ass.net>
References: <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net>
 <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net>
 <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
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

On Fri, Dec 08, 2023 at 11:40:27AM -0800, Alexei Starovoitov wrote:

> What is "sealing" by objtool?

Ah, LTO like pass that tries to determine if a function ever gets it's
address taken.

The basic problem is that the compiler (barring its own LTO pass) must
emit CFI for every non-local symbol in a translation unit. This means
that a ton of functions will have CFI on, even if they're never
indirectly called.

So objtool collects all functions that have CFI but do not get their
address taken, and sticks their address in a .discard section, then at
boot time we iterate this section and scribble the CFI state for all
these functions, making them invalid to be called indirectly.

For one this avoids malicious code from finding a function address in
the symbol table and indirectly calling it anyway as a means to
circumvent the EXPORT symbols.

So objtool does not think bpf_cgroup_release() gets its address taken,
specifically it does not find it's address in a section it knows about.
And hence it goes on the list and we scribble it and the indirect call
goes *boom*.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
