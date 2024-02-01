Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50172C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 17:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fW6QXrddXGrvGyqlni7fRy4ghcAHASQKSlKT0Xlrbl8=; b=wPMD6OHRjBiLnM
	VF4em7S+x6ZacqrZtaTUWtR7OcXCevMA+YwRf68drQdAotkZfUdtdinKiQDXOLwdTVtbyX/CDTs0K
	dftwyPodvidWCv8/UltgbHqtUxvZofvcb4ltp/AND0i71PXVXUj8mqvDj+BDnAwmFZ8xw5Q+O/bjd
	OUeqr+65EkaLR98WgGDNx1pot6S6tk0zOOi4lXcocTAzH1mhAhWQXj8knhIv7QRbwwFATvLVS0sck
	K05TUZq1YwM5WQwFCPx32ZhYGKmXeP9li+wsB7wMM8ABdjeiWBfXs52QB7woZo312Ghw6A/2MvLNt
	gMZ9r6uyFVR4UX146GBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbBS-00000008rFm-3wOr;
	Thu, 01 Feb 2024 17:49:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbBP-00000008rEI-1BDs;
	Thu, 01 Feb 2024 17:49:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F246DA7;
	Thu,  1 Feb 2024 09:49:40 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D4F3F738;
	Thu,  1 Feb 2024 09:48:54 -0800 (PST)
Date: Thu, 1 Feb 2024 17:48:51 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20240201174851.62e74089@donnerap.manchester.arm.com>
In-Reply-To: <20240131-renewably-glimpse-a80339e8ff81@spud>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
 <20240131125920.2879433-2-privatesub2@gmail.com>
 <20240131145244.4f534bac@donnerap.manchester.arm.com>
 <20240131-renewably-glimpse-a80339e8ff81@spud>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_094903_452020_EF5106B8 
X-CRM114-Status: GOOD (  39.33  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?= =?UTF-8?B?Zw==?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jan 2024 21:22:06 +0000
Conor Dooley <conor@kernel.org> wrote:

Hi,

> On Wed, Jan 31, 2024 at 02:52:44PM +0000, Andre Przywara wrote:
> > On Wed, 31 Jan 2024 15:59:14 +0300
> > Aleksandr Shubin <privatesub2@gmail.com> wrote:
> > 
> > Hi,
> >   
> > > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > > controller witch is different from the previous pwm-sun4i.
> > > 
> > > The D1 and T113 are identical in terms of peripherals,
> > > they differ only in the architecture of the CPU core, and
> > > even share the majority of their DT. Because of that,
> > > using the same compatible makes sense.
> > > The R329 is a different SoC though, and should have
> > > a different compatible string added, especially as there
> > > is a difference in the number of channels.
> > > 
> > > D1 and T113s SoCs have one PWM controller with 8 channels.
> > > R329 SoC has two PWM controllers in both power domains, one of
> > > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > > 
> > > Add a device tree binding for them.
> > > 
> > > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
> > >  1 file changed, 88 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > new file mode 100644
> > > index 000000000000..716f75776006
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > @@ -0,0 +1,88 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner D1, T113-S3 and R329 PWM
> > > +
> > > +maintainers:
> > > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: allwinner,sun20i-d1-pwm
> > > +      - items:
> > > +          - const: allwinner,sun20i-r329-pwm
> > > +          - const: allwinner,sun20i-d1-pwm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#pwm-cells":
> > > +    const: 3
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Bus clock
> > > +      - description: 24 MHz oscillator
> > > +      - description: APB0 clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus
> > > +      - const: hosc
> > > +      - const: apb0
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  allwinner,pwm-channels:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: The number of PWM channels configured for this instance
> > > +    enum: [6, 9]
> > > +
> > > +allOf:
> > > +  - $ref: pwm.yaml#
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: allwinner,sun20i-r329-pwm
> > > +
> > > +    then:
> > > +      required:
> > > +        - allwinner,pwm-channels
> > > +
> > > +    else:
> > > +      properties:
> > > +        allwinner,pwm-channels: false  
> > 
> > Do we really need to be that strict?
> > If something compatible to D1 pops up in the future, just with a different
> > number of channels, we would need a new compatible string.  
> 
> Well, you would want to have a soc specific compatible anyway then,
> right?

So the idea would be to add any new (specific) compatible string to that
list then, when we add them?
I guess this would work, but strictly speaking any current driver would
then only need to check this property for the R329 type? The Linux
driver proposed in the next patch *always* honours the
allwinner,pwm-channels property, which is IMHO the right way to implement
this. And that's why I think the binding should reflect that, and not
explicitly *forbid* the property for every one other than R329 (atm).

With the current Linux driver, a potential new SoC using:
	"allwinner,sun20i-d2-pwm", "allwinner,sun20i-d1-pwm";
	allwinner,pwm-channels = <6>;
would work without driver changes. A driver strictly written to this
binding here might not, though, as it would be free to ignore the
pwm-channels property.

Does that make sense? So to encourage future compatibility, can we drop
the "else" branch?

> > If we would leave this else branch out, we could just specify some
> > number differing from the default, and be good.  
> 
> If it were compatible with the d1, then the "then:" branch would apply,
> provided you used the fallback correctly.
>
> Although if the number of
> channels were different, we'd likely end up with modifications here to
> limit it to the correct values for each soc.

That's fine, because this just affects the bindings (and the DT), but
doesn't require any driver changes, which take months to trickle into
distributions, not to speak of LTS distros. A DT can be updated
independently.

Cheers,
Andre.

> > The number of channels really looks like a parameter to the IP, it's
> > modelled like this in the manual (PCR: 0x0100 + 0x0000 + N * 0x0020).  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
