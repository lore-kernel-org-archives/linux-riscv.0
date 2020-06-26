Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0096EC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 22:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60B420B80
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 22:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jB0B1LIz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJoUvBwf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60B420B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7SLcWm735ObgD3D60G12a2bRtXIul16RyB1fwV2B8tA=; b=jB0B1LIzb+8Pvog/WwTVrQqwl
	7eRdfws4NZdHhl+cygogBmsAImhhrw9JMzj/W1YRhMAmCFGmZk7LCINcYRAS88BYEImCvWxVEK+8B
	emm/4tYdHNj/vm9VbJ2kcFRanDzfxTlZeEcpyBhQh77LOHsFtm6re/WV3NMyeurI0mWmM/wroLkDH
	D7lCR1BTp52uR63H95scg0moG38cZ9U5hPt+qejbcNv2UJBhNenp6x0iHM/V+FR9S4yAhzSNOxJxJ
	SaEtvuJBpBnxzalVvPezww3PybcuCIjcCH2CpX9ppyhpIucWJbATlCjWKpyEsQn7N3neuXmEWf3P5
	iCUBKphwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jowS3-0000aN-LY; Fri, 26 Jun 2020 22:04:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowRz-0000Zl-9d; Fri, 26 Jun 2020 22:04:00 +0000
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63F9C20B1F;
 Fri, 26 Jun 2020 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593209038;
 bh=WOQTvXobQ4W5JjaUMq7kWZE0jMQeOGk5MGW4rZFNYmQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FJoUvBwf+2SSHz2fr5vxPYd6aoefwHL0tlm86G/9+r8GmMcp2ZfwG8v/QP7defuDT
 D6lsId8SoNK8CT/QFVljdlp7a2LKRNtj3CK7eEWI766szCKWXBke3IKnvh4VpFJvxX
 DKoi6BJrlVFKVMovm4nd8G3e0rQBjBfAenxKjkPE=
Received: by mail-oi1-f171.google.com with SMTP id r8so9324589oij.5;
 Fri, 26 Jun 2020 15:03:58 -0700 (PDT)
X-Gm-Message-State: AOAM5335Q7S88WVooI3e48VrXmy8F/zNmjnWeGiDeGIubegldz7ov2sH
 XevAx0n+ce/iRr3nWIF5Rd5OhbYDiqJ5Muk64PE=
X-Google-Smtp-Source: ABdhPJyA7RXVNdsucLUlBYRk00ByTmKYmzuM59N4650Dy8dEYBHPZ8+pPQ4fBTN9TdwDgfB6PHfzTHaYzf0UmhXyeYs=
X-Received: by 2002:aca:ba03:: with SMTP id k3mr4145023oif.33.1593209037748;
 Fri, 26 Jun 2020 15:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200625234516.31406-1-atish.patra@wdc.com>
 <20200625234516.31406-2-atish.patra@wdc.com>
 <5e2ce2ae-5458-8579-576a-76721f7d3b08@gmx.de>
 <CAOnJCUKnB7kLdTh1-NaFNw4p6EammETzhUa-Uniq2rrC-7AaQg@mail.gmail.com>
In-Reply-To: <CAOnJCUKnB7kLdTh1-NaFNw4p6EammETzhUa-Uniq2rrC-7AaQg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 27 Jun 2020 00:03:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFyQiYPYB-81POq7agRW1ROt=2j3nN9wcpHGmr4YjmFCQ@mail.gmail.com>
Message-ID: <CAMj1kXFyQiYPYB-81POq7agRW1ROt=2j3nN9wcpHGmr4YjmFCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] efi: Fix gcc error around __umoddi3 for 32 bit
 builds
To: Atish Patra <atishp@atishpatra.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jun 2020 at 23:56, Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jun 25, 2020 at 7:43 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > On 6/26/20 1:45 AM, Atish Patra wrote:
> > > 32bit gcc doesn't support modulo operation on 64 bit data. It results in
> > > a __umoddi3 error while building EFI for 32 bit.
> > >
> > > Use bitwise operations instead of modulo operations to fix the issue.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  drivers/firmware/efi/libstub/alignedmem.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/efi/libstub/alignedmem.c b/drivers/firmware/efi/libstub/alignedmem.c
> > > index cc89c4d6196f..1de9878ddd3a 100644
> > > --- a/drivers/firmware/efi/libstub/alignedmem.c
> > > +++ b/drivers/firmware/efi/libstub/alignedmem.c
> > > @@ -44,7 +44,7 @@ efi_status_t efi_allocate_pages_aligned(unsigned long size, unsigned long *addr,
> > >       *addr = ALIGN((unsigned long)alloc_addr, align);
> > >
> > >       if (slack > 0) {
> > > -             int l = (alloc_addr % align) / EFI_PAGE_SIZE;
> > > +             int l = (alloc_addr & (align - 1)) / EFI_PAGE_SIZE;
> >
> > Here you rely on the compiler to silently convert the division by
> > EFI_PAGE_SIZE into a right shift. Wouldn't it be cleaner to use
> > EFI_PAGE_SHIFT to explicitly avoid a dependency on __udivdi3()?
> >
> > slack = (align >> EFI_PAGE_SHIFT) - 1;
> > ...
> > int l = (alloc_addr & (align - 1)) >> EFI_PAGE_SHIFT;
> >
>
> Sure. I will update it in the next version. Thanks for the suggestion.

Please don't. Dividing by EFI_PAGE_SIZE is perfectly fine, and is more readable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
