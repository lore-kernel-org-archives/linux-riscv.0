Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D47C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2aGAFnEIAgBT6eJNcFGjPEWhqwTImA1Y1bHIUHSUHA=; b=nAc1D4GpxWaSjy
	Oh/eAE7Rk4AU1Ug34ZeGrc4QvezYAVgBCzpvtvqJC0wyTRHh99LtmR+TmCP7TonUyTbVzsG/DQnui
	aXWOVRzvVkPI7qP5+9Rv+qpocdp4t8Suvf1sj8+k8kV8T50liJwsPJ8Jj5qhPPVu1ZRrPTh8THtvj
	JkE2QMWBjGCROYTlsHAoZ1/gFIFyy8gNZzY0s8+petJZ4LH0MhBLT4SgycH+UVdR13UfrcIeKEaq2
	QBcpugI/Bf49jAvifHGLPRKA32/HUZd7rqzQw3rWP/m3qCNH9SxZ3d0WPjv1ZA81emtZ7Fiv8Chbb
	OpnYGXXHqRBa1b6GuhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACvM-0069mV-Bf; Wed, 19 Jan 2022 15:31:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACvI-0069lE-I9; Wed, 19 Jan 2022 15:30:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E9F3B81A38;
 Wed, 19 Jan 2022 15:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7491FC340E8;
 Wed, 19 Jan 2022 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642606253;
 bh=OLrV/mw6WcIgeLQa2HMwTaMX8b3pt7TE+xb2FHEMCV8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fi2HOJiy1XxLSpr2UFKLHavSvFJduA07l7M+QXFmg9r2NyMy5Bd8X8JAaf2ULb8ZE
 5NqJuKubh53QGHL1fxAGcNIE5Op5HHOSs016xV/PwG6EmuoHEfDr5CTyijop6LqYps
 HOeb/8xFrcuh+QB8jXwenWRqxBBOmI2giBGKpv/r+KcpV3p4oeNxsf1grcJHtvbOli
 QZ1e+6UqZkH60gtfkr+TWcP0oTteQbhdJZJZ1LkrGxZSGSqLo7nmqafirAc/TKj76Y
 vmivmxpWGOHnxDrsj+n++cuGcor6dh5HYkcVsg/PmU8lPYXj8VtPJKUZrdaENoVnMz
 fGNcoBjqp2oZw==
Received: by mail-wm1-f47.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so6178429wms.3; 
 Wed, 19 Jan 2022 07:30:53 -0800 (PST)
X-Gm-Message-State: AOAM530a2vRP7jvJle5sK2W3Ir9d2iYFjojf3GrQ/NOwrdnWyfFeLOyq
 jjiSfdx7QVMQ83jqS8ywWmIcgm39RcYohEs/5g==
X-Google-Smtp-Source: ABdhPJyPYQrXxNSnCkTl5v8yMxjogVTk6EpzYA73WuLgFBNs1oJt1pAj6k4kUcCi7ejRXOlSTI1mdHZMJ5Kr9aWFF9o=
X-Received: by 2002:aa7:c587:: with SMTP id g7mr27455803edq.109.1642606240687; 
 Wed, 19 Jan 2022 07:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
 <de35edd9-b85d-0ed7-98b6-7a41134c3ece@foss.st.com>
In-Reply-To: <de35edd9-b85d-0ed7-98b6-7a41134c3ece@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jan 2022 09:30:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzuYxpsNDNPXF1C=kG6HJea650iRzg1YxvNPDToeBC-A@mail.gmail.com>
Message-ID: <CAL_JsqLzuYxpsNDNPXF1C=kG6HJea650iRzg1YxvNPDToeBC-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
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
 Vladimir Oltean <olteanv@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>, 
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
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, 
 Linux USB List <linux-usb@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_073056_902783_F7AED504 
X-CRM114-Status: GOOD (  30.04  )
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

On Wed, Jan 19, 2022 at 9:22 AM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 1/19/22 2:50 AM, Rob Herring wrote:
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
> >
> > Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Georgi Djakov <djakov@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Wolfgang Grandegger <wg@grandegger.com>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Vivien Didelot <vivien.didelot@gmail.com>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: Vladimir Oltean <olteanv@gmail.com>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: Viresh Kumar <vireshk@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Kevin Hilman <khilman@kernel.org>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: linux-ide@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-pm@vger.kernel.org
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linux-leds@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Cc: linux-can@vger.kernel.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: linux-phy@lists.infradead.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-remoteproc@vger.kernel.org
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> [...]
>
> >  .../bindings/remoteproc/st,stm32-rproc.yaml   | 33 ++++++--
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > index b587c97c282b..be3d9b0e876b 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> > @@ -29,17 +29,22 @@ properties:
> >
> >    st,syscfg-holdboot:
> >      description: remote processor reset hold boot
> > -      - Phandle of syscon block.
> > -      - The offset of the hold boot setting register.
> > -      - The field mask of the hold boot.
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: The offset of the hold boot setting register
> > +          - description: The field mask of the hold boot
> >
> >    st,syscfg-tz:
> >      description:
> >        Reference to the system configuration which holds the RCC trust zone mode
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the trust zone setting register
>          - description: The field mask of the trust zone state
>
> >
> >    interrupts:
> >      description: Should contain the WWDG1 watchdog reset interrupt
> > @@ -93,20 +98,32 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the system configuration which holds the remote
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the power setting register
>          - description: The field mask of the PDDS selection
>
> >
> >    st,syscfg-m4-state:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the tamp register which exposes the Cortex-M4 state.
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block with the tamp register
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the tamp register
>          - description: The field mask of the Cortex-M4 state
>
> >
> >    st,syscfg-rsc-tbl:
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >      description: |
> >        Reference to the tamp register which references the Cortex-M4
> >        resource table address.
> > -    maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: Phandle of syscon block with the tamp register
> > +          - description: FIXME
> > +          - description: FIXME
>
>          - description: The offset of the tamp register
>          - description: The field mask of the Cortex-M4 resource table address
>
> Please tell me if you prefer that I fix this in a dedicated patch.

Thanks! I'll fold this into this patch.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
