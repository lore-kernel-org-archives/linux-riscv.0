Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09944C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySMU5uw3iKuy5e2O0uPSzbZGldpdxUWEziN8NOdFWM0=; b=0xm7q3mPDorbTQ
	jqd3X9j+pmdC2he7hh9+wInzJrKn7Ci/xRueP7M9dlJm5xOelEcucRTS459dtJCFB0dAcY5le3k8Q
	Uj2491KosTNefEbe17hsPFWpY1yZkjp/5tMk6YBu0s5L3LrSx691L2N2uUEn5Oiajo75YwL8FllAg
	UHwZRLWUzTdIO552PJ7Pp/wkRvDJ3DBrOEba1tf5VcS2DdAvqwO8s8yQBhofJns2kfdG9H8rMbdm6
	omaQMkhRvmi2ukwGLSY/J0xKCkZgZFSpZ2lvggRgu8ykr6bkDqZ/HiGsB85XvgSrwrHkL61bzFASX
	y/j0f6HTWWGg+ttnwtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neF0t-00Dpkm-9E; Tue, 12 Apr 2022 11:48:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neF0H-00DpRt-Km
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 11:48:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z12so9437782edl.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EaDGYaeGaLhpoOVhpp5l1eF05NJNsCcLRrjBOHZ0w+o=;
 b=kWSrl58wDoO7wxSbiiSCs7Vv0luYQWyRMir2U713mI6rxdbwXTDaLDwfvXve1OsJ2r
 WRCgYG1NxxlNP2vJ46byNoj4UW06ZHKXgO1GgWQecPlP5YcjI0NznzzNQXlgs99vOiog
 w8cp/xXzJnt+MPn28tiGAFkJJZ6As9m1f9IDsGC3aQYIPzYqjqEuRQ+SRoAz+8Qqzl/I
 8Eg1IewCZ+AbjLjGAAAJu7xicwmR/BfcXvyMG4b/IqHWOdH4y2q6RGC8UeuUdUrL9/pG
 UAThltsPYFFCsDWw/kPVQi/nPShiWjihlUPfYqclQqfgsbRIhr+hCNEFU4YziUBJe77J
 sYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EaDGYaeGaLhpoOVhpp5l1eF05NJNsCcLRrjBOHZ0w+o=;
 b=r1w1YOUJDem3arcSHINCWO/tnlHFK/libGx1+pfsgIpK/yQezGy+1wIYsMoBM8/9qo
 Pz+uNCRaaRNqr1EmkgGcGt2ZGIUx8B8v+PYl1YuOikUUJynW7wcN7GlrU8VXejkcnTJp
 eabrn7tzvuoS68BjccQyPKcD4vDpS5uPqYgWoRX42wfgAdfGXWJPULNCumE+lPmOjWKZ
 g3H6bnDNETP+SXKkfReDkXf6jrn9qfsTP+bahDAZ8aDOxe70pzKA/v+7EtQ4BUyG2/s0
 Q0fM2i6ET0duSsET5grGyAB4BTa9dvrNN6+4XWDDB9pxRHyp62m34BBBIlJ7eYWDRgCm
 X3XQ==
X-Gm-Message-State: AOAM531GKo80BpRtF3iYJsEDRhzBNK872eVzC4GZOowJSF9/vPR8RRhU
 vOROrANktQuxgCgZhYijrNY/ew==
X-Google-Smtp-Source: ABdhPJwfRz1f8LSnRV6Lfys4BKUrPrrU8ATvdjdv/Tp7F5aQqNX1yIvKg9ltC4IUI04C9yxIoU1jRw==
X-Received: by 2002:a05:6402:1d55:b0:419:992b:9286 with SMTP id
 dz21-20020a0564021d5500b00419992b9286mr38339082edb.235.1649764091921; 
 Tue, 12 Apr 2022 04:48:11 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 hr35-20020a1709073fa300b006e8b9907b38sm439028ejc.177.2022.04.12.04.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:48:11 -0700 (PDT)
Message-ID: <e202a170-5d94-7484-897a-51718c97eb35@linaro.org>
Date: Tue, 12 Apr 2022 13:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-7-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411085916.941433-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_044813_749095_BD664957 
X-CRM114-Status: GOOD (  16.40  )
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

On 11/04/2022 10:59, Conor Dooley wrote:
> The rtc on PolarFire SoC does not use the AHB clock as its reference
> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
> this second clock to the binding as a required property.
> 
> Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs rtc")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> index a2e984ea3553..1ffd97dbe6b9 100644
> --- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -31,11 +31,18 @@ properties:
>            to that of the RTC's count register.
>  
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: |
> +          AHB clock
> +      - description: |
> +          Reference clock: divided by the prescaler to create a time-based strobe (typically 1 Hz)
> +          for the calendar counter. By default, the rtc on the PolarFire SoC shares it's reference
> +          with MTIMER so this will be a 1 MHz clock.

Please wrap it at 80-column, it is still preferred coding style. The
same in your patch 4/9.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
