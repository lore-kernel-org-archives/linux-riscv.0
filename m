Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BC0C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq36KQUm90zC+rUCNGVX+FK9uSJv8+oNmOWKdormqHg=; b=tm9luv5cv1asBl
	qOGPy3EzioBA0pfXQRhaqCvF19TuwwCPAQh4dqU616U121E8XlKeLs2WKHUxwQetbWnXdmH8f4C2C
	IKbVwopdP0G1c/V7ALDKDkkeqxpFUzez4hyY+wv0PmYwYoA925ewwuRAbIB76sEVt8RV/iBrFsU07
	MONQ1zTrdTcrZ2UviNuswJIhB+6RnfgHMguiriTMJaR6wthc+Oc5iArACeOnhoGN79Ldw66jePOJ8
	G9gS/2yPOfNw9FsYBlr3Aqqwe1AF1g1PYjZD6RAi4Tgyr8wN5Xf1OanmySG6vJai7bbfI3yyeJ9sI
	bO+l2ovHCGRWJB7eDD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfMs-00D2Js-3d; Wed, 27 Jul 2022 11:38:22 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfMp-00D2Hf-Rd
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:38:21 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 7so29860918ybw.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fUe3ZPHnv3mne953AtKNlkKN9ecK/p0RKLrloPpqCts=;
        b=K1YSA94w7f1jm0mGfMBGTj4RDOeDsH5BdZYnKdj+ltvE01uB52qrkFVPQswgNq/6/f
         MNUEbKdU6xkDgPDPLA81boaWlH4bnwjhdQQ5xAIt2g1/tuenHsM8TSSKYjjun4bFEeys
         XldrNCP4c32arY7cDQFRNmTu0CL9PAkzjLHXcaUVoSNXh6lk7T0oUdfMrRpRaEIWe8Rj
         WhzFHunzCcgQ8+v2QYKyYHHqFT0NNAG1FqCP5SWKOm+M9MHFGaTkT7MKSBibE1Gnzawi
         BihjbXPoXNMA4vNyb6g3RyotpVNoT6lQJivBdjz1E+oDJQpAEHkRfddQNSPyQIb5Tf8z
         3CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fUe3ZPHnv3mne953AtKNlkKN9ecK/p0RKLrloPpqCts=;
        b=Xtf+/D2f99aCIHKal/ACrfLPJKnTyDQQi2NPsuBho09GdfzUdNoZNdDF7aZan/BboW
         HI2xKewipxzuDHSfBSx2x+1ltuj/xL3W/Li+2xUdCVNmvQjECrwa49UV8Hf1M/Yekvn1
         sKxV4bfk/8Ek/s06vmx41vOqdvCe9w+hOy8lTlS6q1sqfTr2yziK7vlD3eozU85/TVsV
         rU5KigXe8prp5TbpfoJv6Qvz+7IP0cfBcF+oemos5n1FwbdtFU5EjXDOAfEMrb5+BPD1
         wX9SMKO8qBvcn4lXSTVPHHm/Z4dSxBwkyDYX5dNbBf6aIv6ZmQ3ciR4lIeoW6LjQFkVv
         mV9g==
X-Gm-Message-State: AJIora8PIVZTACMpo0uT3JsGSBMpD/hPxENmozy6J9DhbtRAOl3y7GVq
	TNgyUdw8cOGSEeD4piJgUSePpQs/e9S0/j66KM0=
X-Google-Smtp-Source: AGRyM1vbDxpZI15cnPe+RYbwuyh4ob36FZL9kr7Whb06GU0opVS/mtU/X897buqVar2JA+fAkDH7xA5y7j2o5CywCXU=
X-Received: by 2002:a25:bd83:0:b0:670:fc70:67f3 with SMTP id
 f3-20020a25bd83000000b00670fc7067f3mr16485485ybh.244.1658921897467; Wed, 27
 Jul 2022 04:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org> <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
In-Reply-To: <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 12:37:50 +0100
Message-ID: <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220727_043819_913632_46A20C3A 
X-CRM114-Status: GOOD (  25.64  )
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

On Wed, Jul 27, 2022 at 11:09 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2022 12:06, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Wed, Jul 27, 2022 at 10:54 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 27/07/2022 11:05, Lad, Prabhakar wrote:
> >>> Hi Krzysztof,
> >>>
> >>> Thank you for the review.
> >>>
> >>> On Wed, Jul 27, 2022 at 9:54 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 26/07/2022 20:06, Lad Prabhakar wrote:
> >>>>> Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.
> >>>>>
> >>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>> ---
> >>>>>  .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
> >>>>>  1 file changed, 49 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..f72f8aea6a82
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
> >>>>> @@ -0,0 +1,49 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/riscv/renesas.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Renesas RZ/Five Platform Device Tree Bindings
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>> +
> >>>>> +# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
> >>>>> +select:
> >>>>> +  not:
> >>>>> +    properties:
> >>>>> +      compatible:
> >>>>> +        contains:
> >>>>> +          items:
> >>>>
> >>>> I think you should rather ignore the RiscV SoCs, not specific board.
> >>>>
> >>> You mean to ignore ARM/64 SoCs?
> >>>
> >>> Agreed just the below enum, should do the trick.
> >>>
> >>>             - enum:
> >>>                 - renesas,r9a07g043u11
> >>>                 - renesas,r9a07g043u12
> >>>                 - renesas,r9a07g044c1
> >>>                 - renesas,r9a07g044c2
> >>>                 - renesas,r9a07g044l1
> >>>                 - renesas,r9a07g044l2
> >>>                 - renesas,r9a07g054l1
> >>>                 - renesas,r9a07g054l2
> >>>
> >>>
> >>>>> +            - const: renesas,smarc-evk
> >>>>> +            - enum:
> >>>>> +                - renesas,r9a07g043u11
> >>>>> +                - renesas,r9a07g043u12
> >>>>> +                - renesas,r9a07g044c1
> >>>>> +                - renesas,r9a07g044c2
> >>>>> +                - renesas,r9a07g044l1
> >>>>> +                - renesas,r9a07g044l2
> >>>>> +                - renesas,r9a07g054l1
> >>>>> +                - renesas,r9a07g054l2
> >>>>> +            - enum:
> >>>>> +                - renesas,r9a07g043
> >>>>> +                - renesas,r9a07g044
> >>>>> +                - renesas,r9a07g054
> >>>>
> >>>> Did you actually test that it works and properly matches?
> >>>>
> >>> Yes I have run the dtbs_check and dt_binding _check for ARM64 and
> >>> RISC-V. Do you see any cases where it can fail?
> >>
> >>
> >> Just remove the renesas,smarc-evk2 from
> >> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts. Do you see the
> >> error? Not from this schema. The only error you will see is that no
> >> matching schema was found.
> >>
> > I did run the dtbs_check test as per your suggestion (below is the
> > log) and didn't see "no matching schema error"
> >
>
> So you do not see any errors at all. Then it does not work, does it?
>
Right I reverted my changes I can see it complaining, dtb_check seems
to have returned false positive in my case.

What approach would you suggest to ignore the schema here?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
