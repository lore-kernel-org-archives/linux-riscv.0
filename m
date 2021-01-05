Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C551C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 18:12:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2812C22D57
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 18:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2812C22D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UaEDuz+LNDaL/U8AGSoM1ROey3L35MAqrGiXiMSTp0s=; b=Nl7xnL/HsdinhiWfYTwHMyzXQ
	30A8PSS7+T0QCn/QCTBz/HQIhF6PGbC4UKEYhqfM2nOlKc6p0l+fUWuguqFGOsMEHnLmacTvMZddL
	vapu44N8U+GNlwKVYvSBVQZVA0W/j7XqKgFL5m4Thiw2VQKsKo0aEj1tdoKl5UoDJl5feEq0Wn2MK
	4tpfHi27JXcj4O+rxV6cn24YY6eLx1oxBqe1SmItraxXlowaGmCmQydN3WIj0r/c+b9IkQDvu1Vqo
	hXnEFip0VNwM+gPqbrlr9X1+FjCCsda53lcNHw4cC2BFKUGm3pvy9RXPOXzKwf8jICpUDwDHAA7Pq
	jrP21PYPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwqoT-00043y-GZ; Tue, 05 Jan 2021 18:12:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwqoN-0003zK-7i; Tue, 05 Jan 2021 18:12:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1791722D06;
 Tue,  5 Jan 2021 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609870321;
 bh=/reYBV40Ygz4hCARqF75dpeeGG0UhQDuHeRU1Mh/CCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dz7ZYIQwZi2PGezSrfZYXMAyFlGgRS3XZShhWjyXT3ufXIdHDHMXjuLt80KX6GoPf
 GG9vLFuw58bgfcX32hBzQHrbWIbM7IXR3efJsGv2iQnRdRw/2HGqFmSWyIJMZ/uav6
 zW8xJU3VSIzNihZH289zC2LwLXOyr6xIMVOafDGE=
Date: Tue, 5 Jan 2021 19:13:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <X/SsRVbYVXRX8Psq@kroah.com>
References: <20210104230253.2805217-1-robh@kernel.org>
 <X/RjziK30y56uZUj@kroah.com>
 <20210105174008.GB1875909@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105174008.GB1875909@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_131203_433911_C2DF21C2 
X-CRM114-Status: GOOD (  29.47  )
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

On Tue, Jan 05, 2021 at 10:40:08AM -0700, Rob Herring wrote:
> On Tue, Jan 05, 2021 at 02:04:14PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
> > > DT properties which can have multiple entries need to specify what the
> > > entries are and define how many entries there can be. In the case of
> > > only a single entry, just 'maxItems: 1' is sufficient.
> > > 
> > > Add the missing entry constraints. These were found with a modified
> > > meta-schema. Unfortunately, there are a few cases where the size
> > > constraints are not defined such as common bindings, so the meta-schema
> > > can't be part of the normal checks.
> > > 
> > > Cc: Jens Axboe <axboe@kernel.dk>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Cc: Jonathan Cameron <jic23@kernel.org>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: Jakub Kicinski <kuba@kernel.org>
> > > Cc: Sebastian Reichel <sre@kernel.org>
> > > Cc: Ohad Ben-Cohen <ohad@wizery.com>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > 
> > <snip>
> > 
> > > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > index 247ef00381ea..f76b25f7fc7a 100644
> > > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > > @@ -83,6 +83,7 @@ properties:
> > >        Phandle of a companion.
> > >  
> > >    phys:
> > > +    maxItems: 1
> > >      description: PHY specifier for the USB PHY
> > >  
> > >    phy-names:
> > > diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > > index 2178bcc401bc..8e2bd61f2075 100644
> > > --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > > @@ -71,6 +71,7 @@ properties:
> > >        Overrides the detected port count
> > >  
> > >    phys:
> > > +    maxItems: 1
> > >      description: PHY specifier for the USB PHY
> > >  
> > >    phy-names:
> > > diff --git a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > > index 678396eeeb78..f506225a4d57 100644
> > > --- a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
> > > @@ -40,7 +40,7 @@ properties:
> > >        - const: mc
> > >  
> > >    phys:
> > > -    description: PHY specifier for the USB PHY
> > > +    maxItems: 1
> > >  
> > >    usb-role-switch:
> > >      type: boolean
> > 
> > Any reason you dropped the description for this entry, but not the other
> > ones above?
> 
> No, I should have dropped those too. I dropped cases of genericish 
> descriptions on common properties. There's nothing specific to this 
> binding here really.
> 
> > 
> > > diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > > index 388245b91a55..adce36e48bc9 100644
> > > --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> > > @@ -15,13 +15,14 @@ properties:
> > >        - const: ti,j721e-usb
> > >  
> > >    reg:
> > > -    description: module registers
> > > +    maxItems: 1
> > >  
> > >    power-domains:
> > >      description:
> > >        PM domain provider node and an args specifier containing
> > >        the USB device id value. See,
> > >        Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> > > +    maxItems: 1
> > >  
> > >    clocks:
> > >      description: Clock phandles to usb2_refclk and lpm_clk
> > 
> > Same here, why remove the description?
> 
> Really, the question is why keep 'description' on power-domains. Perhaps 
> there's a little value in the reference to sci-pm-domain.txt, so I left 
> it.

Ok, if you are fine with this, that's ok with me, just didn't look very
consistent :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
