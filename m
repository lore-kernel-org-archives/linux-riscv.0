Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B3FC19F2C
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJWOGuSGGVXixdhSBFOTkkYtxIdgnevhbI76Gy04U7c=; b=jrFNbSJ8YlLf1U
	v0T9w8uEA1Dg3YbfjNH8dfSKaJdyI+9tVxT2Jc4yv9PLYLzC8ZpIqCTNm3Gj+ndPYSAHLKWvKBWk6
	plHybSAj1POGnVHviga1WgBKjyrszsAjfLNvu7tSjJ2Hwv2fL4yUYeyVdxVGkUVY+N7mYaBY/F+5i
	sf4C7UR4YvtP+f/1WWTsd5nRBVAxtWiPyV1R9owICtW4wy/W9n+72qe5bMqSbNW4YmXTpkKceT4RW
	b/ywYZU9fiYDfSppafID74EgqWqLNr6vOAh6LoFnBpksUjv0iyxv0nyvrJFEn4H+3ekrf1jfd+P0Q
	0kCIVif7pqqi0CsxA5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcuT-00BTux-Ss; Wed, 27 Jul 2022 09:00:53 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcuQ-00BTqa-Ix
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:00:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id a82so23648709ybb.12
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lp2UjJeoZNtF3jPddaeCcZ2oTGYQdnwK+wO4WeAagn8=;
        b=XSbIlFiwirHn32plE+wRVIidNeyGwGE7rZrO/FxalW9hGgD1B9ySrWfh7gdqqFTZVY
         H0IejLiZa0buXTKLM1YPKWBU91ytBxfhcdenftN4TD9ztWV/Fdg66hs7YkNaspOMKUly
         7Sw+B7WD/IsXkTMpXtLW7SkG9qfM8tf/lYzBfRtwO56Wjci9sTysluMbYUgld7IzNeA4
         gOYFUXNc3FhUpXS4jZwP76jeObHD5HwiL7+8RIRlGS0t5bg5wdoTmr6Y3ls4q/3UP1kO
         lm8oCE9OvlCbXqnYkYmQzq/H9jCWjI6f2JiJMxMusR5mu2HmG+gEXPqV+mfVT6AmcGDT
         M89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lp2UjJeoZNtF3jPddaeCcZ2oTGYQdnwK+wO4WeAagn8=;
        b=me4mdykxFqW9lu18CugvhEcg+xP/Y3aSOYnlneMGmgn2gqaXs5x/OWHzEza3CpBDZs
         MDnSQvLVMO/auHCJL1sJRLSJ+stiws1ktUKl7KgAjLwLbHsTC8pZnQ0wqdPe6oVNJDDS
         gF6i05HMNRELog3Tz6KVqsZ2O9HqGhb4Vygo+reotRffUZ82s37IfjqOAtBkOL6Vb/Ce
         AJB6hDFFS22avrbyGvb0nDRmm+s08QOmjpQgq9RK5oejdsvW4dJoTVE1frKvwIOGZ3Bs
         9oFJapO7YrUXHhxBe5pnauOuuLuv0vBAXTlKBaYsXha77psMF+l2sj7LDSXEtjJYmfQV
         4YXg==
X-Gm-Message-State: AJIora97QHHB3Zo8Dcp1K9nLX+A+IwlIZdP2qOqW8fq1huBxl5q3a9w2
	TGIaS+TCsSdZLQbVLRxlOCBFqhNjdjdKIo7EtYY=
X-Google-Smtp-Source: AGRyM1ueFJysPUexyidBDBCQ2Ajm5GpI2JfoVj8pVsuoL+AzQRgL3tl0GMPhkouwXL5dOZX4XHhkjaJbr0lJsLccxPg=
X-Received: by 2002:a05:6902:20a:b0:670:c563:9180 with SMTP id
 j10-20020a056902020a00b00670c5639180mr16432213ybs.401.1658912446846; Wed, 27
 Jul 2022 02:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org>
In-Reply-To: <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 10:00:19 +0100
Message-ID: <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020051_095256_1BF02EA5 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Krzysztof,

On Wed, Jul 27, 2022 at 9:53 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> > (RISC-V arch).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> > index ff80152f092f..f646df1a23af 100644
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> >  maintainers:
> >    - Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > +# We want to ignore this schema if the board is of RISC-V arch
> > +select:
> > +  not:
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          items:
> > +            - const: renesas,r9a07g043f01
>
> Second issue - why not renesas,r9a07g043?
>
We have two R9A07G043 SOC'S one is based on ARM64 and other on RISC-V.

RZ/G2UL ARM64:
Type-1 Part Number: R9A07G043U11GBG#BC0
Type-2 Part Number: R9A07G043U12GBG#BC0

RZ/Five RISCV:
13 x 13 mm Package Part Number: R9A07G043F01GBG#BC0

So to differentiate in ARM schema I am using  renesas,r9a07g043f01.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
