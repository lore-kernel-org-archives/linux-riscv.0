Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274F7C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSz8gKhyR+RVYTO1i/SNBM02X3AFpiaMwnng0Sys7pU=; b=BhKi8bjtqpOis9
	y2qMPi5i+uX678pAMifZdwfMSY3GM+UlsfDr73wrgDcOU3b/8XsPW6RPxJ2UpeagQ230cX5WwT4Ph
	x5H+y7uRSh/R3N9tdYDz3QxWrtvRb2GcwGWEKNZPPs8i3QdB5+/xKZ7NmjJzJithfp4xJobcl4v/Y
	cGCVXpt9g6ftfbRegDSRfP+h/lqigPd8nkrOipBZEYOyXrj5Q8TMAXguHNQGqAUJucVQVxF0DRSGI
	aP3UoNcZTP/rOMz3HO7QL+++VNWHtLxVkeuCYBReFpB425p/iF7r3tS1ZqjIvZl/qtrp1+3yK1ppB
	JVB67W6HF0nyKppTf2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6D6T-006v8x-5n; Tue, 28 Jun 2022 15:26:13 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6D6M-006v4o-T9
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 15:26:08 +0000
Received: by mail-io1-f49.google.com with SMTP id a10so13195932ioe.9
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 08:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wVoUetZ5S/GqO2CHeSuZD5HjqLM10h5uZxs1HR13hfg=;
        b=kUOPtgFJ6cgClOr236vn/r6yqVQPh6DDfQ5YX8IA0/w0jBSClsS50vDQKTkZUErOuw
         VpLWiCV3hFaBKpGQ0y2Jx36L1+lkLkbr5+gnH/VlD/1ocWSCI0/l0XTxJsMIe3Xk5SOQ
         t66fuO3BVHiIaCnKxoTHgLE5oI+vURQ3QqhCM5RAyhutuEDQlM/bYzOySodd7VYv2wn5
         Zt2k6ZbnT+Sz7jkkLTZtPanqOseDFwdOo+YSHBlgLoZlBwnmjI+peKJ0boYvM7IUkpCq
         /PHkP2qdmsos3l4KFEuIRD8oJc3kQb1U9m6YcOGa5hXPSgM1tjdUa1U8axKw720drAEs
         HBGQ==
X-Gm-Message-State: AJIora9RHCa+92JzAkrct2MiBNlzrvb7ARdak2ZkNKI1Lap1IEHW5nZW
	+rte7RMJeCXFiVEC3IJRRA==
X-Google-Smtp-Source: AGRyM1u30z6rjSQP/yfjddK3j5eb9UHQa30g9hrzhKsueFxERdQlxns3zeN/rJtosCIDlaE+/J+6ew==
X-Received: by 2002:a05:6638:14c3:b0:331:8153:e5b with SMTP id l3-20020a05663814c300b0033181530e5bmr11835574jak.114.1656429965253;
        Tue, 28 Jun 2022 08:26:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y20-20020a6bd814000000b006751347e61bsm5482552iob.27.2022.06.28.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 08:26:04 -0700 (PDT)
Received: (nullmailer pid 491422 invoked by uid 1000);
	Tue, 28 Jun 2022 15:26:01 -0000
Date: Tue, 28 Jun 2022 09:26:01 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220628152601.GA465684-robh@kernel.org>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-5-mail@conchuod.ie>
 <20220627202149.624eu7w2gzw7jchd@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627202149.624eu7w2gzw7jchd@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_082606_977193_4A0794DB 
X-CRM114-Status: GOOD (  27.71  )
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

On Mon, Jun 27, 2022 at 11:21:49PM +0300, Serge Semin wrote:
> On Mon, Jun 27, 2022 at 08:39:52PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> > Canaan k210 is wired up for a width of 4.
> > Quoting Serge:
> > The modern DW APB SSI controllers of v.4.* and newer also support the
> > enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> > version is auto-detected at run-time there is no way to create a
> > DT-schema correctly constraining the Rx/Tx SPI bus widths.
> > /endquote
> > 
> > As such, drop the restriction on only supporting a bus width of 1.
> > 
> > Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Serge, I dropped your R-b when I swapped to the default
> > property since it changed the enum.
> > ---
> >  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index e25d44c218f2..0a43d6e0ef91 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -143,12 +143,6 @@ patternProperties:
> >          minimum: 0
> >          maximum: 3
> >  
> 
> > -      spi-rx-bus-width:
> > -        const: 1
> > -
> > -      spi-tx-bus-width:
> > -        const: 1
> > -
> 
> My comment was:
> > > > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> > >
> > > 8 too? sure.
> Then Rob said:
> > Then no constraints needed because the common definition already has
> > this presumably.
> 
> IMO preserving the device-specific constraints even if they match the
> generic ones has some maintainability benefits. What if you get to
> discover a new HW which supports Hexal mode? 

x16? Wouldn't we be back to parallel NOR and the problems with parallel 
buses?

> Then you would have
> needed to update the common schema constraints. But that would have
> caused permitting the unsupported bus-mode for all the schemas, which
> isn't correct. So as I see it the explicit bus-width enumeration would
> be ok to have here. But I'll leave it for Rob to make a final
> decision.

Assuming a new width does appear, it's just a matter of time before the 
DW block has a new rev supporting it too, so there's 2 places to update. 
Also, a given platform may pinout less than the block supports, so you 
can't ever be 100% sure an out of range value is in a DT.

But either way is okay with me. If you do keep constraints, you only 
need 'maximum: 8'.

Acked-by: Rob Herring <robh@kernel.org>

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
