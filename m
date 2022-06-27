Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675AC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoL5smix+uMEZ4TMZrFF8OHRUvJT09UYHjnIZjntWRU=; b=iP8BncMmir1der
	1sRT9gNCrRz94dY78pE7rv5OQNedJdxqzeequl+VfObJZS37wXYTZDyUAotdC0KETUpKF8GmVmBZm
	bKM0LvYAB8/urEHyKrBEDxCbPin6nG/HSZYTXgfmWihaZgR5LWByHX8eQHb5EOL5nmLEoL3ZW7P3c
	6Oi7TrMwzQfyrlzlttz5x+gf4sFgbBU0EiQlxnD7duK1G2JVHbWaQpIqw0fWg2MQgex4zw/uJrbW9
	8O1+ejHLoShur4AOxzFTxnS35BU9OOQ+/WOHH8+uCHFjGhFhA7no2ZFqG4S5VtCyCH4+GJ8zhbQLu
	R8GnhD+o+nMyJg2Dzzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5yBe-003Gxm-FO; Mon, 27 Jun 2022 23:30:34 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5yBb-003GwZ-79
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 23:30:32 +0000
Received: by mail-il1-f173.google.com with SMTP id 9so7080462ill.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 16:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x8JlGuBlsyv8u11qNoGLGDrkEldcGlScrLvA1xIrWcM=;
        b=VcmCb3OkF5Wv/8vgdK8wEuVuhmEqg1xW6SrTUCHjodP+oKrO0j+QN6K3Gx6Qe9Gd4c
         tyjO1J3ZiGOq95e6yNvckdDValLm8BZNIQw1iRZb61gpUceN0ecF2yIORbFm9dY5s5ky
         zwnuZ51uaAGQ4gtkOJy3qBc1xYcdnxO7wJkiajU7UjOim25A90kkq1ea3BpFRNTdgB3B
         c704TRX/S3MFRBf1Jrmoj2L583yl0PwWqV6qi/7cZV5vOBQC3OH0gP17gSMEDw0i7LWM
         9KUD1rPcXSGCrzVvxA2AuhvxbavoD4nMDqlrsdiZWpF8X6hSBCFuRu90yl2ZVJK1lDp5
         htBg==
X-Gm-Message-State: AJIora9NkJeuhZhjkDRPW1MBd/TBJp0eqpkzYKxs9Jsqi4Cr3j2SlNlz
	fieKkRt8cYS0DTEh+cVkew==
X-Google-Smtp-Source: AGRyM1v++vx5C2PZ1+V37WXzVu58JZoOtbgG4MxkB9S8u2iPl6cebvqf5cCXt4rpl+8ThnjePE2X0Q==
X-Received: by 2002:a05:6e02:1d19:b0:2d9:1705:892b with SMTP id i25-20020a056e021d1900b002d91705892bmr8430986ila.61.1656372628833;
        Mon, 27 Jun 2022 16:30:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d9290000000b00672f405e911sm5910587iom.38.2022.06.27.16.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:30:28 -0700 (PDT)
Received: (nullmailer pid 3169022 invoked by uid 1000);
	Mon, 27 Jun 2022 23:30:25 -0000
Date: Mon, 27 Jun 2022 17:30:25 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/14] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220627233025.GA3167724-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_163031_302844_6FF6B32F 
X-CRM114-Status: GOOD (  20.13  )
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

On Sat, Jun 18, 2022 at 01:30:27PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware timer but
> according to the documentation & devicetree it has 2 interrupts rather
> than the standard one. Add a custom compatible that supports the 2
> interrupt configuration and falls back to the standard binding (which
> is currently the one in use in the devicetree entry).
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d33c9205a909..9a76acc7a66f 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: canaan,k210-apb-timer
> +          - const: snps,dw-apb-timer
>        - const: snps,dw-apb-timer
>        - enum:
>            - snps,dw-apb-timer-sp
> @@ -21,9 +24,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -
>    resets:
>      maxItems: 1
>  
> @@ -41,7 +41,23 @@ properties:
>  
>    clock-frequency: true
>  
> -additionalProperties: false
> +unevaluatedProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-apb-timer
> +
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 2

When more than 1, you need to define what they are and the order.

> +
> +else:
> +  properties:
> +    interrupts:
> +      maxItems: 1
>  
>  required:
>    - compatible
> @@ -60,8 +76,8 @@ oneOf:
>  examples:
>    - |
>      timer@ffe00000 {
> -      compatible = "snps,dw-apb-timer";
> -      interrupts = <0 170 4>;
> +      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
> +      interrupts = <0 170 4>, <0 170 4>;
>        reg = <0xffe00000 0x1000>;
>        clocks = <&timer_clk>, <&timer_pclk>;
>        clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
