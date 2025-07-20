Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749C5C83F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jul 2025 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7cPjYvRd9Chg1BolJ3VCODNIciMavHDtcrTcrnp37A=; b=e0DTq3QO+AthQM
	qqMXVpq2uh3Zsfd7GUgYGJrXZMH4A1uO0LCwCFbX6DY/5pER0L92Wl0lUHjCjWz2PSx4dS4NoSNcd
	TFeWGF6wSgRr8Ok4EK+F3tboPITI2Nmc4HlBRvOJ7v4MQeUkeGgadUBKkgysRixDEY/3F+8HyOi3I
	GZHACkUOfPvrqaffTjHlmRMKKu5yxSdiZILN8fu/YfjzXUOkyJPJ+2Y1BM7skr+5Ts6BNzZQAcKei
	+Na0IGiIUtUUSbTQeB897/As4xYDAecu92ccVgUMDj162jIJYB8/caf9qbZXbMuD41Lipli4k4lyX
	Nl/TpfVuguZ0VuuLg5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udNFh-0000000EwTR-11F6;
	Sun, 20 Jul 2025 06:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udNFe-0000000EwSm-2nl0;
	Sun, 20 Jul 2025 06:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A3F0601F4;
	Sun, 20 Jul 2025 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0002C116C6;
	Sun, 20 Jul 2025 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752991819;
	bh=ombXy5J9mN5+Ko6iFhW8NndKJFf3Fpi4o6CQRaezi3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HcocEkaAHqoiHoBCIs5ZO1zgy5A6mlv32UCcJW8LJrNOH9xTJsjCjR+0l+k+rDugt
	 FfJRK0wuMhP1+l40qQ4Zsqb2kNgofBEYfXVrDcz5S49YWRrNZuwLyidR4kwpzmO+j+
	 2Ti22ok5s651Cl0DKENNJulslvkPPeDYInLV6/E1rLq+3JS2kHByx10FDPlWtaaYoO
	 zbBEeae5MrdFJ4uyBR+eocuvKJFVtcaQkoastPWeZ1nTyt+lAAqN/K7z9f9MgU77QF
	 ns3N6LeIPgbEVfylgBuIAeVsTpY9WQPioWqB+bD85jLB/SdJceatFgmEgi7I3n/vBJ
	 jDFV6fT3ykiRg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b16a0e38so3003166e87.1;
        Sat, 19 Jul 2025 23:10:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgjKS2xsKi3PbjHlGQeNkUWTvp/S97u+l0+FxmDRV69QOKXVGCyifQwK18hCWnOJ2AgP6LVovadYX3Pdg=@lists.infradead.org, AJvYcCW4jogZnuunNHp3j7klxicQEP3J7o91/+ukmIA9WkCccTV8KBcl+7AwnSBBZKPaknXDwjfS2siGizCSs8qWwQZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxNh6ScA1j1bLBH+w0HBUg4QgnNuEaIxqbb2Sm3D0A+DjJ2xyzR
	/0EoE/4p3I2QeTEp6ht0nchUOKRwb40DYefnzpprBmrSMppzrBkJGdD3QpRgFU2U+75uFeVczr5
	a4I9vCGIDx5xbmcqdPwgL+IbykKYc8So=
X-Google-Smtp-Source: AGHT+IGzW7z8MZyh/6NVryj0xIRWvZtmGLwUiyHXGC4Qk/FYdRSLZqwcI4BFS0lrRzeksvOsF0eTUUFywEq3kCkPty0=
X-Received: by 2002:a05:6512:2301:b0:553:5176:48a with SMTP id
 2adb3069b0e04-55a31843110mr2007807e87.21.1752991817889; Sat, 19 Jul 2025
 23:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250717231756.make.423-kees@kernel.org> <20250717232519.2984886-4-kees@kernel.org>
 <aHoHkDvvp4AHIzU1@kernel.org> <202507181541.B8CFAC7E@keescook>
In-Reply-To: <202507181541.B8CFAC7E@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 20 Jul 2025 16:10:01 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGAwjChyFvjQcTbL8dFXkFWnn9n47bkN7FP=+EsLNsJdg@mail.gmail.com>
X-Gm-Features: Ac12FXxx6bD_QGQsGFgOANxpcIEdVmgITnXc8yZmdE0EdDE9cBbQCb787bRnEwA
Message-ID: <CAMj1kXGAwjChyFvjQcTbL8dFXkFWnn9n47bkN7FP=+EsLNsJdg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] x86: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Michal Wilczynski <michal.wilczynski@intel.com>, 
	Juergen Gross <jgross@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Thomas Huth <thuth@redhat.com>, Brian Gerst <brgerst@gmail.com>, 
	kvm@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-mm@kvack.org, Ingo Molnar <mingo@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	sparclinux@vger.kernel.org, llvm@lists.linux.dev
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

On Sat, 19 Jul 2025 at 08:51, Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Jul 18, 2025 at 11:36:32AM +0300, Mike Rapoport wrote:
> > Hi Kees,
> >
> > On Thu, Jul 17, 2025 at 04:25:09PM -0700, Kees Cook wrote:
> > > When KCOV is enabled all functions get instrumented, unless the
> > > __no_sanitize_coverage attribute is used. To prepare for
> > > __no_sanitize_coverage being applied to __init functions, we have to
> > > handle differences in how GCC's inline optimizations get resolved. For
> > > x86 this means forcing several functions to be inline with
> > > __always_inline.
> > >
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> >
> > ...
> >
> > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > index bb19a2534224..b96746376e17 100644
> > > --- a/include/linux/memblock.h
> > > +++ b/include/linux/memblock.h
> > > @@ -463,7 +463,7 @@ static inline void *memblock_alloc_raw(phys_addr_t size,
> > >                                       NUMA_NO_NODE);
> > >  }
> > >
> > > -static inline void *memblock_alloc_from(phys_addr_t size,
> > > +static __always_inline void *memblock_alloc_from(phys_addr_t size,
> > >                                             phys_addr_t align,
> > >                                             phys_addr_t min_addr)
> >
> > I'm curious why from all memblock_alloc* wrappers this is the only one that
> > needs to be __always_inline?
>
> Thread-merge[1], adding Will Deacon, who was kind of asking the same
> question.
>
> Based on what I can tell, GCC has kind of fragile inlining logic, in the
> sense that it can change whether or not it inlines something based on
> optimizations. It looks like the kcov instrumentation being added (or in
> this case, removed) from a function changes the optimization results,
> and some functions marked "inline" are _not_ inlined. In that case, we end up
> with __init code calling a function not marked __init, and we get the
> build warnings I'm trying to eliminate.
>
> So, to Will's comment, yes, the problem is somewhat fragile (though
> using either __always_inline or __init will deterministically solve it).
> We've tripped over this before with GCC and the solution has usually
> been to just use __always_inline and move on.
>

Given that 'inline' is already a macro in the kernel, could we just
add __attribute__((__always_inline__)) to it when KCOV is enabled?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
