Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50340C83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HoSOKHwGD2mvI2txrBvGJ83SavSeof2DgWhtw/i4bk=; b=JefqAqkSGyRAXg
	/FkSyWL0eK7M40WY+FATG3j13qNN2enfoMj+6qvhBWE/BH6drWHAMsP2V+tnxcFXIT0j6es9/msxX
	oe3YMNZRyOq9UOhBiGpemAmT4Pr7r8ijz31ldsYkk+e7JcBIvNkFbvlCS0g0v2V7+D8zKVspMin8+
	RSJxApv9qTnHVPVt4FAs83VxAO58fRk3bhGNEDVqwlxxfQvlXIWF7Dz3lKWGqJV7bxjjmPYrzj22D
	xj5iDChNgCZW9PE5yUxbfAxykTInNvxyhHgAongoV8sAqNoCANjtnmjKQKMa8/RISIYnisoA9VYRI
	JKniBFspyIpL7esGMDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx4s-00000000cju-01ba;
	Mon, 21 Jul 2025 20:25:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwuE-00000000alW-05P3;
	Mon, 21 Jul 2025 20:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3432A55D87;
	Mon, 21 Jul 2025 20:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75591C4CEED;
	Mon, 21 Jul 2025 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753128876;
	bh=4r/4nG1qgmsh/c5VG19N2iiUSmLvYYkyHl3DeygcpXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFAdcpLWaHxUml6OxVBwU6HF1hrXLHYFkb/H/aJEA6dwrS3fNYgpHHD9vBXhtoV4B
	 DnlKcNVrSuy3OpcCNz5sLZixJ87BNNsHf8Wz/iXbKKuKn/4kGIyWtHqBOtZbDd1IXJ
	 HugdwrRmbPiDKguHMjzYQAyiU+QjuAhDHP4sI+9soOwfvMemYiSYDeWbZvGVJV9Fex
	 I+fr6vfi5W5pHpIw/Uwwc0t82cvI6vzhJdTGqyaczDCk68iZYr7Dm3hhNM2Cwu5lkJ
	 0NpKGkTxKOKNy3D+Lz3rZTszczYJyLaRnmSD0gVfod3q27zUYqquJUIShZDNnZldk2
	 WRNb0JXBCq60A==
Date: Mon, 21 Jul 2025 13:14:36 -0700
From: Kees Cook <kees@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Wilczynski <michal.wilczynski@intel.com>,
	Juergen Gross <jgross@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Thomas Huth <thuth@redhat.com>, Brian Gerst <brgerst@gmail.com>,
	kvm@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 04/13] x86: Handle KCOV __init vs inline mismatches
Message-ID: <202507211311.8DAC4C7@keescook>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-4-kees@kernel.org>
 <aHoHkDvvp4AHIzU1@kernel.org>
 <202507181541.B8CFAC7E@keescook>
 <CAMj1kXGAwjChyFvjQcTbL8dFXkFWnn9n47bkN7FP=+EsLNsJdg@mail.gmail.com>
 <aH42--h-ARsvX5Wk@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH42--h-ARsvX5Wk@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131438_190280_9EACD885 
X-CRM114-Status: GOOD (  36.97  )
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

On Mon, Jul 21, 2025 at 01:47:55PM +0100, Will Deacon wrote:
> On Sun, Jul 20, 2025 at 04:10:01PM +1000, Ard Biesheuvel wrote:
> > On Sat, 19 Jul 2025 at 08:51, Kees Cook <kees@kernel.org> wrote:
> > > On Fri, Jul 18, 2025 at 11:36:32AM +0300, Mike Rapoport wrote:
> > > > On Thu, Jul 17, 2025 at 04:25:09PM -0700, Kees Cook wrote:
> > > > > When KCOV is enabled all functions get instrumented, unless the
> > > > > __no_sanitize_coverage attribute is used. To prepare for
> > > > > __no_sanitize_coverage being applied to __init functions, we have to
> > > > > handle differences in how GCC's inline optimizations get resolved. For
> > > > > x86 this means forcing several functions to be inline with
> > > > > __always_inline.
> > > > >
> > > > > Signed-off-by: Kees Cook <kees@kernel.org>
> > > >
> > > > ...
> > > >
> > > > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > > > index bb19a2534224..b96746376e17 100644
> > > > > --- a/include/linux/memblock.h
> > > > > +++ b/include/linux/memblock.h
> > > > > @@ -463,7 +463,7 @@ static inline void *memblock_alloc_raw(phys_addr_t size,
> > > > >                                       NUMA_NO_NODE);
> > > > >  }
> > > > >
> > > > > -static inline void *memblock_alloc_from(phys_addr_t size,
> > > > > +static __always_inline void *memblock_alloc_from(phys_addr_t size,
> > > > >                                             phys_addr_t align,
> > > > >                                             phys_addr_t min_addr)
> > > >
> > > > I'm curious why from all memblock_alloc* wrappers this is the only one that
> > > > needs to be __always_inline?
> > >
> > > Thread-merge[1], adding Will Deacon, who was kind of asking the same
> > > question.
> > >
> > > Based on what I can tell, GCC has kind of fragile inlining logic, in the
> > > sense that it can change whether or not it inlines something based on
> > > optimizations. It looks like the kcov instrumentation being added (or in
> > > this case, removed) from a function changes the optimization results,
> > > and some functions marked "inline" are _not_ inlined. In that case, we end up
> > > with __init code calling a function not marked __init, and we get the
> > > build warnings I'm trying to eliminate.
> 
> Got it, thanks for the explanation!
> 
> > > So, to Will's comment, yes, the problem is somewhat fragile (though
> > > using either __always_inline or __init will deterministically solve it).
> > > We've tripped over this before with GCC and the solution has usually
> > > been to just use __always_inline and move on.
> > >
> > 
> > Given that 'inline' is already a macro in the kernel, could we just
> > add __attribute__((__always_inline__)) to it when KCOV is enabled?
> 
> That sounds like a more robust approach and, by the sounds of it, we
> could predicate it on GCC too. That would also provide a neat place for
> a comment describing the problem.
> 
> Kees, would that work for you?

That seems like an extremely large hammer for this problem, IMO. It
feels like it could cause new strange corner cases. I'd much prefer the
small fixes I've currently got since it keeps it focused. KCOV is
already enabled for "allmodconfig", so any new instances would be found
very quickly, etc. (And GCC's fragility in this regard has already been
exposed to these cases -- it's just that I changed one of the
combinations of __init vs inline vs instrumentation.

I could give it a try, if you really prefer the big hammer approach...

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
