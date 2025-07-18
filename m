Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02E9C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 22:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMflan8qtuBijxA6BGk3JBLUzhIVoTZZTprne1RYUfs=; b=h+HWA+BXEYrJ7u
	x02j7z4Y5J1giO47FdCHKRnbrQVU261/BSGKnjEZhXWBUJtsq8fHIDQo5vrA8WYIFTJGLASr1MfSv
	9DfReC2HuvbVNn+nC46Rt2+lyAO9B7UEpmTjbWMuOWsM+lvwzZh78wJUT0wHJE8PajvPZ4WIx2Kr0
	b+gFYTmSBY1x7+5KM059YsMtXlbl9htXW/q561ioOscmcux7RducdG6CJl5hY0cDBNEUY43nTqblb
	dgqmWHDMoe3aZA7s0XyQcAy4yJFn0DRSfQc/l6AZR8Z0B5NmMkBZghO2OeO2l3bI74f0z//+tYLpD
	6FputGISLa5JVZBum5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctvS-0000000DZNs-3ykp;
	Fri, 18 Jul 2025 22:51:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctvO-0000000DZMA-2fmA;
	Fri, 18 Jul 2025 22:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C057A57714;
	Fri, 18 Jul 2025 22:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58ABC4CEEB;
	Fri, 18 Jul 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752879088;
	bh=9wq1gPYvCplHPaY4Wm5XgoLMe+aODde2O7VcmHcmk98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmiVcikElcqZk72BFs7/zWioNVg/RlBsEZTqUIs6HsScTtVwOS6j7B3ua7R/5a+8f
	 B/Xx/QRZM/EQh/lO2RicrfWNUj4TspYI7v5C1esxaGnMy5qNgSFrlaLuHCW1KuRQE/
	 vwjy0/1yadEDESYc6Jup2r2d1g6hRKk98N3uI9FiR3pIjtw/6N8d9/1A9DF/kI7Ptp
	 /KtF2y8xo3+DKYzmZGh9ileKlyQIK4tsMmB+vc1VQguKTRnI0Md6sJRL9kCLGWssqH
	 x60/sDs7wvwXbxMyYV4GlknlF8akcqkSZPz9pRU1nNtV+O7XtlJK1/hNvPy3K6SwqK
	 vqLjSPHvQBQpQ==
Date: Fri, 18 Jul 2025 15:51:28 -0700
From: Kees Cook <kees@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
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
	Ard Biesheuvel <ardb@kernel.org>,
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
Message-ID: <202507181541.B8CFAC7E@keescook>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-4-kees@kernel.org>
 <aHoHkDvvp4AHIzU1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHoHkDvvp4AHIzU1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_155130_809620_3A1DE5A7 
X-CRM114-Status: GOOD (  24.19  )
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

On Fri, Jul 18, 2025 at 11:36:32AM +0300, Mike Rapoport wrote:
> Hi Kees,
> 
> On Thu, Jul 17, 2025 at 04:25:09PM -0700, Kees Cook wrote:
> > When KCOV is enabled all functions get instrumented, unless the
> > __no_sanitize_coverage attribute is used. To prepare for
> > __no_sanitize_coverage being applied to __init functions, we have to
> > handle differences in how GCC's inline optimizations get resolved. For
> > x86 this means forcing several functions to be inline with
> > __always_inline.
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> ...
> 
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index bb19a2534224..b96746376e17 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -463,7 +463,7 @@ static inline void *memblock_alloc_raw(phys_addr_t size,
> >  					  NUMA_NO_NODE);
> >  }
> >  
> > -static inline void *memblock_alloc_from(phys_addr_t size,
> > +static __always_inline void *memblock_alloc_from(phys_addr_t size,
> >  						phys_addr_t align,
> >  						phys_addr_t min_addr)
> 
> I'm curious why from all memblock_alloc* wrappers this is the only one that
> needs to be __always_inline?

Thread-merge[1], adding Will Deacon, who was kind of asking the same
question.

Based on what I can tell, GCC has kind of fragile inlining logic, in the
sense that it can change whether or not it inlines something based on
optimizations. It looks like the kcov instrumentation being added (or in
this case, removed) from a function changes the optimization results,
and some functions marked "inline" are _not_ inlined. In that case, we end up
with __init code calling a function not marked __init, and we get the
build warnings I'm trying to eliminate.

So, to Will's comment, yes, the problem is somewhat fragile (though
using either __always_inline or __init will deterministically solve it).
We've tripped over this before with GCC and the solution has usually
been to just use __always_inline and move on.

For memblock_alloc*, it appears to be that the heuristic GCC uses
resulted in only memblock_alloc_from() being a problem in this case. I
can certainly mark them all as __always_inline if that is preferred.

Some maintainers have wanted things marked __init, some have wanted
__always_inline. I opted for __always_inline since that was basically
the intent of marking a function "inline" in the first place. I am happy
to do whatever. :)

-Kees

[1] https://lore.kernel.org/lkml/aHouXI5-tyQw78Ht@willie-the-truck/

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
