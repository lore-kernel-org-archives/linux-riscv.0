Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A22ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qahJl4Nzq94/2B1C6niGsn/UyeKgtQKx4vKT7uwyZkc=; b=uCUzO6C874D8LM
	Mf3FBU6TXLjdEHOswZO+mZSH9BtW3/klFs99Q2ICvkKT64f/CX8VIPLk5nZeGKdnyCd6/n4ZAta2D
	30pd7Utpazsf4CuqY66R8zP0978EYi63z3AlSm+q5oc5JdaYzqZyHNRCn2S8XaDOu4QJolrL+JNKj
	BCz9iO1fwQiPfJ7J0/NueMxC/Sc/66CfaMQa/5Tm8j0j2EQhcre4JavELZu2TjWNpDo5dMBO9VwLW
	3PTd/LD9m0n1lC0R/de9LC16rm/vfGIxSB6NTuHvcVc0HzRjPqm/ROh8rPEToN2mhx8Zh2IANZ3bd
	8iyzxP15J1zc40xZv7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw1q-00AP4G-Bs; Wed, 21 Sep 2022 09:28:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavv6-00ALgQ-IK; Wed, 21 Sep 2022 09:21:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id f20so7695534edf.6;
        Wed, 21 Sep 2022 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GLpNbv2dDZs2ELKJfedbPTLfT2mNSjQrTpD1eCAo9R4=;
        b=mdAeRwbFj19Rzs/mqgRFM2d7927buI86UH/L76robThQCURIrMdVolDmohaWuKLt8F
         ZfJGEFoE5VoyRUdHha0+3lArmu35lorSe0gugTFVVrKQJBPKvNZmq7HbVEpBfkHTjfKx
         X+FRub5EJupwXhVdt7yIy/jkz30YU74pYcMEwqsMB3xrL+wzsWAbmla2uTv3ihCuU9J9
         eYWlTb67MOkHBcKQiT1i4XFrIn0KbAbBlMUPVD6NqznG8+UVojtf1f5yeFMb/wlgHwda
         3soPAwF9S213cC9McMt9xZ7Rq8GJhxlCiJxhBSldfOIvj0jbxFmFKTZioJDYlrxq2UlP
         iSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GLpNbv2dDZs2ELKJfedbPTLfT2mNSjQrTpD1eCAo9R4=;
        b=M9854mwmVo/YACRsTJzv/PezikaYWGgJCcgUNfXiiWfmnk2TXNHNm17vSDN9egPzg7
         8KiI8oQELg98AOMt+5MmiGYl5VeCTZ+QGRoJKPg1C1VvWQgry49jdJBvZvIlSNsB8gp0
         zpgwdrbG8yYdUcD9VlewwMC//rjZdSHToFweQLNfGrTL/4LxtTRWoxuqy9cbdBTnIcKF
         fWGGfsfxcAfnBqmfwksDi53l8I2MAzS/FxiycRkFXITJ1WmXhzYH/XGOfsPYGLG9oWan
         rvA76udPmxC+cOxkrk3/mV88rvYTWo1nv/z8omY8JVN4frp3PZiZSMn+VijHtKDkG5tH
         Mtaw==
X-Gm-Message-State: ACrzQf0mooSa0by+vqlhIMXCCgjh/4nvQrH7ka69DcvQPAtGMqpSDxIf
	Jxv/VpsL7qdL3Uy54V+XVLzvG2ADdy+rJx6V5gs=
X-Google-Smtp-Source: AMsMyM7+OZ810UA2mZJt2QSEYSd2Q9iA3wdNG3qKqnIkRmmrozXEWttDQZsMNbbQC6kq39c2WPA+h5udMhfxXLYzak8=
X-Received: by 2002:a05:6402:350b:b0:452:2b68:90db with SMTP id
 b11-20020a056402350b00b004522b6890dbmr23967840edd.255.1663752085609; Wed, 21
 Sep 2022 02:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
In-Reply-To: <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 Sep 2022 10:20:58 +0100
Message-ID: <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_022128_646092_34DC7DCD 
X-CRM114-Status: GOOD (  23.66  )
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

On Wed, Sep 21, 2022 at 9:53 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/09/2022 09:46, Geert Uytterhoeven wrote:
> >         Hi Rob, Krzysztof,
> >
> > This is a topic that came up at the RISC-V BoF at Plumbers, and it was
> > suggested to bring it up with you.
>
> I guess you also need SoC maintainers as well (+Cc Arnd and Olof). :)
>
> >
> > The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
> > cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
> > To avoid duplication, we would like to have:
> >   - <riscv-soc>.dtsi includes <base-soc>.dtsi,
> >   - <arm-soc>.dtsi includes <base-soc>.dtsi.
> >
> > Unfortunately RISC-V and ARM typically use different types of interrupt
> > controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
> > possibly using different interrupt numbers.  Hence the interrupt-parent
> > and interrupts{-extended} properties should be different, too.
> >
> > Possible solutions[1]:
> >   1. interrupt-map
> >
> >   2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
> >      <base-soc>.dtsi, with
> >        - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
> >        - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
> >      Note that the cpp/dtc combo does not support arithmetic, so even
> >      the simple case where nr = 32 + na cannot be simplified.
>
> What do you mean? Macros support string concatenation and simple
> arithmetic like adding numbers. I just tested it.
>
I did try the below:

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 689aa4ba416b..0f923c276cd3 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a07g043-cpg.h>

+#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr na
+
 / {
     compatible = "renesas,r9a07g043";
     #address-cells = <2>;
@@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
             compatible = "renesas,r9a07g043-ssi",
                      "renesas,rz-ssi";
             reg = <0 0x1004a000 0 0x400>;
-            interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+            interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
                      <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;

This worked as expected, but couldn't get the arithmetic operation
working. Could you please provide an example?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
