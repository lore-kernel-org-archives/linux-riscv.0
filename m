Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42295C07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 11:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45A8613F2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 11:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45A8613F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xhz/dchOWZBK/etRhOr+wqgqPlKuvDyt8Aej4ulF6e0=; b=Jbrn/3js5RfJQL
	JDdyo2o18TdIAi9DttQne7wc2iWdPvoWWAyTEk1PnjAuFn3fvj2oMFuElN1A9737V33v9WcGk1QkD
	jtUUL1DoPO8eRIt5NaLhrUvwLdEwOymkE73XBXndIPc88xwJr1ZMALHBMOm8c6AZUHmsUhT8vLV7u
	OhWt72KNMBXLRj0Adil+Eb0ELQboQNAlhuojpZEAhseeF31MlT/TPsObED5crXyFktsSjDw2tQWwu
	i5Zm4Z+dwRo/aYA0acXEcf07Fj1MP9hm9Mqs4RA76y8FwuETdJaw5R0OxiK6dNrc58CzonFnp67E8
	mvCU3rAvY2vO3uABO2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4M6k-004Is9-1p; Fri, 16 Jul 2021 11:34:18 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4M6h-004Irh-2x
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 11:34:16 +0000
Received: by mail-vs1-f43.google.com with SMTP id a22so4834757vso.1
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 04:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cMUPV4XWaCYtbaAI3uwGWUmIBkcAyAv0q9hV4D7V57I=;
 b=L3vQH0Euhs/pDdgbi+BNUA9EJk9a8ZCDxbGMv9evpR+Sk6/R4NZBCZQrP8jZMGkSp/
 gsHf0Jwu+rN3kzVFHBK8I63/2ABpp72I9RyHQacvzsGTNJ0BRI0yxydJ018R50WOSuEo
 pHo605IxlIL7y6NUoqv/7JGbgxNx2GCV28z4LuS/K/1FcOm+EakVTZWjSAOeRoNFRkBH
 /kbaxWlc617uHRLFp9qYTcG78EYkCd2TVZwaT4unrtHnC4fwaR6xPbMZLwRHrc8zxgKZ
 EA+ej+mvFxrSaaigUYcySr2gSv2FxpJIbecqgI7ArKb3iQ1SWdC8jwHwkB4d2ygC3ZlS
 ZCxQ==
X-Gm-Message-State: AOAM531ZNpA5FUzJMtIiGOSesNqc2NvU64O2WG0WiSfrB1h8fYE/sE96
 TmJC9blTHuGc3ACCf/ENHLe6Ii4ggc8zkFqtxQQ=
X-Google-Smtp-Source: ABdhPJx+MWSgxjV8lpV2hTSfRKj7wmmWXQLwwdJkxn/F2f8hIHC5ehtlTyOGUAEmGXTFndot8GBsgIuGDCaXRI//30Q=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr11677390vsb.18.1626435253971; 
 Fri, 16 Jul 2021 04:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210702014319.1265766-1-bmeng.cn@gmail.com>
 <20210702014319.1265766-2-bmeng.cn@gmail.com>
 <CAMuHMdWpJ194jEnXiUhs5dfC-33rGUm7pE9aMHUTYoMCUdFxZA@mail.gmail.com>
 <CAEUhbmXrSJ2dkXYvoZXTZ+3gV3h9OBx3u0hOitwLvMDKa2A4DA@mail.gmail.com>
In-Reply-To: <CAEUhbmXrSJ2dkXYvoZXTZ+3gV3h9OBx3u0hOitwLvMDKa2A4DA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jul 2021 13:34:02 +0200
Message-ID: <CAMuHMdVfRSGQcBQEFVbUZjoRBKHxPJnbXkddZvF8vcSDQ1v5jg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_043415_173857_E9EBDABB 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Bin,

On Fri, Jul 16, 2021 at 12:14 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> On Fri, Jul 16, 2021 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > > @@ -9,6 +9,10 @@ / {
> > >         model = "Microchip MPFS Icicle Kit";
> > >         compatible = "microchip,mpfs-icicle-kit";
> > >
> > > +       aliases {
> > > +               ethernet0 = &emac1;
> > > +       };
> > > +
> > >         chosen {
> > >         };
> >
> > This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
> > instead.
>
> I was wondering the same thing before doing this, but when I checked
> all other DTS in arch/riscv/boot I found the aliases node is put in
> the SoC dtsi file instead of the board on so I think that's the
> convention.

The numbering of the aliases is supposed to match the labels on the
board, hence it is board-specific, not SoC-specific.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
