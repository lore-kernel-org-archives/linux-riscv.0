Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26AEC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbJ/bG0hfLmsHpsHvPJkGd8rN5IgxMRogge1vlKJT6o=; b=yMbPRXf1Du6Va9
	r2oNQBOPTotCcnEvPI40tZeG8/Ds+fKQKJdUGUPUG2DRHB4sDxE0D80q0MMj+1Vqwe6ZPyI4FX7X2
	f0qxtAdX4n5WgazxHEN84rFljwArhR7XqD7tlmbV1avJ7e6ZNxk3ETn787bk2sf57hKIXT6YfNymq
	oZ4RuH/Gfgx3JyrpCgYqtnYqM9FgPjH7CpxaEhujjnq4/7i9zsMITbeiqDVpLyHorAKzRhkT+86Fu
	F+ExwwxWNCUdUfRPiSzGBqF1cpk3aacfUEoGok8U+uUqFF0m7WlridpAFcFB+OIejyRF/Pp68SmAo
	TNFG3Awd6obNydn8Id5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdeu-00BzRh-GW; Wed, 27 Jul 2022 09:48:52 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdes-00BzOR-1f
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:48:51 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31f445bd486so50727397b3.13
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ovc5shbS0fYZ1tyN3kjcZK0qy/VEjAYRKQdwOOz4xxc=;
        b=oOG3gcU1YIU4gwipAdyMVjIIY4vuN8EmL1P69THZ9JDcgvQhIl91DkkE7u3O3GXU6v
         PN9+tVxoHltovlvMGDqO7UZoKaB0KVhvVD9atC7yIBGCXTS5Sf37po1PmPdq4hrVSdSJ
         aPAIGz8SHv7gHEl5UySreFbYUe7EPkxuMO1hTW00IcS8nO8ck2NF3FmdOxjJMR1T+the
         sdTXGAGnqxtyF51xXMA6l9nrWwalSMf+cedREQ2xc2JOJgY/UxWD/kuJKN8l2igiLCHS
         D/y1wcCuZxD8+GQnp/DarW2RWIHEDWVUq7s6Hyd/isWgcDUlhv+kgCtYgZYP5WbvpQ0e
         nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ovc5shbS0fYZ1tyN3kjcZK0qy/VEjAYRKQdwOOz4xxc=;
        b=5N+fKxsBW1DZ80w0VCAQDIBv3sw5Dbb6jDTNbk+Km+ZUsROGfcwHyab9hVxfX/oFLh
         s8ffOcJxCqitUtUpF0OKPEdKl+hcqQuYiGY91mDpFT4iheh/GXTukXEmtjtpBsIdrA/H
         Sb3y8bUDl+OSLoCjizvBPNn8qnkNyL8r8b6S6kHu6kO2dnk6yF8Z2gUPTUASVqI8TvaF
         NHiq8SxuY0JltbEDcaSJl4lM54aoFA6E4YWpricgNqK3wlQzeJTtCpvI7EiEjPpv/9i0
         8+TFWsY6QK5v663THqm0KFjwGmc7A6E1Oq275mVKCvqRQEk/rAGt1pJ2jBU1ulQilRWq
         pdWw==
X-Gm-Message-State: AJIora92cWJq5QfEjWs8tHga/a2jtirmx2aLVKiYdZ20sxIWt39nFnE5
	fwIlevttXLZrB7s2iVpDlAF69w7fHTf5AUvCNrc=
X-Google-Smtp-Source: AGRyM1u0MOdkXEb4VerU+w73qTk9PZ3K6+cMpGT4uhYq7ze96hmz4VQwbYEqEJulqEsZJfJtFTd8m0sGtcJXvGhmlSQ=
X-Received: by 2002:a81:168d:0:b0:31f:6595:4195 with SMTP id
 135-20020a81168d000000b0031f65954195mr1085301yww.355.1658915328722; Wed, 27
 Jul 2022 02:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org> <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
 <3e3c0c80-48eb-098d-977d-a1801036fc0c@linaro.org>
In-Reply-To: <3e3c0c80-48eb-098d-977d-a1801036fc0c@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 10:48:21 +0100
Message-ID: <CA+V-a8tJVGz57FcJVnbksMot=pg5dXALo4QEyqO+57HnOTJLfQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_024850_151931_DBE67CEB 
X-CRM114-Status: GOOD (  20.28  )
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

On Wed, Jul 27, 2022 at 10:31 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2022 11:00, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Wed, Jul 27, 2022 at 9:53 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/07/2022 20:06, Lad Prabhakar wrote:
> >>> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> >>> (RISC-V arch).
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> >>> index ff80152f092f..f646df1a23af 100644
> >>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> >>> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> >>>  maintainers:
> >>>    - Geert Uytterhoeven <geert+renesas@glider.be>
> >>>
> >>> +# We want to ignore this schema if the board is of RISC-V arch
> >>> +select:
> >>> +  not:
> >>> +    properties:
> >>> +      compatible:
> >>> +        contains:
> >>> +          items:
> >>> +            - const: renesas,r9a07g043f01
> >>
> >> Second issue - why not renesas,r9a07g043?
> >>
> > We have two R9A07G043 SOC'S one is based on ARM64 and other on RISC-V.
> >
> > RZ/G2UL ARM64:
> > Type-1 Part Number: R9A07G043U11GBG#BC0
> > Type-2 Part Number: R9A07G043U12GBG#BC0
> >
> > RZ/Five RISCV:
> > 13 x 13 mm Package Part Number: R9A07G043F01GBG#BC0
> >
> > So to differentiate in ARM schema I am using  renesas,r9a07g043f01.
>
> What is the point to keep then r9a07g043 fallback? The two SoCs are not
> compatible at all, so they must not use the same fallback.
>
Agreed, I wanted to keep it consistent with what was done with ARM64
(since both the SoCs shared R9A07G043 part number).

Geert - What are your thoughts on the above?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
