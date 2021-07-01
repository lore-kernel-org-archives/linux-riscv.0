Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB96C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 08:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C61761452
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 08:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C61761452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbI+JngqKdc9WcsjNC23gaZzheHijOU5kYqtjg56qDI=; b=D4Mn5QIhzLUrPa
	x0lEXHxcPHWH8uh1v0m3qrc/Cc9H/BN5iP9TZpUpGnDopWpZnJmlOw7D0NjEbjufwOouV7adJFcyn
	dKAzJnKrUn+BEdwhKmwTMlsCxP7C0g+y1Rc2MA9qB0AkAqxtGubhxP2PMykq1E+YjuesJK9hwDGp5
	kO4VEYPHOfP8xP0j/jvoItfz/BBQ8t1g8PMer+xnPy6ckYMRzdwQJS6fW0HLuASCN6WHD2Cjwy2I2
	vBroHOYsaS2QS1U4Y+UtF6v51gUVBgAjmKkIUWIuBdazbIB5ZGwrz2gV40CvaBS18L4LzblpZiAtp
	WdzVVTrV5BAqnYJyp/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lysAE-00GX6N-0a; Thu, 01 Jul 2021 08:35:14 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lysAA-00GX55-BT
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 08:35:12 +0000
Received: by mail-ua1-f45.google.com with SMTP id q3so1961199uao.0
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 01:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7bpYvv8lA/1j4v7R7NAURrd4Uck8U09k/ENnDW1qf6k=;
 b=jC8kBXDHvAU6vSxuV9Ckate7KZriPgzl3ljS/GKYr4MvtwwgsYewi7cCeHDyw55jcs
 P5P/28Chr3sSIZeb+yEMiqPfIxePVWO4wI4ZU6ZRhX6aQbwXCFX+iwiGrOCgIagzvdce
 D3sxf3vk5YiXK6caX1htzNlqhadJcjw2v4PTN5OLkQHkndY/iT7lOvKmj9fHFt0RHvyN
 11eu9j1Qgmz5b3uL4NpLwcEjpCrZam1vbujvrGvPzUFV9GJsDfQBJDmPLZd8vZJgpzyl
 rXA11hGnFvE+9ZfJ4W1sT3qdbRQgWtJsXBHYgdju+Ed3Tf9FJ4sdTDN+epi4kC4cTMkj
 c9WQ==
X-Gm-Message-State: AOAM531FcTInytxZyGneo9UnjNKbTpqoFKWRVi6VGifRtDl9BPi/dxOY
 fW+mmis/mdHlxxhuYRhkCyHvYuJV/QDKrkdhZso=
X-Google-Smtp-Source: ABdhPJwv1SzSKBtSCPdf+iejl9KUHvCm35kUVL+cj+WtMmtHDKpmwGbx1YK1y6nfi8T9nvDLRwwPtfy6XeF7XbGZgAw=
X-Received: by 2002:ab0:71ca:: with SMTP id n10mr2640663uao.106.1625128507544; 
 Thu, 01 Jul 2021 01:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-2-drew@beagleboard.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jul 2021 10:34:56 +0200
Message-ID: <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,
 jh7100-gpio bindings
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_013510_439903_10560EC7 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Drew,

On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
>
> [1] https://github.com/starfive-tech/beaglev_doc
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 GPIO controller
> +
> +maintainers:
> +  - Huan Feng <huan.feng@starfivetech.com>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jh7100-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> +    minItems: 1
> +    maxItems: 32

What about clocks and resets?

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      gpio@11910000 {
> +        compatible = "starfive,jh7100-gpio";
> +        reg = <0x11910000 0x10000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <32>;
> +      };
> +
> +...

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
