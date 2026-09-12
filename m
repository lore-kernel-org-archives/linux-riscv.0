Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B2C88E56
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBL4odbNk8gZAKrvK6ebjZOgGYGXp+ba9fW+yX2T7JM=; b=CxcMRKSsLcJHS3
	1IX6uxtXMAF2BM+xYVl59mho11hVAzGw2N8AWaaZFAV4mtSnozcOkO84BjUBwNiLc200l2MA5sgtr
	860Bo4Pm0TwRYhY61fTef5OMWBfmY9gYL6kZaHvWZ1EADhg+SnOM0WMqRLJ6a5WHN67rLjc+Ocyna
	xmUOWnpHADNZuHKkDoEGt3BG4gvfkkzH2ScXDfgXpthIo7GpQvXaZGFAML2rFAA0ywd8V/giuR0Xt
	/wHmpPLbSSp+giiBcAj37JH3pEeiAT8qKXbeASU3GEo2f9QJQKLtbcir+Y0sW+3auxjunP7nCGmem
	kD27YZ50+s5ti1IE2JUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WVZ-00000001GQq-19cW;
	Sat, 12 Sep 2026 22:47:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WVX-00000001GQg-0Mp7;
	Sat, 12 Sep 2026 22:47:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1ABA60008;
	Sat, 12 Sep 2026 22:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7215B1F000FF;
	Sat, 12 Sep 2026 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253257;
	bh=YTs0RHzOBARO9Zxd/72JxEwAoUlFgRlD7PJM9ViCXyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e4ZfcMFmvfYKUh71LAPoMcJrwB+EauX2idSlHvlrc7/TcwWF4y4so18J/fbY5lXYi
	 R7U55xnaXLAON7/zdmlPVdNgwj6zPMq1L2fBY8yKvOCgRckwkR0KzQNa2gxGw7uFfA
	 wm2T2BsSDlRNJ4H1wIXuFyyLsOUX42JzfBTZ57ZX668HEN5yhgzUyOYlE/vi9rRF1e
	 wxNzTDgBlwyw4kYH+U2DPdRNeBPA1JL+8gr8GbujAgHSSmzPofsMXi7mlmK5MX4lQM
	 Q9YMH4vqdH97Z9EK53Aaj452z+/sBIpyi8GFKK13J3KjBc/JY1me3oHi5xO3iHRUE4
	 jKTcBOzWYivwQ==
Date: Sat, 12 Sep 2026 15:47:33 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 18/23] objtool: cache relocations and function dead end
 state, do less work
Message-ID: <aqW4klkDI2P0aUn5@jpoimboe>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-18-5dc1ac01672d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-build-speedup-v1-18-5dc1ac01672d@kernel.org>
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

On Tue, Sep 08, 2026 at 09:55:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.4s     8.1s    -0.28s (-3%)
>   x86 defconfig, touch mm/vma.c, clang      7.5s     7.1s    -0.41s (-5%)
>   x86 defconfig, clean, gcc                27.1s    26.8s    -0.34s (-1%)
>   x86 defconfig, clean, clang              26.6s    26.2s    -0.40s (-1%)
>   x86 allmodconfig, touch mm/vma.c, gcc    30.2s    28.4s     -1.8s (-6%)
>   x86 allmodconfig, touch mm/vma.c, clang  28.1s    26.0s     -2.1s (-7%)

Nice!

> @@ -305,7 +305,15 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  
>  static bool dead_end_function(struct objtool_file *file, struct symbol *func)
>  {
> -	return __dead_end_function(file, func, 0);
> +	if (!func)
> +		return false;
> +
> +	if (!func->dead_end_known) {
> +		func->dead_end = __dead_end_function(file, func, 0);
> +		func->dead_end_known = 1;
> +	}
> +
> +	return func->dead_end;
>  }

This bit seems like it should be a separate patch.  Though actually, it
can just be dropped as I have something similar brewing:

  https://lore.kernel.org/9d4b8ccfed745ac47a954aa2e1de62a85197122d.1788899473.git.jpoimboe@kernel.org

> -struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, unsigned long offset)
> +/* Should never be invoked, provided as a backstop. */
> +static struct reloc *find_reloc_linear(struct section *rsec,
> +				       unsigned long offset, unsigned int len)
>  {
> -	return find_reloc_by_dest_range(elf, sec, offset, 1);
> +	struct reloc *reloc, *first = NULL;
> +
> +	WARN("%s: linear scan for sec %s with %u relocs at offset %lu len %u",
> +	     __func__, rsec->name, sec_num_entries(rsec), offset, len);

Won't this be triggered for sections created with
elf_create_rela_section()?  I don't see where they set rsec->hashed.

> @@ -1147,6 +1307,28 @@ static int read_relocs(struct elf *elf)
>  
>  		rsec->base->rsec = rsec;
>  
> +		/* DWARF relocs are never looked up. */
> +		if (is_dwarf_section(rsec->base))
> +			continue;
> +		if (reloc_sec_in_order(rsec)) {
> +			rsec->sorted = true;
> +			continue;
> +		}
> +
> +		rsec->hashed = true;
> +		nr_hashed += sec_num_entries(rsec);
> +	}

Hm, I'm not sure whether hashing is even still needed, as compilers
generally emit sorted relocs.

> @@ -1592,6 +1799,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
>  	}
>  
>  	rsec->nr_alloc_relocs = nr_alloc;
> +	copy_reloc_cache_to_hash(elf, rsec, nr_relocs_old);

Not all relocation appends go through this allocation code path.
It can return earlier in this function if the space has already been
allocated previously.  So this call probably belongs in
elf_create_reloc().

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
