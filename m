Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF0BC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Oct 2022 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwOpoRNgx/B4VlBSk3AGDH8ZcSksCL5Qq1fFKevqdjw=; b=YB0nQ5Xd5xebkP
	E/rfUXTkMuTDtrwCINvjFp+aVR9m+H0hvH6jGZNRnUOZkBvVYS7G4Ba56SUcFBbAcdgyPWQEwI4Jr
	TGQFSAeofL8uWXbGmeRJjllbaqG8cDAqsgvbQ/7FKrP+WU6HetbHVLx115+7KriZY++wOe+kWf3h2
	ZTULWEOHljcG2Be4RxNCKGs5g5mhttalVoNl5Wwc4gcRbODOV0WbDXPuESPZDJAV1eoV3uO8vhd5u
	nqAf9wDrbiBR4589/kDDXhKmhiLTGbwGH7OW5YkRuhLauD/QeowQx4fnlaphsQfBQpdCpoKG7Lu/w
	8rKswFS8a+rJBOnFMd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok8Hy-0034t8-GQ; Sun, 16 Oct 2022 18:23:06 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok8Hu-0034rU-HK
	for linux-riscv@lists.infradead.org; Sun, 16 Oct 2022 18:23:04 +0000
Received: by mail-ot1-x32e.google.com with SMTP id a14-20020a9d470e000000b00661b66a5393so4657429otf.11
        for <linux-riscv@lists.infradead.org>; Sun, 16 Oct 2022 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wW7XFUIrfwAYj9V0BgTRJZPYfpuX+5gjcsBRlqmRR3c=;
        b=JU3t4HRNM+9S9D0rHT+rK3o8ST81UnTQgBfh8fVYH3zJRD9lc2nScx9TUwfInn/Y8i
         rnwHf6LF7QiRhuKpEdiq2XMqHTQzkvUVNdQKsje4bUd1cvetdei5A8y8Avo9o3m6I9Je
         BVYCV8JMV62C1iAIhA0KspdlrHtyJW7XZwfkKCsnnY7KVg5AZKfBKd1ihwpDc/bCa7Nv
         wujlkxtEdHTXvFTIpi66WVhuwukKYgdonQuNuDsbwxcL5MYZVrbsBH78EOpx/mdO2lhS
         PWZFiuBx25QPV+ICluSljA3OV1Rbk9qkr43mjUusVk64uX6LlDq0As0Hoz6yguuboBfm
         TJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wW7XFUIrfwAYj9V0BgTRJZPYfpuX+5gjcsBRlqmRR3c=;
        b=jCq3C/ADdxUxGoOscV1QqLTdkYac8xLR9jFA089rrIFdJsVh+l90Mg+TQXVcBKYwME
         67sFDDZQRoSIygnffX/lclomk12jZgoHkH4S8BrPfU/v6sfk8zvcRa510CJRQjxGm3XM
         a13JpoY1ZbDiabLYQz5hFUpvtzW8f8Le+ZRjGuEYjQuYCwD3mXfrnfLKhTB47aVS/h7H
         TYQJnDi989LwPOfQt8AY7Vw2/BXL/zVkvT/+XvzOT9eZWWQGKF5VuXbPePyB56AZQNBj
         FsVZ+PKFk3O7TUyMBVzSkWvT1DLx/Te1HsEcNC/KZhxaDIJPct8X9GHZo2FdTx/UKYkz
         0oLQ==
X-Gm-Message-State: ACrzQf1BDsrkH8Ewmahdnj1Nccv+KCKXagdCCYgbqZPU4qbVLxfYC+ez
	06R9SWj2DO0GIr2xRXe2jN7taFmK3eHtas+5kWw=
X-Google-Smtp-Source: AMsMyM4nQJlVhF5jmHJN1j7Nm7J+AvU6gMopIMylRr6DV6jrnlnjX8VOMlWRdql4oP0xaM689bT/msJw+xzE7e0xOuk=
X-Received: by 2002:a05:6830:141:b0:661:acd7:de with SMTP id
 j1-20020a056830014100b00661acd700demr3651892otp.367.1665944581210; Sun, 16
 Oct 2022 11:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221014204210.383380-1-nathan@kernel.org> <CAKwvOdmvqoO1220ac7RVbVzvmbJB0wYq5WOfuz=T8hd+CkijBg@mail.gmail.com>
 <CAK7LNAQvpSFUiX9=92UnoZpJs=uzaZqpGG-r1dyeWsRXpS5fmw@mail.gmail.com>
 <CA+icZUWfB1pxTFc2VX4_J2dqZZkZ=raC=EVKuPDP0EdBy777OQ@mail.gmail.com> <Y0xLdOM0TAbcJHop@spud>
