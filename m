Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4750DC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ty734DHl+67Xp+7QSwC671zQES+nFTmf1UeoLZhspj0=; b=KSseMRzK30sxOl
	HdBTglZw3ofIom7JyizuhluKFakebLMNCgfMKWDYoB1JXs+henka8Grq9Lh+LlYEFJWTeePs5kZ0l
	QSS1b+CvKNyb2VnGH1aKg24WD4FWV4ByJxp81SgbLlLbMtlioc44FU7OqGy6pPs+mbTfK1e4h1nQU
	3lX4ds1ZveMu9iAyt3TqSlSci+3eHybqqe9tT3ZyKBFeghUnW9NJ8ZjAYInQB4Uoz0WByQG8nFjid
	yTkqVS1115fkTe31OKZMamjxRzLqDU6gIAxpgQqeFbFDA7Wvz+APT5RjQgCO2qRJzwZSrV+cPFqy6
	0zp/KJ2RLsCE/C5hcoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdtz-0043AW-0C;
	Fri, 24 Mar 2023 09:40:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfdtu-00438U-1q
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:40:01 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC1283F2D3
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1679650793;
	bh=x1u3QRP74rxw2nee5OeJkGqMtHejmjh8sNTSy7NjgGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vG6iC67rXememkhEElEkDbNPHDyMLNnnoH/X6XNUdATsEKzjjSlrI8ljaTFL5ag4A
	 dZL8p7lQz1oBl4Cxk86jJNWA5qehqZaoMkuE/yVBvKeov/ZdP/+yRzxmKI8rudYDZi
	 qZcAqDoP6gpzfXKcg9OABw4dW9zicbCBA6/pwKkS2SqzopCjjjRStiWvOuLGU9JChE
	 hDe4KztVIo/iqseA/290TG8xSdcoRa2DO7Pq3Rv0M0ZhuW/X55QNOxKzSvKXIZY4yk
	 nGwoV/Mvkd/xTWVYf6/XBM7OHBwqsEKv7LpwJnM3bJ621Qss40TExNI4kcR4mZI2hM
	 lBuQXrGhvtEDQ==
Received: by mail-qt1-f200.google.com with SMTP id c14-20020ac87d8e000000b003e38726ec8bso699996qtd.23
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679650792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1u3QRP74rxw2nee5OeJkGqMtHejmjh8sNTSy7NjgGo=;
        b=fNxC4iiRL2+VqoYFbB0daDl/g54vtadmgSdcuhfGfvwtABewlHCw8vglr70TzoXOAV
         M9Lws/d1OHWvgpS1tp7db5fgNiSBZ8nj9HgAmfNG4Og+dPeHEhrqnfqAGsNAN0OLHkep
         GvyCmSbg6+6UA36AHTseKfJLx92LGOw6kk53k/nRtANNeQZ7bbfeNzahO8W1LOpEJ2v2
         mVLMLZOoNOeW8A6gINj6mr0IHZsGOTxc1NvZKuXQSaAwm4jmdRCLsiLaVWSbHHt7TJmk
         qWBQPD64g2uplfFMMKRJAOY9bqIhtAwzqLbks6KRoq4ZxSd1zHiF/ATe9KQiFghsIkvn
         CfeQ==
X-Gm-Message-State: AO0yUKW1rGK8puJ95yIqFPy8KKrQFLPnzcEpUXx4TLuSn934+mUMJe67
	BV5f4g0hdxWmmcDmulcpRNtkC0wvcQKm0m+pIUSVqDfbYB5esATfp6otQkIaga/o9oa0PRWJTQP
	nKc7EPJdyr3F1D4IqkYcmPZzcPxdVn3J9z9pBERNfS7Dax9Q7lNdMxd+QEz0aeg==
X-Received: by 2002:a05:622a:451:b0:3bf:e265:9bf with SMTP id o17-20020a05622a045100b003bfe26509bfmr880584qtx.5.1679650792593;
        Fri, 24 Mar 2023 02:39:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set+q0Yp8ZlJj5eLBsDugPvTedO/h3PnYGnGhBGHJml+AqpsIH2K51udX+L1TK9PO0R/sfinm5PneI740v94KOeg=
