Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D621C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2xGY8TsNg5cT0YF64GNgvrw1+rnxcm2WQrwNxGAl5k=; b=LEJkEgAKgtcuS4
	n51HRQy3i6er7Ye2HsEnRsGqXBZvFIitvfj28xxx/WSviJuhDLxUazJf+Llm1QRVgSOjErhAzXEX9
	q96yQquPxE51tleNDr1k6egn9yWjOrCMX4/5MBIJcYvu453wAUtbFpEg7XteUfQ3dptfNnU/uD5Gq
	0O6Hpaq2YTAUic7HKCyMzLFZlzWiT9sczt2UtQTM4YfmxcyDjgkbwlXRQ66//v+35LKQDCIezTv97
	vfRrNlkHaX9U5egUpJC1Wr+UDDnLRBlWrF+5yPHOZR+o1zEhUAHXgFBLBXsnwh8B2WAsrhrdU53tL
	BNVECC9r2W1yahc/BKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGj1y-00F5Y8-Hz; Wed, 27 Jul 2022 15:33:02 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGj1v-00F5Uq-DO
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 15:33:00 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31f64093c21so20644617b3.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQl6ehKgsHyBcO+W1cY0L1NdZu5y/xwam/X+NYPQiLI=;
        b=DeXHGhLgtfyynj98wV8YO+BCLU/Yzf46/Fa08tj2uwlIiGSuXkHKxFj+or8DphUJMl
         ptVfTRP7Lr69Rb5HZQpGnjpDx73NVijiQrvaLm75o5dLo1Y+30Q2zI9e3DK++wyFqOCj
         Sbr8b0SCC/8fsjHe63vYZdtuFi2Vc0FEWvcCJOHKhtxh2UCi1/xKXnDGpXK/zHdYa2f3
         4elZnFzDTlcM9TOmqq2QfrvGxy3WDv3uQyTBBrgO+qDkIY9aeWr+pMQ6anyoDsO3/Wdw
         aZk6C590YR1L4+kKOCpuZnu5uSAonYVLSbQBHbfLdJ2YnWmEQ814i2s5l+MlJqjmSd3G
         IJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQl6ehKgsHyBcO+W1cY0L1NdZu5y/xwam/X+NYPQiLI=;
        b=s/3RfTniMx+UrTKMExnyiNw4CehIRyg8JAmHlNWPHPUuC8r8RTIsGygCrYH9jKPqgn
         WHGTimZ01aCU/2f3L9cBfY+Keliq/SMiRyBsQFbb+8qWVb/6pMxHHy6hlVpdd9spgTfk
         5hmLIVHzUstkINEtGW03z0oy9yxXnWkx7bbP9qXyta7CeYxyErUG0i3n6DyWpMR7Ul9u
         W9/R3fPXOwH4shSpcS5mFVe5Klq59VPhXDLLsH7Yke3yC3nPLAuLIEizr31YJl/24Ccv
         pevtX/HgwHHt4Mnf7Uny78CtlRSjcmdlcQcQyik2xIEA787wokhxXmKXXLfzQ6BBo82N
         NpVA==
X-Gm-Message-State: AJIora8EJh9I3zl0xTgzTnZfBZcQ4btP83Xy3U0g8KS6R7nSOGZQb61h
	9HEq5jHr5cNTVx6Y15ti6RtWoTWsU5v0wp3W6IM=
X-Google-Smtp-Source: AGRyM1sO8vBRq9aT9sglSssa+iwKjicoels0vxgWeCj/K+xF2arUKXy1DBNmqhRSbnGdnNWfin4mhsUYSijorGIdNcw=
X-Received: by 2002:a81:5d55:0:b0:31c:dce7:96c9 with SMTP id
 r82-20020a815d55000000b0031cdce796c9mr19528137ywb.519.1658935975618; Wed, 27
 Jul 2022 08:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org> <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org> <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org> <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org> <OS0PR01MB5922FDF8CFFE44A611D3783886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <75e5ace3-3255-2302-65f5-9fbef9cb1147@linaro.org> <5292fbdd-9eae-2398-1260-cbef652f6af2@microchip.com>
In-Reply-To: <5292fbdd-9eae-2398-1260-cbef652f6af2@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 16:32:28 +0100
Message-ID: <CA+V-a8vVOXeqUZL7fTVHrc1qnC==uLR+nHooz=1mg-K3BwW3mQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
To: Conor.Dooley@microchip.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_083259_500313_B753E63A 
X-CRM114-Status: GOOD (  21.89  )
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

On Wed, Jul 27, 2022 at 2:29 PM <Conor.Dooley@microchip.com> wrote:
>
> On 27/07/2022 14:00, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On 27/07/2022 14:56, Biju Das wrote:
> >>>
> >>> Then it is not the same SoC! Same means same, identical. CPU
> >>> architecture is one of the major differences, which means it is not the
> >>> same.
> >>
> >> Family SoC(R9A07G043) is at top level. Then it has different SoCId for taking care of
> >> differences for SoC based on ARMV8 and RISC-V which has separate compatible like
> >> r9a07g043u11 and r9a07g043f01?
> >
> > This does not answer the concern - it's not the same SoC. The most
> > generic compatible denotes the most common part. I would argue that
> > instruction set and architecture are the most important differences.
> > None of ARMv8 SoCs (SoCs, not CPU cores) have "arm,armv8" compatible and
> > you went even more - you combined two architectures in the most generic
> > compatibles.
>
> I would have to agree with this. The most "core" part of the SoC is
> its architecture and while the peripheral IPs might be the same etc
> & the Renesas marketing team might have put them in the same "family",
> for the purposes of a device tree I don't see how having a common
> fallback makes sense.
>
Agreed, I was following the same which we have done on the ARM64 schema.

I am waiting on Geert's feedback on whether we should follow as
Krzysztof suggested ie to have

renesas,smarc-evk-r9a07g043f01 - for the board
renesas,9a07g043f01 - for the SoC

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
