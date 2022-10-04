Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CC8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKEfuNsUp8UAiPBHkrWaq2C0BhcluBAy4Suz6nGOVcA=; b=GO4kQboxb2DxST
	dDpkKVW4N8doncjjmYYnX4aRHcd3zBrH1J/29j6He63tfNKaEBAPma38mrWDnAU1RxZUiDZkaqQsj
	KvYcgtxf8o3iiKGyiZxETsbCqO6k/At/DRd/xpUTturIQX4jXgppoB0H9wbQdtHtWpcWsmN8P9WEL
	K+4OIT/LarbR1eAHKheWwPL3PCl3jawPLTyGJesVp8Fsi/ExB+vZNMCK2J5FDkYzgVm+gyUkQ568W
	LNaVJZYuG3G2SXD9FnyQjjhfNQ+8ORqhSYOKMx4abji1FgJ4YmHhZh7wD9Vrxm5tQY6GG/lMnGbFI
	eJYmwP0AYvdLg57aV7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdyu-0095D3-Jv; Tue, 04 Oct 2022 09:12:52 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdyr-0095BP-KT
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 09:12:51 +0000
Received: by mail-qk1-f178.google.com with SMTP id d17so7983034qko.13
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 02:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cNSxtiNrKbDPv0gefLyvvkj1SY75gKEiYHU4erA9wgQ=;
        b=LrLVdooc0/GwjqO0/eBYAl06ODAZKbmaIv6Io7Qp8DhMGhVZqXHhGw/Uti8VP+S1pt
         +6UgFQ/gtrsCIWfMHdmun+PsbCFw4wvxo8N4jkPglkioIKo9RgOsyBaCtjZi7fccI567
         JlfWv0Rb4qwLbm8LV+V/Jp8dO30k2d2iZj55hhf6WbuJFRawigqanyXLsPsnyb5Facqe
         XSl/GqL9qYvBxXHG+GxGAmW/La8z4jom+j8Tj9gHe8y6Zf7qtGHH0VaAoOLdlKZGfXle
         JZzGMIDeonx9dJ/UVXv+mzyP8h97uFmxeTQGEigFP9HfA+KKxz1fjKsXFDdR6J0+1y45
         CybA==
X-Gm-Message-State: ACrzQf1ppfX+64QtsSB8knYgAxkfDUts4ArzO567Kz8R1VFFlMtg0/cd
	q84WibfcBpoOdTqdXLNGQg8HumxflhmSmg==
X-Google-Smtp-Source: AMsMyM4qSQ0hDBka1Z5XctD28xDcOOPmny+Ud9dlSZe5vHVA/tgX7/mZQ1bI9hDwd/LLnA4Y/rRxvQ==
X-Received: by 2002:a05:620a:440a:b0:6ce:d463:934d with SMTP id v10-20020a05620a440a00b006ced463934dmr15746624qkp.761.1664874767300;
        Tue, 04 Oct 2022 02:12:47 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b006cbd92ca141sm13974969qkb.133.2022.10.04.02.12.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:12:45 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 63so16074959ybq.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 02:12:45 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr24038304ybx.543.1664874764897;
 Tue, 04 Oct 2022 02:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX1BuvHz46QWd+ajEcwmWMeSmvN4AtODuFEysRk14ArZQ@mail.gmail.com>
 <CA+V-a8vnNQDMgjhJfz91g++dVVv5Z5FTuFrNRHLW3PjPump0Mg@mail.gmail.com>
 <YzvhaxuZbeCwLZ5m@wendy> <CA+V-a8uYwm+Z4=3beNZE7q3mG7S3uKdEagY2c-KStD0thyw6Gw@mail.gmail.com>
In-Reply-To: <CA+V-a8uYwm+Z4=3beNZE7q3mG7S3uKdEagY2c-KStD0thyw6Gw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2022 11:12:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqV3DMLLfS5Vrkmx1KOBHqyC_pO7kHLnMf8OPSFe6doA@mail.gmail.com>
Message-ID: <CAMuHMdXqV3DMLLfS5Vrkmx1KOBHqyC_pO7kHLnMf8OPSFe6doA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas: r9a07g043f-l2-cache:
 Add DT binding documentation for L2 cache controller
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
X-CRM114-CacheID: sfid-20221004_021249_692796_6A472439 
X-CRM114-Status: GOOD (  36.79  )
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

Hi Prabhakar,

On Tue, Oct 4, 2022 at 9:59 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Oct 4, 2022 at 8:32 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> > On Tue, Oct 04, 2022 at 08:26:01AM +0100, Lad, Prabhakar wrote:
> > > On Tue, Oct 4, 2022 at 7:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Oct 4, 2022 at 12:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> > > > >
> > > > > The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> > > > > Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> > > > > describes the L2 cache block.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> > > >
> > > > Not andestech,ax45mp-cache.yaml?
> > > >
> > > I wasn't sure as we were including this in soc/renesas so named it as
> > > r9a07g043f-l2-cache.yaml if there are no issues I'll rename it
> > > andestech,ax45mp-cache.yaml.
> >
> > I may be guilty of suggesting soc/renesas in the first place, but should
> > this maybe be in soc/andestech? I have no skin in the game, so at the
> > end of the day it doesnt matter to me, but I would imagine that you're
> > not going to be the only users of this l2 cache? Or is it a case of "we
> > will deal with future users when said future users arrive"? But either
> > way, naming it after the less specific compatible makes more sense to
> > me.
> >
> As there aren't any Andestech SoCs upstream, I am in favour of keeping
> in soc/renesas for maintenance. If in future there comes a new soc
> from Andestech (which will go into soc/andestech) we will have to
> split the maintenance work.
> But anyway if there will be any users of L2 cache we could always
> provide a config option which can be used by other SoCs.

What about Documentation/devicetree/bindings/cache/?

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
