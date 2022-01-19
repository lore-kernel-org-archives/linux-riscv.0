Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84993C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBlOfDIqlOmubbqUGGJNu378uSgzeBmuj6SX+2X5E9g=; b=4eqDiyVQedWFYN
	bxcF7UIjY0L+6okhYAWw8Qj3yN1azeFXeTH9w09u1e3I4VzRZorjUp9O5nP2n2Y9zKpdl6yZyhzzX
	8V8BeE52GNS2omEJJtd044c3Kgz2kjcd2lQDkGZVZfHoH6ja6dXYAVQBIoRDWKibQslbRro5l6Fsg
	Zj8VuVuWpgZTx0vjxr0/GZWX0ONlUkzDIuqa060MkC92AjLVsZwMJabZq/vi1AzCmJnYaeRHWw6on
	/xSDN0tU5DSL6UyHFTarPXZXUYt74MaoQju/RqfFQAvYyCjzwv0XD7e7h1vZYX3jaxwcEcrL3bFR+
	1ECcLcNmoAtGqb8Bo1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACtr-0069K3-JC; Wed, 19 Jan 2022 15:29:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACtp-0069IN-3n; Wed, 19 Jan 2022 15:29:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF4CC6150E;
 Wed, 19 Jan 2022 15:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB7AC340F5;
 Wed, 19 Jan 2022 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642606164;
 bh=eiP3xCZsCy88f8i33Qm5tHFJtlYCUAmvYn1cMS/h6LE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I1dPJN3TNsxi+GutnLfvLdAkrWaj+YTzuNOht44jN2mKf4fq/VkPg/jPsPShpheIN
 w60sca0yrzhrw+coRSJ3HgeB7dL4Ychtb88u293ZJQTXzrjtyODiFgDB4cXmqZt6xV
 AcWnpVHvAgN8zPYxE5Mku4TyInsZsNHWhAHgeTnCLSpuomcTJdzI+merY+u28R4kbp
 lA5zvYtpL5fMlJ72EaUW0GKDHa+8MhGWvomV5SCUqAS8IJvzymtE9RhCMTcXzPdioM
 OGRz+34yZg5gVhz37TdPybPlWPnLd2QB1HKIoGQ1bf4IAC//3aLt8oCkE4Rw27Uo5n
 z2G0zV2aggLyQ==
Received: by mail-ed1-f42.google.com with SMTP id b13so14023357edn.0;
 Wed, 19 Jan 2022 07:29:23 -0800 (PST)
X-Gm-Message-State: AOAM53394VaE1cCUJwMMQqg7NqKkcJdfcp3IZBgdu9KyqFhhahMPFrjW
 foDPsLOh2U68TE3O2DiS3MyDlVFPNvB/5fGWkQ==
X-Google-Smtp-Source: ABdhPJyIYkyo1vqpmGZeQ86/fG6wkTZGxnD2kYhf8PsblQjCHqdJn557iPYrUwhbvXoPPN23Wd86PLfRtc/FtNJz2Yw=
X-Received: by 2002:a17:906:7801:: with SMTP id
 u1mr8098133ejm.82.1642606151522; 
 Wed, 19 Jan 2022 07:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
 <20220119103542.el3yuqds6ihpkthn@skbuf>
In-Reply-To: <20220119103542.el3yuqds6ihpkthn@skbuf>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jan 2022 09:28:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeTmew8ZaNsXqVsXCrkW9zb1V2JcANRVPXyEHqZnVWzA@mail.gmail.com>
Message-ID: <CAL_JsqKeTmew8ZaNsXqVsXCrkW9zb1V2JcANRVPXyEHqZnVWzA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Vladimir Oltean <olteanv@gmail.com>
Cc: devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee.jones@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Kalle Valo <kvalo@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sudeep Holla <sudeep.holla@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, 
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, 
 linux-can@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, 
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_072925_243528_71DB1C16 
X-CRM114-Status: GOOD (  27.61  )
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

On Wed, Jan 19, 2022 at 4:35 AM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> > The 'phandle-array' type is a bit ambiguous. It can be either just an
> > array of phandles or an array of phandles plus args. Many schemas for
> > phandle-array properties aren't clear in the schema which case applies
> > though the description usually describes it.
> >
> > The array of phandles case boils down to needing:
> >
> > items:
> >   maxItems: 1
> >
> > The phandle plus args cases should typically take this form:
> >
> > items:
> >   - items:
> >       - description: A phandle
> >       - description: 1st arg cell
> >       - description: 2nd arg cell
> >
> > With this change, some examples need updating so that the bracketing of
> > property values matches the schema.
> > ---
> (...)
> > diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > index 702df848a71d..c504feeec6db 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > @@ -34,6 +34,8 @@ properties:
> >        full routing information must be given, not just the one hop
> >        routes to neighbouring switches
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      maxItems: 1
> >
> >    ethernet:
> >      description:
>
> For better or worse, the mainline cases of this property all take the
> form of:
>
> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
>                                 link = <&switch1port9 &switch2port9>;
>                                 link = <&switch1port10 &switch0port10>;
> arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
>                                                 link = <&switch1port6
>                                                         &switch2port9>;
>                                                 link = <&switch1port5
>                                                         &switch0port5>;
> arch/arm/boot/dts/vf610-zii-scu4-aib.dts
>                                                 link = <&switch1port10
>                                                         &switch3port10
>                                                         &switch2port10>;
>                                                 link = <&switch3port10
>                                                         &switch2port10>;
>                                                 link = <&switch1port9
>                                                         &switch0port10>;
>
> So not really an array of phandles.

Either form is an array. The DT yaml encoding maintains the
bracketing, so how the schema is defined matters. To some extent the
tools will process the schema to support both forms of bracketing, but
this has turned out to be fragile and just doesn't work for phandle
arrays. I'm working on further changes that will get rid of the yaml
encoded DT format and validate DTB files directly. These obviously
have no bracketing and needing the DTS source files to change goes
away. However, to be able to construct the internal format for
validation, I do need the schemas to have more information on what
exactly the phandle-array contains.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
