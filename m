Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1802FC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+g6dm+xoN39f1aIre+LLRrE50XOMx2ylKwxYQuPXW0E=; b=Q0gVOcQey7Y9e6
	NWWMDwekxzg44yPmmQhYHoDYEvC1Z0gauksnWO66dAqpesF1Z0wlCNIuo8U0QTtMQAgCyUC8Ij4s/
	pJqTjxnYZqyApCmGimvPzC4tNv/qSJ1Bmqfl7tQF0qm8NwhwIsU5J2UXAsigklVRzr2sOT5o1IfUP
	z+FzDToqVJ5QXdvrAtcoztQwyuMdNhirWWX13w/imtvlxbKliRTFKrHCk+vxIgM8a5N152V+KFWFH
	3HfmY7fpXmsViWxwcZGjH9XZr7ENrNzDY+aTfxDdXnYh8L72ONeScXJd3B3ws74zsTymCgLleEWm6
	6Bpb8DFxHxHHHAg0ygFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauRY-009g4U-Fj; Wed, 21 Sep 2022 07:46:52 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauRV-009g1O-0e; Wed, 21 Sep 2022 07:46:50 +0000
Received: by mail-qt1-f177.google.com with SMTP id j10so3519602qtv.4;
        Wed, 21 Sep 2022 00:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=OhopKPZK57xXKGubPvCv9frnIozANjFyjeXFzVUULTY=;
        b=NkSol/Lg/3QwUSvc1R9050L+/bZRB60e6h0avQ0iFAovCQeqTNzJlCqWCiL5D0Sd8I
         p55GGD/7BFue57YnVts5azhICi4+eZPC9+r7/R60x6bOln7HEizsng++i+fSdAdkqEX5
         9p3cY0929DklAPxC+XTISQ8MSBuuIlL1K8W26Z2dhzfwccoXUsIpWs685H1f4L7PLH3h
         3ewKXvKZsGER+FRJzmBSPZ1zrn3wmM5JRSJeVR7RgqcUUDbYLmYSjdTbgrzNdj5Pif8R
         S+Z6uUMjJf9dybomT+G+mS2a9hj0UVlLkC78NTle+qSTm60jumEbIbLZ5hoUkuA6j+6+
         P5yA==
X-Gm-Message-State: ACrzQf3dUPP13d84iUG0/FOz/uhF2GukmmoXmSFwlkpXxcOv1zcNFXjI
	cL6yIJoQ78TPVSh7Dwo2lUGV8v72xSRe7g==
X-Google-Smtp-Source: AMsMyM6jAfg4j89jGmRmZqVcGTC18gDQcUkbmZOBUKQP+nnsQxuyBJ2Wa3Tai/cfVoAw0Y55xQ7ERA==
X-Received: by 2002:a05:622a:4c:b0:35c:bd5f:d795 with SMTP id y12-20020a05622a004c00b0035cbd5fd795mr22406298qtw.28.1663746406316;
        Wed, 21 Sep 2022 00:46:46 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v10-20020ac8748a000000b0034355a352d1sm1176465qtq.92.2022.09.21.00.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:46:45 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-324ec5a9e97so54502637b3.7;
        Wed, 21 Sep 2022 00:46:45 -0700 (PDT)
X-Received: by 2002:a81:8d3:0:b0:34d:1215:fb4b with SMTP id
 202-20020a8108d3000000b0034d1215fb4bmr10409981ywi.383.1663746405180; Wed, 21
 Sep 2022 00:46:45 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
Message-ID: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
Subject: Similar SoCs with different CPUs and interrupt bindings
To: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Atish Patra <atishp@atishpatra.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_004649_113258_1F598755 
X-CRM114-Status: GOOD (  18.39  )
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

        Hi Rob, Krzysztof,

This is a topic that came up at the RISC-V BoF at Plumbers, and it was
suggested to bring it up with you.

The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
To avoid duplication, we would like to have:
  - <riscv-soc>.dtsi includes <base-soc>.dtsi,
  - <arm-soc>.dtsi includes <base-soc>.dtsi.

Unfortunately RISC-V and ARM typically use different types of interrupt
controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
possibly using different interrupt numbers.  Hence the interrupt-parent
and interrupts{-extended} properties should be different, too.

Possible solutions[1]:
  1. interrupt-map

  2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
     <base-soc>.dtsi, with
       - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
       - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
     Note that the cpp/dtc combo does not support arithmetic, so even
     the simple case where nr = 32 + na cannot be simplified.

  3. Wrap inside RISCV() and ARM() macros, e.g.:

        RISCV(interrupts = <412 IRQ_TYPE_LEVEL_HIGH>;)
        ARM(interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)

     Cfr. ARM() and THUMB() in arch/arm/include/asm/unified.h, as used
     to express the same operation using plain ARM or ARM Thumb
     instructions.

Personally, I'm leaning towards the third solution, as it is the most
flexible, and allows us to extend to more than 2 interrupt controllers.

Note that this is actually not a new issue.  For years, ARM SoCs have
existed with multiple types of cores on the same die, using Cortex-A
cores for the application, and Cortex-R/SuperH/V850/... cores for
real-time and/or baseband operation.  So far this wasn't an issue, as
only the Cortex-A cores ran Linux, and we ignored the other cores (and
the related interrupt controllers and hierarchy) in DT.

What do you think?
Thanks for your comments!

[1] https://lore.kernel.org/lkml/20220815050815.22340-7-samuel@sholland.org

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
