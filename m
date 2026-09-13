Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A975EC88E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23xAuEYNpjquO7zKIxTD98kTSfx4UFAUJGiQOGLZhTk=; b=eqWUxCoQ1VXiib
	zSrQZBnubmHDly0OOm0GLLUXEgf/7Pwl67UjrmNTBl4xXH9eEpomRpcUWaVv/os97iNErHy8JcUw1
	FUHVYoN6YtBWi7WRXIX15rTI0tQ1Z8RLL6Z9BEBx1IMHTQhHQHsKEMHBTmIERJq1qPDRJsEDtP4f7
	RadO1Y3UaG1gwOVV0Sz8RRaxZDMLiTRFk3HlihfkG4VKCYUs9NNeu8juJYuk1e6oopeQYAH/hTkvR
	MoYE28OzKMHDlRtocARPjOFCQ88667Afdp/c8hZvFV8MKIWizL9ASpkb9yemzZOAlICfh9P5N/p0q
	o+ZkRjPQZ7/vL+4I62yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qox-000000021Jt-2IWB;
	Sun, 13 Sep 2026 20:29:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qou-000000021Jc-2k22;
	Sun, 13 Sep 2026 20:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4CA543777;
	Sun, 13 Sep 2026 20:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FA71F000FF;
	Sun, 13 Sep 2026 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789331338;
	bh=aOuVJZFYo0EDnLKzsfleMThuTLbpPfRT1aSflxZmaT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0ZhGK8IM4pIb1CdketDYt0edlRhvhAJcYPbTotFxrv2kw0TO70plhK5M8Ow4nV2Y
	 mwMDowI3NHyoBWV011IY2wWsKAKGOGixpCreQgvVUT8twOX4rpEdIR2R6pSU2G9cgK
	 xLls4fh66gx+pevVkNSnHxgSeeATqKD58Y1wwNy2bsCKZfSRn7EVljxkzQd1Adjxg5
	 A2iv7O9vUu9qd0iw0fOkZhS+rxtfbCfGQLPN1oobjnRl3APaZENDbJCNztY8EkulbF
	 5GsMUdC4Rzpaaick9NOgUDWw4DUkDASFngKX/AxtrH+14+4CDDqGNsqS8be0SY+/X4
	 H26ZtERmdMyng==
Date: Sun, 13 Sep 2026 21:28:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
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
Message-ID: <aqcGKhbNOPZvmOL4@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-18-5dc1ac01672d@kernel.org>
 <aqW4klkDI2P0aUn5@jpoimboe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqW4klkDI2P0aUn5@jpoimboe>
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

On Sat, Sep 12, 2026 at 03:47:33PM -0700, Josh Poimboeuf wrote:
> On Tue, Sep 08, 2026 at 09:55:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, touch mm/vma.c, gcc        8.4s     8.1s    -0.28s (-3%)
> >   x86 defconfig, touch mm/vma.c, clang      7.5s     7.1s    -0.41s (-5%)
> >   x86 defconfig, clean, gcc                27.1s    26.8s    -0.34s (-1%)
> >   x86 defconfig, clean, clang              26.6s    26.2s    -0.40s (-1%)
> >   x86 allmodconfig, touch mm/vma.c, gcc    30.2s    28.4s     -1.8s (-6%)
> >   x86 allmodconfig, touch mm/vma.c, clang  28.1s    26.0s     -2.1s (-7%)
>
> Nice!
>
> > @@ -305,7 +305,15 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
> >
> >  static bool dead_end_function(struct objtool_file *file, struct symbol *func)
> >  {
> > -	return __dead_end_function(file, func, 0);
> > +	if (!func)
> > +		return false;
> > +
> > +	if (!func->dead_end_known) {
> > +		func->dead_end = __dead_end_function(file, func, 0);
> > +		func->dead_end_known = 1;
> > +	}
> > +
> > +	return func->dead_end;
> >  }
>
> This bit seems like it should be a separate patch.  Though actually, it
> can just be dropped as I have something similar brewing:
>
>   https://lore.kernel.org/9d4b8ccfed745ac47a954aa2e1de62a85197122d.1788899473.git.jpoimboe@kernel.org
>

Ack, dropped for v2, will reference that seris in the cover.

> > -struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, unsigned long offset)
> > +/* Should never be invoked, provided as a backstop. */
> > +static struct reloc *find_reloc_linear(struct section *rsec,
> > +				       unsigned long offset, unsigned int len)
> >  {
> > -	return find_reloc_by_dest_range(elf, sec, offset, 1);
> > +	struct reloc *reloc, *first = NULL;
> > +
> > +	WARN("%s: linear scan for sec %s with %u relocs at offset %lu len %u",
> > +	     __func__, rsec->name, sec_num_entries(rsec), offset, len);
>
> Won't this be triggered for sections created with
> elf_create_rela_section()?  I don't see where they set rsec->hashed.

Good catch thanks, it was triggering for those, e.g. CONFIG_LIVEPATCH, repro'd
locally.

Updated the code to hash these too correctly for v3.

>
> > @@ -1147,6 +1307,28 @@ static int read_relocs(struct elf *elf)
> >
> >  		rsec->base->rsec = rsec;
> >
> > +		/* DWARF relocs are never looked up. */
> > +		if (is_dwarf_section(rsec->base))
> > +			continue;
> > +		if (reloc_sec_in_order(rsec)) {
> > +			rsec->sorted = true;
> > +			continue;
> > +		}
> > +
> > +		rsec->hashed = true;
> > +		nr_hashed += sec_num_entries(rsec);
> > +	}
>
> Hm, I'm not sure whether hashing is even still needed, as compilers
> generally emit sorted relocs.

They do, and anything read from the file in the build does, but this is a
fallback for sections that objtool grows or creates itself which needs the
duplicate check + can be appended out of order.

>
> > @@ -1592,6 +1799,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
> >  	}
> >
> >  	rsec->nr_alloc_relocs = nr_alloc;
> > +	copy_reloc_cache_to_hash(elf, rsec, nr_relocs_old);
>
> Not all relocation appends go through this allocation code path.
> It can return earlier in this function if the space has already been
> allocated previously.  So this call probably belongs in
> elf_create_reloc().

Ack thanks, fixed for v2.

>
> --
> Josh

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
