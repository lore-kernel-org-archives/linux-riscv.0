Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4AAC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 21:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997AE2089D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 21:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bcCy17jC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="g+CAS8Ul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997AE2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y1rN4V1I1SuLVdR9wcV9GEwSfLJAlyLxbnYi3jtIzOU=; b=bcCy17jCWS6TuUNmxpZivEqMh
	Y5AvysaWUkM6Glmu1CZZULrKz9iSnSpPEK9iqqQmgE/pT1wZap8VtoT0Z3wEYKgo9IPF+mUwHHCSG
	h/KpwEgmC9XAZ4yfSdddZghebWeQJBgvka/guBsle6AGfxSLWRCX5NLPjHA4TP7PGqROxhCqjeEot
	QO7uock8B5iCwMcrvzGaA6jNp7P7zx8u+2vrgt/BMcGWJ2J6QZJeCMGkSW5Tx0l408gzA6kOGZ+Wt
	rpq3XlICwWC+COdieM5dDEXYHhBEJsfU0OArzVGHuUpvGRGwn22Fi9uccswudaWHMjNvACAvD2yOf
	MLHSVKhGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jowKg-0007Sc-F1; Fri, 26 Jun 2020 21:56:26 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowKe-0007Ry-2w
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 21:56:25 +0000
Received: by mail-wm1-x343.google.com with SMTP id f139so10686955wmf.5
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s24mstSCNQlTFolgjec0iiKMpvfLNvCEazKvZzeEqpA=;
 b=g+CAS8UlAQOOsv4s7ohlbFkbJmOpPZq5OC7QRzoSqEzhhgE34Acd5sfrAMN8Uu9C3O
 WjP+DC/W4+0jp5qX9LvxioOw4eodRT/6RRpQpqrwVQ3/k7qf0G9GOfAGstoLym1Coe0G
 Xph832bBIMuzUv0udF9hevqW5Jxiwdj/IOadY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s24mstSCNQlTFolgjec0iiKMpvfLNvCEazKvZzeEqpA=;
 b=sheDJwTvD8oEEqkMrOMzBqUxAg8cJF18QuRg5IWdZI53AjpfTuB/ksGQlARPP4gxlh
 XupAF/QKOBXBz0fuGAFb/MhtePVUgsBxs2oKLZKPoqxR3AAz3s5JElagAbbW+gah++nO
 srdwJyQ5iYn6gX7r25flRG3VWBAAb7sxKd7UuNLRw8TtaMxw76wrQemjnHXMInN1HLLh
 HMVQlHZKkFJBKwbRg2lBF/oanL4V4rz4Xv87uD7I1ueQVbuo8RV3IAZdmx2x97vUFbvL
 lyriXHQoNag/2juQ81FPUv7/zE6cXkFkMPfiAXfgKIUg3RWyi4dIcogROFEG4a2RjRU+
 0Org==
X-Gm-Message-State: AOAM533Q85dZMqrcisZTnSnzKbBlRiMPpNGntOSt7/Kbu8FXgi4wOm2o
 cNt4WuGtYPIKF/kcaeCwcUOa5WFMmP/Jom65RWvM
X-Google-Smtp-Source: ABdhPJxvUiPRna7ukmDfkDR7tOrY35okfuOqyyzB1yZ0cFFCHPw0NEqSkR/UuIDigPHl1bx2wJyIWsX7BstpN+VvZ3U=
X-Received: by 2002:a1c:9d09:: with SMTP id g9mr5333593wme.31.1593208583105;
 Fri, 26 Jun 2020 14:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200625234516.31406-1-atish.patra@wdc.com>
 <20200625234516.31406-2-atish.patra@wdc.com>
 <5e2ce2ae-5458-8579-576a-76721f7d3b08@gmx.de>
In-Reply-To: <5e2ce2ae-5458-8579-576a-76721f7d3b08@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 26 Jun 2020 14:56:11 -0700
Message-ID: <CAOnJCUKnB7kLdTh1-NaFNw4p6EammETzhUa-Uniq2rrC-7AaQg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] efi: Fix gcc error around __umoddi3 for 32 bit
 builds
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
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
 Masahiro Yamada <masahiroy@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 7:43 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 6/26/20 1:45 AM, Atish Patra wrote:
> > 32bit gcc doesn't support modulo operation on 64 bit data. It results in
> > a __umoddi3 error while building EFI for 32 bit.
> >
> > Use bitwise operations instead of modulo operations to fix the issue.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  drivers/firmware/efi/libstub/alignedmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/alignedmem.c b/drivers/firmware/efi/libstub/alignedmem.c
> > index cc89c4d6196f..1de9878ddd3a 100644
> > --- a/drivers/firmware/efi/libstub/alignedmem.c
> > +++ b/drivers/firmware/efi/libstub/alignedmem.c
> > @@ -44,7 +44,7 @@ efi_status_t efi_allocate_pages_aligned(unsigned long size, unsigned long *addr,
> >       *addr = ALIGN((unsigned long)alloc_addr, align);
> >
> >       if (slack > 0) {
> > -             int l = (alloc_addr % align) / EFI_PAGE_SIZE;
> > +             int l = (alloc_addr & (align - 1)) / EFI_PAGE_SIZE;
>
> Here you rely on the compiler to silently convert the division by
> EFI_PAGE_SIZE into a right shift. Wouldn't it be cleaner to use
> EFI_PAGE_SHIFT to explicitly avoid a dependency on __udivdi3()?
>
> slack = (align >> EFI_PAGE_SHIFT) - 1;
> ...
> int l = (alloc_addr & (align - 1)) >> EFI_PAGE_SHIFT;
>

Sure. I will update it in the next version. Thanks for the suggestion.
> Best regards
>
> Heinrich
>
> >
> >               if (l) {
> >                       efi_bs_call(free_pages, alloc_addr, slack - l + 1);
> >
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
