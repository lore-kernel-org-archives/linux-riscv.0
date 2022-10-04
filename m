Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E403C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAV3uQ4r2/fTOan9YgvuRwrry4PKZUoj/7s39vHl4bc=; b=ZSxPNhwOjQy1UL
	uyaJ0W7qxaavkYI9VHZeS5UccpcE10Mhq2udX2H0isowJOm3iAVN/hL2pzs5uwq8XBQyqoVTO6ek/
	tN/JiYBs1qkFuMQTBffRNgaSKOXQrJT/NMiKfu897ka4Pgs5a4wygu6Y7lold/zl+8rl2bJegbbFS
	u2ONsyuLO1rZ2izDkl2f86EACUoBcONuEeaQg9X1QdmIFLAvizLpTntEdzV4Wm+lNQczKmfcbMuMa
	x+1ooFj1R0mU4p0zY3pqSJ1EQ3HYPTc40kzQDvZ7mRos3UGiXTt+kpt6Gao+g8jBZS7/jEMb1BpQu
	O2EL25DpA1L7w41Xrfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeH3-0097oI-Q7; Tue, 04 Oct 2022 09:31:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeH1-0097mM-0M
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 09:31:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w10so5137356edd.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=scCLn+ph1UwggMlH0DfSAgp5HKCsgoA8BWLgo9P4NBI=;
        b=g288wrK1MpJ5OqQfyyRnufGz8XScpljjEmSqeO11AOP8i6mrztUnVqx82KgfBbvDWJ
         AQku5ORj7LyTEsI09W35txqcRR8krUCRWzCqwhW17/7lRaKlq+vDvgvDR75skcRZv1G4
         mfyNaIvOGKzbkLHT3w9Lm48g2KEGANtNvBAZA03dbbHXHy7SSIN5XbyRis9CJJo9dTxx
         MHr17EhrRj0sZNsdYvmFPHklRT3BYClHOb/GaWQavDNrpJfd1BdWp4v4CQU9s1Ya2fdl
         2j9kRjL06AhKewOyZjZWTVpIa2iy3KEcTgNuvKpO9fzIcSLGoQHgFIMXoY4Xzrsp1qQi
         i+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=scCLn+ph1UwggMlH0DfSAgp5HKCsgoA8BWLgo9P4NBI=;
        b=748hQukrsHkKi34EvH4qXfPG2FsUU/JqteFHfruoyf4jHFaFXHgEOfWU/sZiXyZzgy
         L0WIA98xZ/CJioKKUzjCfd4u4tVIhD3egaPz1gg+YehondRU9TiYMm7Cx/7YmTY4YQM1
         nhFFe3HNfuM94xWK1meWokxjJAIP/LbnE3e3ZV8M7e9Dn3isAz5yME0F+X21wwa8VYlD
         /AX52hd008v7lUsIYswpcGA5RSYZv/aTV1fsKRGO23NTBg2x8NY4YUJVka90RrTqR0DP
         mE/hxa7uSb9UrV1uSF/IAuXyIehQBIbMci/jbGoTaud8e0WzlaTVQWAIfEGES7Zd2ZqC
         Qdfg==
X-Gm-Message-State: ACrzQf1jFYl/5IjNEqAqS2HwiBsbBPxM0dkrorzid/+v0xaxEj8f1Kn7
	iabOIpOHDQOFMWzq8Xiez4xM7DDoOxfDl9Z+vYE=
X-Google-Smtp-Source: AMsMyM59PqwrgK1dRoo/jsyDhll8qx53jwPGZsthXe0V2zWSaj5gaulmAalr/5BCASTSdEWSfkl+r1bN56y+mCxx2nY=
X-Received: by 2002:a05:6402:5485:b0:459:147a:d902 with SMTP id
 fg5-20020a056402548500b00459147ad902mr6778287edb.263.1664875892283; Tue, 04
 Oct 2022 02:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
 <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com>
 <YzvhaxuZbeCwLZ5m@wendy> <CA+V-a8uYwm+Z4=3beNZE7q3mG7S3uKdEagY2c-KStD0thyw6Gw@mail.gmail.com>
 <CAMuHMdXqV3DMLLfS5Vrkmx1KOBHqyC_pO7kHLnMf8OPSFe6doA@mail.gmail.com>
In-Reply-To: <CAMuHMdXqV3DMLLfS5Vrkmx1KOBHqyC_pO7kHLnMf8OPSFe6doA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Oct 2022 10:31:05 +0100
Message-ID: <CA+V-a8vK8KKeAvqur+CnE=SBkvYsQ7g_Gu5=v=qZ-0=VTk+RjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache:
 Add DT binding documentation for L2 cache controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_023135_103032_51349785 
X-CRM114-Status: GOOD (  31.04  )
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

HI Geert,

On Tue, Oct 4, 2022 at 10:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Oct 4, 2022 at 9:59 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Oct 4, 2022 at 8:32 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> > > On Tue, Oct 04, 2022 at 08:26:01AM +0100, Lad, Prabhakar wrote:
> > > > On Tue, Oct 4, 2022 at 7:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > > > > >
> > > > > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > > > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > > > > describes the L2 cache block.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> > > > >
> > > > > Not andestech,ax45mp-cache.yaml?
> > > > >
> > > > I wasn't sure as we were including this in soc/renesas so named it as
> > > > r9a07g043f-l2-cache.yaml if there are no issues I'll rename it
> > > > andestech,ax45mp-cache.yaml.
> > >
> > > I may be guilty of suggesting soc/renesas in the first place, but should
> > > this maybe be in soc/andestech? I have no skin in the game, so at the
> > > end of the day it doesnt matter to me, but I would imagine that you're
> > > not going to be the only users of this l2 cache? Or is it a case of "we
> > > will deal with future users when said future users arrive"? But either
> > > way, naming it after the less specific compatible makes more sense to
> > > me.
> > >
> > As there aren't any Andestech SoCs upstream, I am in favour of keeping
> > in soc/renesas for maintenance. If in future there comes a new soc
> > from Andestech (which will go into soc/andestech) we will have to
> > split the maintenance work.
> > But anyway if there will be any users of L2 cache we could always
> > provide a config option which can be used by other SoCs.
>
> What about Documentation/devicetree/bindings/cache/?
>
Sounds good to me.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
