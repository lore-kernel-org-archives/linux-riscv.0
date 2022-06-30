Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044F9C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkb1qvBX/x+/wc2g+uFZgcLmAfElJ7ydzM/9j0TPlYU=; b=EkRZRhkXs3rmfq
	PAVhUfU1nsw+RenwnDh0aXB1Y5sUUeyvCLwGzNUE242ThaehC20ugxWrlOyJ3f7QYiIFscWJKewj+
	KSw8/ZsdIqqDwCIGl1MPkrNXTZBDq2tCThV15Kmneu+9G29mF9W98x8TBoj19UqS4Bqd39xOE9SMw
	Ca5imIvs6DJMp5x0s2fIm+zKSj8uJpbE/crECrhw3XKSd0Y7SnbOwCuAAqxJqMUP3nrz78VW6nRNX
	3ZNclJzX+gCriupGhn5tBP5qIl4Dm8tCiFtGhVzI9iqbpKBdUJzDoMW2ZPbSC31+u2cukrFXBa79v
	A/E9Fi6s7GH/WGwM5SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o728a-001hvc-0r; Thu, 30 Jun 2022 21:55:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o728X-001htz-Or
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 21:55:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id a4so721041lfm.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
        b=AkPzOgMfGFfZSjZD7jfIt2VIntAlLoUSr3SbzTZY0tvDU2JAbZAB5jwCcqhRCkAM2f
         SZMaXzambC5XvJqoJSqZhCYJjt3IvVCp+6BwaWT4/O99SY2jx12hO35bgEKhKuKxejcQ
         dE2URnyS5yf1nh9ijeSAcPycHs2KVfpVtk/PdoQ7jD6COfYLF+mrcrO6e33CUzwQZPGY
         APDYTngSt7Y+GPy5o8I+w1G0pNyoFvpS1MDQY6Dnc7Ax6wnu+jMdv5Clu6vCV+9thnMt
         x6/8Y8TfDG/rsDa4DJ2sM0E7/R76fWr9+E3VerI/dstVRhBOWwsbw1sjWfdYFwEvwyeZ
         Vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
        b=UgxP60XgEEF8oZylIFXDBW0olA/lh4tfo2qO+JBvppdKcV3gw5nbqA7muiXrX3YM+Q
         3fO2TNpaLtxfNh3xYhHOXSohM66q7lkUh54s1R8PsrWF2e4i3DhSkEeVVtMKWTFIqeNA
         CJaxL/bjxatYVQlo8PKapSVqoUOP2V/DnCz2WKvowBCK/8jJ3rJjOu9KuXI0CkekTK+k
         /uE3+PwxL8P2AWfQIc0tt63U8ZRkik4raT0G0le2QVHHr0H2vvZYSdkMD70gh91jHpQL
         Rm+UyQ/niZpB32OrPu0V8KYIS1IxIGLOn5bSGAZAsiX5euWQX1J3CLTTzbYx1GCDD2GH
         K/zQ==
X-Gm-Message-State: AJIora/S0DHpLMUR2byPcdszz0+mkOxbI7I2S2BzYKOFuUyC32llb5DM
	ySu1PAkGHMGmny/hNkDYCZY=
X-Google-Smtp-Source: AGRyM1uQwi4ck8oI9eCwLDrSO3GQoKmA3R5saWkWWfnF2szv6WIcphr08hrqWMNbe4QePSuxVMEb9g==
X-Received: by 2002:a05:6512:118f:b0:47f:6a1a:20d4 with SMTP id g15-20020a056512118f00b0047f6a1a20d4mr6526103lfr.428.1656626143761;
        Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id e12-20020ac24e0c000000b00478a311d399sm3304595lfr.0.2022.06.30.14.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:55:40 +0300
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
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <20220630215540.cifnzovya57bgbsw@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_145545_850245_46591BAD 
X-CRM114-Status: GOOD (  18.71  )
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

On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..e33ef22aec9c 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,9 @@ properties:
>        - const: axidma_apb_regs
>  
>    interrupts:

> -    maxItems: 1
> +    description: per channel interrupts

Description is inaccurate. It's either combined or per-channel IRQs.

Other than that:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> +    minItems: 1
> +    maxItems: 8
>  
>    clocks:
>      items:
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
