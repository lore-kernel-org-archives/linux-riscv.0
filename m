Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17BCA0ED3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/HH4tC4VuDFVmqzfTWkK4yDPww9HTfcx16A0IRp+kk=; b=40duqVo8uQA4eQ
	8qqCXpydzH2b27fzg0yGeacxb8dOb5CjjFDk2KD5Lf2LRwBPgkf02d0eHNhioMNzOUtnV6YHm2rGp
	9ej1P2QTTQDAew1jqmhUKyXqOl59Q7C65gvpOmT/dHPh71PWplngoAroqI3/4dmHAJn6lWcuKoUVt
	Rvb5StUwhONnKpkT53GyjhoilVKOJYP7hjnNk7apM/qmQM2UdkZcaWSzrjNXaKTQnmtDtKH5Z+w/7
	whjFerK1zcQrGAUA0lOZSkgJC+a+LPIs3fZnuf0Nk0OO/gXT/Gthel0JNRpr6REA0mACD9sW5yjHX
	tdG//1Irntk+ia2Gw7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slk54-0000000378a-3wd1;
	Wed, 04 Sep 2024 07:05:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slk51-0000000377o-26Zc
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 07:05:29 +0000
Date: Wed, 4 Sep 2024 07:05:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <20240904070520-GYA107481@gentoo>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
 <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_000527_764353_05A83401 
X-CRM114-Status: GOOD (  28.41  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Krzysztof 

On 08:46 Wed 04 Sep     , Krzysztof Kozlowski wrote:
> On Wed, Sep 04, 2024 at 12:27:23AM +0000, Yixun Lan wrote:
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO banks, each consisting of 32 pins.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 95 ++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > new file mode 100644
> > index 0000000000000..db2e62fb452fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 GPIO controller
> > +
> > +description: >
> 
> Drop >
> 
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set controlling a bank of up to 32 pins.  A single
> > +  interrupt is shared for all of the banks handled by the controller.
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> 
> Maintainers go before description. Use example-schema as template.
> 
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^gpio@[0-9a-f]+$'
> 
> 
> No, why? Drop.
> 
> > +
> > +  compatible:
> > +    items:
> 
> and you can drop items as well.
> 
> > +      - const: spacemit,k1-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: >
> 
> Drop >. Everywhere.
> 
> > +      Define the base and range of the I/O address space containing
> > +      the SpacemiT K1 GPIO controller registers
> 
> Redundant description, drop.
> 
> > +
> > +  ranges: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +    description: >
> > +      The first cell is the pin number (within the controller's
> > +      pin space), and the second is used for the following:
> > +      bit[0]: polarity (0 for active-high, 1 for active-low)
> 
> Rather refer to standard GPIO bindings header.
> 
> > +
> > +  gpio-controller: true
> > +
> > +  gpio-ranges: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The interrupt shared by all GPIO lines for this controller.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: gpio_mux
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +    description: |
> > +      The first cell is the GPIO number, the second should specify
> > +      flags.  The following subset of flags is supported:
> > +      - bits[3:0] trigger type flags (no level trigger type support)
> > +        1 = low-to-high edge triggered
> > +        2 = high-to-low edge triggered
> > +      Valid combinations are 1, 2, 3
> 
> Hm? No, you must use standard interrupt flags, not custom ones.
> 
It should be same as standard flags, my intention here was try to say
the controller support edge trigger only, but no level trigger flags (4, 8)
should I just replace number to macro, and put it like this:

The value is defined in <dt-bindings/interrupt-controller/irq.h>
Only the following flags are supported:
    IRQ_TYPE_EDGE_RISING
    IRQ_TYPE_EDGE_FALLING
    IRQ_TYPE_EDGE_BOTH


> > +
> > +  interrupt-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - interrupts
> > +  - interrupt-names
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> 
> Use consistent quotes. Either ' or ".
> 
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof

Ack for other comments, will address them in next version, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
