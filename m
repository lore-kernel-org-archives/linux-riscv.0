Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C086C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o39Jw37mSkmSqCh8P6AF1yANPKNPKrG94T7JXT0XJWU=; b=pp7wFrMvZ+MIah
	h2/N2iIsD9sr0T98+nq8txRQuZAJqJd2x/5Xp84UhBnQIc94WvYpA4u2i7pe9+LMBIJTjf9ZN31NA
	zfQQWjQYBhZpCiOAuJjsD0GqvcuIrpGFjwIyiwLiMvMcxn0SKm1iyRCG4SpuWBNMD5u8ClW3DAVAz
	R3qRqFb8/AlEmkrX9J+sDszF2Z2BIZ4S3t8zsqpYDuTceggupWP61tjRYJwb4I6wBlw97r+RRzG5T
	M7gHWxMc3TkuR5P6mylHAJPYu/L3qxYunQtEk/rbsCco+EnvS8p1LVuDRsnSWkrkqnPn00kadFOPQ
	ZWqjfszUJGw4sPuVGbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OSF-002Te2-OO; Mon, 20 Jun 2022 20:57:03 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OSB-002Tba-Pp
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 20:57:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id g12so7156466ljk.11
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
        b=XqDUXO3E0jN9GQ9iGhmoxij0PahkYfXP61nSCTKCx/fvSoFpRgDWoLiqAgCUJw1PnX
         GdUgZ6dYoT0Uit7ykMaMR28omMbZ7gDLoi3NlWPpOtwarIrAKYFsFwlDEOerY9w8oIh9
         rbNjhalyLNI+e+pBOTtZlMUNIOGbQPKrYkgGGE49HLjM86guD1yX+eIVXs28qYEpQbEL
         6u9TJxb58aw5NaSuOkvrVJyyneGqycdZCp/nKqOuDGx84SLdx3Jj79iGAZlYRrBgW6bm
         FIeQBMEkq8FhjglPxtSJNnSUrVC7AertpkEpoopILkV/YW/Fu3kY37aS2zC50BoszzoE
         3eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
        b=3zRaUPDUYKWI7FVBlz4oNZuqkDfSS5WIj+O2Mp0SwFmX+M1TVz72biT0gLDwLgIvHv
         g4COVFMZTXaiiFYEY56xuC29OI7OiMalFQpiioaBTm7p7LUbHTFTHtxrKmxwaPn5yQaa
         ir9LTmFoqN90Z3cJ6k6uepHQ2SY47EzSJYM2p8g6NSh/3oFtKcoKFTpNy8Cgd8g9LGsq
         oSWKnyx9qxFDcSh/zVK929+yin43bpT44jSrDIRTviUPE2cKOeSWI2f2eZk5TYh5s+ch
         mOnxT+0yANi10NpJpZRPY9wOMcPBHG1DAZXKiXBa+k0450Q9A4wW3USvoOVi8NYFYNrX
         96RA==
X-Gm-Message-State: AJIora/1SU3ePD5rpwd6CHflosfBRGCe+1DY0IKCuLHF0nbFFUv2ObD+
	fWhTPs5DiK2x8mScwyNS9DA=
X-Google-Smtp-Source: AGRyM1to9l7DPfbxuwJzqkPzvrt6m3YRq/lqE+tbkd+LRqyrjxLhnrSzMA6Azd9ZVxOZ5l1LL1DhCQ==
X-Received: by 2002:a05:651c:2107:b0:255:beb0:9969 with SMTP id a7-20020a05651c210700b00255beb09969mr12785405ljq.157.1655758617786;
        Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id i17-20020ac25b51000000b004778632bff6sm1893799lfp.59.2022.06.20.13.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Date: Mon, 20 Jun 2022 23:56:54 +0300
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
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220620205654.g7fyipwytbww5757@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_135659_904174_60E50B12 
X-CRM114-Status: GOOD (  21.42  )
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

On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..f2b9e3f062cd 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -135,19 +135,41 @@ properties:
>        of the designware controller, and the upper limit is also subject to
>        controller configuration.
>  
> -patternProperties:
> -  "^.*@[0-9a-f]+$":
> -    type: object
> -    properties:
> -      reg:
> -        minimum: 0
> -        maximum: 3
> -
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: snps,dwc-ssi-1.01a
> +
> +then:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 4
> +
> +        spi-tx-bus-width:
> +          const: 4
> +
> +else:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 1
> +
> +        spi-tx-bus-width:
> +          const: 1

You can just use a more relaxed constraint "enum: [1 2 4 8]" here
irrespective from the compatible string. The modern DW APB SSI
controllers of v.4.* and newer also support the enhanced SPI Modes too
(Dual, Quad and Octal). Since the IP-core version is auto-detected at
run-time there is no way to create a DT-schema correctly constraining
the Rx/Tx SPI bus widths. So let's keep the
compatible-string-independent "patternProperties" here but just extend
the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
properties values.

Note the DW APB SSI/AHB SSI driver currently doesn't support the
enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
activated by means of the corresponding CSR. So most likely the DW AHB
SSI controllers need some specific setups too.

-Sergey

>  
>  unevaluatedProperties: false
>  
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
