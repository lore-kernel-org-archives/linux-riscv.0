Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA3C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hD6Pw74QfzA8GpN6C8cWiF6NtzW1gNWhYWAeqxCkdA=; b=NiYdzuwwhHlu7+
	D/VPp8f9quzmqSYg2Wwh7/8xbPwUr6yUNQz2zyIEuOr8hyqj/XH1ZC7In6U/Jj/xvM/bhTftGETp4
	oaCmFtRTXjCNho4t/m0VHmPG8qpw79IIQUgXKXXjGBWV6vbdTQ+AIJysl3BL7k42/P4pnToOuBcoj
	ldStMe6vkAhcbvOqj/9xwSkSQkcldhvobhIVbPLKMqw5Net2SrKqoVnOnls+9M5/LFu6RbB0dSznm
	hL+HCJPt5V6jFYON1OO3ZgCoZ+a5xA7SYhXOPxMuFxhXuajkShUlsRNer7uiSiXzS6BnV67v0EpC+
	JkXDTlUim7aETeE2a0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGX9-004eEA-I1; Tue, 25 Oct 2022 09:47:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGX6-004eDP-Nb
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 09:47:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F000D6E;
	Tue, 25 Oct 2022 02:47:41 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.7.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65D3C3F792;
	Tue, 25 Oct 2022 02:47:31 -0700 (PDT)
Date: Tue, 25 Oct 2022 10:47:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Lai Jiangshan <laijs@linux.alibaba.com>, arnd@arndb.de,
	palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, zouyipeng@huawei.com,
	bigeasy@linutronix.de, David.Laight@aculab.com,
	chenzhongjin@huawei.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for
 noinstr
Message-ID: <Y1ewrRpHBwg2wJnb@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
 <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
 <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
 <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N>
 <Y1Z/rLaaUp7e9xoy@hirez.programming.kicks-ass.net>
 <Y1aBshGIWMEm+yTv@FVFF77S0Q05N>
 <CAJF2gTQvmSuOP_QQ8RGfq2soLrv9XD3g=8v9pE+U0y+pzqMY4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQvmSuOP_QQ8RGfq2soLrv9XD3g=8v9pE+U0y+pzqMY4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_024740_881810_E6ED29C6 
X-CRM114-Status: GOOD (  23.69  )
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

On Tue, Oct 25, 2022 at 10:51:02AM +0800, Guo Ren wrote:
> On Mon, Oct 24, 2022 at 8:14 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Mon, Oct 24, 2022 at 02:06:04PM +0200, Peter Zijlstra wrote:
> > > On Mon, Oct 24, 2022 at 12:56:03PM +0100, Mark Rutland wrote:
> > >
> > > > How about we split this like:
> > > >
> > > > | /*
> > > > |  * Prevent the compiler from instrumenting this code in any way
> > > > |  * This does not prevent instrumentation via KPROBES, which must be
> > > > |  * prevented through other means if necessary.
> > >
> > > Perhaps point to NOINSTR_TEXT in vmlinux.lds.h
> >
> > Makes sense, will do.
> Do I need to update the comment with NOINSTR_TEXT? eg:
> 
>  * Prevent the compiler from instrumenting this code in any way
>  * This does not prevent instrumentation via KPROBES, which must be
>  * prevented through other means if necessary. See NOINSTR_TEXT
>  * in vmlinux.lds.h.

I think given Peter's reply we can leave the patch as-is for now, and we can
leave commentary or other changes to a later follow up. I'm happy to propose
patches for that once the existing bits are merged.

Sorry for confusing matters!

> > > > |  */
> > > > | #define __no_compiler_instrument                          \
> > > > |   noinline notrace noinline notrace __no_kcsan            \
> > > > |   __no_sanitize_address __no_sanitize_coverage
> > > > |
> > > > | /*
> > > > |  * Section for code which can't be instrumented at all.
> > > > |  * Any code in this section cannot be instrumented with KPROBES.
> > > > |  */
> > > > | #define noinstr __no_compiler_instrument section(".noinstr.text")
> > > >
> > > > ... then we don't need __noinstr_section(), and IMO the split is
> > > > clearer.
> > >
> > > Yeah, perhaps, no strong feelings. Note I have this in the sched-idle
> > > series as well (which I still need to rebase and repost :/).
> >
> > Ah; I'll sit on this for now then, and once that's all in I can send a
> > cleanup/rework patch. Sorry for the noise!
> We still keep __noinstr_section(), right?

Yes -- for now this patch can stay as-is, and __noinstr_section() will remain.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
