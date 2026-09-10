Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431B4C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfbP8hX323yl9VdHdYrmlyN8enmrdWgMyjntEip2e04=; b=TMkGMgj+xkdDVs
	xCfHaOYIFH0I45ZYDleTA1iwuNHSolZDS5zGAfnLuut8KQ/27498OmRwPW0g4SYZCwUDTKNOiEsEd
	7j8LfvzdFhRzpNILnweCbOlCuSKlCXsWiCP5vRwryjdV06u3bTbhIomtJLV3HoW/OwSK1lQf8a5ML
	G3cBhrAzPhPHeMq2hriZxceXtNUpqlQkKY84GpPijh7Qm4ZWq6suIkbl66VTru39xSIf2CiKBBAv6
	pXO7LXEymWCYecKII5vOXABK90KP2bfUaxuKboV2oQNcO9m8ccvco23XwNMna1D3vUIkrAGHJ1jB1
	uIe+GUTCd7b3vr7i17Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVi-0000000E83v-4Bla;
	Thu, 10 Sep 2026 11:00:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVh-0000000E82S-1PFe;
	Thu, 10 Sep 2026 11:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ACD241E51;
	Thu, 10 Sep 2026 11:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6E31F00898;
	Thu, 10 Sep 2026 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789038003;
	bh=rH49KjocGWRkJ+AZJQhcm2lj6KEBkusUet19acjfj5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBG2Xis6aC2x/TFiRhgODNHYxMsm9AepijpQMJLiqGJS2lxSLsxOf+CTbdiEH9Fg7
	 WR7MjDDhyRRBUsOFpbxeN9nm4odVyTHdNN2h+M+AOb8VZsSMhCIMfBNtqb9j7yhu9F
	 9E80Yd1DWtWvPL6hdktW9e+aJ2MKlEz3IxuD82KF3or9xnpT5GRh28m13ae5AzDEdK
	 GTqk0D/qMhaSfCzPZ3Hq7mA6hZajZ8baL4mU1jblluQrILkPVl0XG54BRP+o8PpLFb
	 bQvtujHLityCH1kc2rr1NQxKpn+fgba64Qzq43EdmJc41t6NlWX1VyB1G1BN+80GJ1
	 G6CWH17PIcZJQ==
Date: Thu, 10 Sep 2026 11:59:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 09/23] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <aqKNKBt2RX-cFKtP@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-9-5dc1ac01672d@kernel.org>
 <178901395291.3971858.229822965899686230.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395291.3971858.229822965899686230.b4-review@b4>
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

On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> > placed MODULE_INFO() strings in the .modinfo section in vmlinux.unstripped,
> > however it left the section allocatable, so it gets assigned an address and
> > on arm64, arm and riscv, the section is tagged as PT_LOAD.
> >
> > This is useless as the data is ultimately stripped anyway.
> >
> > Doing this results in a lot of unnecessary work - each pass copies the
> > whole file, 450 MIB with relocations for an x86 allmodconfig build and 250
> > MiB for an arm64 allmodconfig build.
> >
> > This adds ~0.7s on the serial tail of every build for arm64 and ~0.2s for
> > x86 (the tail is single-threaded work done after parallel work has
> > finished).
> >
> > Nothing requires .modinfo to exist at an address, so fix this by using
> > --dump-section which prevents the allocation.
> >
> > Image, bzImage, System.map and modules.builtin.modinfo are unchanged and
> > the stripped vmlinux differs only in its program headers.
> >
> > The objcopy passes are on the serial tail of every build that links
> > vmlinux, no-op builds are unchanged.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, touch mm/vma.c, gcc        8.9s     8.8s    -0.16s (-2%)
> >   x86 defconfig, touch mm/vma.c, clang      8.1s     7.9s    -0.20s (-2%)
> >   x86 defconfig, clean, gcc                27.6s    27.5s    -0.13s (0%)
> >   x86 defconfig, clean, clang              27.2s    27.0s    -0.18s (-1%)
> >   x86 allmodconfig, touch mm/vma.c, gcc    42.0s    41.6s    -0.40s (-1%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index b2988aa12f66..7be9e0321867 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -855,7 +855,7 @@
> >  		KLP_SYMID
> >
> >  #define MODINFO								\
> > -		.modinfo : { *(.modinfo) . = ALIGN(8); }
> > +		.modinfo (INFO) : { *(.modinfo) . = ALIGN(8); }
> >
> >  #ifdef CONFIG_GENERIC_BUG
> >  #define BUG_TABLE							\
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index 4b54aaeca65d..1fc7a0ca8eaf 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -90,11 +90,9 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
> >
> >  remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
> >
> > -# To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
> > -# it is necessary to remove the PT_LOAD flag from the segment.
> > +# none of the removed sections is allocated, so no segment is left empty
>
> I think we could just drop this comment, I don't think it is
> particularly helpful

Ack!

>
> >  quiet_cmd_strip_relocs = OBJCOPY $@
> > -      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
> > -                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $@
> > +      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $< $@
> >
> >  targets += vmlinux
> >  vmlinux: vmlinux.unstripped FORCE
> > @@ -103,21 +101,11 @@ vmlinux: vmlinux.unstripped FORCE
> >  # modules.builtin.modinfo
> >  # ---------------------------------------------------------------------------
> >
> > -# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
> > -# tools that expect vmlinux to have sufficiently aligned sections but the
> > -# additional bytes used for padding .modinfo to satisfy this requirement break
> > -# certain versions of kmod with
> > -#
> > -#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> > -#
> > -# Strip the trailing padding bytes after extracting .modinfo to comply with
> > -# what kmod expects to parse.
> > +# use --dump-section to include non-allocated sections
>
> Same thing here, I am not sure anyone will question '--dump-section'
> here. Otherwise, this seems reasonable. I was curious about the $@.tmp
> until I read the objcopy manual but that probably is not worth a
> comment.

Ack too.

>
> I can probably take this one faster than the rest if you want to put it
> early in the stack since it is pretty low hanging fruit and earlier it
> gets exposure to -next, the better.

Sure sounds good, the sooner we get these in -next the better.

I was planning to go through feedback/sashiko (+ give a bit more time for people
to respond) before doing a v2, but I guess you could put this to -next as-is,
given v2 will just be stripping comments here (as it stands anyway!)

>
> --
> Cheers,
> Nathan
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
