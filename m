Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09666E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbyhTmLzeYOT4E53QUQ8hdC59o9PzsGeWAisWFEXurM=; b=jtVrEc1vl6T8QY
	sVP2mSCf6IXfMaNw/HBivlz/npsCuPs3VeY4gaYkzqRtceA+1wMFgKLFYavWTfA4yZaN585DmW9Ej
	ZMx8+0gS1304fIZ0k4L8pQdtC/bdi0e9pMixx58O4HhB2FudocTj09cFmSVrB7bZyqws+dBxnbOBS
	IJgiXfgnL22ZdZoyrXmevOWrPVCms9Ks5q8Ag5hEexsa25BQJwA0icUItnYVay3Yn5qhu+GFZlX5s
	90khOu5jyXDx0MUhXQ+ama7mk8Q8F+8poCkoCEusIzZcXnaGFlU7AKzLf6eqZnKiiB6s0L/PhauCb
	xiDnRaVox/3qV/rHPJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOrK-00000003FVZ-3gY0;
	Thu, 19 Dec 2024 22:19:06 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOrI-00000003FUr-1x3t
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 22:19:05 +0000
Date: Fri, 20 Dec 2024 06:18:57 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241219221857-GYA3769757@gentoo>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
 <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
 <20241219-secret-passenger-350d9c54fdf9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241219-secret-passenger-350d9c54fdf9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_141904_535540_D76CC6DA 
X-CRM114-Status: GOOD (  27.24  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor:

thanks for your review

On 19:52 Thu 19 Dec     , Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 03:17:43PM +0800, Yixun Lan wrote:
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO banks, each consisting of 32 pins.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 75 ++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3d3d0b3bf2c144ed57b717bee50064949e26f087
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 GPIO controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> > +
> > +description:
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set controlling a bank of up to 32 pins.  A single
> > +  interrupt is shared for all of the banks handled by the controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ranges: true
> 
> What do you need this for?
> 
right, this isn't needed, will drop it.

> > +
> > +  "#gpio-cells":
> > +    const: 2
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
> > +  interrupt-names: true
> 
> Not that a name is valuable when you only have one interrupt, but if you
> don't specify what the name is, you cannot interrupt-names!
> 
indeed there is one interrupt, I will drop this property

> Cheers,
> Conor.
> 
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +    description:
> > +      The first cell is the GPIO number, the second should specify interrupt
> > +      flag. The controller does not support level interrupts, flags of
> > +      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > +      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> > +
> > +  interrupt-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupts
> > +  - interrupt-names
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    gpio@d4019000 {
> > +        compatible = "spacemit,k1-gpio";
> > +        reg = <0xd4019000 0x800>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        interrupts = <58>;
> > +        interrupt-names = "gpio_mux";
> > +        interrupt-parent = <&plic>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        gpio-ranges = <&pinctrl 0 0 128>;
> > +    };
> > 
> > -- 
> > 2.47.0
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
