Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CEAC02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUPLOcYLKmROwnav06vXyE1SLeiv03F4qacAVTgZakA=; b=ZbfE/Ra2f+iq4A
	wq19Jy1g+OEqt4mgJgVWFG/N0TXRh87GDeDk/Xjzy7qneIC5WTIOET6x62vg37eRSjSYHVdkta0Q8
	gWvtAFdcn25RXSGZD7BB289njYQhSnpTSTzQZDjt2zH3kzxhPoLHxyLV9zrjCYKlMzCmetIg7WR7q
	sz1hKEewOjR8JhozyFRq7fNxOSbhKNGav5efJlvoqT3qXkKwW4V5qSZlCFDLRDHrb+Slt8T2Ed3rP
	oJyY1R0d4chWUSIvkPZKQvXLfbMWd2/QW2mbEC+t3VDRC6dOBYwYdZRS9Lv35Ss/FK70KdvDIo6yr
	oQ1O0QVfdOGE3Vmwbr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb6Tw-0000000DTis-37To;
	Thu, 23 Jan 2025 23:19:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb6Tt-0000000DTiU-2UXJ
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 23:19:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2164b1f05caso25447055ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 15:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1737674364; x=1738279164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfONWgM4B+rw2JH14h+1A74u4ndlqnjc1n9HGrEwEIU=;
        b=Q0NdVmujgDukSi3z4nOwFLZSQoc85AsP/ILfRluLzutEwbZ/SJFfprt8Gc1shvzsg3
         TWw2Yu2duE5PJDeclx6917LNh+fMFbbwhGfbYOd6BEv/oKsMHOXksIKRdlo3CR6sUBI9
         OZqnW7bcc+zaKbFVMDtVRB29S0hfNSkJuMHnf0YvYmJMbRpL/9+xFYy5ViDLWUdD45BI
         Nu9AIhoDs1g/UnRi0Q9NjswPS31XtNvOt4YiMtIS/jBiTN+Jzau4bPKfET1gfNqQoW0p
         YjTz1m9IfjCAq74GWihU22H2zGm+6mKiGV4ZmGjwuacgcfL8oK2w+AXpnlHaKpf+yOzZ
         X8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737674364; x=1738279164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfONWgM4B+rw2JH14h+1A74u4ndlqnjc1n9HGrEwEIU=;
        b=q+NwmmnGSjN4R07nSVueywAx7Lp15ic+gIl2eQSn4kelHOgL0VbTvL/OzPksJsBKcK
         PAJ4KM9HtuNsiZZElD+wnt5B4R0dbagD6lrNaD5Zec1ajBoHeWAe9oOCD8OIZydcnYyu
         dZVyOtt33rSW0M3TWAOEh2mhC75Lc2LGDZnGjlD0Fzg38RvLaN695c8SHDQJG0+wglY2
         exJg10EGuYdYh5LbQA4sH+/kn7RzyHjkAEXmcDaG1gqOfqf54L2n23a7ldOnpBdk7yyi
         +IY2Jl7i8qfosDAnOmDWmDJJ8lBMg1pn7ws3cMG+6V8EYiTE1KxeEhEoBfe4qMI8cndF
         43Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXEET9Ru23cWtvPmniCcF7v6zmemBH44ygf55SdjfPCZVD+ehr/R91W44sUO1Tt50Lj2uSWdPdPE0GhVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4zeu9sOGd/TDLDh3Ua92aE6/6c7RDStR6cnvFn88EYMIpROTT
	XYqeLeTFdYfw1pX93at14ydjR880AoXWqZv5DvtSRlQ9ZTz+VANT0qAGeMAhnOw=
X-Gm-Gg: ASbGncsOj6LS+iRiWZ3EzRXVHfBuzCLqClWkKD4oWu52JKhiXXVf3OchYZ5ekWTGrCp
	Lh2MWLce3pAnHI99BOflSgmuII4B98xHUes5006J4bQj4xHCHk6G7unP+Bacz7Uk2vMyHlaFGq2
	8HDl7crtQevH06djBgNbe/2wKag/a91E6N1TduRBSvKsiUpI+yEwIDlb/B8xORfZ7PvmintODc3
	/3cj65X1XkSDym6wS+imJp6UoCaNqrPTvShlxYckKatAh5/ssx9jyqLqRCcak8uDeuNPNW+/LvT
	rntl8coMp/kBgQdGxnYh3cElLrGhJ5Zpu8SXBjN5obXRxA==
