Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386CC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Oct 2022 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jot2HlQqHwb+1UcfgxIwdaH3Ld22TPixrU/gnLyMH58=; b=DqZsvNdchW43dd
	PDFrEZOTbA+aluVRdl420bFJq3lrLbE3bVUvYUYtTIT0mVITsvMN2N2gFhPzOVuYpJAS4Sw5cGLKu
	huepfNj23TsyNoydnkvL8Rp2sc4tvWKSGyIw/Rrv+WAkhB7eNkR3hl5N+kDn5+0D1Lr7jf7q+ESxi
	IJaw9kNBI5lUT8nlKaTad19a5XW0OhZujTeqBNjq3HbgmsRtbcvZw5CGddt86YcT+O4/E/Mp+TATm
	jD5msOC2RtcejrIaGyK2cLMBg+fenM+ei8qhicQ0uYNfHHiJLQfobH+IuBA5NR0oX73wJGovgk64O
	rXe23fQQfrmJv5CpOlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok7xg-002yzt-7Q; Sun, 16 Oct 2022 18:02:08 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok7xc-002yvY-U1
	for linux-riscv@lists.infradead.org; Sun, 16 Oct 2022 18:02:06 +0000
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 29GI1Xse027168
	for <linux-riscv@lists.infradead.org>; Mon, 17 Oct 2022 03:01:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 29GI1Xse027168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665943294;
	bh=b4VA+tBJuEnC8jIae8cXwOp1TYcyi0oocXt7lEgyOMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rTy+cCQsM375y+PYO89OXal5KJiGFsH+4zReiee/tH/HpNgY9PEeI3ffusK0DiKK5
	 nAbZWPUCFFlOXk0gZKTWvG+0Zxs3hijaMpypoDECh406PHsd0bu7Xl+Ztw0KjV78rk
	 lEq9nc3onvSfd7ItO5TwPTYAngqijl4VSExZSlRaY0so+m8jnIc/NUtO63C2ZTPt8L
	 2CN3FBNsH+zZ2ALrWEl5datZodkxvyrvkjl8fHjAdqcDlZ24C5S7LGJ9ckHk4k2ZQ2
	 pABDG1v+0ZIo6Z9KLiUrHC9/+TMin7w+Qbht1pH7PScQLdt7SoIamh9g+kAaumqNck
	 KE2rFwZQnvTog==
X-Nifty-SrcIP: [209.85.167.176]
Received: by mail-oi1-f176.google.com with SMTP id j188so10071764oih.4
        for <linux-riscv@lists.infradead.org>; Sun, 16 Oct 2022 11:01:33 -0700 (PDT)
X-Gm-Message-State: ACrzQf1RrhHtAYaqykWi6gp8YMn3GENZJgpg4R9pX46eYixQDq5vbFMW
	MHsbjH63fH4BxD4D2fcm+wcKKQkaClRId2aechk=
X-Google-Smtp-Source: AMsMyM6jNepDfS+DPxchfDCxe/qhBRssWHyBUIZIV1uxO3jA5Kw2+penDdCXDc1RfvkxCa9eI44SeuJQLu6BQy/MbAw=
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id
 cj5-20020a0568081b8500b0034d8ce1d5b0mr11559696oib.194.1665943292581; Sun, 16
 Oct 2022 11:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221014204210.383380-1-nathan@kernel.org> <CAKwvOdmvqoO1220ac7RVbVzvmbJB0wYq5WOfuz=T8hd+CkijBg@mail.gmail.com>
In-Reply-To: <CAKwvOdmvqoO1220ac7RVbVzvmbJB0wYq5WOfuz=T8hd+CkijBg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Oct 2022 03:00:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvpSFUiX9=92UnoZpJs=uzaZqpGG-r1dyeWsRXpS5fmw@mail.gmail.com>
Message-ID: <CAK7LNAQvpSFUiX9=92UnoZpJs=uzaZqpGG-r1dyeWsRXpS5fmw@mail.gmail.com>
Subject: Re: [PATCH v2] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, Tom Rix <trix@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_110205_211243_6A931728 
X-CRM114-Status: GOOD (  34.97  )
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

On Sat, Oct 15, 2022 at 6:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Oct 14, 2022 at 1:48 PM Nathan Chancellor <nathan@kernel.org> wrote:
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
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks for keeping these LLVM_IAS=0 builds alive a little longer.  My
> hope is the GNU binutils can relax their requirement for debug info
> sections to improve support for DWARF v5.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


Applied to linux-kbuild.
Thanks.



> > ---
> >
> > v2:
> >     - Rebase on commit bb1435f3f575 ("Kconfig.debug: add toolchain
> >       checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT") from the kbuild
> >       tree.
> >     - Limit CONFIG_AS_HAS_NON_CONST_LEB128 dependency to GNU as. There
> >       is no point to applying this dependency to the integrated
> >       assembler because it will always pass.
> >     - Apply the CONFIG_AS_HAS_NON_CONST_LEB128 dependency to
> >       CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT as well, due to the
> >       aforementioned kbuild change.
> >     - Move comment block to above CONFIG_AS_HAS_NON_CONST_LEB128, as the
> >       configuration is now used in two places.
> >     - Drop Conor's tested by, as the patch is different enough to
> >       potentially require new testing.
> >
> > v1: https://lore.kernel.org/20220928182523.3105953-1-nathan@kernel.org/
> >
> >  lib/Kconfig.debug | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index db8d9271cabf..5c1c63575895 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -231,6 +231,11 @@ config DEBUG_INFO
> >           in the "Debug information" choice below, indicating that debug
> >           information will be generated for build targets.
> >
> > +# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
> > +# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> > +config AS_HAS_NON_CONST_LEB128
> > +       def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
> > +
> >  choice
> >         prompt "Debug information"
> >         depends on DEBUG_KERNEL
> > @@ -253,7 +258,7 @@ config DEBUG_INFO_NONE
> >  config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >         bool "Rely on the toolchain's implicit default DWARF version"
> >         select DEBUG_INFO
> > -       depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502)
> > +       depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> >         help
> >           The implicit default version of DWARF debug info produced by a
> >           toolchain changes over time.
> > @@ -277,7 +282,7 @@ config DEBUG_INFO_DWARF4
> >  config DEBUG_INFO_DWARF5
> >         bool "Generate DWARF Version 5 debuginfo"
> >         select DEBUG_INFO
> > -       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
> > +       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> >         help
> >           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
> >           5.0+ accepts the -gdwarf-5 flag but only had partial support for some
> >
> > base-commit: bb1435f3f575b5213eaf27434efa3971f51c01de
> > --
> > 2.38.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
