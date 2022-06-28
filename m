Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2479C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GILf3en2votdlBUpX7387s4+FclrCRoCJoxh5qm6f6Q=; b=Dejfy1rSCYvFoh
	6D1HdIpTpIysLOcbtkuexfC1a3Op4F6H21UE7DcJZqwbTVOeN+Q6mgmI1UvQwciTqrdzty4tMG2Io
	SppJDyPgZwPMeRbUiv3XVfHyx5R9Ii2XDAgaZCwCRWgUAEcO5wlGa46ZtkSXAIyQn/jb3rBzXEpHq
	hgx2RkpPEf2xXYNDQNtSSYViHWpQSkFNFDWc+/yLoHo9boe385Did3QejcI1t0PVByw3xCk0aBUl8
	DC2SUrjRcQlxkFUoSjkxpxoKWf11IdbfgDz1jZa1n+F/6Qfa7SZ57/8izZrk471yND4Ok2x9Oky2p
	jomFSo0YLzxDEiOdI0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o692s-005qPJ-AE; Tue, 28 Jun 2022 11:06:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o692p-005qO2-9g
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 11:06:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id by38so14422465ljb.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=74ZknYvbAERmU3fgiRR2mY3FgoTL84vsypu6NISs3NA=;
        b=dDWLan8xSf2psi8Ku75yN5OgwcTLoIo4QLRQchGf/tnOHIEErsIqClR6R6jj0hHnE1
         glxdqv+Q+oNFas8s3KUFWDNz6pCfCPGtgu3GDRYlMy8tJSqLISPSkAXtSSB18Fc1cBl9
         K3i6ywdqZ7ooQdcDjGUO7jYYHtuMLkvdmJ0B7dpE8NaXa1Etww0PTwkNOS43/A+TUy5U
         fbSKJaRnMnBzQpBS8IlH8etIJaUkiMjzJuedU3YNzOd/a7muD3ZZ5O3Ejx5xtKj1NDNE
         X0K/TmyZEHl6Tx4YK+iB9mRmODqCTxt7r/nNT2QWhS3fceeeluPSUjYTDUwqbKQzyWX0
         vMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=74ZknYvbAERmU3fgiRR2mY3FgoTL84vsypu6NISs3NA=;
        b=jKTIqQAT4SByKdDhswXmldX5jfgrB5FrEhpyMG27/Hh5rFMQV90+Wsvj936tbdlrCj
         tYHuZHH06gwk8T3kGBId2vzzn2YIeCwmyiPhV+adq0LDcLljkPS5FOzmE6JcbMFeEZID
         R26MDOmPayKInes6dCgLk7kEtPmnu0s3UFMTAN8UEkW4CQss8d1euuikdvOIv9a512WL
         ZOzA1kBZPJJBAoCEo58MmcMZRv0PsA7rzjeOil5E30l/jzEXBIGKTy/gyu+9jbezjyw6
         RyMaRlTUhSTSQuvmgr9Gof7inIDq7eGoxymI/dn/KagXtDoN0zZXVudrPmR6tuwiWifT
         rrYw==
X-Gm-Message-State: AJIora/w5Q0r4xAuRgHoEi4dmeT4Z6CnGemzj93xGHkozE4J1Ur4gxJk
	PEi6W0rWiZtobiA6vCnmsnw=
X-Google-Smtp-Source: AGRyM1uuwEf2Hbf380gJgJC1h2WOLcL2fEEXBsO7Ix96Zj9MMadTRjHIHgo7LzQz1OVzJUoUH5Gl+w==
X-Received: by 2002:a2e:b88a:0:b0:25b:c698:eede with SMTP id r10-20020a2eb88a000000b0025bc698eedemr4258515ljp.205.1656414369905;
        Tue, 28 Jun 2022 04:06:09 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id z20-20020a056512371400b0047f9f075e04sm2156981lfr.296.2022.06.28.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:06:09 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:06:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/14] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220628110606.5xdzqxwrrqwymgvn@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-6-mail@conchuod.ie>
 <20220627233025.GA3167724-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627233025.GA3167724-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_040611_376572_8B001DD1 
X-CRM114-Status: GOOD (  21.79  )
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

Hi Rob,

On Mon, Jun 27, 2022 at 05:30:25PM -0600, Rob Herring wrote:
> On Sat, Jun 18, 2022 at 01:30:27PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The Canaan k210 apparently has a Sysnopsys Designware timer but
> > according to the documentation & devicetree it has 2 interrupts rather
> > than the standard one. Add a custom compatible that supports the 2
> > interrupt configuration and falls back to the standard binding (which
> > is currently the one in use in the devicetree entry).
> > 
> > Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > index d33c9205a909..9a76acc7a66f 100644
> > --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> > @@ -12,6 +12,9 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - items:
> > +          - const: canaan,k210-apb-timer
> > +          - const: snps,dw-apb-timer
> >        - const: snps,dw-apb-timer
> >        - enum:
> >            - snps,dw-apb-timer-sp
> > @@ -21,9 +24,6 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > -  interrupts:
> > -    maxItems: 1
> > -
> >    resets:
> >      maxItems: 1
> >  
> > @@ -41,7 +41,23 @@ properties:
> >  
> >    clock-frequency: true
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: canaan,k210-apb-timer
> > +
> > +then:
> > +  properties:
> > +    interrupts:
> > +      maxItems: 2
> 

> When more than 1, you need to define what they are and the order.

Please see my note to v2 of this patch:
Link: https://lore.kernel.org/lkml/20220627211314.dc2hempelyl5ayjg@mobilestation/

-Sergey

> 
> > +
> > +else:
> > +  properties:
> > +    interrupts:
> > +      maxItems: 1
> >  
> >  required:
> >    - compatible
> > @@ -60,8 +76,8 @@ oneOf:
> >  examples:
> >    - |
> >      timer@ffe00000 {
> > -      compatible = "snps,dw-apb-timer";
> > -      interrupts = <0 170 4>;
> > +      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
> > +      interrupts = <0 170 4>, <0 170 4>;
> >        reg = <0xffe00000 0x1000>;
> >        clocks = <&timer_clk>, <&timer_pclk>;
> >        clock-names = "timer", "pclk";
> > -- 
> > 2.36.1
> > 
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
