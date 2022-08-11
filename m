Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C16C25B06
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 23:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjBDJ4yZxYKx4fm+HhHbJ84u6u4gE6vadB7+kQX7y1w=; b=AckjKVI/8fS4oi
	dhvxoBG24wFoytvv3E9+LrWeUm7H/8IgOozg4WV3OGXvxRpkMyEyjFTASLeaRcEUSZroGzc+9Y/vJ
	ldGwi+T/ymzsdlqDopB9o0ijwjeUH2AkjUdBK6PD6fj8sti3Y25RsltjiRDwyDws/pLHRxphpMLY6
	cwSREqK4+1aKHZZDpPyKB4gdUvFYOQGG+PhqiHxJnhim+v5j6x+NvADfoGaKAYRB/4yNsM1DINdM6
	5jDpyo9gUKZaxNaHN+Cfa0IAvS1hUV+Y74x+AMBPTLhH0IRidbrzUCDTPDEqf7AWb6iHt5lh/J9D8
	kkjjPUb1UpwgutoYTZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMHkm-006lnW-2h; Thu, 11 Aug 2022 23:38:16 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMHkj-006lkk-Ts
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 23:38:15 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-32269d60830so188031587b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 16:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IVeJqcWhysLWzgWUShSqLwDczoSExRUDYbSpzRpTiXQ=;
        b=k9jTdTI8sjO6UKOTeC4As0uQK2prWT7dSWXk4grIFRnvMm8jpC71fdZnFr5SVlFie3
         J5u9uJmgcQOpJlmDc+TH8w1teZWNMP2cwYNXmIFamQ+6Oez/W8vAph4I54W5OMxOaWi3
         nzH8r7JhnuooVcrrlRzGUgyXwBWg/NRqQooBGrXsRw4UH8M3qym/5q98FZ1LWi/Q8gIy
         /zQtmgyn6JIhmp/XPWJ4Df1VyBMTp6GMv1xc22OfjJDwRgldahF+FV3/Co5okfwaU45w
         TNz2pQ/MqF4vgbz7VCz+TSEj0hjfhtVk2wGEkuFhFUsNc94jgGEMz6GSwyK20nFeGtll
         uO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IVeJqcWhysLWzgWUShSqLwDczoSExRUDYbSpzRpTiXQ=;
        b=XNsZo0NlTMhha33UfBmts0GwLsOlquYX4ikSiQboXmdGcgcuY1YWydtCw6f9iKKADW
         XKMn/EDiEomcvTIqk9jsMzZJZo2i/FInU45SS4NXtbkZU78pj79jK0B/HlqLrMx9Urz3
         uC/t7OMWg+FJoiurihxsou0SD/6uNQVeKQx1G7VlV3m7jarguaAmRpzuQ6FHP+ybeiJj
         FWYCL2ASynhNEH58E6+vs/dxEpiKr3oBArkBFsBLjZaqgrOmwlQfovO5o6fmPaAIcyrb
         A9Xraxhs0QYP7vP0zXf0FfGutsKynsfKWws7p3E4Kp2a0j4uxFk/2yzIr3aItE7Zp4Xq
         +Y0Q==
X-Gm-Message-State: ACgBeo0Vl+68F/R3+7t/f4yvYYLAk99K3aSHy80Te/wxSnL485uDR+zB
	J1IUHOg0gU/YQl8qk/xV1ddc8NR26FqTo4Sh9p8=
X-Google-Smtp-Source: AA6agR53mPvsRpuEkAtKI6C+nhnmHsWN+IupElYcWWe4XANRE7IWo58pKjOW1TMETFZly0nVg2UElycZ1NeUGtGGebc=
X-Received: by 2002:a0d:f282:0:b0:329:7da1:90e8 with SMTP id
 b124-20020a0df282000000b003297da190e8mr1535254ywf.519.1660261089750; Thu, 11
 Aug 2022 16:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org> <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
 <3e3c0c80-48eb-098d-977d-a1801036fc0c@linaro.org> <CA+V-a8tJVGz57FcJVnbksMot=pg5dXALo4QEyqO+57HnOTJLfQ@mail.gmail.com>
 <CAMuHMdWih6XiVfLT0g=k8QrMmVzb2sqv9hxqtGE1t1F1Jvj_QA@mail.gmail.com>
In-Reply-To: <CAMuHMdWih6XiVfLT0g=k8QrMmVzb2sqv9hxqtGE1t1F1Jvj_QA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Aug 2022 00:37:42 +0100
Message-ID: <CA+V-a8tkRJrugewfAunO7CP9H7A8H5OM2=uRQtDfk7=15Zkw4A@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_163814_035372_57DC4C8F 
X-CRM114-Status: GOOD (  24.21  )
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

Hi Geert,

On Thu, Aug 11, 2022 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jul 27, 2022 at 11:48 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Jul 27, 2022 at 10:31 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > > On 27/07/2022 11:00, Lad, Prabhakar wrote:
> > > > On Wed, Jul 27, 2022 at 9:53 AM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > > >>> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> > > >>> (RISC-V arch).
> > > >>>
> > > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>> ---
> > > >>>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
> > > >>>  1 file changed, 9 insertions(+)
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > >>> index ff80152f092f..f646df1a23af 100644
> > > >>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > >>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > >>> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> > > >>>  maintainers:
> > > >>>    - Geert Uytterhoeven <geert+renesas@glider.be>
> > > >>>
> > > >>> +# We want to ignore this schema if the board is of RISC-V arch
> > > >>> +select:
> > > >>> +  not:
> > > >>> +    properties:
> > > >>> +      compatible:
> > > >>> +        contains:
> > > >>> +          items:
> > > >>> +            - const: renesas,r9a07g043f01
> > > >>
> > > >> Second issue - why not renesas,r9a07g043?
> > > >>
> > > > We have two R9A07G043 SOC'S one is based on ARM64 and other on RISC-V.
> > > >
> > > > RZ/G2UL ARM64:
> > > > Type-1 Part Number: R9A07G043U11GBG#BC0
> > > > Type-2 Part Number: R9A07G043U12GBG#BC0
> > > >
> > > > RZ/Five RISCV:
> > > > 13 x 13 mm Package Part Number: R9A07G043F01GBG#BC0
> > > >
> > > > So to differentiate in ARM schema I am using  renesas,r9a07g043f01.
> > >
> > > What is the point to keep then r9a07g043 fallback? The two SoCs are not
> > > compatible at all, so they must not use the same fallback.
> > >
> > Agreed, I wanted to keep it consistent with what was done with ARM64
> > (since both the SoCs shared R9A07G043 part number).
> >
> > Geert - What are your thoughts on the above?
>
> "renesas,r9a07g043" is the CPU-less SoC base containing I/O devices.
> "renesas,r9a07g043f01", "renesas,r9a07g043u11", and
> "renesas,r9a07g043u12" are SoCs built by integrating one or more
> RV64 or ARM64 CPU cores and the related interrupt controllers with
> the CPU-less SoC base.
>
That's bang on! which I missed to convenience the DT maintainers.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
