Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C41AC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 03:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B25060ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 03:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B25060ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d54+21YWVVO4iAC7mZFK0WZ9ozC1VT5XvFhjBIT9LxE=; b=QK3L9es1/Qfej9
	h62TOO8wOF/vBk5jRIKYJVe7m9efyHlmxX6f9VwcsoCXnIVqmzAkjHBug+hFK3mxgj3rsVgXLw+Jc
	buZq93W8cdoSf50cQH9uG9SAxxz6H7MD0sM+kMuAgaAr0pkzOpL5kF2oQw2wNfeTFla0wd3f3e7I6
	KJxNbKSht0ZJ690JVY44qwF1D2FquLm71kqH0uF7cqaWglq2ndEcgDBs0QcTEx/m8AjlvJl6QVCXm
	B2GusjwzD7owTsAJmHO5mAzwlyY9bX/InTWWCmD3BhXBjM9jMCZe2uOTmkwqj2ijBx4IeDHvVVEk8
	1dDxgb/QGXrw23Xq4nIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB80q-004iJX-Ml; Wed, 04 Aug 2021 03:56:12 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB80n-004iJ2-Fy
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 03:56:10 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id b133so2058655ybg.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hj9+DJIOL+JCNgd1VkxAemug2Cv7GpybntcyarY0768=;
 b=E0W3PWSjR4jT3BElR92k5+zvvDnXGjBWFFwzmkloJRPzJc6WpqAKZVrEBLsr4OjVdN
 2wL/Gz+EeOaee78kFE1O1oCeXY7gKcYpLGfj6Rf5EoXpg6dr6SQZ3rke/Y50Net7cdqy
 817/hDiNPCFDrD9Arr91OFqa23801NnJn+ALmH1X3IVJMaGKoeqhz+2PPYXh/yQv6U60
 jL+vW/UvMvn6DXkOVYFukc/CSzk+7Ex/yCYYcSKK6lXP5u3kZu/YtFGdujY9Kgj2/uoM
 Ck18mKbkUd7F/5ltfWRSRHCGd+iR2XZM0NbCYtCnwU2CC+tJNJUY3ImfO//Y1Nlm0pU0
 YoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hj9+DJIOL+JCNgd1VkxAemug2Cv7GpybntcyarY0768=;
 b=aTIsFjI+oAyzxB+QY1EBPdftmanNLUdglFvF3wmieVESMu5B09pvaW+ZjaKbisVsaL
 kSiC8WUqr41iAlNVWLFBAyT8ajVjPREsSlwFXvsjQ89mB45qAsF5YI6AmwKgQzGCvSyd
 j/tga/eefSYAqsx9bloRy/1fOk7a7YYkHzL/EKoifhNUOFlLbNs0LLgAz2TsQP7IQp/Y
 4R+r99acoOSFPnItvam4S6cNNrWz9MQzENSCLii+zrSPqZtfZNpXXrnDhvHex/XjDs4A
 cVZFsgX6aariSFL1soLubFrEWaOOILmKcsVNrbSMCldj0yRCyMHshzIs0IR9n3LwDKGW
 QFSg==
X-Gm-Message-State: AOAM530uQScySlt7cw593N5vjkakocJwKjEH9UxT7VJPqXDBZroK6tfN
 mBYtEmWa2uj5O3Y8eqZcRk26MEYDc0iSbcQ6hSw=
X-Google-Smtp-Source: ABdhPJx3en8bRJvYJfxOe+A265Py6kZ7FGMVnudWfWIB8827KDnvPcOVdwtTwkOc73ffzGgj6IjkV/A2PqBYvuHOAUU=
X-Received: by 2002:a25:be09:: with SMTP id h9mr34942719ybk.239.1628049367867; 
 Tue, 03 Aug 2021 20:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdVfRSGQcBQEFVbUZjoRBKHxPJnbXkddZvF8vcSDQ1v5jg@mail.gmail.com>
 <mhng-78538c33-fe7b-4eea-83c7-5dfe4f5824d1@palmerdabbelt-glaptop>
In-Reply-To: <mhng-78538c33-fe7b-4eea-83c7-5dfe4f5824d1@palmerdabbelt-glaptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 4 Aug 2021 11:55:56 +0800
Message-ID: <CAEUhbmUkuKd7itzvQyzrYeqfUQv6LCqkXDsO=yufQppDBceLQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Atish Patra <Atish.Patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_205609_573303_4D91C8C5 
X-CRM114-Status: GOOD (  21.29  )
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

On Wed, Aug 4, 2021 at 11:55 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 16 Jul 2021 04:34:02 PDT (-0700), geert@linux-m68k.org wrote:
> > Hi Bin,
> >
> > On Fri, Jul 16, 2021 at 12:14 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >> On Fri, Jul 16, 2021 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >> > > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> >> > > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> >> > > @@ -9,6 +9,10 @@ / {
> >> > >         model = "Microchip MPFS Icicle Kit";
> >> > >         compatible = "microchip,mpfs-icicle-kit";
> >> > >
> >> > > +       aliases {
> >> > > +               ethernet0 = &emac1;
> >> > > +       };
> >> > > +
> >> > >         chosen {
> >> > >         };
> >> >
> >> > This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
> >> > instead.
> >>
> >> I was wondering the same thing before doing this, but when I checked
> >> all other DTS in arch/riscv/boot I found the aliases node is put in
> >> the SoC dtsi file instead of the board on so I think that's the
> >> convention.
> >
> > The numbering of the aliases is supposed to match the labels on the
> > board, hence it is board-specific, not SoC-specific.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
>
> I don't see a v2 of this.

Will send v2 soon.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
