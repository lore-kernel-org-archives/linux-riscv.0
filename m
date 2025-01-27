Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDCCC02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YV7e+jt8lEmLM4erDX27KdqQoR5CFd8Mn37uq3U1Q7I=; b=CYu9bTzBsOKYbJ
	amzO04pRYBszVzFrgaUElMU5V4dwjWHBCaPjJo5/+v+gzDbv7TdDxKwWkbHEf469oiqgBg36yEwlS
	fWKwH4N6MJi1p4rQUs+yaF5QWShRSDWe/UG+6tm+O8YJvJ9CZWoLDMsFIAu9EA77BhD8VbGOmjsik
	VSFEF2SgxgEh8/BWbz8YHOQrrUrNMTSwkh/OBuTcknxy1yzoz/qHcGhkqy7IHHIUbjBCizT+vz4xo
	K/bLMrREpNN/luMi2CSKonRBIQkXV/JZYEO6cu7ebJWh49dmLu8W4mLeheFfBLHhLUKxL/duuA5pF
	pOM+PqY9oOo5Jre/AuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTfv-000000031XM-33J4;
	Mon, 27 Jan 2025 18:17:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTfs-000000031Wz-487x
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 18:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47177A41969;
	Mon, 27 Jan 2025 18:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C83C4CED2;
	Mon, 27 Jan 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738001847;
	bh=bPMgdUx6tBcvM4b3enWsKBCUp6vLClclKDzrrTXyl/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddC7HyoAuAE23vOxPA0afI327iU6OWwMgQRKPpr+/BqszfR+Mch+m+c+8DynCieGY
	 4cR+sjldUqfscWal3R8Twe5t7rdoHvnWbm5Q1/U6CnbHuiYe/6gRuFt8i+Ak4POiUy
	 EHF/MhRhh7C8NJjk15PqjC74lwt4d3Gbh0ZCd5SNF1Rr9NtxDsDPWr9WR4b4Eyx2E/
	 4bWYxb0ybR3ulGbihEvATCm4nEFGbiaiwULmzkhxl2Er4SpQcEqxR6tI6tYQEuNshb
	 Y7HNACn49ymJ02zTmo9VCP0334rcKpy2styY3bbuV0HP9Wy/xTVzFQOG8z+KfpQk1I
	 VliHDJwHw1kyA==
Date: Mon, 27 Jan 2025 12:17:26 -0600
From: Rob Herring <robh@kernel.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250127181726.GA538260-robh@kernel.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_101729_160955_6F63A4D0 
X-CRM114-Status: GOOD (  40.52  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 23, 2025 at 03:19:18PM -0800, Olof Johansson wrote:
> On Thu, Jan 23, 2025 at 11:30:42AM +0000, Yixun Lan wrote:
> > Hi Olof:
> >  thanks for your reivew
> > 
> > On 12:03 Wed 22 Jan     , Olof Johansson wrote:
> > > Hi,
> > > 
> > > On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> > > > The GPIO controller of K1 support basic functions as input/output,
> > > > all pins can be used as interrupt which route to one IRQ line,
> > > > trigger type can be select between rising edge, failing edge, or both.
> > > > There are four GPIO ports, each consisting of 32 pins.
> > > > 
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > > ---
> > > >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
> > > >  1 file changed, 116 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > > @@ -0,0 +1,116 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: SpacemiT K1 GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Yixun Lan <dlan@gentoo.org>
> > > > +
> > > > +description:
> > > > +  The controller's registers are organized as sets of eight 32-bit
> > > > +  registers with each set of port controlling 32 pins.  A single
> > > > +  interrupt line is shared for all of the pins by the controller.
> > > > +  Each port will be represented as child nodes with the generic
> > > > +  GPIO-controller properties in this bindings file.
> > > 
> > > There's only one interrupt line for all ports, but you have a binding that
> > > duplicates them for every set of ports. That seems overly complicated,
> > > doesn't it? They'd all bind the same handler, so there's no benefit in
> > > providing the flexibility,.
> > > 
> > yes, all ports share same interrupt line, but each port has its own
> > irq related handling register, so it make sense to describe as per gpio irqchip
> > 
> > also see comments below
> > 
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^gpio@[0-9a-f]+$"
> > > > +
> > > > +  compatible:
> > > > +    const: spacemit,k1-gpio
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  "^gpio-port@[0-9a-f]+$":
> > > > +    type: object
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: spacemit,k1-gpio-port
> > > > +
> > > > +      reg:
> > > > +        maxItems: 1
> > > > +
> > > > +      gpio-controller: true
> > > > +
> > > > +      "#gpio-cells":
> > > > +        const: 2
> > > > +
> > > > +      gpio-ranges: true
> > > > +
> > > > +      interrupts:
> > > > +        maxItems: 1
> > > > +
> > > > +      interrupt-controller: true
> > > > +
> > > > +      "#interrupt-cells":
> > > > +        const: 2
> > > > +        description:
> > > > +          The first cell is the GPIO number, the second should specify interrupt
> > > > +          flag. The controller does not support level interrupts, so flags of
> > > > +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > > > +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> > > 
> > > Same here, since there's no real flexibility between the banks, it might
> > > make sense to consider a 3-cell GPIO specifier instead, and having
> > how to handle the fourth gpio port? I would like to have uniform driver for all ports
> > 
> > > the first cell indicate bank. I could see this argument go in either
> > > direction, but I'm not sure I understand why to provide a gpio-controller
> > > per bank.
> > > 
> > 
> > IIUC, your suggestion here was same as the implementation of patch v3 of this driver[1],
> >  while combining all four ports into one irqchip, which NACKed by maintainer[2].
> >  I tend to agree having a gpio-controller per bank provide more flexibility,
> >  easy to leverage generic gpio framework, even each port can be disabled or enabled,
> >  and IMO having shared irq handler isn't really a problem..
> > 
> > [1] https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
> > [2] https://lore.kernel.org/r/CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com
> > https://lore.kernel.org/r/CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com
> 
> Hmm, I don't understand the reasoning there, but it's not my subsystem.
> 
> It seems worse to me to misdescribe the hardware as separate blocks
> with a device-tree binding that no longer describes the actual hardware,
> but it's not up to me.

I agree. It's clearly 1 block given the first 3 banks are interleaved.

If Linux can't handle 1 node for N gpio_chip's, then that's a Linux 
problem. Maybe it can, IDK. The lookup from a DT node to gpio_chip just 
needs to match on more than just DT node pointer, but look at the node 
ptr and arg cells.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
