Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D6FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJpJhOt6ruEg/QbwTJQvgcgvZ+eMIjWXyl6416YXWto=; b=TKACz5j6hFcNkp
	FX3QFNjzqRyR1cLNnlc9zulq0J0gQ+KV9O/Izg+/9UWSw4vOaPue+tDjgUZY5gXpazHifkQatpEz8
	W/bXGc1FpBs/xHnUHZ2L59FDnUrlSbPppKKBES3b0q4KIIIyUxjHeMxllnei6GWWm9Pyk6SNk04ZQ
	WdD0x7cS6MSJFTUAHW6Fw+ZUmejJiuzWgaYIQ+mXLdo6rr7tTr+zAxJIT44riYlqr9MopA93htazz
	J52RGsAoNLvgp2Y8i4rLo3xvXyNIYk0rVJ/WviTKfPyPZ0CVRyzXvUIVTsHdmirqZ6kAMs4EpNjXV
	SftXE+TtNoHu14KareIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5sKR-0026ve-1O; Mon, 27 Jun 2022 17:15:15 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5sKJ-0026nQ-3t
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 17:15:12 +0000
Received: by mail-io1-f42.google.com with SMTP id r133so10267207iod.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=An//ZVIBHusXq7ojPg64QggrwNUop5VEk57ILCBBv0U=;
        b=V5fWk+EkvYjPFCUeuQ8bbExe7BCamWvp6cArP367Wo8U0sFjl8QVatGH7pqnufZLUN
         XhB/65hT1WgoWF9wHY+Xp+QjCYUUnNozNqchDBAuwJZhAvj9JOTmYysQ2BBJ7vj7SoFq
         kXuObmIezbd0d869ZtpT8hjkghxS073UZNRZwWgiDj1xTAPKUnQTIxaakEDLLkgY6u5h
         QWsCBdcVHBN63mktsRcZK8+Za9IvRWONSDjQDK4sJ82l5f3wdMu/KcC6r42oIZDFIz3U
         NAlwhMXPjuHbBZ90TFNETCRYA20s5xNfZOjbaSxlhU5xabscJ1wYEr08LvBSyChp5Bb+
         K4vA==
X-Gm-Message-State: AJIora9NpId2umsKmV4P5Gwycg37i/5/JIBmQ/0vRrXNmO5w1Zjy1SFv
	GmlS1sttESzsYcUnqLPH2w==
X-Google-Smtp-Source: AGRyM1trlOnex3HcAYrl5SVQu6l8zcvR+jlYFtBQiWM5jDgBNdFpV78MBBeicB8VYl+Oe0sIBxfwBA==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id h7-20020a056638338700b0033c9f9e5a17mr2713672jav.12.1656350104060;
        Mon, 27 Jun 2022 10:15:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a23-20020a056638059700b003320e4b5bb7sm5118946jar.57.2022.06.27.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:15:03 -0700 (PDT)
Received: (nullmailer pid 2608313 invoked by uid 1000);
	Mon, 27 Jun 2022 17:15:00 -0000
Date: Mon, 27 Jun 2022 11:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: fancer.lancer@gmail.com, mail@conchuod.ie, airlied@linux.ie, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com, sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, daniel.lezcano@linaro.org, palmer@dabbelt.com, palmer@rivosinc.com, tglx@linutronix.de, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, masahiroy@kernel.org, damien.lemoal@opensource.wdc.com, geert@linux-m68k.org, niklas.cassel@wdc.com, dillon.minfei@gmail.com, jee.heng.sia@intel.com, joabreu@synopsys.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220627171500.GA2600685-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_101507_224628_8F291744 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Jun 20, 2022 at 09:06:34PM +0000, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 21:56, Serge Semin wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> >> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> >> this.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
> >>  1 file changed, 35 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> index e25d44c218f2..f2b9e3f062cd 100644
> >> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> >> @@ -135,19 +135,41 @@ properties:
> >>        of the designware controller, and the upper limit is also subject to
> >>        controller configuration.
> >>
> >> -patternProperties:
> >> -  "^.*@[0-9a-f]+$":
> >> -    type: object
> >> -    properties:
> >> -      reg:
> >> -        minimum: 0
> >> -        maximum: 3
> >> -
> >> -      spi-rx-bus-width:
> >> -        const: 1
> >> -
> >> -      spi-tx-bus-width:
> >> -        const: 1
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        const: snps,dwc-ssi-1.01a
> >> +
> >> +then:
> >> +  patternProperties:
> >> +    "^.*@[0-9a-f]+$":
> >> +      type: object
> >> +      properties:
> >> +        reg:
> >> +          minimum: 0
> >> +          maximum: 3
> >> +
> >> +        spi-rx-bus-width:
> >> +          const: 4
> >> +
> >> +        spi-tx-bus-width:
> >> +          const: 4
> >> +
> >> +else:
> >> +  patternProperties:
> >> +    "^.*@[0-9a-f]+$":
> >> +      type: object
> >> +      properties:
> >> +        reg:
> >> +          minimum: 0
> >> +          maximum: 3
> >> +
> >> +        spi-rx-bus-width:
> >> +          const: 1
> >> +
> >> +        spi-tx-bus-width:
> >> +          const: 1
> > 
> > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> 
> 8 too? sure.

Then no constraints needed because the common definition already has 
this presumably.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
