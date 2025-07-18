Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AAFC83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUssFAWLIBke4pdRuOmhxEAV7kSOFA0TUadPUsHrUxE=; b=eUhoF87RpySBKu
	eIcf1r4wKoqxwb1H4bfOA56oSrjuD1P52N4Jot8iomav53OEl59oVdSLPbp6w8K/+4kJPcKccFSRv
	CtqfMS4/Pbd0ZELWgGblNnh+GwMnYmCLc+3pHI6G0Z9E37eIMjGptYKxhnhCCO/vO4bGuGLvzSS2g
	R+NPImC8XyOYhla1jl8jK5aiouma7bcvAhgra2fZ62UcOME2ug44coxcKxDd5PruXVbUXZKLVdr2C
	aQUX/qfKfdXpLIRsUYTzVG8DCXN96twEsh7on2gjg3pAWZFTZJ4XoPxsfQRQNVQ3PZqhkxOvIISp/
	DgPNQ32ZtC1Q+UxyvLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgrH-0000000C5nr-1Uca;
	Fri, 18 Jul 2025 08:54:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgaN-0000000C3qm-3BGc;
	Fri, 18 Jul 2025 08:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 373645C5996;
	Fri, 18 Jul 2025 08:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E585C4CEEB;
	Fri, 18 Jul 2025 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752827813;
	bh=HL/2nr+vhFKcEcF58riyFRNQttwiCB/9fGbm+q71Dgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmH8kuFDP69wLkOjDvdpYL8g4oErm+tCxzSYFjNficaE3yVU2VDi2CVybyh3k2vzL
	 ktrs4o3SmHh9+Ti01m0+zENfWaUVs3rPEOFccIDJ8JzUuMBm7vzDhfYqgJjGzyUfX2
	 tzprzSBZDHn6R6ZCy1S+ooHnVTZn0aRQWwJVACdL/lb02WuONW5CmJoAQ+l6IEgvXV
	 YUoaFOXIVofvTGsxJhTxgxblsj38dHI42GL2cErPbWSgZ0WyDVaDQIEbTqk0zRmB/4
	 6UGfFtVoeLA7gIVsJdymOjI/f87nJMUh+D/2j397DUryS3KRRsJ57CDJHeSOO9dNdu
	 VnRo0rjVmoxGg==
Date: Fri, 18 Jul 2025 11:36:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kees Cook <kees@kernel.org>
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
Message-ID: <aHoHkDvvp4AHIzU1@kernel.org>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-4-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717232519.2984886-4-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_013655_891722_28654EEE 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Kees,

On Thu, Jul 17, 2025 at 04:25:09PM -0700, Kees Cook wrote:
> When KCOV is enabled all functions get instrumented, unless the
> __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> x86 this means forcing several functions to be inline with
> __always_inline.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

...

> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index bb19a2534224..b96746376e17 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -463,7 +463,7 @@ static inline void *memblock_alloc_raw(phys_addr_t size,
>  					  NUMA_NO_NODE);
>  }
>  
> -static inline void *memblock_alloc_from(phys_addr_t size,
> +static __always_inline void *memblock_alloc_from(phys_addr_t size,
>  						phys_addr_t align,
>  						phys_addr_t min_addr)

I'm curious why from all memblock_alloc* wrappers this is the only one that
needs to be __always_inline?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
