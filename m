Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B6DC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 20:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9212078A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 20:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szaV+EPC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="RwCEbkr7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B9212078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WKVSbS8Jgpwv9Hl18xORxgasFQyXKqHJbiNPcHWkeJ8=; b=szaV+EPCdOwr3yynnGGOsNVz1
	aZ9Ot2Z2iJd/sg6yhC426X8gpmCin5iWVsgUh6C7/ZZIIhxhZmpudQzHnD/YT/SmPiMHXtSzSk80n
	8uSElqy9SOaGFainbYO2mdffnG2MF/CwJjU7RI3cDqaD82qa9U4zipGTT3tdqrgXqvtAMsZHx/qpY
	KfTFal/qOrBTo0+cAYeVBA72gONTrFPKfX+o//yJidaHBL/XBquO9Xu9cXBdGfG4p+TMttU2NPJvk
	8akeWigSGyd/WD8Ba3k1PBjKTBS5+JSaiXgle+ZT34sR1knY2DzCBN3V08d4m6RaXwNPDfSyDi5hc
	Umq//nKoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq06W-0003oO-Qe; Mon, 29 Jun 2020 20:10:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq06T-0003mf-H9
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 20:10:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id s10so17808301wrw.12
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DuXPs2KRc0kRkrIeNHomDGkRgeQMj5m4hx2hmqHrvd0=;
 b=RwCEbkr7yIXMwaL6oCI6h3TFBrn9VLnCgp8TQCTIrSgyVQuzK7Iywclm3ny1C/A1j6
 CiUUsHeusFGkR4ofBNlMT4xs3Kk14kgzfpLpcB8o5VTHHC+x3qfdunD/jM1rZKGu8j+1
 HFbJcxtTP50PS+jYQqGKvl03Itsy8M6Zm5+f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DuXPs2KRc0kRkrIeNHomDGkRgeQMj5m4hx2hmqHrvd0=;
 b=F/AIQd5mLv+JSAFYK7kvqzYqKbF3KLaBmLaOW2NimBjaUA3HqzKT1KK3rsCKz4PCVG
 uXXo8wiH1MoRCv9lveR4sz6SzSWaAM1wQNIGX9aJK4dl3QegZrMKO9aiP1R4GH0NBhFh
 oPIO0wXVbfq58Pv6v8TJHI9x//NnF4QbBq3Vfzutac4v/w3yLbLGsL//AiT9BhuCqzCY
 5N0BugSdIenLprFvQOjYsHHXutQOp3LyLH5pAsWCBdyXHS4zAg1mxDph/T9KJFyT1AI2
 62vUkewYVHzQvG0hZSoKtJAEz+2CUCtKvETUaBAJ70x+4/hArCnQGgHoIIR2Unh0psUe
 TQxw==
X-Gm-Message-State: AOAM530Kkabcd8lEJUYam7BAo/GmxuGiQlzb5aExEHKT+J9efKaapoWZ
 u12xvi87qM0IUnLHEahlWxuUZqcdILhX4dcG6C2e
X-Google-Smtp-Source: ABdhPJxHxREtLEN5Xz2f+V7HyVEy8DgsTaByjDILcaX0i/Qvfu6F12G1pzyMk4t6el/9QubVSfamdtO8NvLTSslFfjc=
X-Received: by 2002:adf:e884:: with SMTP id d4mr17770822wrm.176.1593461406779; 
 Mon, 29 Jun 2020 13:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200625234516.31406-1-atish.patra@wdc.com>
 <20200625234516.31406-2-atish.patra@wdc.com>
 <5e2ce2ae-5458-8579-576a-76721f7d3b08@gmx.de>
 <CAOnJCUKnB7kLdTh1-NaFNw4p6EammETzhUa-Uniq2rrC-7AaQg@mail.gmail.com>
 <CAMj1kXFyQiYPYB-81POq7agRW1ROt=2j3nN9wcpHGmr4YjmFCQ@mail.gmail.com>
 <CAMj1kXFd3wpob228WOYOu3SG0r2SEbT0cZF1JkF6uwjzrmf2EQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFd3wpob228WOYOu3SG0r2SEbT0cZF1JkF6uwjzrmf2EQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 29 Jun 2020 13:09:55 -0700
