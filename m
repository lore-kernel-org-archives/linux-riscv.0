Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E9CC07E95
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 20:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606F9613EB
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 20:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 606F9613EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdU1HrbN/ktZ8hsAMecqBjAr6GdDl3XSE4S8th4kv6k=; b=wAwWuM9S8Igwn1
	BOeJaEz5B72TmFXyoUDEWhy5ejkmEiV7Lbl+Goi0/hXdsrzlldgKxHtmdfB6xmIH/pYYsE4ycdPt9
	55veXGbee0aG9CQ7tYgqT8lr7U+/hiS+I+t6w6dei5BQmK66U+BvhglK843qrczqDoyLMdfjJ1Uo+
	4AF1Cg1Zhknp+qeh3zAw3xsc7OwRRgf5VhPGQZvggImi6S+dWBsL49PlDDMsnyC/uyBSD8LwGl/mo
	dLFLT76lKwcgzBS7so/RCEobPVyz1hj7AGYhJHQA9w9nxPqvzOS5OhfJWjtlE+P5n16J2FAAaEriF
	H7yr9VUABnx5/EaH7AzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQD8-0042mw-K5; Fri, 02 Jul 2021 20:56:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQD5-0042ls-Ep
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 20:56:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id f20so2237009pfa.1
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1AEvcX79wTwRSqbgBLrkHdiDfFShg8BM5FD9raF2EWY=;
 b=IKuq5TByHH3DkX3ppDM5EBgRgnaAP3gRxzEx/9k8gJBKVC2i35+kz++q7w1A9sq8JK
 JIe1c7iiGsUtCfUQBtZ1rmKNuKFnY9UJlS3Iyx66zNFBQg2cPztZkL+tPnuQW9g5stJO
 LofVqXnk0H3/nl3BiqcovVZdRYE/OGJxIczEKYEz3eggxQATcNROQVhd8hOkxxgcj30F
 NwBFRw1hXahDBiHBoCdhHV7F3jGZ6LH00hhgSFQqx9kmU0LCbpw6JJBPhehoZi9fixSo
 klkKgmmuHew3Sm0ZZCO8V4IZ5H1kjDrOtBhoxyE1HwvAv2zHOVLJtCCjk9yo93bQCGns
 BlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1AEvcX79wTwRSqbgBLrkHdiDfFShg8BM5FD9raF2EWY=;
 b=kL601dEP1aqUHki1GC7ihJBHAWy5ZYF6bUZCfwDGOMqyFfKePAAE4V34Dg56tNcBR+
 IPU29T6tJXL271Pqg9Ixhky3eddz8FrzGB9MJB8sObDngIib0fd4LwjfSxCfKJWkcpaQ
 kQgdLzeC4m9M3FEhJ48ctAdbPX8xVDLX7l8fXNZFmduJ7n8OGxqxUTicOjjkt5xH7Nn9
 8n+y3/rgQtihTg9nabtkS5J3M3WKZBkpVo9WGMvNfKwZjVXXH+ScBNNhfhOwWVZEiEZX
 lzjx22U0vesgq28EckcHvWjensXt5VwM6z6T4tRFDgrJIwfKJLfUujPoda4ZDm0lehYV
 QsBA==
X-Gm-Message-State: AOAM5315vSFNf9ecjwxDR7MMPr3hRxYtdMQrw1K576Iu7nAj5wRkVPuO
 F3ncFoC7BkZWHRbDLitZstndeQ==
X-Google-Smtp-Source: ABdhPJy//fWJHUgOfLQXNO5yR56HJiJp3eYtU+jnWyQxCWPl2c7tstUnyhlF0EcmYQlhyMVWmYGR+w==
X-Received: by 2002:a63:6246:: with SMTP id w67mr1850437pgb.66.1625259385386; 
 Fri, 02 Jul 2021 13:56:25 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
 by smtp.gmail.com with ESMTPSA id j16sm4908574pgh.69.2021.07.02.13.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 13:56:24 -0700 (PDT)
Date: Fri, 2 Jul 2021 13:56:22 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio
 bindings
Message-ID: <20210702205622.GA1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_135627_597783_F2C26F92 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7100 GPIO controller
> > +
> > +maintainers:
> > +  - Huan Feng <huan.feng@starfivetech.com>
> > +  - Drew Fustini <drew@beagleboard.org>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,jh7100-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > +    minItems: 1
> > +    maxItems: 32
> 
> What about clocks and resets?

Thank you for your feedback, Geert.

GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
tree node would use something like this:

  clocks = <&clkgen JH7100_CLK_APB1>;

I see the sifive-gpio.yaml has:

  clocks:
    maxItems: 1

Would that be the correct way to do it for the starfive gpio yaml?


The reset for GPIO controller is presetn under dom_sys.  Do you think
know you know an example that has reset in the YAML?  Is there some code
that would actually make use of that information?

> 
> > +
> > +  gpio-controller: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - "#gpio-cells"
> > +  - gpio-controller

Do you think I should add 'clocks' to 'required:'?

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +      gpio@11910000 {
> > +        compatible = "starfive,jh7100-gpio";
> > +        reg = <0x11910000 0x10000>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        interrupts = <32>;

I would add:

  clocks = <&clkgen JH7100_CLK_APB1>;

But I am not sure how reset would work?


Thank you,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
