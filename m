Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FA6C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eA8RT/PS3RM2WVYtzdV14dyRzPqMsCH1pCRIR2XQao=; b=gz6iMXKzQHiffU
	Pc/pfaiX0zDQ+N4E0WZ5pgFD4yx7Zb7ttslJpWRTZrAJdPWydVv39bUX/Vlb5QufWbx8mHcZd32WY
	jcLt2hFxkpaSlBtEer+d4MhP+lRnnrdeFcdZ8GhwzvhcKmmRyACeI83hTJZLMX55jJor1cRGCbh/s
	oUCePUrrNRe7prlPsXWQcWjTjtiJQzLdYEzH7heCnAcB/Ov2UCpiT1fWEuYhe/8CIL/aRweT7qav0
	wsYZ2O63uUhTu1SVE2hO75kMQT6AzhnGarEB0vLFVzva05FLgIRfSOmntnYI1KOKbAMlCX60Hf2RO
	cQ4ixErSJnCww4QNOXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGd0L-00BYPQ-NW; Wed, 27 Jul 2022 09:06:57 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcza-00BXqs-St
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:06:12 +0000
Received: by mail-yb1-xb30.google.com with SMTP id c131so29212269ybf.9
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TVtZIwcu07JXR0+8xN/nQ/0RqGwtHXT7p6Ok3vBeYZE=;
        b=ZWqbYH4Scf7v0uPK5nBhI+Oi2aGMD3geeu+RxWWfYOXlH233jnt/MhtON9mgnkNPJ8
         6ASkPkPzx9T4XCRpBU4dfQfAwQ8QUbQgPkk4EYRT0FR3+xAI7fi8WsZqVSR/HQUjFpD+
         45rkjW8YLxnp4INk5NmrDVeL7osGrneXlYxnSb+Yz0G0q3DWwVQr77QSpWWNIRjDkdlg
         FtxTn4NGkfcH+d8cQ4VFkyrGGtlohUQwGzDu27uTyzhzk/eBetVM6Dg9boxyEcUtHkmz
         Ax9VJZbcH7ZK6WV6wWnOPnjSvPvX9iocq148gy1lgQCZIMr57pRH1usjDQ2kobJ2rbHE
         BtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TVtZIwcu07JXR0+8xN/nQ/0RqGwtHXT7p6Ok3vBeYZE=;
        b=ye3gYx7jFuTn1rxE4s81Os4+znJ2UGTWgmqj/+ZKMDvDqj3wZzhaHTbKik5/hvVJs5
         UtuZKMvJjFpulyqW8Bb/PtKAPTTi2zYI3GaYdPJpdLibUWfhvaWX+7ujZL0klBe2rkIR
         WvoJ2isZIDES4AnVgoPxg0LDB+FY543d4HL+jFKRXVIcP/Tbpe7YwWFbrWVJoQs1OGov
         Ko+6FIY21ngCuXQbw3bDhj/MaaaskHjSTZe9ecZaa2ZD7NdZfV3rPC+5+ptUS1GezmYV
         nXnqFb+APkajIGQf+Ou+MEVcl63IgOIy0ZStuO4KisqF0p1JWMI1iLH+FrF5EmklDXUo
         sreQ==
X-Gm-Message-State: AJIora/43d+ctP1sPX7m8Bamf0EIhtkSxdNf6mdX0bqPbVmJcU5QMOY/
	5rwUKlPqYK46CFcoZtbSIdhg0AijqZiH8EUbHYg=
X-Google-Smtp-Source: AGRyM1vMDtzNnEM6xTH8HaoM2lTtPMXOMKIaKhZ65B7NZ920zrB5f8/tgkkYAAYImsgLC6OF2gaBWwRSwVR8dhHF0+M=
X-Received: by 2002:a25:4689:0:b0:671:6d4f:c974 with SMTP id
 t131-20020a254689000000b006716d4fc974mr6910885yba.354.1658912769970; Wed, 27
 Jul 2022 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
In-Reply-To: <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 10:05:43 +0100
Message-ID: <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
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
X-CRM114-CacheID: sfid-20220727_020610_990686_56B922A9 
X-CRM114-Status: GOOD (  19.94  )
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

Thank you for the review.

On Wed, Jul 27, 2022 at 9:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
> > new file mode 100644
> > index 000000000000..f72f8aea6a82
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/renesas.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/Five Platform Device Tree Bindings
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
> > +select:
> > +  not:
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          items:
>
> I think you should rather ignore the RiscV SoCs, not specific board.
>
You mean to ignore ARM/64 SoCs?

Agreed just the below enum, should do the trick.

            - enum:
                - renesas,r9a07g043u11
                - renesas,r9a07g043u12
                - renesas,r9a07g044c1
                - renesas,r9a07g044c2
                - renesas,r9a07g044l1
                - renesas,r9a07g044l2
                - renesas,r9a07g054l1
                - renesas,r9a07g054l2


> > +            - const: renesas,smarc-evk
> > +            - enum:
> > +                - renesas,r9a07g043u11
> > +                - renesas,r9a07g043u12
> > +                - renesas,r9a07g044c1
> > +                - renesas,r9a07g044c2
> > +                - renesas,r9a07g044l1
> > +                - renesas,r9a07g044l2
> > +                - renesas,r9a07g054l1
> > +                - renesas,r9a07g054l2
> > +            - enum:
> > +                - renesas,r9a07g043
> > +                - renesas,r9a07g044
> > +                - renesas,r9a07g054
>
> Did you actually test that it works and properly matches?
>
Yes I have run the dtbs_check and dt_binding _check for ARM64 and
RISC-V. Do you see any cases where it can fail?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
