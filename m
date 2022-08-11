Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FCC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syFnn2N6jdu+w1R9cxOCtdVmJw5yQZBsArrX4I8WgZ8=; b=iwUWuzFBPHsQDL
	rptkpCdLcL0l2wegkrOzFMdB7N0cGitmvWyg+qOyYTz/x/UprxPFjjKHI4vKDGT8a3BC9WqEbiB9I
	lXL9R3miVFQ0knvYHP+LwfKtOhxNjLeHRvxmIdL5LHjh6vkEDJSV4a58kta1wzjqrL20KIDzF4Ejm
	Va3uaatDMj4rsKWyu/zoDNT3+LzOSkU0zi++p3xl6n66rWdMWr3o42ttmJwWsyPDv3b+prQ+DALxQ
	GHI5tMQ/BPLaIbJ+tq3CeCe/6JRT6Cf/t0ij+UjgNYDrtkZVAZeKSb+ewIOxqWxq3b6C9TsmeDuJ+
	YIGYs/jm8w4+23oUt0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAKb-00E9R9-6J; Thu, 11 Aug 2022 15:42:45 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAKY-00E9NW-89
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 15:42:43 +0000
Received: by mail-qv1-f45.google.com with SMTP id d10so8018060qvn.8
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CmaQmycmiDs0ZhLNzBEap3uy9DegAtgeJY98yfTaoT0=;
        b=aSvCr6vxBw71h+W1vWsxtc5atEFuTNHjYIQaACvQl8On0bH8PPgJpjUif7UgiEfcnJ
         z/v3hKsyMLYdRJ7cFxeQVoOMIbkVeNiGLiS9NUW+35HEeYoQhEd9GfnjXqQ7wRx1snuF
         0Kbs6YqH6W4jbQAeKh7kSE+cEtVwnNM/bcEgSKmgNwsRjvZeZpGkgbcIb6tovGwDTHpf
         buYC6uotsAIfB8WtaOymJ69dplvSGOtHqE0CFzidep4HwrQpJhoSn5Fa+ZJsDi4yhLAA
         eRWZtrel6ewbKu8ESn/K2bnVImS4TnTy+qywAbMgt/bhOo1heI54YOj1cIstI91ryvvD
         FoXg==
X-Gm-Message-State: ACgBeo1MRnVVtQstVfSF88CZqloy0rAWvFXOyBN4XPGW0o2OEyY17BKv
	6sNpK+GfHsesLF1eiJIQucgQfXKHmVWlvoyY
X-Google-Smtp-Source: AA6agR42sjihgijdKIq3wON6LOBXG9ZSLieswJsMCuhaEioEKBuyu8Xj/qxJAFEdG1S0YzduiVSo8w==
X-Received: by 2002:a0c:9d92:0:b0:476:95b7:1dc1 with SMTP id s18-20020a0c9d92000000b0047695b71dc1mr28951581qvd.19.1660232559491;
        Thu, 11 Aug 2022 08:42:39 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id dm23-20020a05620a1d5700b006b906c7ba98sm506279qkb.85.2022.08.11.08.42.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:42:36 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id z5so28864022yba.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:42:35 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr29967472ybq.543.1660232555433; Thu, 11
 Aug 2022 08:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org> <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org> <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org> <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org> <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
In-Reply-To: <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 17:42:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
Message-ID: <CAMuHMdWOdQ5HNU8CuWYXHqYs-UfdggTuCf1AARdJC-3WMTy7Hg@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_084242_311497_D541EF98 
X-CRM114-Status: GOOD (  33.71  )
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

On Wed, Jul 27, 2022 at 2:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/07/2022 14:21, Biju Das wrote:
> >> Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
> >> documentation for Renesas RZ/Five SoC and SMARC EVK
> >> On 27/07/2022 13:37, Lad, Prabhakar wrote:
> >>>>> I did run the dtbs_check test as per your suggestion (below is the
> >>>>> log) and didn't see "no matching schema error"
> >>>>>
> >>>>
> >>>> So you do not see any errors at all. Then it does not work, does it?
> >>>>
> >>> Right I reverted my changes I can see it complaining, dtb_check seems
> >>> to have returned false positive in my case.
> >>>
> >>> What approach would you suggest to ignore the schema here?
> >>
> >> I don't think currently it would work with your approach. Instead, you
> >> should select here all SoCs which the schema should match.
> >>
> >> This leads to my previous concern - you use the same SoC compatible for
> >> two different architectures and different SoCs: ARMv8 and RISC-V.
> >
> > Or is it same SoC(R9A07G043) based on two different CPU architectures (ARMv8 and RISC-V)
>
> Then it is not the same SoC! Same means same, identical. CPU
> architecture is one of the major differences, which means it is not the
> same.
>
> > Using same SoM and Carrier board?
>
> It's like saying PC with x86 and ARMv8 board are the same because they
> both use same "PC chassis".

That's not a fair comparison: the "PC chassis" is passive, while the
carrier board is an active PCB.  So it is more akin to plugging
any Intel LGA 1151 processor into any motherboard with an LGA
1151 socket.  Do we have compatible values for all such possible
combinations? ;-)

The classic compatible scheme of an ordered list from most-specific
to least-specific is not well-suited for this case of mere
aggregation.  That's why we have been decoupling board and SoC
compatible values for a while, and identifying specific boards by a
combination of a board-specific and an SoC-specific compatible value.

New SoCs that are available with different core CPU families (and
that are pin-compatible) are just the next step in the evolution....

At the DT validation level, I think the proper solution is to
merge Documentation/devicetree/bindings/arm/renesas.yaml and
Documentation/devicetree/bindings/riscv/renesas.yaml into a single
file under Documentation/devicetree/bindings/soc/renesas/.

What do other people think?
Thanks!

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
