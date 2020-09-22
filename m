Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AC8C2D0E2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 15:40:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F49E20C09
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 15:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qck2LtBj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F49E20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tgT/Bg26ccssdso3i0D4lnVH1/JfvpdDnP9/r+ze1TI=; b=qck2LtBjl2YCUlTubd5JIuXYT
	F5MygRkbtLejzwnJqx0U6pajLEt9hgHj81VN5Lmv6J5/Hb/3KOwpXpYLjmJtijhdBO24rdFUjPGwv
	/zD17dnMEW7NI19MU6EB/x21UqX5aMYhjZlxTFYAv1GjgwLY+8mxr4/pzgFYhpHX6Y++0Vejr5IJF
	LJBo+vL2TFKLPoONh9WU5GzUHrVu8Y52HkywAgM3GG7f/vBimDnDf7CEUMRXBBfW3ulr2k0yCLizv
	u1Q2Fva75tf9dyYglUyn/I6XAnKAb9p9EWzbQEmFhD9dIf4qBMQYCOlMa7n7OosqXx2DDgTc5T9MU
	zqjolzd9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKkP6-0004zu-EK; Tue, 22 Sep 2020 15:40:28 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKkP1-0004yO-7Q; Tue, 22 Sep 2020 15:40:24 +0000
Received: by mail-il1-f194.google.com with SMTP id t13so17705078ile.9;
 Tue, 22 Sep 2020 08:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8GdJRN6siN1K/3VUt/RzQ7dwFh0PUHODAfHPAkJXVec=;
 b=DACpAJtOY1SiSTOueG57TOyuLpqtUYsR56bwyJDUwBo/Jrllc1mQeQB4oufe/0lOtg
 En0iqsZobJiAhiviNhCUz3yzu1boaj3VP/SCSfqc4VpdDa3j+DX7zBk3s7WISu8pPuBo
 oWuPtflSKI9IWhBWPtuEWR9bn94l5bzn8RAD3JREQhTL1UbwUehg7m8bZcBRTgQr+aqm
 oaqHQe8RDYc9cJfkgZEPU+5ZolL+J2m1XPo6VkIsmkU5mppaarWuHGggSS80XOvHNRdM
 0oG1SCOFP8l0pSmmzopnh8vE6232jmfCVbKei1abfT3Cd599G/i3lRhFg1ev7G+yUJHp
 1WYA==
X-Gm-Message-State: AOAM533j6tifVhQUkDoiAok5DfccBj9J7tSmyvEpolEouqhGnBReamIK
 IjXEJyAk2f8hO/vCPwakgg==
X-Google-Smtp-Source: ABdhPJyREJxSIdBKii6r07HwAtgscFY+xZM0Hzr/ADdWxpwvmnoH8SQzW6oBqLEpp2gzISGF/n+Kjw==
X-Received: by 2002:a92:b503:: with SMTP id f3mr4935318ile.23.1600789220548;
 Tue, 22 Sep 2020 08:40:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e4sm7533543iom.14.2020.09.22.08.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 08:40:19 -0700 (PDT)
Received: (nullmailer pid 2730094 invoked by uid 1000);
 Tue, 22 Sep 2020 15:40:18 -0000
Date: Tue, 22 Sep 2020 09:40:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200922154018.GA2657058@bogus>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
 <20200920193915.GA31074@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920193915.GA31074@kozik-lap>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_114023_284571_5B1977F2 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 20, 2020 at 09:39:15PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> > On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > > controllers.  The schema enforces proper naming of GPIO controller nodes
> > > and GPIO hogs.
> > 
> > Did you not see my previous reply about a common schema? We already
> > have a common GPIO and hog schema in dtschema. Please add to it
> > whatever is missing.
> 
> Indeed, I'll enhance the dt-schema.
> 
> The trouble is that each in-kernel YAML file still has to mention
> possible gpio-hogs nodes. Is the proper solution to put them in common
> YAML inside kernel sources?

Currently, the gpio.yaml schema is applied to all nodes. That has the 
advantage that GPIO related properties are always checked whether we 
have a device specific schema or not. It has the disadvantage that you 
can't do some constraints like required properties or what's in child 
nodes.

We could (and probably should) change it to be referenced by specific 
gpio controller schemas like we do for i2c, spi, etc. Then you can 
define required properties there and do something like:

"-hogs$":
  type: object
  $ref: gpio-hogs.yaml#


> > My goal is all common schema end up in dtschema, but I haven't pushed
> > folks to do that yet. Ones I've done are there though. One issue is
> > what's in dtschema should be GPL/BSD and the existing text bindings
> > are default GPL, so there's a relicensing exercise. In some cases, the
> > schema is there but I haven't copied over the descriptions.
> 
> Right, I'll skip the descriptions when posting to dt-schema.

I was hoping someone would add the descriptions. :)

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
