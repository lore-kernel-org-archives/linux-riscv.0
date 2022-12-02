Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A75BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmKyzcjTwDa+RO9nKK6UuyYuQSettWP+tQJlYfbMOXE=; b=a7C9OkY2ss/aJ9
	c8kC1LuyawXRkReKzLl+UnhDAuxppWpZS3RqbY4i4C2x5jV1hw5LBdWBmxBKXVRfjWCnFe200xdgw
	Ri1KltbVQZ61K/QMCALs780Urf5BbLyyTu4+7ZHhMIG4930PETQImdvI9Jnc1VLtsTTyx9S+0+nxQ
	51oUvk/6ejAZgjz7pPnpgME5maLIemFxJPqVPKVhbYtE72myuwCOdlaMk6I4WfS3CaQIXrEt7J54L
	9qqyzMCreIAXDhttOCGN2X05CEj33JDhyRVQyN/s2UIi2N1BmQLZ8OrUUG6aKT4yYlG8iz4f/tKxW
	lxcExbTY0jScRL7CGd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11H8-00ERuO-5s; Fri, 02 Dec 2022 08:20:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11H4-00ERs5-7y
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 08:19:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A80A61F8C
	for <linux-riscv@lists.infradead.org>; Fri,  2 Dec 2022 08:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8C5C433D6
	for <linux-riscv@lists.infradead.org>; Fri,  2 Dec 2022 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669969197;
	bh=0ZnuSrqRuhjsk8n2SNjuiavyYPMTBT4baAW3idwtSMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PEJWzUXY6QnPddhCAbQA8Ln91+6Q5En2+9t2sVpA4vsVdZe77SuR6aAi/8+gTnUCR
	 FGXnBVhujiFE5Ecac3Q5VKonJpxy0TEepShozzYro8G1s1nSLHatxRrQuwIF44WjxK
	 P1Linb7dP2eP+zcHeHs5oEzMJDEP0FMH/cbn3VinGNrwUd30hHB3a2q3kK33WHePOR
	 VxLQdHy5iBkGnEfnZuebaIPFlPYpoXKE632mnDepqho/B+FJbLwg+KEjt3En0eAC9H
	 Jm8E6sIXamcHVA/XHuoqnm3M9TGSdcTQiAhsoO610SUf/lUpWB/s1K7/SI++D0smW4
	 JI6nJ2bGNJDZQ==
Received: by mail-lf1-f46.google.com with SMTP id g7so6305606lfv.5
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 00:19:56 -0800 (PST)
X-Gm-Message-State: ANoB5pn8S90Jr2etbUqSMVUsBihfeEJ5cgYkyC3rbm1+YClYrmtUuHC8
	RHUeqQ/on74VK3y/Uyu0Dc7/ZylVRwN7q8Oeh28=
X-Google-Smtp-Source: AA0mqf5YZdoAmm+Igxnj0lPbYCtmTJqEXXksr0fEhk12uTEra6daOFKOHf35q/qBplj4yWq5qKZdMFxf9LtEh2101pc=
X-Received: by 2002:a05:6512:3e2a:b0:4ab:534b:1b2c with SMTP id
 i42-20020a0565123e2a00b004ab534b1b2cmr18339569lfv.426.1669969194978; Fri, 02
 Dec 2022 00:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20221130225614.1594256-14-heiko@sntech.de> <mhng-3dd5efb0-e79f-4978-89a8-f9ec02004a7e@palmer-ri-x1c9a>
In-Reply-To: <mhng-3dd5efb0-e79f-4978-89a8-f9ec02004a7e@palmer-ri-x1c9a>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Dec 2022 09:19:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFHuSzZ2X3+Z0wj6BZ5YrPwaaQrHJWGc48A-C2M8A=5Mw@mail.gmail.com>
Message-ID: <CAMj1kXFHuSzZ2X3+Z0wj6BZ5YrPwaaQrHJWGc48A-C2M8A=5Mw@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] RISC-V: add infrastructure to allow different
 str* implementations