X-Google-Smtp-Source: AGHT+IG9D69/A30bCSG56XByEivne0LZ4eTvZXYB8a9hFGTFSDJHXfcZ7shZT7kJGwKsgbTgNynaAA==
X-Received: by 2002:a05:6a20:8423:b0:1e1:ca27:89f0 with SMTP id adf61e73a8af0-1eb215bec54mr45503593637.37.1737674364069;
        Thu, 23 Jan 2025 15:19:24 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac4907f076dsm426261a12.37.2025.01.23.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 15:19:23 -0800 (PST)
Date: Thu, 23 Jan 2025 15:19:18 -0800
From: Olof Johansson <olof@lixom.net>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250123113042-GYA38135@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_151925_909497_FDA7AA4E 
X-CRM114-Status: GOOD (  38.43  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 23, 2025 at 11:30:42AM +0000, Yixun Lan wrote:
> Hi Olof:
>  thanks for your reivew
> 
> On 12:03 Wed 22 Jan     , Olof Johansson wrote:
> > Hi,
> > 
> > On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> > > The GPIO controller of K1 support basic functions as input/output,
> > > all pins can be used as interrupt which route to one IRQ line,
> > > trigger type can be select between rising edge, failing edge, or both.
> > > There are four GPIO ports, each consisting of 32 pins.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
> > >  1 file changed, 116 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > @@ -0,0 +1,116 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SpacemiT K1 GPIO controller
> > > +
> > > +maintainers:
> > > +  - Yixun Lan <dlan@gentoo.org>
> > > +
> > > +description:
> > > +  The controller's registers are organized as sets of eight 32-bit
> > > +  registers with each set of port controlling 32 pins.  A single
> > > +  interrupt line is shared for all of the pins by the controller.
> > > +  Each port will be represented as child nodes with the generic
> > > +  GPIO-controller properties in this bindings file.
> > 
> > There's only one interrupt line for all ports, but you have a binding that
> > duplicates them for every set of ports. That seems overly complicated,
> > doesn't it? They'd all bind the same handler, so there's no benefit in
> > providing the flexibility,.
> > 
> yes, all ports share same interrupt line, but each port has its own
> irq related handling register, so it make sense to describe as per gpio irqchip
> 
> also see comments below
> 
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^gpio@[0-9a-f]+$"
> > > +
> > > +  compatible:
> > > +    const: spacemit,k1-gpio
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^gpio-port@[0-9a-f]+$":
> > > +    type: object
> > > +    properties:
> > > +      compatible:
> > > +        const: spacemit,k1-gpio-port
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      gpio-controller: true
> > > +
> > > +      "#gpio-cells":
> > > +        const: 2
> > > +
> > > +      gpio-ranges: true
> > > +
> > > +      interrupts:
> > > +        maxItems: 1
> > > +
> > > +      interrupt-controller: true
> > > +
> > > +      "#interrupt-cells":
> > > +        const: 2
> > > +        description:
> > > +          The first cell is the GPIO number, the second should specify interrupt
> > > +          flag. The controller does not support level interrupts, so flags of
> > > +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > > +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> > 
> > Same here, since there's no real flexibility between the banks, it might
> > make sense to consider a 3-cell GPIO specifier instead, and having
> how to handle the fourth gpio port? I would like to have uniform driver for all ports
> 
> > the first cell indicate bank. I could see this argument go in either
> > direction, but I'm not sure I understand why to provide a gpio-controller
> > per bank.
> > 
> 
> IIUC, your suggestion here was same as the implementation of patch v3 of this driver[1],
>  while combining all four ports into one irqchip, which NACKed by maintainer[2].
>  I tend to agree having a gpio-controller per bank provide more flexibility,
>  easy to leverage generic gpio framework, even each port can be disabled or enabled,
>  and IMO having shared irq handler isn't really a problem..
> 
> [1] https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
> [2] https://lore.kernel.org/r/CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com
> https://lore.kernel.org/r/CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com

Hmm, I don't understand the reasoning there, but it's not my subsystem.

It seems worse to me to misdescribe the hardware as separate blocks
with a device-tree binding that no longer describes the actual hardware,
but it's not up to me.

Let's get the platform support merged, ignore my feedback here -- we need more
SoCs supported upstream and this code is good enough to go in as-is.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
