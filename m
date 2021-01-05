Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B3CC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 17:40:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6755C22D01
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 17:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6755C22D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TWihxxNH3QlzQz0SjWGJl5Wj9DIDfZ/xX9P/y93FPqg=; b=KIBifQrBu/Wy8jmiLVYs4Yjjx
	rts8KOGfA0opxRXr2Cag1yQLPT272mBBaGAvsgWFC8aPcT3Ovoc/8F4ZnSnkZBxLfg7DZ3Pzk3EyL
	+TzlkoYUIHsDxdZTC1oQegTT4gb8ARUPmCSUO/88b5H+25eFqosu7BwWUh1jy2SSX7HhoDe1Z87Ia
	DfOWcxIUJBVDPaNLNSGGLKvKFNiHoWD3lSeQ3COAQj4mY3vsx1LPWvc7WF5lXZsrlf2m4nmDXdQ+N
	Q+Z3u7o696wWhGZNmuCPdLSPlJ6vBoJeBb6wOboGc8vXJi8GKIra5NQ4Y2u+etFLXMM7r9GiYN8ge
	vwlxLdDKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwqJh-0005DZ-QA; Tue, 05 Jan 2021 17:40:21 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwqJd-0005C2-MS; Tue, 05 Jan 2021 17:40:18 +0000
Received: by mail-io1-f46.google.com with SMTP id n4so76161iow.12;
 Tue, 05 Jan 2021 09:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8QCUqXr2bzGc5ddkxZAj8Vxc5oTvsGwo9juSuaK/DNc=;
 b=LRfWmk3W4FBXPmlIVx+88ahZupHca0L7LfMFqXR5lf07Jw2YvtDfDPHokqMA/oipon
 OqOhQtR5/P/n3JhTgoTKNBvdBN7VPKnVPfWILlm9FCJWo2P5Q8GyodmJQx0HJBiTcEHM
 7wrhXzLP9sH60fA4m7tIQ3Tsh6/6Li2oKo+W6IRiQIon8qMQyG7DV68Pl5I30oK/MsAP
 bM7/0yKWRZvdpFhiZtYXT8gNSqMoxCcCQNGBP4h+asLCynDL144tpe7NPwK/o4549IKA
 Zp8guOj3ZXWP90adq714wNh8lXFcN6PWYahgc1YlX8OdSO7f0sM4c23eOC3vCc9dPt7M
 0uSQ==
X-Gm-Message-State: AOAM5301fOtCYchgGT62F1b3kMpL9bf+kNqKQMulL2XQtbJBSVj1IQgj
 ev7yPTNJnSnsct5K9yRsGQ==
X-Google-Smtp-Source: ABdhPJxCW42aLPbGC5oVtd7TRg3rkrFk+Qrm1SC6TjLARKSfiB9JNiyQ7YL2gLDjCHBjUScpozxZgA==
X-Received: by 2002:a02:7692:: with SMTP id z140mr666018jab.21.1609868414264; 
 Tue, 05 Jan 2021 09:40:14 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y15sm121208ili.65.2021.01.05.09.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:40:13 -0800 (PST)
Received: (nullmailer pid 426116 invoked by uid 1000);
 Tue, 05 Jan 2021 17:40:08 -0000
Date: Tue, 5 Jan 2021 10:40:08 -0700
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <20210105174008.GB1875909@robh.at.kernel.org>
References: <20210104230253.2805217-1-robh@kernel.org>
 <X/RjziK30y56uZUj@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/RjziK30y56uZUj@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_124017_776766_9436E253 
X-CRM114-Status: GOOD (  29.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 05, 2021 at 02:04:14PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
> > DT properties which can have multiple entries need to specify what the
> > entries are and define how many entries there can be. In the case of
> > only a single entry, just 'maxItems: 1' is sufficient.
> > 
> > Add the missing entry constraints. These were found with a modified
> > meta-schema. Unfortunately, there are a few cases where the size
> > constraints are not defined such as common bindings, so the meta-schema
> > can't be part of the normal checks.
> > 
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: Ohad Ben-Cohen <ohad@wizery.com>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> <snip>
> 
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 247ef00381ea..f76b25f7fc7a 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -83,6 +83,7 @@ properties:
> >        Phandle of a companion.
> >  
> >    phys:
> > +    maxItems: 1
> >      description: PHY specifier for the USB PHY
> >  
> >    phy-names:
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > index 2178bcc401bc..8e2bd61f2075 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > @@ -71,6 +71,7 @@ properties:
> >        Overrides the detected port count
> >  
> >    phys:
> > +    maxItems: 1
> >      description: PHY specifier for the USB PHY
> >  
> >    phy-names:
> > diff --git a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > index 678396eeeb78..f506225a4d57 100644
> > --- a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > @@ -40,7 +40,7 @@ properties:
> >        - const: mc
> >  
> >    phys:
> > -    description: PHY specifier for the USB PHY
> > +    maxItems: 1
> >  
> >    usb-role-switch:
> >      type: boolean
> 
> Any reason you dropped the description for this entry, but not the other
> ones above?

No, I should have dropped those too. I dropped cases of genericish 
descriptions on common properties. There's nothing specific to this 
binding here really.

> 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > index 388245b91a55..adce36e48bc9 100644
> > --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > @@ -15,13 +15,14 @@ properties:
> >        - const: ti,j721e-usb
> >  
> >    reg:
> > -    description: module registers
> > +    maxItems: 1
> >  
> >    power-domains:
> >      description:
> >        PM domain provider node and an args specifier containing
> >        the USB device id value. See,
> >        Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> > +    maxItems: 1
> >  
> >    clocks:
> >      description: Clock phandles to usb2_refclk and lpm_clk
> 
> Same here, why remove the description?

Really, the question is why keep 'description' on power-domains. Perhaps 
there's a little value in the reference to sci-pm-domain.txt, so I left 
it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
