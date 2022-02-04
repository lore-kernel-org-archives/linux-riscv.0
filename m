Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E131C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueNtr8rx3cvj6SySMhc5f1Gru7eRfzMvT2jOPlz+Vgk=; b=jb2hJadzmWfBf0
	0DU4noGePVK2qgqeDNTL1yAArnVEO+68qGMOytg+efkpfIirti4qzSCxMYRhWwSBqCv5PST7aNQ+F
	angSY3oMc6HtU0D5Gfz8moX55oYlFEBE/xMUS4KVmhWV9UhVQVYZAV0cvCtwhDCnM/JHxAx7B0qNW
	J7TyoVZMl5AFg9y40dwnad86v9QD/MbEB+BSrz8CzmO+ba+4uSC4fJSqmD1NL7QCD92XwVgQf7ggF
	MBJShRrwUeeNdogbRSAiV0mpoAk1CUz9OCzowBC/rpS6IBbOTObNpdt3iqaR96GXBeAA4sE4pyBe9
	aQ72tKwLKewNBgcDPe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7Lt-005c3e-MS; Fri, 04 Feb 2022 22:46:49 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7Lr-005c2s-1s
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:46:48 +0000
Received: by mail-oi1-f182.google.com with SMTP id s185so10240965oie.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 14:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L8b72xGfF9umAJJg7tsHu1AkAehHlvUS7fj1GSuG6R0=;
 b=BWaIYIgrqpLx8WIaluXlR4RcwMKdjSRNwUq6PwKm6UtLiAcK25YC0dhY9/5AOybq9E
 QwIDaWhjIav75Vibzr+VJe3GTAyruI/pio+EFXkgAuW2yVEWwVDwycmPoX4R1duH8ttu
 qIMM6BO48oKYyyZYqy624+CBvVtaoBv/titDWcbzxTY24rg2JB/ilbGTrYgwG0rdWKYS
 /Cl0SAQnRj8kEHlXkBSsmqdM/pyp66Vv/KDR4T7saH69cxdfrd40SlO/KdCYoq4dlqPh
 JLPopDHSC+pDggfEQgEl247k83WCaGRvfksmgqWK0a3YVGth/Gex6m4caybPHQ13ebxS
 nOcg==
X-Gm-Message-State: AOAM530jYoSz5X0B01Z6G4tTlN1ukEc3wQE8814GFoxHyJUyEq1hfLmP
 DmYW+FQWqcDvckLMEI22kw==
X-Google-Smtp-Source: ABdhPJwxV7g+49b86KSwvPAvbdlz385/Vu9mnW4I2sV9P9k4qH3MueJC6HWx5Bhq3KvuLey/MH/2Zw==
X-Received: by 2002:a05:6808:1981:: with SMTP id
 bj1mr2364232oib.213.1644014806196; 
 Fri, 04 Feb 2022 14:46:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m7sm1268743ots.32.2022.02.04.14.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:46:45 -0800 (PST)
Received: (nullmailer pid 3324348 invoked by uid 1000);
 Fri, 04 Feb 2022 22:46:43 -0000
Date: Fri, 4 Feb 2022 16:46:43 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v5 04/12] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <Yf2s0w4Yi6rcxukj@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_144647_118846_89F3CDDA 
X-CRM114-Status: GOOD (  18.38  )
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

On Mon, Jan 31, 2022 at 11:47:19AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..f35cca4e8656
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The RTC on the PolarFire SoC has a pair of interrupts. The first is the
> +      RTC_WAKEUP interrupt. The second, RTC_MATCH, is asserted when the
> +      content of the Alarm register is equal to that of the RTC's count.
> +    maxItems: 2

Rework something like this:

items:
  - description: RTC_WAKEUP interrupt
  - description: RTC_MATCH, is asserted when the content of the Alarm 
      register is equal to that of the RTC's count.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    rtc@20124000 {
> +        compatible = "microchip,mpfs-rtc";
> +        reg = <0x20124000 0x1000>;
> +        clocks = <&clkcfg CLK_RTC>;
> +        clock-names = "rtc";
> +        interrupts = <80>, <81>;
> +    };
> +...
> -- 
> 2.35.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