X-Received: by 2002:a05:622a:451:b0:3bf:e265:9bf with SMTP id
 o17-20020a05622a045100b003bfe26509bfmr880578qtx.5.1679650792313; Fri, 24 Mar
 2023 02:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-12-hal.feng@starfivetech.com> <b4beb457-8581-4b2f-8655-2e3f82a94f75@spud>
 <5b75161e-3d0d-50e5-fd4e-af92edf62317@starfivetech.com> <828e8cb9-a4c6-4c2d-8a23-2cfdc4395fe1@spud>
In-Reply-To: <828e8cb9-a4c6-4c2d-8a23-2cfdc4395fe1@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 24 Mar 2023 10:39:36 +0100
Message-ID: <CAJM55Z-dKKpBJAof1cuAombBFckEhvZ00o6MZHT_KN+baKRc0g@mail.gmail.com>
Subject: Re: [PATCH v6 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_023958_914856_AA9C9946 
X-CRM114-Status: GOOD (  47.74  )
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

On Thu, 23 Mar 2023 at 10:02, Conor Dooley <conor.dooley@microchip.com> wrote:
>
> Hal, Emil,
>
> On Thu, Mar 23, 2023 at 03:44:41PM +0800, Hal Feng wrote:
> > On Wed, 22 Mar 2023 21:53:37 +0000, Conor Dooley wrote:
> > > On Mon, Mar 20, 2023 at 06:37:40PM +0800, Hal Feng wrote:
> > >> From: Emil Renner Berthing <kernel@esmil.dk>
> > >>
> > >> Add bindings for the system clock and reset generator (SYSCRG) on the
> > >> JH7110 RISC-V SoC by StarFive Ltd.
> > >>
> > >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >> Reviewed-by: Rob Herring <robh@kernel.org>
> > >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > >> ---
> > >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
> > >>  MAINTAINERS                                   |   8 +-
> > >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
> > >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
> > >>  4 files changed, 454 insertions(+), 3 deletions(-)
> > >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> > >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
> > >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> > >> new file mode 100644
> > >> index 000000000000..84373ae31644
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> > >> @@ -0,0 +1,104 @@
> > >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: StarFive JH7110 System Clock and Reset Generator
> > >> +
> > >> +maintainers:
> > >> +  - Emil Renner Berthing <kernel@esmil.dk>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: starfive,jh7110-syscrg
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  clocks:
> > >> +    oneOf:
> > >> +      - items:
> > >> +          - description: Main Oscillator (24 MHz)
> > >> +          - description: GMAC1 RMII reference or GMAC1 RGMII RX
> > >> +          - description: External I2S TX bit clock
> > >> +          - description: External I2S TX left/right channel clock
> > >> +          - description: External I2S RX bit clock
> > >> +          - description: External I2S RX left/right channel clock
> > >> +          - description: External TDM clock
> > >> +          - description: External audio master clock
> > >> +
> > >> +      - items:
> > >> +          - description: Main Oscillator (24 MHz)
> > >> +          - description: GMAC1 RMII reference
> > >> +          - description: GMAC1 RGMII RX
> > >> +          - description: External I2S TX bit clock
> > >> +          - description: External I2S TX left/right channel clock
> > >> +          - description: External I2S RX bit clock
> > >> +          - description: External I2S RX left/right channel clock
> > >> +          - description: External TDM clock
> > >> +          - description: External audio master clock
> > >> +
> > >> +  clock-names:
> > >> +    oneOf:
> > >> +      - items:
> > >> +          - const: osc
> > >> +          - enum:
> > >> +              - gmac1_rmii_refin
> > >> +              - gmac1_rgmii_rxin
> > >> +          - const: i2stx_bclk_ext
> > >> +          - const: i2stx_lrck_ext
> > >> +          - const: i2srx_bclk_ext
> > >> +          - const: i2srx_lrck_ext
> > >> +          - const: tdm_ext
> > >> +          - const: mclk_ext
> > >> +
> > >> +      - items:
> > >> +          - const: osc
> > >> +          - const: gmac1_rmii_refin
> > >> +          - const: gmac1_rgmii_rxin
> > >> +          - const: i2stx_bclk_ext
> > >> +          - const: i2stx_lrck_ext
> > >> +          - const: i2srx_bclk_ext
> > >> +          - const: i2srx_lrck_ext
> > >> +          - const: tdm_ext
> > >> +          - const: mclk_ext
> > >
> > > I'm sorry to be a bit of a bore about these bindings, but Emil mentioned
> > > to me today that he had some doubts about whether any of these audio
> > > clocks are actually required.
> > > I've had a bit of a look at the driver, cos the TRM that I have doesn't
> > > describe the clock tree (from what recall at least) and I think he is
> > > right.
> > > For example, the TDM clock:
> > > +   JH71X0_GATE(JH7110_SYSCLK_TDM_AHB, "tdm_ahb", 0, JH7110_SYSCLK_AHB0),
> > > +   JH71X0_GATE(JH7110_SYSCLK_TDM_APB, "tdm_apb", 0, JH7110_SYSCLK_APB0),
> > > +   JH71X0_GDIV(JH7110_SYSCLK_TDM_INTERNAL, "tdm_internal", 0, 64, JH7110_SYSCLK_MCLK),
> > > +   JH71X0__MUX(JH7110_SYSCLK_TDM_TDM, "tdm_tdm", 2,
> > > +               JH7110_SYSCLK_TDM_INTERNAL,
> > > +               JH7110_SYSCLK_TDM_EXT),
> > >
> > > Hopefully, I'm not making a balls of something here, but it looks like I
> > > can choose an internal TDM clock, that is based on JH7110_SYSCLK_MCLK,
> > > which in turn comes from either an internal or external source.
> > > If I am following correctly, that'd be:
> > > +   JH71X0__DIV(JH7110_SYSCLK_MCLK_INNER, "mclk_inner", 64, JH7110_SYSCLK_AUDIO_ROOT),
> > >
> > > Which in turn comes from:
> > > +   JH71X0__DIV(JH7110_SYSCLK_AUDIO_ROOT, "audio_root", 8, JH7110_SYSCLK_PLL2_OUT),
> > >
> > > This leaves me wondering which clocks are *actually* required for a
> > > functioning system - is it actually just osc and one of gmac1_rmii_refin
> > > or gmac1_rgmii_rxin.
> >
> > As I had mentioned somewhere before, some audio clocks need to change their
> > parents at different stages of work. I should explain in detail here.
> >
> > For the i2s*_ext clocks, we should use these external clocks as parents when
> > the I2S module is working in the slave mode, while we should use the internal
> > clocks as parents when the I2S module is working in the master mode.

Right, so what Hal is saying here is that the i2s*_ext clocks are only
needed if the board is designed to have i2s modules in slave mode.

> > For the tdm_ext clock, we use it as the clock source for an accurate playback
> > rate. If we use the internal clock as clock source, the TDM can't work
> > normally, because it can't get a required rate from the internal divider.
> > By the way, note that we need to use the internal clock as clock source when
> > we try to reset the tdm clock, otherwise, the reset will fail.
> >
> > For the mclk_ext clock, which is 12.288MHz, it's used as the clock source
> > through all the running time, otherwise, the daughter clocks can't get the
> > required rate from the internal PLL2 clock (1188MHz) through dividers.

Right, so PLL2 is 1188MHz on the VisionFive 2.

Hal: But is it not possible to program the PLL2 to run at a multiple
of 12.288MHz in some other configuration?

> > So all these audio external clocks (i2s*_ext / tdm_ext / mclk_ext) are
> > actually required.
>
> Okay. I think I am okay with leaving the binding as-is then, and if
> someone needs to omit the entire audio subsystem on the SoC, they can
> follow Stephen's suggestion.
>
> @Emil, is that okay with you?

Conor: I'm fine with the bindings like this. I just want to make sure
that we all have the same idea of what is "optional" and should be
marked as such in the bindings.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
