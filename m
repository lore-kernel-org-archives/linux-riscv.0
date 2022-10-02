Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF10C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBgx2RBcpOkG/RoTkEP+EuZCxTd2gSF7vdVf9d9Pr6w=; b=ttjZJg/PEDqdfl
	azRcR51WeMZ1lprNTCgt8k6ghPM/UyqRZiOeqDNB656o95wFJ1mtvWcPC7/4rWrvSofBMRa9MqeI6
	DPJ36H4mELWMcnVYqEplIjCiSfYsDalidG94V4u4uJfC+U5oMXx1XLQH/Yml3GCQeZSH8S72jbui4
	QVQ7Zpm7EWXHmQj4KbmMkoiYCuNvQUeFXv+SqAKy/xlR/0j6kCkyaxftjawdw+nl5Q0sFohq2wDpa
	TcIO47EG8dHz5SYNCOR0VpUbWecy7pwC7W9P7Czk2+m7lj4safubFp1I+3kUSzSIFPywEqQ0SQf84
	hOzvepysy/e7fLq1Smlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of3GS-0020qs-7g; Sun, 02 Oct 2022 18:00:32 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of3GP-0020pz-5E
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 18:00:31 +0000
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 292HxoaL005178
	for <linux-riscv@lists.infradead.org>; Mon, 3 Oct 2022 02:59:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 292HxoaL005178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664733591;
	bh=R7PtaZgk8+x+PYWDXdf99v3/AVCGe2a94wV004hUH6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xO0A9g6RUJDnwA9CSB2weCoEo3scGkQp28Ccfl360YU0NCEKRWy8ePTKXF+LpHcCR
	 Qj+uhXnzOk6WVPdOivwCgrAz7CzjtAT2/dm4OAICaja5guzw8Ros+o2qneakR8IlcE
	 eOSnFVXdQxApRAhSyA02do3kR+7Zdc9roadR+3ITb5vb0BgjeSJGf+iL34U8xQ6NH1
	 4M1Vwgd6UeNDob+6avKBE8LCKNKyladdUYnQOT6hdEiL039kktvXWBi2VsTzY6bDYN
	 U8k9p7ishUwJp9e7S4E8ujIUIHoxuF2je2jy5/laGeRgdNtZSoIt28LQeskpSxA1ai
	 7iIt7ux3HRO6w==
X-Nifty-SrcIP: [209.85.167.180]
Received: by mail-oi1-f180.google.com with SMTP id n83so9545828oif.11
        for <linux-riscv@lists.infradead.org>; Sun, 02 Oct 2022 10:59:51 -0700 (PDT)
X-Gm-Message-State: ACrzQf1xSjXcVB8wf7XGgEsPPbiW1DPysLWGzL9CXFn5DlA4rzneZekS
	/ulfZeILj+WkCaofGvFfXpU/06z87WiTHMLPYqc=
X-Google-Smtp-Source: AMsMyM71XYvBGKDOzldQA/iz6nCeMmIE5deiPHcMCnEuC+39NL3vd7LcIFvceQocZO4CUjwu53RMLDmfQcWmNz4h5P4=
X-Received: by 2002:a54:400c:0:b0:34f:9913:262 with SMTP id
 x12-20020a54400c000000b0034f99130262mr2676040oie.287.1664733590046; Sun, 02
 Oct 2022 10:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org> <CAKwvOdmPLqX=oCwg43TYHj=tdoaU5OYc=bO906u=LeqcSrx+Dw@mail.gmail.com>
 <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X> <CAKwvOdk87wRWoiVjswZPwoLbSm+sYsMW6FHZv+r6MHxLHn0Trw@mail.gmail.com>
In-Reply-To: <CAKwvOdk87wRWoiVjswZPwoLbSm+sYsMW6FHZv+r6MHxLHn0Trw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Oct 2022 02:59:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtS_cVVjsV32S8hQJNER3jN9frnRosz4rfQ6+TkXKUtg@mail.gmail.com>
Message-ID: <CAK7LNAQtS_cVVjsV32S8hQJNER3jN9frnRosz4rfQ6+TkXKUtg@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, Tom Rix <trix@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev,
        Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_110029_675659_5FD1725D 
X-CRM114-Status: GOOD (  25.45  )
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

On Thu, Sep 29, 2022 at 6:53 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 28, 2022 at 2:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Sep 28, 2022 at 02:13:47PM -0700, Nick Desaulniers wrote:
> > > Reraising my concern from
> > > https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1258678969
> >
> > Sorry, I thought I addressed your concern with my comment right below it
> > but I probably should have worded it better.
>
> No, I just missed your point about other architectures.
>
> > > We've put a fair amount of work into getting CC=clang LLVM_IAS=0 to
> > > work for DWARF v5 (both on the GNU binutils side, and Kbuild), I'd
> > > hate to see that effectively knee-capped because of an issue in GNU
> > > binutils that is only relevant for one architecture.
> >
> > Sure, that is a completely reasonable concern. However...
> >
> > > I'd concede support for ARCH=riscv, but not for all other
> > > architectures, which this effectively does.
> >
> > No, it does not, CONFIG_AS_HAS_NON_CONST_LEB128 can still be enabled
> > when GNU as supports this construct for a particular architecture; as
> > far as I can tell, RISC-V is the only one that doesn't. See the tests
> > with ARCH=arm64 and ARCH=x86_64 compared with ARCH=riscv below.
>
> Ah, sorry for the noise then. Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> --
> Thanks,
> ~Nick Desaulniers




This patch is incomplete.

It looks like Clang 14 switched to DWARF v5 by default.

I see the same errors for
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y





masahiro@zoe:~/ref/linux$ clang --version | head -n1
Ubuntu clang version 14.0.0-1ubuntu1
masahiro@zoe:~/ref/linux$ grep DEBUG_INFO_DWARF .config
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
masahiro@zoe:~/ref/linux$ make ARCH=riscv LLVM=1 LLVM_IAS=0
CROSS_COMPILE=riscv64-linux-gnu- -j24
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
/tmp/vgettimeofday-5997b4.s: Assembler messages:
/tmp/vgettimeofday-5997b4.s:2698: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2699: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2705: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2706: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2712: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2713: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2719: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2720: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2726: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2727: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2731: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2732: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2736: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2737: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2743: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2744: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2748: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2749: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2755: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2756: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2760: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2761: Error: non-constant .uleb128 is not supported
/tmp/vgettimeofday-5997b4.s:2765: Error: non-constant .uleb128 is not supported
   ...


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
