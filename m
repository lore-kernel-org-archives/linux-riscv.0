Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0032EC83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuuTJENQGq/Zz+2Fmj2uqyE+Z7pIgJqUmUnrGJSBurU=; b=N7DGLKhpZ6Flu9
	ZMaEQhY4xJ/MT0COuAqxDWmApbJeMiBAJgrLNPX5Bz9ZEDGntj1BZGmJ8Y2MVhtqSvqRdQfgJvEpA
	UbXol/p4fTwSLv6tKgNbIe5NDe67Ei+IAxXk9fTOlKMkpoAMLYivzcZ3RxvL77JiZmE6AsoHcBqvV
	S37pjdjG5edDpRirCkKNqAzFE7ews1thL6L4q16ii7KPZ/kHlBSuWHHmIVbrQRigp0SdvvEM1UEFm
	N7PV8uhqMKGe//xV30uRJQxAeXNyOGGJMNDMIeWC0e1xOqmpz7IrwxDiFXC+7yWEOvR1SotsLvCBa
	s6gDyKs2rTKb3pKme5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ST-00000001qQV-1he7;
	Tue, 22 Jul 2025 08:34:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8L4-00000001pVA-2fZW;
	Tue, 22 Jul 2025 08:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 017F7600AC;
	Tue, 22 Jul 2025 08:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A537C4CEF5;
	Tue, 22 Jul 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753172825;
	bh=yGkRA/6qnjLPhMkWmaVYag52FJSXvc8HTUW6Y3Xuzs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftIKtFsS+75DjkESBKR4C/0fTfhjTO5EAQaosz6bDp0SBtC0xu6jrbFmvS+RKsdrx
	 f4dMY3bCIrRdjzyHRTqQ2IS3DbC0aaJA20FDQXMOHNRYWFh4FtQSBKE6qcpYZfqwwn
	 EBlY5p7lMzTdcc4tj5YJJGVzamw8NuZS2DY35/I8OtpLoIXd1OL5/ZeHJymCJvh1YO
	 fQNqEpJ2tIsXeilrIIv/4unMX0gRI4A5tYLUiPoiE/g7dGzpTCnD1Qfrv0OCm/INtf
	 +6BTjWwe4qdBcxVcEwQyD1qD72/jVzjC0CRHbF2sbB7CBVIvfoxl37x9XjTdsKkyQI
	 517UWQRiFJG/g==
Date: Tue, 22 Jul 2025 11:26:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aH9LRgiiXQdABrd6@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-4-kees@kernel.org>
 <aHoHkDvvp4AHIzU1@kernel.org>
 <202507181541.B8CFAC7E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202507181541.B8CFAC7E@keescook>
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

On Fri, Jul 18, 2025 at 03:51:28PM -0700, Kees Cook wrote:
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
> > >  					  NUMA_NO_NODE);
> > >  }
> > >  
> > > -static inline void *memblock_alloc_from(phys_addr_t size,
> > > +static __always_inline void *memblock_alloc_from(phys_addr_t size,
> > >  						phys_addr_t align,
> > >  						phys_addr_t min_addr)
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
> For memblock_alloc*, it appears to be that the heuristic GCC uses
> resulted in only memblock_alloc_from() being a problem in this case. I
> can certainly mark them all as __always_inline if that is preferred.

We had a few of those already converted to __always_inline, so I'm ok with
continuing to fix them one at at time. Gives a feeling of job security ;-)

> -- 
> Kees Cook

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
