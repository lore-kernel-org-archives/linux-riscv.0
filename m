Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqyainQRgUr5YcmP+4PKwEUmzAC2oAQ7o1xML2eug/E=; b=LvtojOhUKIPFj4
	zkAEk4wkzL6vEG9QqUfkTkhAvJgheAQacwLHLAgK+ZTN1Mwf1/br2KHicsy5or3zvHcA3PJmFOYcX
	ddoRAcQV4+KAJRjc9OvvawlRyqBO8SEB1T+GI6euA9/Sl3q+jDY3KATxY4KHQ/vdm2HREV/KtUy39
	L5Nyl8+e7pP0QEUaXhlvQyjZC3T//7RaR4LtQEAEp86MuSAqfQlQUf725N+KNu0Bt/i360qwfe+d9
	jj9x1/pGmd5rGs9AOiMnSGl9AFKueJbOEpKJX9xUmJWA11OwMz1vqTjPXMSkBPHsAAHfoZf6763Eu
	tXJbTjQ/HaYA7Ae5DOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofO21-006f60-DL; Mon, 03 Oct 2022 16:11:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofO1x-006f3q-Ep
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 16:10:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B934B80F01;
	Mon,  3 Oct 2022 16:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC1EC433D6;
	Mon,  3 Oct 2022 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664813454;
	bh=VNuWSL+WeJYDCChgOKB7QTNXhZXJ1iCWHHhQoDC15/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqLI6a7LmhNtbdijFB574BY8yHNZT2SmoFuyIHKCkvsfY38pwiC3Ce5QzLG/WTVhP
	 qb0hCuXYC3l0JlnLOLUKnZjyR2su6ycCNigHzT32/3wBUmppA/Qu1Nl0BJQwB5nsHh
	 AHvOt8msRJuAaPfYDrWBxc9pLIcodATPpBaUuB6zOjRcCaezSifnZRNk3yt76p1yIP
	 oueDYo4LvY9nK1pG1owc6Fg6N2CYI1sge37kw44oCzHatb08SnmTDXvu5z4QBj1uRD
	 Zq1vnspuDlFkemOqNq7zTqbMtI7m5jQCI1rVj77qevdHd14ng04Cj3m1mUHYtl04UO
	 i1aENRviLNfCw==
Date: Mon, 3 Oct 2022 09:10:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	llvm@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
Message-ID: <YzsJi7sT54dJtvKw@dev-arch.thelio-3990X>
References: <20220928182523.3105953-1-nathan@kernel.org>
 <CAK7LNATqoW-3fmFZBAbPuKhdRn4UD_o8jthVsBanyYzFWpzSSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATqoW-3fmFZBAbPuKhdRn4UD_o8jthVsBanyYzFWpzSSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_091057_810545_5A679570 
X-CRM114-Status: GOOD (  35.81  )
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

On Mon, Oct 03, 2022 at 03:47:30AM +0900, Masahiro Yamada wrote:
> On Thu, Sep 29, 2022 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When building with a RISC-V kernel with DWARF5 debug info using clang
> > and the GNU assembler, several instances of the following error appear:
> >
> >   /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported
> >
> > Dumping the .s file reveals these .uleb128 directives come from
> > .debug_loc and .debug_ranges:
> >
> >   .Ldebug_loc0:
> >           .byte   4                               # DW_LLE_offset_pair
> >           .uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
> >           .uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
> >           .byte   1                               # Loc expr size
> >           .byte   90                              # DW_OP_reg10
> >           .byte   0                               # DW_LLE_end_of_list
> >
> >   .Ldebug_ranges0:
> >           .byte   4                               # DW_RLE_offset_pair
> >           .uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
> >           .uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
> >           .byte   4                               # DW_RLE_offset_pair
> >           .uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
> >           .uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
> >           .byte   0                               # DW_RLE_end_of_list
> >
> > There is an outstanding binutils issue to support a non-constant operand
> > to .sleb128 and .uleb128 in GAS for RISC-V but there does not appear to
> > be any movement on it, due to concerns over how it would work with
> > linker relaxation.
> >
> > To avoid these build errors, prevent DWARF5 from being selected when
> > using clang and an assembler that does not have support for these symbol
> > deltas, which can be easily checked in Kconfig with as-instr plus the
> > small test program from the dwz test suite from the binutils issue.
> >
> > Link: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1719
> > Tested-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  lib/Kconfig.debug | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index d3e5f36bb01e..19de03ead2ed 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -231,6 +231,9 @@ config DEBUG_INFO
> >           in the "Debug information" choice below, indicating that debug
> >           information will be generated for build targets.
> >
> > +config AS_HAS_NON_CONST_LEB128
> > +       def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
> > +
> >  choice
> >         prompt "Debug information"
> >         depends on DEBUG_KERNEL
> > @@ -277,6 +280,10 @@ config DEBUG_INFO_DWARF5
> >         bool "Generate DWARF Version 5 debuginfo"
> >         select DEBUG_INFO
> >         depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
> > +       # Clang is known to generate .{s,u}leb128 with symbol deltas with
> > +       # DWARF5, which some targets may not support.
> > +       # https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> 
> If you plan to patch both DWARF_TOOLCHAIN_DEFAULT and DWARF5,
> it will be cleaner to move this comment to AS_HAS_NON_CONST_LEB128.

Sure, that sounds reasonable! I can base this change on the series that
you recently sent:

https://lore.kernel.org/20221002181107.51286-1-masahiroy@kernel.org/

> > +       depends on !CC_IS_CLANG || AS_HAS_NON_CONST_LEB128
> 
> The condition "!CC_IS_CLANG" is repeated here.
> 
> If you use the following patch as basic,
> https://lore.kernel.org/lkml/20221002181107.51286-2-masahiroy@kernel.org/T/#u
> 
> you can write the code like this:
> 
> !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 &&
> AS_HAS_NON_CONST_LEB128)

Right, I had initially had something along this line but the length of
the line bothered some folks in pre-review so I opted for a second line.
With your clean ups, it seems reasonable to move it back to the original
line.

> Another big hammer solution is to give up Clang+GAS for CONFIG_DEBUG_INFO.
> If we go this way, this patch is unneeded, though.
> Thoughts?

I think this is a simple enough solution to avoid that big hammer at the
moment but if we continue to run into corner cases like this, that is
certainly worth considering.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