To: Palmer Dabbelt <palmer@dabbelt.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Cc: heiko@sntech.de, Ard Biesheuvel <aardb@kernel.org>, linux-riscv@lists.infradead.org, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, 
	Conor Dooley <conor@kernel.org>, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, 
	emil.renner.berthing@canonical.com, linux-efi@vger.kernel.org, 
	heiko.stuebner@vrull.eu, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_001958_397480_97DAE78B 
X-CRM114-Status: GOOD (  33.94  )
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

On Fri, 2 Dec 2022 at 05:08, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 30 Nov 2022 14:56:13 PST (-0800), heiko@sntech.de wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > Depending on supported extensions on specific RISC-V cores,
> > optimized str* functions might make sense.
> >
> > This adds basic infrastructure to allow patching the function calls
> > via alternatives later on.
> >
> > The main idea is to have the core str* functions be inline functions
> > which then call the most optimized variant and this call then be
> > replaced via alternatives.
> >
> > The big advantage is that we don't need additional calls.
> > Though we need to duplicate the generic functions as the main code
> > expects either itself or the architecture to provide the str* functions.
> >
> > The added *_generic functions are done in assembler (taken from
> > disassembling the main-kernel functions for now) to allow us to control
> > the used registers.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/Makefile             |  3 ++
> >  arch/riscv/include/asm/string.h | 66 +++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/image-vars.h  |  6 +--
> >  arch/riscv/lib/Makefile         |  3 ++
> >  arch/riscv/lib/strcmp.S         | 38 +++++++++++++++++++
> >  arch/riscv/lib/strlen.S         | 29 +++++++++++++++
> >  arch/riscv/lib/strncmp.S        | 41 ++++++++++++++++++++
> >  7 files changed, 183 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/riscv/lib/strcmp.S
> >  create mode 100644 arch/riscv/lib/strlen.S
> >  create mode 100644 arch/riscv/lib/strncmp.S
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 0d13b597cb55..581e4370c2a6 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -80,6 +80,9 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
> >          KBUILD_CFLAGS += -fno-omit-frame-pointer
> >  endif
> >
> > +# strchr is special case, as gcc might want to call its own strlen from there
> > +KBUILD_CFLAGS += -fno-builtin-strlen -fno-builtin-strcmp -fno-builtin-strncmp -fno-builtin-strchr
>
> I was poking around Ard's comment on that -DRISCV_EFI to try and figure
> out what it was doing, but I think this is the bigger issue.  I haven't
> benchmarked anything, but my guess is that turning off support for these
> builtin routines will outweigh the faster outline implementations of
> these routines.  I don't have any benchmarks to prove that, but in
> general compilers are pretty smart about handling these builtin routines
> in the common cases and deferring that to runtime is probably the wrong
> option.
>

Indeed. Case in point:

riscv64-linux-gnugcc -O -S -o - -xc - <<<"int foo() { return strlen(\"bar\"); }"

gives me

li a0,3
ret

whereas this

riscv64-linux-gnu-gcc -fno-builtin-strlen -O -S -o - -xc - <<<"int
foo() { return strlen(\"bar\"); }"

gives me

.LC0:
  .string "bar"
  .text
  .align 1
  .globl foo
  .type foo, @function
foo:
  addi sp,sp,-16
  sd ra,8(sp)
  lla a0,.LC0
  call strlen@plt
  ld ra,8(sp)
  addi sp,sp,16
  jr ra

Other str* and mem* routines are optimized in similar ways when
dealing with small sizes or compile time constants.

Also, I'd recommend avoiding redefining these prototypes to static
inline as it deviates from the official prototypes in the C library.

> I haven't looked all that closely at this patch set.  Is there some
> reason it's necessary to disable the builtin handling?  If not then my
> guess is it's better to leave that enabled unless some benchmarks show
> otherwise (and I don't know of any Zb* hardware to test against).
>

Why not have a single generic version of each in the binary with a
patchable NOP at the start, and patch that to an optimized version
when available? That way. all of the early code can remain as is.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
