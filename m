Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4857C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68vwvox9ieq6pvm1YBuSboBRDugwN6W5AUKRzGLoVtU=; b=uN+QDaubn3e8mO
	NShPhnRtiWCRbgNpLonuGOYdDuiy8OPjlLSci6pd6v9AY1M8ZM2jgWzCqFmXjGN8E6CbucrQd7dNq
	lisSiTd1B9Hd4dZgzwxt0GlioLrlGcq/2GQWkcoUY6V2QEucxzEQThreXjLC6e+fJ/UKExa6Xx8nv
	drPHYY4XwyY4+v3nTuSZ8ODCGswxIluMps6zrAg5YB+5s01DWUggG0eLJohSSPMxpjkbSdSA5olBN
	jWKKQ99yrBAQYrYBltykmS2VSlxODDukA+3jEggwoGQyCEJxtw0uIMDgayBcivy8bjDWDWx3m/n6u
	9rgFFJGZZPMwrODAmXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xTp-000iH3-2s; Thu, 30 Jun 2022 16:57:25 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xTl-000iFb-T4
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 16:57:23 +0000
Received: by mail-il1-f173.google.com with SMTP id p14so12800262ile.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 09:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cSCjzkkaYP9MYdWZQafK4xMoYiSrEDWkLIVS/pLNRR8=;
        b=tibEKBsu2drDAItj5ms4VTycFxj8pE5pqMv4JHvqYGO1L4R+aysQhD10prBOiCIq9j
         +I1BTSBBmXccwRQgSaTtc5M/gKHZbjXjYWeL/vF1Fmhl3TV9HZm8p/RrJfilWNVqhPDL
         IKTaCbGdawMmOwR+71zoGoYwT/vKAW/jmdLFR5d7eWn6VKjsDnaBgIlsX4QalwfTJXk8
         nhTbzUZ3jusnOHJ36KgOwyoHqZ8NQ6GpgiTBIPnof6dOjfU+k2GYbyWJvbX5CQ6tfdzO
         cGnrN7d8Wi9+j//V99sOvgsISFibdAnQuMHFU7c5eLbb9wyLrE9L1yDsQujx6t5r9VdO
         Twng==
X-Gm-Message-State: AJIora9PZrqnLkCevQW687GLfXLZTDLXHQeOaE69dJcivcxZwtSNY5ac
	5/P0cf2XiqlU1GXjmDW9lw==
X-Google-Smtp-Source: AGRyM1ur4AOc7bK5eVjgml5dO/I1YI3o54vzy9DsjE/7iDAB6CuVvnaI9nMRxVWdksw+oB2ay497Pw==
X-Received: by 2002:a92:cd8f:0:b0:2d9:5d44:6a53 with SMTP id r15-20020a92cd8f000000b002d95d446a53mr5817684ilb.226.1656608240763;
        Thu, 30 Jun 2022 09:57:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q25-20020a05663810d900b0032e1a07228asm8851588jad.26.2022.06.30.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:57:20 -0700 (PDT)
Received: (nullmailer pid 2895373 invoked by uid 1000);
	Thu, 30 Jun 2022 16:57:17 -0000
Date: Thu, 30 Jun 2022 10:57:17 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org, 
	Serge Semin <fancer.lancer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Vinod Koul <vkoul@kernel.org>, 
	Dillon Min <dillon.minfei@gmail.com>, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Mark Brown <broonie@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220630165717.GA2895317-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_095721_973601_5304F955 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, 29 Jun 2022 19:43:33 +0100, Conor Dooley wrote:
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
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
