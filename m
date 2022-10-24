Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E405C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWHxPIklurkTWS4ZWQ+gAUSHXk+e4JueZbQZnxH0Rqg=; b=PO3ogtvziJAJa0
	QjwV5fMxch4AT7VTfRZuMbA+gOJSLADxLgbwpcklKa1P6pblhvPQqTyualLOROZS9af8yYPxRYm6Y
	rex9+nuRltoE+SQg7pTF5CV9e6HL0q9hM2FnfG1KrYGEh2MI3XRyRUUULaPAu9SZxYuk8zSMOmXtm
	yJDxJw79FsT8yYBVi+T4hy2fiereb0ZDX1hMJ8BLIuU3+Ly5TvfwvUWYp+XqbUPwIxMpYBYq1LoM9
	82NXMjxQ0JzG7MTyLO9Dss8vzXgYeX5Dm8wf38NPUBIId+uBRNlwq7E3IzZXihOvoz+PO3xDq34Ym
	GgvWALEn17jsvUe7L9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omw40-001F6Z-Uw; Mon, 24 Oct 2022 11:56:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omw3y-001F5K-CO
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 11:56:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EA95D6E;
	Mon, 24 Oct 2022 04:56:16 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.7.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A90F3F7B4;
	Mon, 24 Oct 2022 04:56:06 -0700 (PDT)
Date: Mon, 24 Oct 2022 12:56:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>, peterz@infradead.org
Cc: Lai Jiangshan <laijs@linux.alibaba.com>, arnd@arndb.de,
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
Message-ID: <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
 <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
 <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_045614_523767_6BDE1097 
X-CRM114-Status: GOOD (  26.83  )
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

On Thu, Oct 20, 2022 at 08:29:28PM +0800, Guo Ren wrote:
> Hi Mark and Lai,
> 
> On Thu, Oct 20, 2022 at 5:15 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Sat, Oct 08, 2022 at 09:54:39AM +0800, Guo Ren wrote:
> > > On Mon, Oct 3, 2022 at 7:39 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > On Sat, Oct 01, 2022 at 09:24:44PM -0400, guoren@kernel.org wrote:
> > > > > From: Lai Jiangshan <laijs@linux.alibaba.com>
> > > > >
> > > > > And it will be extended for C entry code.
> > > > >
> > > > > Cc: Borislav Petkov <bp@alien8.de>
> > > > > Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > > > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> > > > > ---
> > > > >  include/linux/compiler_types.h | 8 +++++---
> > > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > > > > index 4f2a819fd60a..e9ce11ea4d8b 100644
> > > > > --- a/include/linux/compiler_types.h
> > > > > +++ b/include/linux/compiler_types.h
> > > > > @@ -227,9 +227,11 @@ struct ftrace_likely_data {
> > > > >  #endif
> > > > >
> > > > >  /* Section for code which can't be instrumented at all */
> > > > > -#define noinstr                                                              \
> > > > > -     noinline notrace __attribute((__section__(".noinstr.text")))    \
> > > > > -     __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
> > > > > +#define __noinstr_section(section)                           \
> > > > > +     noinline notrace __section(section) __no_profile        \
> > > > > +     __no_kcsan __no_sanitize_address __no_sanitize_coverage
> > > > > +
> > > > > +#define noinstr __noinstr_section(".noinstr.text")
> > > >
> > > > One thing proably worth noting here is that while KPROBES will avoid
> > > > instrumenting `.noinstr.text`, that won't happen automatically for other
> > > > __noinstr_section() sections, and that will need to be inhibited through other
> > > > means (e.g. the kprobes blacklist, explicit NOKPROBE_SYMBOL() annotation, or
> > > > otherwise).
> > >
> > > In riscv, "we select HAVE_KPROBES if !XIP_KERNEL", so don't worry
> > > about that. I don't think we could enable kprobe for XIP_KERNEL in the
> > > future.
> >
> > Sure; but someone else might use __noinstr_section() elsewhere where this could
> > matter, and I was suggesting that we could add a comment as above.
> Okay, how about:
> 
> /* Be care KPROBES will avoid instrumenting .noinstr.text, not
> __noinstr_section(). */
> #define __noinstr_section(section)                             \
>        noinline notrace __section(section) __no_profile        \
>        __no_kcsan __no_sanitize_address __no_sanitize_coverage

How about we split this like:

| /*
|  * Prevent the compiler from instrumenting this code in any way
|  * This does not prevent instrumentation via KPROBES, which must be
|  * prevented through other means if necessary.
|  */
| #define __no_compiler_instrument				\
| 	noinline notrace noinline notrace __no_kcsan		\
| 	__no_sanitize_address __no_sanitize_coverage
| 
| /* 
|  * Section for code which can't be instrumented at all.
|  * Any code in this section cannot be instrumented with KPROBES.
|  */
| #define noinstr __no_compiler_instrument section(".noinstr.text")

... then we don't need __noinstr_section(), and IMO the split is
clearer.

Peter?

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
