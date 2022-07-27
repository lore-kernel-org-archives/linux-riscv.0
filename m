Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B283EC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQEC/XuPur0K0wO7iaxJcRPLm5jcNjqZKZUKA5C92R8=; b=w9ljfQ8bAFtGtO
	YBcUo2+/oUcGOgDaCYMmPoJ8ApXZA3nDYb+T0MCpNq4k5kjgXb/boe0iGBNMsxd9Ly0wxNehoajUN
	8B4RgMRh8tgyjv4ScB78Sfv+hmPCwU2Gg3pZLSXHltjAeWpSK0X/tjfCtrgb67wprKy6vgvSFWfo4
	A7jDnkwN7z5RkZmS+IpM9nP2ppZgla0xPD+rPaKAdOWJONpDUATLUPMrRiqZA1EhlPSDOvmuEZTzC
	fh2FrzJHf8sIrtornjZCqWB8QVoAaBlPMUUaXQD/ZOS6vER7f61tKX04g3r+Ll9TyV0eyYTNLRB9k
	6/bdEYORMLDUar2ae83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdSN-00Bq82-FE; Wed, 27 Jul 2022 09:35:55 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdSI-00Bq1z-L2
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:35:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id r3so29333262ybr.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tO96KCUrmod4Bc1ngFqk0NF3aHyVouo2a5XyYHy3WtA=;
        b=bfGBK5IAfMvP2xnlRZtAoV1vqJHJNuA+Rk9DU4uwapU+O4esI07HFst2iQtQ+dXDw5
         w/ieBMT3/j5vQDkH2VKCyKkZikrEY4wP/rgaWMejjZ7bfgm3jc+2RFe7cYa5kAmxsPS7
         E10w/dQLhdcgSNaNjMlRb1R2MS3XgFykoYMqbfofmbXustfawqSJOi5N9WSSh1NTdaaZ
         r0Pi25Emj5arzzrrQPG3CHmlj44IAfgUsjkFjHiw6L+EoEc7wnnD8lQrEoQbYeBntkAf
         yJYYRJ4FsPnvrSNsIvbR69v6/dbBWokNQfTYPmgS1KzXjCZPWXyT9B+GuLy8aqE84Kqy
         NXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tO96KCUrmod4Bc1ngFqk0NF3aHyVouo2a5XyYHy3WtA=;
        b=IeK7lRamkTNyhuV9/6XKwMk6IyBl/z3+iEmprfJ9e+/NhNMjGWY1SBSZnQJNxLc6zD
         60nRlFDLsEEmJ5Ua30JoKUiQAhqq4IKcoeiKZyk5Fw8J8nMmyaY91XDJckU8ocoBxz8Q
         D3XS5IDSRqXzEK8QOG+oWbio6PWQOl0YJboRGmffbvUxy4d90+XwjTUtD9EaxDk5I/YY
         50ogul+uDEFDRAwkLVxYT9eM/aOcP63csIsD9IF2jX1uX2M/JM7Kwv1wgG7ZrTWAnDAd
         /O5mKN1XtEMLkBwqWQ+dKyAgoPY/HjLs+fCzZjnXCHVSKNPM9REPWcahA0t1YazRGbJl
         XRvg==
X-Gm-Message-State: AJIora/f3tMffpjayd+d2vRPLtWBT6ApAv+8wyKs0jFIeumoKpnZdKDG
	h4cjIe3OZvsp91b/7TiVXnKpu0mXN6DXMWAOB/Q=
X-Google-Smtp-Source: AGRyM1tTw4w511Z1qejEOK9vSuyQPylIYKCBdl8onOcjCJ2A9h7t/jpCh5PWMT+1BJjigzlLpNJe0GLPufh8KC9k13Q=
X-Received: by 2002:a25:830f:0:b0:66f:cc60:c740 with SMTP id
 s15-20020a25830f000000b0066fcc60c740mr17248720ybk.117.1658914549731; Wed, 27
 Jul 2022 02:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <OS0PR01MB5922F1DEF93337884249DBF586979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F1DEF93337884249DBF586979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 10:35:22 +0100
Message-ID: <CA+V-a8t6h2++KfhG92FrKXtwg4nF5-nE2TPjfnWZzNgtxJHONA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023550_752423_59A972AF 
X-CRM114-Status: GOOD (  26.10  )
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

Hi Biju,

On Wed, Jul 27, 2022 at 10:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Lad, Prabhakar,
>
> > Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
> > documentation for Renesas RZ/Five SoC and SMARC EVK
> >
> > Hi Krzysztof,
> >
> > Thank you for the review.
> >
> > On Wed, Jul 27, 2022 at 9:54 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 26/07/2022 20:06, Lad Prabhakar wrote:
> > > > Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this
> > SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/renesas.yaml    | 49
> > +++++++++++++++++++
> > > >  1 file changed, 49 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/riscv/renesas.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml
> > > > b/Documentation/devicetree/bindings/riscv/renesas.yaml
> > > > new file mode 100644
> > > > index 000000000000..f72f8aea6a82
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
> > > > @@ -0,0 +1,49 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > > +---
> > > > +$id:
>
> > > > +
> > > > +title: Renesas RZ/Five Platform Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > +
> > > > +# We want to ignore this schema if the board is SMARC EVK based on
> > > > +ARM64 arch
> > > > +select:
> > > > +  not:
> > > > +    properties:
> > > > +      compatible:
> > > > +        contains:
> > > > +          items:
> > >
> > > I think you should rather ignore the RiscV SoCs, not specific board.
> > >
> > You mean to ignore ARM/64 SoCs?
> >
> > Agreed just the below enum, should do the trick.
> >
> >             - enum:
> >                 - renesas,r9a07g043u11
> >                 - renesas,r9a07g043u12
> >                 - renesas,r9a07g044c1
> >                 - renesas,r9a07g044c2
> >                 - renesas,r9a07g044l1
> >                 - renesas,r9a07g044l2
> >                 - renesas,r9a07g054l1
> >                 - renesas,r9a07g054l2
>
> Why do we need to add renesas,r9a07g044 and renesas,r9a07g054
> in riscv file? These are arm64 only SoC's.
>
The above needs to be added to avoid dtbs_check/dt_binding_check
errors. The above hunk ignores the RISC-V schema if it's an ARM64 SoC.

Cheers,
Prabhakar

> Cheers,
> Biju
>
>
>
> >
> > > > +            - const: renesas,smarc-evk
> > > > +            - enum:
> > > > +                - renesas,r9a07g043u11
> > > > +                - renesas,r9a07g043u12
> > > > +                - renesas,r9a07g044c1
> > > > +                - renesas,r9a07g044c2
> > > > +                - renesas,r9a07g044l1
> > > > +                - renesas,r9a07g044l2
> > > > +                - renesas,r9a07g054l1
> > > > +                - renesas,r9a07g054l2
> > > > +            - enum:
> > > > +                - renesas,r9a07g043
> > > > +                - renesas,r9a07g044
> > > > +                - renesas,r9a07g054
> > >
> > > Did you actually test that it works and properly matches?
> > >
> > Yes I have run the dtbs_check and dt_binding _check for ARM64 and RISC-
> > V. Do you see any cases where it can fail?
> >
> > Cheers,
> > Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
