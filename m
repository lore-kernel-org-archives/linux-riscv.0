Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C2C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 21:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6lNab3GtZCDdH/LBr+iz4i/RsvzJne1cmtpOg13wq8=; b=iN7EELumcWtMYQ
	IHstMC19/8RR9J4b9gFQkQ1ntz2p0YtIQc+cCY4y6rQK2vlID5kZLJlZH4Mn4eTI6iDXBBWQJ9DF0
	hhcW1y+yz6L4k9K6GqJ2TrQerHlGA/RseOz5GO2BcV3e4SeVC6jfSqKqvqxn70+QVnBrPgx0LXEZ6
	wCBON6JHblBW5B5VNi4SEIsWXHP4MP/M4gm4JzSLj0I9wwsrDPXNpC2zg1tmnh387l8CJ0I5Y1uta
	NFvtEyRVG+v45XMWtF/IEH+j5YV4WSF/1wr0d0tA6xJ/MLiTeRDDeeoMtr/NUuQb9zJJN4uXTFyop
	BdDfac7Ptq9S0eu1K6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71wv-001g56-QE; Thu, 30 Jun 2022 21:43:45 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71wt-001g47-0E
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 21:43:44 +0000
Received: by mail-lj1-x233.google.com with SMTP id s14so344977ljs.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
        b=lrWda6wWNqrPSJmZGSOm1ISr7wKduLFWi1rtfL/yScVS9rHmDVD4N/9zCj+VSJ1+Oa
         FO9NZKuJMIQLUjdIYTiAb8HTBGYm+o9Ez2NIlum6kfuR5+fovJBM/7p+CV2LxVlJ3E6G
         KbNf1TNhzph7T0TL/sDQ4Hw8iQagGqS9jY2lgDmk2pKIsLr0eEUC7CM3K/ir9SVbBuVr
         mnIbczJybBGXfmK7KjkwqGLjfxGX15NKjz6h67HEK5siEgqdufHy9gcSjXVGAN/0WIOu
         yx7sM7I+pjTlcSePBegIfy7IPhw66UH8cQ9c4cOTJEpeHnzk0zgK/utetinXxDnU/V10
         Rp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
        b=G77AdLUhl8JXLQ3S8+NfMYKzrToS56PCEmuRpzWBuB1a2dY9v0pYFSVby8/L9PTIO2
         hZhJE5DY5w5j/1kZwm5zky2FXnTeKwv8idP4V5Nu2xqA0SLcm08HeChTQv9SvZ5UOcPq
         5aru3ZFATDh1oW1A2IapzpYn/NoY9P6OnhgnA+WWKHSm1RbnpCmQ69C1lIosTNOiZmct
         ogWgaDt/VTiFIjYcuH+9zFyp2YhmvwM11TDwK/lipfHTMq8wbxlT4WKnpHjbbrRtV8GH
         G4q37p3IInWwAFnKP/C3Awat+rBy5dRbCTMjIKAOt72uvC36ChDeUifbdqBprUQQS04n
         M1iw==
X-Gm-Message-State: AJIora/nLwLWS3XCCpccrO5PkDxbJZ8YPMARQnEhy5xcOXAHZ6RgKKhX
	y4ghKiK6/QI42Pm8zhSZmgQ=
X-Google-Smtp-Source: AGRyM1tiXOSoDewIDtJQjZ6heJh2v6Etx9okcGhLJIyxUHhTxknHodjEWzqlCQs2mLldDoYhOHP8Ow==
X-Received: by 2002:a2e:a793:0:b0:25a:74f4:b377 with SMTP id c19-20020a2ea793000000b0025a74f4b377mr6429372ljf.177.1656625419868;
        Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id v22-20020ac258f6000000b00478f739f1fdsm3296894lfo.103.2022.06.30.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:43:36 +0300
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
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220630214336.tyhll4ldrgdibnjv@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_144343_081466_07E93235 
X-CRM114-Status: GOOD (  17.35  )
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

On Wed, Jun 29, 2022 at 07:43:33PM +0100, Conor Dooley wrote:
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

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
