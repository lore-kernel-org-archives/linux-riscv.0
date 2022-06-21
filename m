Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34340C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJw0Fkl/35hHg6GUQ9RLk5PiYXYyeAocBnQZ+8Yi17g=; b=3P+Zje16oqklHs
	pD5sjbHcVdhdEVd2KXp4HXRynspZVdPsl/E7hm87ka4t2y48SGkKEr0O5Ekxk1zzNtPxUZRupNRfZ
	RBVZw0Z0vkDje6VuxwCbcjL5d4jVNx8RIzokeYzmptaq6jROgMX34TbPgavssw9otTTbfMPcgqySu
	asvYodwlzvVGDemwoKj0a/1SjBjkWkeqok5l2Uvk0BeTmxmBRfsBXnQCR/TRrvXc194d5VXqhip6r
	p5nut6mmpGq3fkrIU01QqYi8WCW5FEMH9SNvkTBsYf8QXGsXmHc6UDgCwGDdLRCcxQo7z1QSuf+74
	M6uU9aStKJ9NzqQ0RezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3XvW-003wRX-V6; Tue, 21 Jun 2022 07:03:54 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3XvT-003wOz-UO
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 07:03:53 +0000
Received: by mail-qv1-f43.google.com with SMTP id i17so12410212qvo.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 00:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ezwPnqEAb9XxkVE6EHdU5akaM6B3QfniuvIAXM1ujs=;
        b=l2R5u6s3F2GBU449Et0MghcIOJGAX3Rb5ijtulrj4i2YmkBhROqMpamGLBYVJXuPXk
         DNYxwQDDSxTxDAjgTmovHPyI1GoULPnpTwndV52h3KFKvw/v+g0nApCClIC3MMA9ukZd
         YesPWpcr6FdhMjWZP6Wq+A1B3b0y2gOhXK1kPU+tRablk6oJ9Y4vwQs6ivv1OMpw7IYH
         KqdSFfkRRa4JG5QRe2ZlyyYlSWxNMhuzRyVPECJjP3V0PrdLV8yEXdf3CZ62RQy+RNGM
         dbwhfrmVajqWHoLtPqwlV6MiMzGlkdH0TiaSG/moD2wtNKKd73fi4L48I5qvFtHBP1FL
         4CxA==
X-Gm-Message-State: AJIora/CjJA3h9kzQWYUR5/YViRHJDW+f7GZ2ICIGAyHMzY0RiTuJLCs
	DNhSuee7+8O06IuxDusITPjvP5paWhEZZA==
X-Google-Smtp-Source: AGRyM1vrRpWIIaHF6AkLvskTZLWWeEYz4ltzT4L3sj4T9CS0Bo1qlzuKoDTV1sTzXQbhyhtYwme2BA==
X-Received: by 2002:a05:6214:21a5:b0:46e:3743:a0b6 with SMTP id t5-20020a05621421a500b0046e3743a0b6mr21337586qvc.19.1655795028439;
        Tue, 21 Jun 2022 00:03:48 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006a36b0d7f27sm14973387qkp.76.2022.06.21.00.03.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 00:03:48 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id e4so10248853ybq.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 00:03:48 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr30754158ybh.36.1655795017074; Tue, 21
 Jun 2022 00:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie> <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
In-Reply-To: <20220620205654.g7fyipwytbww5757@mobilestation>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2022 09:03:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
Message-ID: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-spi <linux-spi@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_000352_017021_BD4B103A 
X-CRM114-Status: GOOD (  33.96  )
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

Hi Serge,

On Mon, Jun 20, 2022 at 10:56 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> > width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> > this.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
> >  1 file changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index e25d44c218f2..f2b9e3f062cd 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -135,19 +135,41 @@ properties:
> >        of the designware controller, and the upper limit is also subject to
> >        controller configuration.
> >
> > -patternProperties:
> > -  "^.*@[0-9a-f]+$":
> > -    type: object
> > -    properties:
> > -      reg:
> > -        minimum: 0
> > -        maximum: 3
> > -
> > -      spi-rx-bus-width:
> > -        const: 1
> > -
> > -      spi-tx-bus-width:
> > -        const: 1
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: snps,dwc-ssi-1.01a
> > +
> > +then:
> > +  patternProperties:
> > +    "^.*@[0-9a-f]+$":
> > +      type: object
> > +      properties:
> > +        reg:
> > +          minimum: 0
> > +          maximum: 3
> > +
> > +        spi-rx-bus-width:
> > +          const: 4
> > +
> > +        spi-tx-bus-width:
> > +          const: 4
> > +
> > +else:
> > +  patternProperties:
> > +    "^.*@[0-9a-f]+$":
> > +      type: object
> > +      properties:
> > +        reg:
> > +          minimum: 0
> > +          maximum: 3
> > +
> > +        spi-rx-bus-width:
> > +          const: 1
> > +
> > +        spi-tx-bus-width:
> > +          const: 1
>
> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> irrespective from the compatible string. The modern DW APB SSI
> controllers of v.4.* and newer also support the enhanced SPI Modes too
> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> run-time there is no way to create a DT-schema correctly constraining
> the Rx/Tx SPI bus widths. So let's keep the
> compatible-string-independent "patternProperties" here but just extend
> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> properties values.
>
> Note the DW APB SSI/AHB SSI driver currently doesn't support the
> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> activated by means of the corresponding CSR. So most likely the DW AHB
> SSI controllers need some specific setups too.

That doesn't matter here, as DT describes hardware, not software
limitations.

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
