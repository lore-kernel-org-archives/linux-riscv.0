Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEFC25B4F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKIPdXJ7S0sYYHJZpJmlxZTi8XqpgbeVBg6z2pnXv4E=; b=Kvj+FdYM9yXxpt
	YIOVxccmrCpqC1nQlVLtSl+Oeafn5lnXDrsDORL9JaM48iWsw+iZJrNv2zLN9LY2xclSJ8zUTzFXL
	2SNerZOfxhcPxTiDHxaNpSRj6BGQezxZSMItd859sVcWumZO1ncKEAk5NP8YRL8RRYXH3HX/Hj9ma
	TwxRrA59rDoDTfKHdeMzkwqSd3+ECfWxEj5Zmhpix+r4gMInyZ/pfNR/msWgsRm/D5EosOjs8iuIZ
	VjAbBEZeujBb1fedTlj9U0j72/G27WERtmj2rUv3eYklYh2VcxwZqzV2IcsMALNhvIuQXgHutfFJ2
	+4iEX4FapzXu3CmvMYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42z8-00000008Nop-2ir1;
	Mon, 06 May 2024 18:22:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42z3-00000008Nle-43k5;
	Mon, 06 May 2024 18:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 239F46140D;
	Mon,  6 May 2024 18:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B99BC116B1;
	Mon,  6 May 2024 18:22:35 +0000 (UTC)
Date: Mon, 6 May 2024 14:22:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile
 <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, Liviu
 Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 13/17] x86/ftrace: enable dynamic ftrace without
 CONFIG_MODULES
Message-ID: <20240506142240.36c38d7f@gandalf.local.home>
In-Reply-To: <20240505142600.2322517-14-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
	<20240505142600.2322517-14-rppt@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_112242_139592_DA1CA77D 
X-CRM114-Status: GOOD (  12.83  )
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

On Sun,  5 May 2024 17:25:56 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Dynamic ftrace must allocate memory for code and this was impossible
> without CONFIG_MODULES.
> 
> With execmem separated from the modules code, execmem_text_alloc() is
> available regardless of CONFIG_MODULES.
> 
> Remove dependency of dynamic ftrace on CONFIG_MODULES and make
> CONFIG_DYNAMIC_FTRACE select CONFIG_EXECMEM in Kconfig.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/x86/Kconfig         |  1 +
>  arch/x86/kernel/ftrace.c | 10 ----------
>  2 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
