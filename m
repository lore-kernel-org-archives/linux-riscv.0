Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148A3C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA9270kfozSKOSDie810dy261szyzkIt2keefJrg7o8=; b=bxIdJ+YNeR/dF4
	tB5oFJvAyVmBV6KrBsJUvr51D94SCPmsd832Scj1DSQqCaeiyvJXsvc38eaPIu+T1VJkdUiTRU/oX
	zp5jsPMsR7LQzTZBjGI8K28PdIJrbtENajbdAnAE3F1+2L+m7SYPJ15cTqWmPED55nHGLVxTn8AGR
	AOfAVRXKTokxqby2TMUldTV1bhSAFKE9GPS8fHHQhxErTTkevhGdaHPt1bKu7dlDTuJl6kQo4kWN6
	SeIy93qj+Fkat6zH6Vd8dxyqEb+rUfD3st9+KORFfKDPl4Dx1Lxj4Osr1HzYXFIVon1Qs1KQczlWt
	w833GvKqL2QLAQSittPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Clp-006oUC-3f; Tue, 28 Jun 2022 15:04:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Clm-006oTA-0n
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 15:04:51 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o6ClP-0005Ih-K7; Tue, 28 Jun 2022 17:04:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 01/16] dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
Date: Tue, 28 Jun 2022 17:04:26 +0200
Message-ID: <22692709.6Emhk5qWAg@diego>
In-Reply-To: <3361801.QJadu78ljV@diego>
References: <20220627194003.2395484-1-mail@conchuod.ie> <20220627194003.2395484-2-mail@conchuod.ie> <3361801.QJadu78ljV@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_080450_088000_C9CFCB07 
X-CRM114-Status: GOOD (  28.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 28. Juni 2022, 17:00:56 CEST schrieb Heiko St=FCbner:
> Hi Conor,
> =

> Am Montag, 27. Juni 2022, 21:39:49 CEST schrieb Conor Dooley:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > =

> > A dt-schema binding for the Ilitek ili9341 was created as
> > panel/ilitek,ili9341.yaml but the txt binding was ignored in the
> > process. Move the remaining items in the txt binding to the yaml one &
> > delete it.
> > =

> > The example in the txt binding has a spi-max-frequency which disagrees
> > with the yaml replacement (and its own documentation) so change that to
> > conform with the binding. There are no users in tree of the Adafruit
> > yx240qv29 to check against.
> > =

> > Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original=
/SPEC-YX240QV29-T_Rev.A__1_.pdf
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> =

> in your v1 you already got a [0]
> Reviewed-by: Rob Herring <robh@kernel.org>
> for this patch
> =

> Looking at the diffstat, which didn't change, you should
> include such tags in followup revisions, to prevent
> reviewers from double efforts.

and now I see that the review actually happened _after_ v2 was send ;-)


> [0] https://lore.kernel.org/r/20220627232054.GA3155668-robh@kernel.org
> =

> > ---
> >  .../bindings/display/ilitek,ili9341.txt       | 27 -----------
> >  .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
> >  2 files changed, 34 insertions(+), 41 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/ilitek,il=
i9341.txt
> > =

> > diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.t=
xt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > deleted file mode 100644
> > index 169b32e4ee4e..000000000000
> > --- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -Ilitek ILI9341 display panels
> > -
> > -This binding is for display panels using an Ilitek ILI9341 controller =
in SPI
> > -mode.
> > -
> > -Required properties:
> > -- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"
> > -- dc-gpios:	D/C pin
> > -- reset-gpios:	Reset pin
> > -
> > -The node for this driver must be a child node of a SPI controller, hen=
ce
> > -all mandatory properties described in ../spi/spi-bus.txt must be speci=
fied.
> > -
> > -Optional properties:
> > -- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> > -- backlight:	phandle of the backlight device attached to the panel
> > -
> > -Example:
> > -	display@0{
> > -		compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> > -		reg =3D <0>;
> > -		spi-max-frequency =3D <32000000>;
> > -		dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > -		reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > -		rotation =3D <270>;
> > -		backlight =3D <&backlight>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili=
9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.=
yaml
> > index 6058948a9764..94ca92878434 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >        - enum:
> >            # ili9341 240*320 Color on stm32f429-disco board
> >            - st,sf-tc240t-9370-t
> > +          - adafruit,yx240qv29
> >        - const: ilitek,ili9341
> >  =

> >    reg: true
> > @@ -47,31 +48,50 @@ properties:
> >    vddi-led-supply:
> >      description: Voltage supply for the LED driver (1.65 .. 3.3 V)
> >  =

> > -additionalProperties: false
> > +unevaluatedProperties: false
> >  =

> >  required:
> >    - compatible
> >    - reg
> >    - dc-gpios
> > -  - port
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - st,sf-tc240t-9370-t
> > +then:
> > +  required:
> > +    - port
> >  =

> >  examples:
> >    - |+
> > +    #include <dt-bindings/gpio/gpio.h>
> >      spi {
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> >          panel: display@0 {
> > -                 compatible =3D "st,sf-tc240t-9370-t",
> > -                              "ilitek,ili9341";
> > -                 reg =3D <0>;
> > -                 spi-3wire;
> > -                 spi-max-frequency =3D <10000000>;
> > -                 dc-gpios =3D <&gpiod 13 0>;
> > -                 port {
> > -                         panel_in: endpoint {
> > -                           remote-endpoint =3D <&display_out>;
> > -                      };
> > -                 };
> > -             };
> > +            compatible =3D "st,sf-tc240t-9370-t",
> > +                         "ilitek,ili9341";
> > +            reg =3D <0>;
> > +            spi-3wire;
> > +            spi-max-frequency =3D <10000000>;
> > +            dc-gpios =3D <&gpiod 13 0>;
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&display_out>;
> > +                };
> > +            };
> > +        };
> > +        display@1{
> > +            compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> > +            reg =3D <1>;
> > +            spi-max-frequency =3D <10000000>;
> > +            dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > +            rotation =3D <270>;
> > +            backlight =3D <&backlight>;
> >          };
> > +    };
> >  ...
> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
