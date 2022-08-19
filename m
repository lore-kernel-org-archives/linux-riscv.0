Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3CC28B2B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRA0y9v71Dl/nzs7N6FGbGw+F5ljKL9V47u1C6zulO0=; b=pY2T6VDtC9JRYn
	j9f7rm/HSLpD5sH69meDnZvPHFczd+FKAV31grJfp5YFUV89rZTqFaZa/N1elMeV4UCluuslS/g2e
	PHIvrx45lOTHHK4OVElRulXB8ZXoomlMl08auxS+6F+mHmcvrSJBNs4PaXj9fzQJELub6dO2Y6lGj
	ghasDJd5GF0oHfkrQvLDEhsuSB0CA+F/qiB9pmcH9ilmqNpHfCYMwoAUpu/qxE6CVO+5oXD+DwBX2
	kuXU3hC6alVFHRSLC9LoBHAxzBBH8pQLeRXi7W+v8WWpn4Ak1ecV+MOdk7mOL2Hipdv7E0P9fL11z
	JWggRP/Aw4X9qL9HDocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxPg-0046rB-Eq; Fri, 19 Aug 2022 08:31:32 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxPd-0046pt-8R
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:31:30 +0000
Received: by mail-qt1-f181.google.com with SMTP id h22so2853807qtu.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ZIz9uUnGvGIaQHLjwy5JfKqGUPRt15jYrUPzIJQykQk=;
        b=FC0uGYGA+BM7MdW0HLNu+xO4hHqiroo5jBmGefNAIhIGmTIPd9h0Eh2iSdR/Yqs2Ko
         k+CJ8FwV+++goNWg4YdM9HkrSIUGfbajCARnprqXWsOdN2r0HJj4iiX5RCpSr6h2ekbX
         zLziXlcG2BqNEg/T90Uuh0CGZ/zTUVtsErvoscWd8f+if+iUS8xkjWLI9oDlikryMBUT
         2qrgpJBtapIsL9ONyhlT2lZOYCD2eh8149+dmz96rBir5iPn0/dxXyr9LCjL+pNBp4pR
         k1wU/FK8NA/JleQxJjALpPVDqKTHI2v/69N5THYdznC6rY9jCc5a6pg8AGOVsMWkY3dV
         1YKg==
X-Gm-Message-State: ACgBeo38rmzwiCpRTcgiR3fy8r5u/XC35EDPV4W25aloKVNebgDZqDsr
	Ofcs6kX0yHsKdlC545/4RNManjujvjq/Ew==
X-Google-Smtp-Source: AA6agR5vPQTwsNgH0UuL6WK9LZ6fK9qR1fAd6SpUb+r9tYq//7xX4cURAv8d0jgY0TGRPIQdvL5I7Q==
X-Received: by 2002:a05:622a:1013:b0:344:5b66:fe15 with SMTP id d19-20020a05622a101300b003445b66fe15mr5654093qte.66.1660897883395;
        Fri, 19 Aug 2022 01:31:23 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id ge8-20020a05622a5c8800b003437a694049sm2595038qtb.96.2022.08.19.01.31.23
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:31:23 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3375488624aso74647757b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:31:23 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr6672282ybr.202.1660897524733; Fri, 19
 Aug 2022 01:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com> <CA+V-a8uNRr+WPX=YC+UMT4ch4S5XwsatHCzUoSt+hTk4C=cheA@mail.gmail.com>
In-Reply-To: <CA+V-a8uNRr+WPX=YC+UMT4ch4S5XwsatHCzUoSt+hTk4C=cheA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 10:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjWsUF1_CnojrvT+EyEmAp25jkT2TyWSisGinAGgMb3w@mail.gmail.com>
Message-ID: <CAMuHMdXjWsUF1_CnojrvT+EyEmAp25jkT2TyWSisGinAGgMb3w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_013129_341719_B7E1F7D3 
X-CRM114-Status: GOOD (  32.16  )
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

On Mon, Aug 15, 2022 at 10:16 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Aug 15, 2022 at 8:00 PM <Conor.Dooley@microchip.com> wrote:
> > On 15/08/2022 16:14, Lad Prabhakar wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > Enable the minimal blocks required for booting the Renesas RZ/Five
> > > SMARC EVK with initramfs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v1->v2
> > > * New patch
> > > ---
> > >  arch/riscv/boot/dts/Makefile                  |  1 +
> > >  arch/riscv/boot/dts/renesas/Makefile          |  2 ++
> > >  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
> > >  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
> > >  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
> > >  5 files changed, 73 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
> > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> > >  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> >
> > Just to sort out some of my own confusion here - is the smarc EVK
> > shared between your arm boards and the riscv ones? Or just the
> > peripherals etc on the soc?
> >
> RZ/Five SoC is pin compatible with RZ/G2UL Type 1 SoC (ARM64). RZ/G2UL
> SMARC EVK carrier board can be swapped with RZ/Five or RZ/G2UL SMARC
> SoM and still be used.
>
> > If it is the forver, does the approach suggested here for the
> > allwinner stuff make sense to also use for risc-v stuff with
> > shared parts of devicetrees?
> > https://lore.kernel.org/linux-riscv/3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com/
> >
> it does make sense. But I wonder where we would place the common
> shared dtsi that can be used by two arch's.

You can keep it under arch/arm/boot/dts/renesas/, and refer to
it from riscv as <arm64/renesas/...>.
Cfr. the symlinks under scripts/dtc/include-prefixes/arm64/ and
e.g. cros-ec-keyboard.dtsi.

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
