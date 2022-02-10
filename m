Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B388C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+/FUP3kTfM1kHY3ez0IR8Jwa6vsufgadDYYtQFnwA4=; b=YdqoZ0KZfHys+B
	MWLBZB9/IxpW6Sbm8/d7MYc/dVl07P9NXzNMsucbc56dH9ItYec3lk0tyJADpo4CMdnNVHbWKFpih
	mSAqQuO5lHjvq6nWmV9JazuVi6V6c0EjSQeemXn2Yn1XSwtnC6PqekzL5UtJqJpj6nALFxBlqComt
	x7vuhUpsfV8kaBxTyx+5dXAw54vW786yuQZwG8GuOAQ37Q+WFTDC99wCRcCxZ/oGZavwnjOqZ66+P
	55j8XjhNNFPiMNuV9h44lkyID72NsxvEXW3ThBGQz6PCs9lAShycsFzb3gTBjJOY7ldIC21g/RTu4
	PjYpJc7Ti6EHeZyir13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIDg3-004YLq-NU; Thu, 10 Feb 2022 17:56:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIDg0-004Y32-Fz
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 17:56:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9031661D15;
 Thu, 10 Feb 2022 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70648C004E1;
 Thu, 10 Feb 2022 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644515775;
 bh=mp2WY1Z07IUjp9Qk8J2PhJawFi/dDHvgiH8vGbexGRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFRSKpDwJ8tH9Ko3XvxybAcXr9GE36E4SzO+uwgbYhqIou6MC6C0tZ7JzQ7IRJBLy
 6PsshJNUi535eP4JUvCxtTY4i9W08ztaEQwOuI+BnpNyMyI5iF3jJkk2PECLtLZxFs
 MDPipXog5CPfVtQxG06kzrZ3qHlQd2TW4QarW0YI=
Date: Thu, 10 Feb 2022 18:56:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: aurelien@aurel32.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
Message-ID: <YgVRu9Z0BDyJdjR5@kroah.com>
References: <20220126171442.1338740-1-aurelien@aurel32.net>
 <mhng-f5101f2f-eb08-4e20-8cb3-b7d267ba25bc@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-f5101f2f-eb08-4e20-8cb3-b7d267ba25bc@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_095616_644860_D49B1E1E 
X-CRM114-Status: GOOD (  24.38  )
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

On Thu, Feb 10, 2022 at 09:40:22AM -0800, Palmer Dabbelt wrote:
> On Wed, 26 Jan 2022 09:14:42 PST (-0800), aurelien@aurel32.net wrote:
> > From version 2.38, binutils default to ISA spec version 20191213. This
> > means that the csr read/write (csrr*/csrw*) instructions and fence.i
> > instruction has separated from the `I` extension, become two standalone
> > extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> > this causes the following build failure:
> > 
> >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
> > 
> > The fix is to specify those extensions explicitely in -march. However as
> > older binutils version do not support this, we first need to detect
> > that.
> > 
> > Cc: stable@vger.kernel.org # 4.15+
> > Cc: Kito Cheng <kito.cheng@gmail.com>
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 8a107ed18b0d..7d81102cffd4 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> >  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> >  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> >  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > +
> > +# Newer binutils versions default to ISA spec version 20191213 which moves some
> > +# instructions from the I extension to the Zicsr and Zifencei extensions.
> > +toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> > +riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> > +
> >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> 
> Thanks, this is on fixes.  It's CC stable, but doesn't have a "Fixes" tag --
> I did that on purpose as this isn't really fixing a bug in Linux so I'm not
> sure it's right to point at a particular patch, but I'm not sure how that
> will play with the stable tree.

I will backport it as far back as it easily goes to, and then forget
about it :)

If you have a Fixes: tag, and it doesn't properly backport that far,
then you will get a "FAILED:" email notifying you about it.

hope that helps explain things,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
