Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635AEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajhj65VpH4Frr7L7bVajlhYcP4rx+Gh9S6jvouoiZvQ=; b=evP8CqV2iqxO5p
	zO3EyuQDUvUVf43IdJy5nOAOCck1UvIaEUENuT24mivxlj/QccXEjTpOmDuA97Hk1m0DYCdOXgNTX
	EslfmE5lW9LnwAEj8pSee5bdzKOIzNEYamUxU9qyuYzb3W0+BZ3JiWvNj5VTje4NyEZAoy+AwvaEn
	NzzQU2GIzNnON9t0tFGDDQ3OgTq+z3Y4+EYz2aPt6iYy/vBECp2USiLzxjcrNWiRJBtRVSE1ddXZD
	y4Ge8oZ8UesL+n6lg7v0WPcjkXyUyHN0vCTcwV9nPss40otQZ7mAdI5RljgBwSLhJEj/BshQyznHk
	UO4rQF7fYNWLqduIIPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of411-0028wf-03; Sun, 02 Oct 2022 18:48:39 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of40x-0028uT-Li
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 18:48:37 +0000
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 292Im85u021233
	for <linux-riscv@lists.infradead.org>; Mon, 3 Oct 2022 03:48:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 292Im85u021233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664736489;
	bh=TRjUcYAKDUQUfOl2UzVa5Db91m2ohyT00gg0PveXTJw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cazvcCWRVaggUGDRHkSjgmGgbkC5Mc1zyB8gIqbwNm/CJKqG1RwJVo9tKr0+4kqy1
	 K/1v3k1Ua7Nrbnnx3FaKQ6N0LnrmcItK0O1QIbWSH0+/3KQBPPLQTHSvV2TueMn5WV
	 TkJuTEzhxhss+KPcH8n1ZOPOCcXXWWtzXlZUfvayvzTrs09ZtlTAxHbv3/ItLm8L7A
	 DtNEDM4Va6ldfeE1RzNY3UdwuHs8tTVoHDsnQLfy0+ATp9a6CC80qkQSHj7ISNUZnD
	 8kC0v+V9+k7Alfm90th2XK6qPDtLWRrJ/oRZyrpcXTqwKYwrj8ND5Pguec3Pqnusp9
	 XDpZoLnbHYM7Q==
X-Nifty-SrcIP: [209.85.160.44]
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-131ea99262dso8588339fac.9
        for <linux-riscv@lists.infradead.org>; Sun, 02 Oct 2022 11:48:08 -0700 (PDT)
X-Gm-Message-State: ACrzQf240V9bPQ4WTHNDqWD69aJDAL7M7OAzxvCAqJ3OK6qjMjIac+Kw
	rd5FERJiJ161EWFUpU9ajzjA9U8ahRv7pxYI9OE=
X-Google-Smtp-Source: AMsMyM4psjYHeZSR3Ro25ovHwTFwKbX824K5RHhHzmMWugSJQEWv6mhM08TrewmcC0Qie5sVY26AvzSV6lPz2LWtbiY=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr3514681oab.287.1664736487445; Sun, 02
 Oct 2022 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org>
In-Reply-To: <20220928182523.3105953-1-nathan@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Oct 2022 03:47:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqoW-3fmFZBAbPuKhdRn4UD_o8jthVsBanyYzFWpzSSA@mail.gmail.com>
Message-ID: <CAK7LNATqoW-3fmFZBAbPuKhdRn4UD_o8jthVsBanyYzFWpzSSA@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev,
        Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_114835_958808_F56BE55C 
X-CRM114-Status: GOOD (  24.89  )
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

On Thu, Sep 29, 2022 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with a RISC-V kernel with DWARF5 debug info using clang
> and the GNU assembler, several instances of the following error appear:
>
>   /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported
>
> Dumping the .s file reveals these .uleb128 directives come from
> .debug_loc and .debug_ranges:
>
>   .Ldebug_loc0:
>           .byte   4                               # DW_LLE_offset_pair
>           .uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
>           .uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
>           .byte   1                               # Loc expr size
>           .byte   90                              # DW_OP_reg10
>           .byte   0                               # DW_LLE_end_of_list
>
>   .Ldebug_ranges0:
>           .byte   4                               # DW_RLE_offset_pair
>           .uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
>           .uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
>           .byte   4                               # DW_RLE_offset_pair
>           .uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
>           .uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
>           .byte   0                               # DW_RLE_end_of_list
>
> There is an outstanding binutils issue to support a non-constant operand
> to .sleb128 and .uleb128 in GAS for RISC-V but there does not appear to
> be any movement on it, due to concerns over how it would work with
> linker relaxation.
>
> To avoid these build errors, prevent DWARF5 from being selected when
> using clang and an assembler that does not have support for these symbol
> deltas, which can be easily checked in Kconfig with as-instr plus the
> small test program from the dwz test suite from the binutils issue.
>
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> Link: https://github.com/ClangBuiltLinux/linux/issues/1719
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  lib/Kconfig.debug | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d3e5f36bb01e..19de03ead2ed 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -231,6 +231,9 @@ config DEBUG_INFO
>           in the "Debug information" choice below, indicating that debug
>           information will be generated for build targets.
>
> +config AS_HAS_NON_CONST_LEB128
> +       def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
> +
>  choice
>         prompt "Debug information"
>         depends on DEBUG_KERNEL
> @@ -277,6 +280,10 @@ config DEBUG_INFO_DWARF5
>         bool "Generate DWARF Version 5 debuginfo"
>         select DEBUG_INFO
>         depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
> +       # Clang is known to generate .{s,u}leb128 with symbol deltas with
> +       # DWARF5, which some targets may not support.
> +       # https://sourceware.org/bugzilla/show_bug.cgi?id=27215



If you plan to patch both DWARF_TOOLCHAIN_DEFAULT and DWARF5,
it will be cleaner to move this comment to AS_HAS_NON_CONST_LEB128.



> +       depends on !CC_IS_CLANG || AS_HAS_NON_CONST_LEB128



The condition "!CC_IS_CLANG" is repeated here.

If you use the following patch as basic,
https://lore.kernel.org/lkml/20221002181107.51286-2-masahiroy@kernel.org/T/#u

you can write the code like this:


!CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 &&
AS_HAS_NON_CONST_LEB128)







Another big hammer solution is to give up Clang+GAS for CONFIG_DEBUG_INFO.
If we go this way, this patch is unneeded, though.
Thoughts?




-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
