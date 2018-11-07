Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D467EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99BE2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 18:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlNFk9pQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="dYm9xICH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99BE2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HXDP11OZ0yAC7T1WanNZ7t1fD+joHRgsROIYBwta5G8=; b=DlNFk9pQaBAQzPFW8+dgmM7Rwm
	q3Sa7/l+gcJrs7oj92f2GK1NOuEblDOBJHJ2kVnueqgB6f6n9OnkKTY0OL/c0fDqA9wCYrJPcXU6j
	0+HWpLevR3KR2dk7H6zI+Pk2KgFACelKntNBlbc9xRZ/gPuYG/slvN0ggbc3RGhXfIlBd4AL79MhQ
	mDcO1nzNbTItu5fywEIhKqR6j5BJtYFsWVHtVBY2uOniXqjbt1LmrFtyaJ+owv5B9mxnwsODtnDAy
	q4cAVqHi04kXSUO4teD1XgFl9Rwu93I68GTcWi3Rj05WYBnEn9clox+OIvLTM7RRDEthXIaOxzNB2
	pexPcqxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKSro-00071Z-9o; Wed, 07 Nov 2018 18:47:52 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSrl-00070X-FT
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 18:47:50 +0000
Received: by mail-lf1-x142.google.com with SMTP id p86so12267709lfg.5
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fdhesnwODR1IUqoa62aCJQitJnka6y/M2DWmc07iOSo=;
 b=dYm9xICHkHRE5lBCEYV2BPKQ56Y2eKahzBo+6ZIwkVzlt1yB3VUs3+brOiFmTk6dIe
 IL18AFnwXmewlwwqtu0wD3Im1jp4o2NBEPnhw2pYLNZQbnhgd+hN5UdzJNfoept1rKcg
 zQ0sdLJUcQfMeVKRyj7FJFcT3WexBQdUgiVtVnSr0scn41hljQropzo6w6+bgwomTAh0
 FvoW8gC+8xTCnEbFmJfLKCiqAKKJpP0AzwyzHjsDcoO+jALG+2IMlp2Fr3wRuhnfKJ+D
 HF4zt0IA9/qjf/tOkQaIYl0A8FPIAGwkeMvizjP9NTPoxI8uh6N+V9UDoBFQ2B0ss1HR
 u2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fdhesnwODR1IUqoa62aCJQitJnka6y/M2DWmc07iOSo=;
 b=Aap9HOtYvZxQzdU6KxZ/3wNIcLy2LWlTjnXzPLZKUU+nB/LJLcEyVa1cT7V4g8mhK5
 TOsHj54vzR2HGlQPFOa6Es9TvCiW5XU1VPOidtIn9HEKNvkM2HLA+kNxqVSiMlSvLOcM
 klR6AVa2WQpWOII5q1FubYtkMtKaBN8uPmNjzJ5nHm+dQg4CoJrop82dISFWxfTu9xac
 JF8d7Etgk8qfx+QDn30be2UYF6Kdu20janMD67LbG8b5KTXiSpIMt/iD/MQs71erLt+6
 p6Gau/Nqsyid6Nrr720CsUVcuIJfUUd/q6lFkVT7BHgr0OuoC9+nlDtQIIyyKp28ivYm
 88sg==
X-Gm-Message-State: AGRZ1gLcjo1bLUwy5VwrsxQzi5yWJd8fsO70WRvjqB8a560pA1zVznbf
 mk5aHTIP4ZMTWb+5beZOxB6z1UkpHgPPXQgkOZ0VXA==
X-Google-Smtp-Source: AJdET5dgEsX+VCUe3E+btA7Zs0MRxvxhzwAPzLR3Sfs6cagOwHfG4mfvPJBb5Rn3w+vGu9/fFrA/0irWawPe158p2qo=
X-Received: by 2002:a19:1901:: with SMTP id 1mr729485lfz.99.1541616456574;
 Wed, 07 Nov 2018 10:47:36 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org>
 <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
In-Reply-To: <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 7 Nov 2018 10:47:24 -0800
Message-ID:
 <CAOesGMg+jW7SN2+E_FYbwi8GdNhc8KrEsahB-Nn+AseO6kLGXA@mail.gmail.com>
Subject: Re: [TECH TOPIC] SoC maintainer group
To: Theodore Tso <tytso@mit.edu>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, 
 linux-clk <linux-clk@vger.kernel.org>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Russell King <rmk@armlinux.org.uk>, 
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_104749_521487_E003F47A 
X-CRM114-Status: GOOD (  12.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107184724.0zL_eEVbyl7brpYZjVz7VXm6V8gZTqjN8g0ndefR7Wc@z>

On Wed, Nov 7, 2018 at 9:35 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Nov 7, 2018 at 9:17 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> >
> > On Tue, Nov 06, 2018 at 02:16:27PM -0800, Olof Johansson wrote:
> > >
> > > Olof Johansson (arm-soc)
> > > Arnd Bergmann (arm-soc)
> > > Kevin Hilman (arm-soc)
> > > Mike Turquette (clk)
> > > Stephen Boyd (clk)
> > > Linus Walleij (pinctrl + more)
> > > Mike Brown (gpio/regmap + more)
> >
> > Could the poeple listed on this list please list potential schedule conflicts?
> >
> > I'm going to assume we should avoid: Andriod uConf, RISC-V uConf,
> > Device Tree uConf.  What are other potential conflicts.  I'm going to
> > guess this might be "interesting" to schedule.  :-)
>
> Yeah, apologies for adding a bunch of cross-coordination this late too.
>
> It's likely going to be conflict-ridden no matter what we do. RISC-V
> and DT are the main conflicts, Android probably has a bit less.
>
> Tuesday afternoon looks least conflict-y when I squint at the
> schedule, or Thursday afternoon (but ideally not overlapping with
> Daniel's DRM/gitlab session).

Ted,

Can we have 3pm-3:30pm on Thursday? It seems relatively low on
embedded-related conflicts and at 3  people would have time to migrate
from Daniel Vetter's gitlab talk if needed.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