Message-ID: <CAOnJCUJAdMoTEtxn8Q0Frxi9fw6PS052e3jp2CSJszmGBPp4kA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] efi: Fix gcc error around __umoddi3 for 32 bit
 builds
To: Ard Biesheuvel <ardb@kernel.org>
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

On Sat, Jun 27, 2020 at 2:22 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 27 Jun 2020 at 00:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Fri, 26 Jun 2020 at 23:56, Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Thu, Jun 25, 2020 at 7:43 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > >
> > > > On 6/26/20 1:45 AM, Atish Patra wrote:
> > > > > 32bit gcc doesn't support modulo operation on 64 bit data. It results in
> > > > > a __umoddi3 error while building EFI for 32 bit.
> > > > >
> > > > > Use bitwise operations instead of modulo operations to fix the issue.
> > > > >
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > ---
> > > > >  drivers/firmware/efi/libstub/alignedmem.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/firmware/efi/libstub/alignedmem.c b/drivers/firmware/efi/libstub/alignedmem.c
> > > > > index cc89c4d6196f..1de9878ddd3a 100644
> > > > > --- a/drivers/firmware/efi/libstub/alignedmem.c
> > > > > +++ b/drivers/firmware/efi/libstub/alignedmem.c
> > > > > @@ -44,7 +44,7 @@ efi_status_t efi_allocate_pages_aligned(unsigned long size, unsigned long *addr,
> > > > >       *addr = ALIGN((unsigned long)alloc_addr, align);
> > > > >
> > > > >       if (slack > 0) {
> > > > > -             int l = (alloc_addr % align) / EFI_PAGE_SIZE;
> > > > > +             int l = (alloc_addr & (align - 1)) / EFI_PAGE_SIZE;
> > > >
> > > > Here you rely on the compiler to silently convert the division by
> > > > EFI_PAGE_SIZE into a right shift. Wouldn't it be cleaner to use
> > > > EFI_PAGE_SHIFT to explicitly avoid a dependency on __udivdi3()?
> > > >
> > > > slack = (align >> EFI_PAGE_SHIFT) - 1;
> > > > ...
> > > > int l = (alloc_addr & (align - 1)) >> EFI_PAGE_SHIFT;
> > > >
> > >
> > > Sure. I will update it in the next version. Thanks for the suggestion.
> >
> > Please don't. Dividing by EFI_PAGE_SIZE is perfectly fine, and is more readable.
>
> Actually, I will take this patch as a fix right away - 32-bit ARM has
> the same issue (although it does not actually incorporate this object
> file)
>

Thanks. I will drop it from my next version in that case.

> In the meantime, please check how the stub gets pulled into your
> kernel: the idea of a static library is that only the objects that are
> used are included in the final build, but this turned out to be broken
> for arm64 [0]. IOW, simply applying a similar change might fix your
> build issue as well (assuming RISC-V does not actually call
> efi_allocate_pages_aligned() anywhere)
>
Sorry. I missed this thread earlier. Yes. Applying a similar change
fixes the static library linking for RISC-V. I don't see
efi_allocate_pages_aligned or efi_random_alloc
in vmlinux anymore. I will update my patch. Thanks.

I did not see any new version of the next patch in that series [1].
Thus, I am leaving libstub/Makefile changes
as it is. Please let me know if I missed something.

[1] https://lore.kernel.org/linux-efi/CAMj1kXGg-w6N7jyG0pBJmeRctAhG2wWGoU=ryWj+Qi2UH-_m9Q@mail.gmail.com/

> [0] https://lore.kernel.org/linux-arm-kernel/20200604022031.164207-1-masahiroy@kernel.org/



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
