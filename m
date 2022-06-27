Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6D1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lbULbBcPP65JQtRI0/kEwio8xYnmdD4jtzGMGshRRQ=; b=EJtBRI1UvOs5Ej
	MqhKJflfgHZ2ySAiGxyE7e8w/Y5eOio2VXSIph2vXWu5qDWyv5tF2b4+KJ1l6I5PHWt76aVEOB5xE
	+Xbi+PAT05sXnPPLbBj+u6UdCsHBI+t1IJ8Ni+MDJn5S+qgREljk7+v6luAjvXfzfIosc98TTTC+C
	2O1OY97cU7lQYjUkSBv1MKwW3TUO1gXJhbcGGqF9XCu9Up5HRqmr/vbVhCakYr3iC3P/tMahf1Nn3
	wF58eIERma/k7i958viis+C9C7rgh77+U1SN6vrYMQkB6/YGfwq6KZ9Zs7Xfy6lciUM+y+S7fFKZE
	iUu8t8++XOf9aJByUIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5vFB-002kkk-66; Mon, 27 Jun 2022 20:22:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5vF8-002kjY-Ap
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 20:21:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id x3so18605587lfd.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aEWNCuKRy84iEbBoB1dMIfYVeUetfldA1vTgDU/ZzpE=;
        b=geDEG3yd1mYJXt6c1aZqzKWP/aSMvf/tfBT02vnFiFO+9ETRIt4umK1PW+NPrV4xAH
         IPwGcjymmEkEzhhk9+XfpXmXGl1Hw9JVqezOplwRathZX7199rU+Z7wL341nIIuFtkZf
         rX2nPa+o+ldHMvBiVu03vmITAtU3+Jlc/PAYiJ2mr2uSfK25+/LYPfwM6msaBK3V5YU+
         /HKZtnsRBNWbAUETnWCFuG2fuIB/wg1zNavS4iltt3gKSZOGaTwwTY6EMCMZedVNKp41
         XYAPLMzh0ibM9cjqHXGiaOyXJy6HDQQZ/imNX5A24xcPor78JRMcqOv2q4TJSZyyxRKh
         dSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aEWNCuKRy84iEbBoB1dMIfYVeUetfldA1vTgDU/ZzpE=;
        b=iDAUXmy2IHgoiTDRF5BOiq6xEX7FT3vu4tWxkFcclwr6krh682KjOn0L8UxNG13fjk
         mth2u/sBccM3WqaoTUkTYrmowQU5wOmJ26aMkuXCa8zLTxu1+PQbrPiCJ4d5JZx2O8FJ
         ZmW0WJSaVUrGr4vVp4C5eHAPB3LoQ9EXAABxRZ0fUW+Px0n+yT/OhyGEb1CDalt0mtdo
         KyudRatFQARC70vb4OVv7pKH6XYXFka/HeZRgb0SMPcer2/7aaQt8bCaA9staSzp592H
         HaZjLuElbI3L0lSXKTqOhmTFAet6Fg1Kep0IolIM4ZLxZ7RQxD2MLXUvI1fvzL+cHyGv
         tmIg==
X-Gm-Message-State: AJIora99Ed58GAJZdZaRs+izz92PLiOpTdofYKbyL7mlNI/syeqxs+pu
	OQ9WAtHWWeY9NngwAafApTU=
X-Google-Smtp-Source: AGRyM1va63TpZ/BKlBrasRzo3hQuwImYd1Viwhj3pBKVD/eIotL0NPskkSjb7q5nOJbI3zAauoeozw==
X-Received: by 2002:a05:6512:3d8f:b0:47f:a083:a989 with SMTP id k15-20020a0565123d8f00b0047fa083a989mr9505126lfv.646.1656361313593;
        Mon, 27 Jun 2022 13:21:53 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id q4-20020a0565123a8400b004796e1555eesm1917694lfu.199.2022.06.27.13.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:21:52 -0700 (PDT)
Date: Mon, 27 Jun 2022 23:21:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220627202149.624eu7w2gzw7jchd@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_132158_433655_56498BB9 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Jun 27, 2022 at 08:39:52PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> Canaan k210 is wired up for a width of 4.
> Quoting Serge:
> The modern DW APB SSI controllers of v.4.* and newer also support the
> enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> version is auto-detected at run-time there is no way to create a
> DT-schema correctly constraining the Rx/Tx SPI bus widths.
> /endquote
> 
> As such, drop the restriction on only supporting a bus width of 1.
> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Serge, I dropped your R-b when I swapped to the default
> property since it changed the enum.
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..0a43d6e0ef91 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -143,12 +143,6 @@ patternProperties:
>          minimum: 0
>          maximum: 3
>  

> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> -

My comment was:
> > > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> >
> > 8 too? sure.
Then Rob said:
> Then no constraints needed because the common definition already has
> this presumably.

IMO preserving the device-specific constraints even if they match the
generic ones has some maintainability benefits. What if you get to
discover a new HW which supports Hexal mode? Then you would have
needed to update the common schema constraints. But that would have
caused permitting the unsupported bus-mode for all the schemas, which
isn't correct. So as I see it the explicit bus-width enumeration would
be ok to have here. But I'll leave it for Rob to make a final
decision.

Rob

>  unevaluatedProperties: false
>  
>  required:
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