In-Reply-To: <Y0xLdOM0TAbcJHop@spud>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 16 Oct 2022 20:22:24 +0200
Message-ID: <CA+icZUWj52mQcQeSqCiD_DXrrj9YCLYfdNqvDpPMAF3s_6TMcw@mail.gmail.com>
Subject: Re: [PATCH v2] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Conor Dooley <conor@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tom Rix <trix@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_112302_593916_B1A6D5F0 
X-CRM114-Status: GOOD (  43.41  )
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
Reply-To: sedat.dilek@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Oct 16, 2022 at 8:20 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Sun, Oct 16, 2022 at 08:10:30PM +0200, Sedat Dilek wrote:
> > On Sun, Oct 16, 2022 at 8:04 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Sat, Oct 15, 2022 at 6:52 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Fri, Oct 14, 2022 at 1:48 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > >
> > > > > When building with a RISC-V kernel with DWARF5 debug info using clang
> > > > > and the GNU assembler, several instances of the following error appear:
> > > > >
> > > > >   /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported
> > > > >
> > > > > Dumping the .s file reveals these .uleb128 directives come from
> > > > > .debug_loc and .debug_ranges:
> > > > >
> > > > >   .Ldebug_loc0:
> > > > >           .byte   4                               # DW_LLE_offset_pair
> > > > >           .uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
> > > > >           .uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
> > > > >           .byte   1                               # Loc expr size
> > > > >           .byte   90                              # DW_OP_reg10
> > > > >           .byte   0                               # DW_LLE_end_of_list
> > > > >
> > > > >   .Ldebug_ranges0:
> > > > >           .byte   4                               # DW_RLE_offset_pair
> > > > >           .uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
> > > > >           .uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
> > > > >           .byte   4                               # DW_RLE_offset_pair
> > > > >           .uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
> > > > >           .uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
> > > > >           .byte   0                               # DW_RLE_end_of_list
> > > > >
> > > > > There is an outstanding binutils issue to support a non-constant operand
> > > > > to .sleb128 and .uleb128 in GAS for RISC-V but there does not appear to
> > > > > be any movement on it, due to concerns over how it would work with
> > > > > linker relaxation.
> > > > >
> > > > > To avoid these build errors, prevent DWARF5 from being selected when
> > > > > using clang and an assembler that does not have support for these symbol
> > > > > deltas, which can be easily checked in Kconfig with as-instr plus the
> > > > > small test program from the dwz test suite from the binutils issue.
> > > > >
> > > > > Link: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1719
> > > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > >
> > > > Thanks for keeping these LLVM_IAS=0 builds alive a little longer.  My
> > > > hope is the GNU binutils can relax their requirement for debug info
> > > > sections to improve support for DWARF v5.
> > > >
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > >
> > > Applied to linux-kbuild.
> > > Thanks.
> > >
> >
> > [1] says:
> >
> > "This looks good to me! Feel free to submit with a:
> > Tested-by: Conor Dooley <conor.dooley@microchip.com>"
>
> Hey Sedat,
>
> I actually didn't take a proper look at the v2 at all... I didn't realise
> that Nathan dropped by T-b for v2 since he'd changed the patch enough to
> feel that he should.
>
> I'm not too worried about the removed T-b (espcially since Linus has
> just merged Masahiro's PR containing this change).
>
> Thanks though!
> Conor.
>

Yes, just saw the update on
https://github.com/torvalds/linux/commits/master first.

-Sedat-

> >
> > -sed@-
> >
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1261158627
> >
> > >
> > >
> > > > > ---
> > > > >
> > > > > v2:
> > > > >     - Rebase on commit bb1435f3f575 ("Kconfig.debug: add toolchain
> > > > >       checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT") from the kbuild
> > > > >       tree.
> > > > >     - Limit CONFIG_AS_HAS_NON_CONST_LEB128 dependency to GNU as. There
> > > > >       is no point to applying this dependency to the integrated
> > > > >       assembler because it will always pass.
> > > > >     - Apply the CONFIG_AS_HAS_NON_CONST_LEB128 dependency to
> > > > >       CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT as well, due to the
> > > > >       aforementioned kbuild change.
> > > > >     - Move comment block to above CONFIG_AS_HAS_NON_CONST_LEB128, as the
> > > > >       configuration is now used in two places.
> > > > >     - Drop Conor's tested by, as the patch is different enough to
> > > > >       potentially require new testing.
> > > > >
> > > > > v1: https://lore.kernel.org/20220928182523.3105953-1-nathan@kernel.org/
> > > > >
> > > > >  lib/Kconfig.debug | 9 +++++++--
> > > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > > > index db8d9271cabf..5c1c63575895 100644
> > > > > --- a/lib/Kconfig.debug
> > > > > +++ b/lib/Kconfig.debug
> > > > > @@ -231,6 +231,11 @@ config DEBUG_INFO
> > > > >           in the "Debug information" choice below, indicating that debug
> > > > >           information will be generated for build targets.
> > > > >
> > > > > +# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
> > > > > +# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> > > > > +config AS_HAS_NON_CONST_LEB128
> > > > > +       def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
> > > > > +
> > > > >  choice
> > > > >         prompt "Debug information"
> > > > >         depends on DEBUG_KERNEL
> > > > > @@ -253,7 +258,7 @@ config DEBUG_INFO_NONE
> > > > >  config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > > >         bool "Rely on the toolchain's implicit default DWARF version"
> > > > >         select DEBUG_INFO
> > > > > -       depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502)
> > > > > +       depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> > > > >         help
> > > > >           The implicit default version of DWARF debug info produced by a
> > > > >           toolchain changes over time.
> > > > > @@ -277,7 +282,7 @@ config DEBUG_INFO_DWARF4
> > > > >  config DEBUG_INFO_DWARF5
> > > > >         bool "Generate DWARF Version 5 debuginfo"
> > > > >         select DEBUG_INFO
> > > > > -       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
> > > > > +       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> > > > >         help
> > > > >           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
> > > > >           5.0+ accepts the -gdwarf-5 flag but only had partial support for some
> > > > >
> > > > > base-commit: bb1435f3f575b5213eaf27434efa3971f51c01de
> > > > > --
> > > > > 2.38.0
> > > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > > ~Nick Desaulniers
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
