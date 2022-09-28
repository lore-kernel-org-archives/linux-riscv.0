Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB0FC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aesFGhm/HW1xLSP5AHIJm8dWGqym156riVZ8l3xe4A=; b=r2q97FF8DLRBLi
	CR3W3B+DFR0IrYTEPAvDbETUU1A9j+aoNd2ryT3tN69uCRArRW7S2gLYQQ9QplEl+qQJnMEf7mxGN
	+J2Fd54fk6YZWU7uHSo7yk9OTxyFydKrWWUn/PPZ2nRa9fl2sUXU9zjWScVx0Yf18Kgm/ahQvku+7
	89IE9uy6+nYQ3pg8JOmJYU428O+wKSZu+rLqGYpVGSomJhy6ErKpLHgVwvsq8Bnf7M2pKcmv36xCd
	V6MHCWSzRe8MNJ2XoSzatrPZMwsoVuF8Gf7rjR6T6UAm1BZi35khvEiZYCIYYSmX3OpPdgd2z4VlH
	4k3qrflF2ysEqHW1oPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odeNa-000PuP-3W; Wed, 28 Sep 2022 21:14:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odeNW-000Psq-AB
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 21:14:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso3985156pjk.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=v0k9ORqQb3RbZ04b8VgsYD7iTc3Y46CtHEmVrhJH2aA=;
        b=fDfRgrlfSwRvlwVBa7jPlMJDqaCg6wsEHOT7OqSyBKAwnbZk6dz9cP4cMffi0sp/Yg
         fypu2QW/qpEFEenbak6VjgyLvGsb45/wHZrOWfvj5mMxNp1NiOt62JtWip07ZAcQNBSX
         SPhKDIg/NI9KoQR2FwaZ6LlP9suMPm8BiBT9Ernxw8IpwhJ5SD34AEJT0yOKm8xlcoVe
         eUhZ1K5yQOPppu8f6js57n9XanNs8w844SysHgQWa3uTQTP26mMUvEE1lwd0wHXyqvk5
         yndOqptt7kEva4tqdWYz7DIS8xize+NdLxGSKJkvw/Ft8LmNvbchLTmnH7x9fLvQz8Qx
         gZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=v0k9ORqQb3RbZ04b8VgsYD7iTc3Y46CtHEmVrhJH2aA=;
        b=sn+T3p4D+HrVs7ywu7QZtvJRFuLTc++h+CHuIoMqc/6TUYTHBAYLjF50NFNCvHQW89
         +Qvs18YKF19k+Q+T2fdBidx2fdrqP9ynHbCb7nsDbP4Ga9KrRppoc42h7rfstZ5vc7fP
         sQlyrGwdzi8Qg4XQ9C+/ldTOFgWqTxmMlin4gH1RN7aCnwsDn5wmKNVvF5nGjX1FfwR9
         xSph0nkiakAuaRC0chZLc+aaxjPzhU5Pa24ntpIBMxHbTQTBoRbjFJ0YodWWioUs3A3C
         OzLVTMyYUBAhtLK4fzJoC115s3+ElOO4VzOAX5dwMhhXnyWrJy4lxXNy4of1V3k8dD63
         p71Q==
X-Gm-Message-State: ACrzQf0UL8QV94h5vgSxtl2CQTfb4E78CHiuh4orPWJx+Y9Oyv0TnXfI
	H+jNqNM5TToflNzLHAU2w7GF6P3X/tosN5qahOk0C5HTRPh2pQ==
X-Google-Smtp-Source: AMsMyM5UboqUpZNmThgqY9aypu7QDq6EQiZROsKNTuF1cWEnMhwu6Bc1VIOtQQrULDIr++MWCEcRuu19vGWr2u4E0Kk=
X-Received: by 2002:a17:90b:1d0f:b0:202:be3e:a14a with SMTP id
 on15-20020a17090b1d0f00b00202be3ea14amr12512808pjb.102.1664399639224; Wed, 28
 Sep 2022 14:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org>
In-Reply-To: <20220928182523.3105953-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 14:13:47 -0700
Message-ID: <CAKwvOdmPLqX=oCwg43TYHj=tdoaU5OYc=bO906u=LeqcSrx+Dw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, llvm@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_141402_377680_8196E6F4 
X-CRM114-Status: GOOD (  27.40  )
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

On Wed, Sep 28, 2022 at 11:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
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
> +       depends on !CC_IS_CLANG || AS_HAS_NON_CONST_LEB128

Reraising my concern from
https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1258678969

We've put a fair amount of work into getting CC=clang LLVM_IAS=0 to
work for DWARF v5 (both on the GNU binutils side, and Kbuild), I'd
hate to see that effectively knee-capped because of an issue in GNU
binutils that is only relevant for one architecture.

I'd concede support for ARCH=riscv, but not for all other
architectures, which this effectively does.

>         help
>           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
>           5.0+ accepts the -gdwarf-5 flag but only had partial support for some
>
> base-commit: f76349cf41451c5c42a99f18a9163377e4b364ff
> --
> 2.37.3
>
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
