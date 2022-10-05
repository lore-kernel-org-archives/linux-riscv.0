Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D04CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bh4VDV4Ub/lDTcIxYWYq8W5IYNlhHMlfnLxqNG5sElY=; b=JZRCLJntKo0m2s
	wh+jH+qu7m3I/IfkHi52Y3oqtf6KlcFsi6E0gECrdHdiSELlCU6vRed9E1+zAFmariUBdH/m9uEnW
	QsReQQxxCQKQgiW6ImMGg7cCwrzhoOoAogIvhWEi45vKPJtKmuWhFDCFOm0G1AlId4AX7NCRLjSnJ
	o6ZnY6tUmrqOVc8gwSegto7xK42FL2hylg9Vbd6P4uRMmEKiV9pG8UkuM+RF8vCpDNQ+bUvRdD3KN
	Mlw44v3a3DQz/2y29eb3Y5wtWu1i6M0ztR5oGgdxj+9quAtMpGoJB0MopUarkIH3Zwh/j4KWqB/g3
	aN3iXCkT4UrH6qx+nfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4K6-00EBbT-B4; Wed, 05 Oct 2022 13:20:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4K2-00EBZk-SB
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:20:28 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 456744146C
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1664976023;
	bh=jBaHquY2gPRnyppqdq61kZ2fwJdv7V+rcZ7lwJtbiaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QPuBcoXxKCNE9La7nxehD8hidPF7mJY6FJUWNdO//RQmuvoQOaEeRGpgLVFsIztQS
	 ly3sGy6blFKmN36bb62iu/jtcwrmaoygTFD64bf6C4H8LvRWD9xEFj6/0bRkOQy9WF
	 tHrm7ySi0WAtWg3W4l+Q8R1Gg+z9mP0qnodavXqbJ7Q586+TmX0i4Po7mo5y/0snKE
	 U2OC/EYmlrGJZ9xIZ8e55+PDTM82REPmydLQMTJMoG8dUMgEHHzHI6IhlGVuk5SQ/+
	 Zn3bXdKD9xIVYnIFCEKa1/zD77S9jdKo6UbAXCv3fCoxXhyMGtnGVnSvHBGVrrdWQ8
	 p1hZB2i8RjhNw==
Received: by mail-qk1-f200.google.com with SMTP id bp17-20020a05620a459100b006ce7f4bb0b7so14100660qkb.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jBaHquY2gPRnyppqdq61kZ2fwJdv7V+rcZ7lwJtbiaA=;
        b=M9eqWfNlD03W+C/eKZZAPg52QzKfZj4V8kE27CAQmLbk+E+7J8RE8bfplRcumJNWm9
         h5oVJDLSsvxY1xgT2RfODcYVBvdTZ+00ZWhhA2ZqItzY9jU0mf3Ahi/nMdFoUm9WZAtM
         bK0casCHrj/MSnXaBP1d62h8SWrUTh2V7TCBtfdM7nV+u62DDPdR0Em2mUAS9Cqt+0ui
         5ifY+MpqJWs6hCNHd2jzMiBdU+Vuw4doVwVVnzMnR4ZRBDRiN/BTBgbBHGocKibH1vxB
         R/72L3wZa4pkXF+VNRKPhN/6xu/bbcjNdChjAqwmIfXWxyW6EkBK12HrVH9sKhO4rJHa
         ug6w==
X-Gm-Message-State: ACrzQf1RXmzbaVQ/bPeuaifK1LjeC4kMogQMgc+0Gxz7MJmthsdMbcD6
	Q/YkeAMEBgE7b61TLwx9Wnx9RAutqLvptFFGrNWnHGQBorolC+Oi6ZW40A13fhStVuo7sthtm2k
	pnwz8jokjTg3G/gAd7pGUydhwwcT70xWfKishc5/Ln9tgDo7/2kSM6uRo02q5FA==
X-Received: by 2002:a05:622a:13c6:b0:35b:a742:28ae with SMTP id p6-20020a05622a13c600b0035ba74228aemr23012778qtk.435.1664976022209;
        Wed, 05 Oct 2022 06:20:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VzygNfGaHRADBYYItL4bS/N9idRpjVZehxb+NwhHmc/VMzKXudAwOZgLbL+u1dtE/kkYiOhO7QFkR6EckAi4=
X-Received: by 2002:a05:622a:13c6:b0:35b:a742:28ae with SMTP id
 p6-20020a05622a13c600b0035ba74228aemr23012768qtk.435.1664976022002; Wed, 05
 Oct 2022 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-10-hal.feng@linux.starfivetech.com> <20220930204905.GA903203-robh@kernel.org>
In-Reply-To: <20220930204905.GA903203-robh@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 5 Oct 2022 15:20:06 +0200
Message-ID: <CAJM55Z8ikNucTv4VjoEHwK5C_-nnvFNtn_2_U2E0QgbJKP97fg@mail.gmail.com>
Subject: Re: [PATCH v1 09/30] reset: starfive: jh7100: Move necessary
 properties to device tree
To: Rob Herring <robh@kernel.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_062027_334565_91468502 
X-CRM114-Status: GOOD (  21.18  )
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

On Fri, 30 Sept 2022 at 22:51, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 10:32:04PM +0800, Hal Feng wrote:
> > Store the necessary properties in device tree instead of .c file,
> > in order to apply this reset driver to other StarFive SoCs.
> >
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> >  .../bindings/reset/starfive,jh7100-reset.yaml | 20 ++++++++
> >  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  3 ++
> >  drivers/reset/reset-starfive-jh7100.c         | 50 +++++++++++++------
> >  3 files changed, 57 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > index 300359a5e14b..3eff3f72a1ed 100644
> > --- a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > @@ -20,19 +20,39 @@ properties:
> >    "#reset-cells":
> >      const: 1
> >
> > +  starfive,assert-offset:
> > +    description: Offset of the first ASSERT register
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  starfive,status-offset:
> > +    description: Offset of the first STATUS register
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  starfive,nr-resets:
> > +    description: Number of reset signals
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - "#reset-cells"
> > +  - starfive,assert-offset
> > +  - starfive,status-offset
> > +  - starfive,nr-resets
>
> Adding required properties is a red flag. You can't add required
> properties to an existing binding. That breaks the ABI unless the OS
> deals with the properties being absent. If the OS has to do that, then
> why add them in the first place? All this should be implied by the
> compatible string.

Indeed. I really don't understand why this is even necessary. As
mentioned in my reply to the clock driver my original code just had a
combined driver for the whole CRG (clock and reset generator I
presume), and then you just need a simple node like this:

syscrg: clock-controller@13020000 {
    compatible = "starfive,jh7110-syscrg";
    reg = <0x0 0x13020000 0x0 0x10000>;
    clocks = <&osc>, <&gmac1_rmii_refin>,
             <&gmac1_rgmii_rxin>,
             <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
             <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
             <&tdm_ext>, <&mclk_ext>;
    clock-names = "osc", "gmac1_rmii_refin",
                  "gmac1_rgmii_rxin",
                  "i2stx_bclk_ext", "i2stx_lrck_ext",
                  "i2srx_bclk_ext", "i2srx_lrck_ext",
                  "tdm_ext", "mclk_ext";
    #clock-cells = <1>;
    #reset-cells = <1>;
};

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
