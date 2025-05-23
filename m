Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC61C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7u0+rGBpgz0k8btPKYblvMabCB1DvpUmCFHR3KyQH8=; b=PgPwN1gDEGnIFI
	PCsA6mZWT4NsHJ0KQgePht71bQX9LF9FfphCWL8mlMvFCGZSIDmv3VOrnNkped7OuPSyxzg9xUpNX
	r8zRodkNrqkrOLCWL0U+WYUb8RtbC43EK0ExszDoVITebYKA0KHSTywyYnCFrjHdFEFDhSWOVOXiV
	l1Oe6g7v13nOdxFR/mW/tq8lEfpiCe3RTqaryAnRRyTYtehRETwnwt0XbppBa4SsmKCujKny41Kep
	ag0XdbMhRUu6r5qw3CpVp33eaeoRo4irMgClpgyuYYlkGfKOviJ1KN301e/4UPYzkp0THtSobouI9
	PwfqIzpkxBQ8hhKk4atA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZ4T-00000004sec-0e9g;
	Fri, 23 May 2025 20:32:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZ0L-00000004sDD-1vo6;
	Fri, 23 May 2025 20:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A175F45078;
	Fri, 23 May 2025 20:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E60C4CEEF;
	Fri, 23 May 2025 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748032111;
	bh=mCqS/Kijb63hfjRogkIoo1V9a7plAKd5pBatsPb3zS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKCTWrMOz8QGFkwtap37uEMcxPQVostPEoFPh+liJpGoIZm7yUbph01VSxYIZ9Mnu
	 Xp2SFx8fCFcAMCn/ELInspiWG36xJF3J7d0jPlVxo6aeh9oNz5+dzf8Kq3g/Xe/so1
	 mYCrUnXAuBAVZPsZr7ruImlYVc+gipnIRXGuB54FA2ds4IMAQQ3eh1QLM/4b0qJj2M
	 gTr/IjcVsa0wubmGcNRixgHZajZrPNsHowCdWXY/LC03W+Pu6hAChB6eWCEPXnK99u
	 2vaA5rFoq3M2ELAJVxf64ufJ8UJLD7jY5t0UU+6I6+n7SgWhzCzujvRIpD5lc47LG4
	 +IQz87qYLaslQ==
Date: Fri, 23 May 2025 13:28:28 -0700
From: Kees Cook <kees@kernel.org>
To: Sean Christopherson <seanjc@google.com>
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
	Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>,
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
	linux-mm@kvack.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
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
Subject: Re: [PATCH v2 04/14] x86: Handle KCOV __init vs inline mismatches
Message-ID: <202505231327.3FA45E4B@keescook>
References: <20250523043251.it.550-kees@kernel.org>
 <20250523043935.2009972-4-kees@kernel.org>
 <aDCHl0RBMgNzGu6j@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDCHl0RBMgNzGu6j@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_132833_541590_89BEFC2D 
X-CRM114-Status: GOOD (  12.78  )
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

On Fri, May 23, 2025 at 07:35:03AM -0700, Sean Christopherson wrote:
> On Thu, May 22, 2025, Kees Cook wrote:
> > diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> > index 921c1c783bc1..72f13d643fca 100644
> > --- a/arch/x86/kernel/kvm.c
> > +++ b/arch/x86/kernel/kvm.c
> > @@ -420,7 +420,7 @@ static u64 kvm_steal_clock(int cpu)
> >  	return steal;
> >  }
> >  
> > -static inline void __set_percpu_decrypted(void *ptr, unsigned long size)
> > +static __always_inline void __set_percpu_decrypted(void *ptr, unsigned long size)
> 
> I'd rather drop the "inline" and explicitly mark this "__init".  There's value
> in documenting and enforcing that memory is marked decrypted/shared only during
> boot.

Sure! I will swap this around. Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
