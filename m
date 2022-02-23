Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M+z0SGWcFZOEt6QNm9VhgwsSGMMXi0CRc+yvei7xGA=; b=CylzeNEkBsicyw
	0Cei8K8fWzg6AzpGo8b8J5WqL9GQC25r57JN7jbxRqVAfEUmLUaxCqLyVlTVADGjb3r1HM+iKLY51
	WnW7UWBowDqB2jEpEah+Rr/o/8LWU7rik4J7ds6BFS4Qmp+36kaezE2iq5OePAgKFmaNEPV9EDmFA
	7vNwHWSJycsKh6Vu8XKlswBI3SGY+rfoVLZk6NwxWzGwFJFThSJbLquwgKAVJEyVGQRhuFtz/hscz
	6R9NUnrBaW8UJPb0BR/hxhrkNvb2znUxg8DpC11RG1KlsJURcZC5+S85tf/vPjIh30WqQy0ETseHT
	cQSXv87OBaYJMVyHvATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtPj-00Eymy-OL; Wed, 23 Feb 2022 15:18:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMtPf-00EykU-QQ
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 15:18:46 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E89AAC000A;
 Wed, 23 Feb 2022 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645629516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L8WJ1C1Tx3aKKa3O4w4oElLz8XE2ctzr9MgK1/YUoCU=;
 b=oc+Jes6pQdZo1kzhSYkAkXsvE4s+RVTUPbPWDmF1a35hrX82st5TluCAV2C15w0eMkA6I5
 nP4Q+Q12KrmS/7Sss8FFkJroL31r78SoKt2sw/bLzZGFDhtudEOtKMfhmDS+/0qjJ+B7yL
 J2/IS+Z4W/TYryGG1X8Dz/Y49ypWY9CsE22lqqkz4jV2WVnpyPb9JDrEiHzzf2yyFa3jOd
 R0ubzG96gMcXnRbrpvcpOyppNxeAFUVC0LPXkmZwmq0wqfUPITlJbx8HtOmcK+ntjSCVm5
 lVxdfAzaWpUBonEOa73WxiVLJABsIPWjte8zqb/7KK1JEox5Lbi/c0jsv1EyAw==
Date: Wed, 23 Feb 2022 16:18:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor.Dooley@microchip.com
Cc: a.zummo@towertech.it, Lewis.Hanly@microchip.com,
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
 atishp@rivosinc.com, palmer@rivosinc.com, robh@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 03/11] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YhZQRqHib2+GR7Ma@piout.net>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-4-conor.dooley@microchip.com>
 <5b0681a0-ff46-7eb4-3644-0d1173c1f0d4@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b0681a0-ff46-7eb4-3644-0d1173c1f0d4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_071844_153049_1CFF978B 
X-CRM114-Status: GOOD (  17.65  )
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

On 23/02/2022 07:41:27+0000, Conor.Dooley@microchip.com wrote:
> Hi Alessandro, Alexandre,
> If one of you could take a look at this, that'd be great.

I actually expected someone else to apply this, what is your plan?

> Thanks,
> Conor.
> 
> On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Add device tree bindings for the real time clock on
> > the Microchip PolarFire SoC.
> > 
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> > new file mode 100644
> > index 000000000000..a2e984ea3553
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> > +
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +maintainers:
> > +  - Daire McNamara <daire.mcnamara@microchip.com>
> > +  - Lewis Hanly <lewis.hanly@microchip.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microchip,mpfs-rtc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: |
> > +          RTC_WAKEUP interrupt
> > +      - description: |
> > +          RTC_MATCH, asserted when the content of the Alarm register is equal
> > +          to that of the RTC's count register.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: rtc
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    rtc@20124000 {
> > +        compatible = "microchip,mpfs-rtc";
> > +        reg = <0x20124000 0x1000>;
> > +        clocks = <&clkcfg 21>;
> > +        clock-names = "rtc";
> > +        interrupts = <80>, <81>;
> > +    };
> > +...
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
