Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44828C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeLJUqIT/9uUb3KM5lSU/z92I+kjY0I2AGQ36PEj0og=; b=WqEUvGcU/JIzlI
	OsnvME875F6+sQmG9p6Ok8Jm2mun0Iw0N6/TgvYXGchBZ6Fb8dHJZEN0BCm0ErMZB6Hk1C40COfml
	/usIHwE7YjIfJ/zv0Oerv4bkHqknX5RgXjsWgyoK4iGGJgCl8cIRh2BqfxMEi2z4xvGXPJ2/+LlEU
	jydURQTEwso66H8G5JHrMiLg7OkEIgmZD5by2ZRUPoua7TzVZ44kWyuaIxbxONjimpShy2fkxMWC0
	BS/ibSHkZRh1WxWD/4AW7fTftqInJqPjgDCq/aYsPj3/uSdunOEyPlpsZJSllubaLcUeGr8CIQZER
	YfPlUj16J19fJ1FxJ98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1ND-008Bvx-Rb; Fri, 19 Aug 2022 12:45:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1NB-008BuG-3p
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:45:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u9so5944559lfg.11
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qqffeJ1cELkTvZi2yVxU+KEC+V9oMcB95umfP5C+/ms=;
        b=C0gCvt6FGl2dkLGc++ML4O+KSqvWSCQnKOwA9F5j3zwkJOsDpb2jOMd2PfEsq/TyRW
         lNxrVzNySX24r+5Vs1PXCzbOltRSDmMaCPqRv8vpqFqkDjqex2EgqF4zv5XAuO95nBDy
         WiJcuwyKZCyjxBwDw3q8F6HTLNIPapWU63m6yXKuohaY0aD3oWRQ2svfuhijls0dSy+7
         pZZ4t6quHgFo45JY9FIics9N+MpO670rTh/pTjPAjOP3SOAb7RYBZO4CglNALOVrhPJk
         oQt5uxxhVE1lBLUu6tiD2WvUCkfWsqZm3zMjGOXm468VqMMUMvnFsvfKJi4ck5ZLHoK/
         tkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qqffeJ1cELkTvZi2yVxU+KEC+V9oMcB95umfP5C+/ms=;
        b=htLUweNXGnscmx38ibV6opxjcpqW3DG4Ifa7aUT9IhjSlyYb8ImAYs132qe7oI9oGR
         R1m/pnt+Lu7nkhy6OpjuHKs72YserNac7PpQjLJkF42j9gOmYRzg/EBQY8u9AqxMXNcO
         t+xSKZWpe6Sr3QdktDSw2KdnMJNIaMEzGXtIMQUI1YJp64JXWmgpols3GfIvO57AEfRX
         sUC9xJCJ1i8/fFSELEzzy2eIovIYYXFkEMyDHb/YFyyPmUVPdBW23Vu65lWMNbw3EV1G
         LfLkM1MCEKFv4YBhXwOgGN2DOkeIUUXLxxMQHkd/KIxLmgfKpbha0vt3rMNcv5t6+kVF
         CrVg==
X-Gm-Message-State: ACgBeo04VysQufLZEyG8sqJ8+KTM1KKqCsP8yQQhHPSDUJCrEh0aSoyP
	KqPAB1+mVx02/NOJ1T3k3DbY/A==
X-Google-Smtp-Source: AA6agR7/PRkYQLtYE0l0kOSX2qoSLm7uckRWBd/nF3eYbhF9x+nTNIyBDipk1CoYBEgaYkztlr74kw==
X-Received: by 2002:a05:6512:282c:b0:492:b415:6def with SMTP id cf44-20020a056512282c00b00492b4156defmr2503429lfb.615.1660913111394;
        Fri, 19 Aug 2022 05:45:11 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id t5-20020a195f05000000b00491734dcb89sm624998lfb.196.2022.08.19.05.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:45:10 -0700 (PDT)
Message-ID: <0976b1c1-a8e0-5a61-51ff-9b47f29569a5@linaro.org>
Date: Fri, 19 Aug 2022 15:45:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/6] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-3-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054513_230812_D2D1DFE1 
X-CRM114-Status: GOOD (  11.62  )
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

On 19/08/2022 15:22, Conor Dooley wrote:
> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> ordinal corners of the chip, which our documentation refers to as
> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> highly configurable & many of the input clocks are optional.
> 

Thank you for your patch. There is something to discuss/improve.

> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell.
> +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
> +      PolarFire clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ccc_nw: cccnwclk@38100000 {

Node names should be generic: clock-controller

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
