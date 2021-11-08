Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAB4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6509A611C0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6509A611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0XbYTH2bUk/3wQ6v+NFImBD6Xpk1gS0EpupwGHilyk=; b=HJTCQe1E8QeWtG
	Sfnb5Bo9ZyX4FSYzdeGc8+6g0Mv54ddvU63lPyPb8F+UOGk8jV0V9NRUCHM6EgPh2yLGtTU4PXY8C
	NYPlrOUULws42pdb/5BNY+YHpgku5rUiZbjax0UHHzvbcAdaj28BTyGmnE3u5d2G59RdJvMZY2rJ5
	G/knODhH2Lg4NWYDw+z7FSswh2SubXZMymH/nAhjiMKheea6yqNdTOBPVotZm00zgzReCiEtLUQc7
	lE0BUD2N1C+oT2H6ZARwgJdws1IrUvtl40M9X1OJwh4bBbILSFylyN3ao/WNytuQVpWrAgP9y43CU
	CKEiDayX23LsHeJRdVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkBx7-00HSkf-6b; Mon, 08 Nov 2021 21:13:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkBx4-00HSjz-Ay
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:13:16 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E6DA3F1EA
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636405993;
 bh=XB2KDOBpJiDTxLvN53KaY9Yfn9kq5MuLsy13SYbvRGU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=UE+sQ5HC8SwYYYj7RcaBdm8GunNKTsOGQLbKZjuai+rkr4WLHN3crG47WIxD+fnXp
 jSo7kUuENRJCtm+foTIvhY/Aaz81prUdYLgoSARcMDeYL3Sx8vjuo5rWBVgzloPYCS
 3tiI5ks94aMQD3nuAMZ8xCvI5/yAit5u9ig49g4zW1uRjLBqXYocdi0PPqVswEUqyB
 PmtCe4YQti1t5wSAUaVEzedFOgJGkjACBYrbMghdQaLLvZoaobqJOs0rRPqlH7bXPi
 ufpUlTbLJnjQnw3TMhyFlGfz0Ur87EyHDzw0+sA2au3MX2U0+rKqv5KlJe+/gMvL9u
 ucwCabZySCP1Q==
Received: by mail-lf1-f71.google.com with SMTP id
 d2-20020a0565123d0200b0040370d0d2fbso2220763lfv.23
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XB2KDOBpJiDTxLvN53KaY9Yfn9kq5MuLsy13SYbvRGU=;
 b=KDMxesaC9ake4JLiCg0hdVsoIRApBViCSG3c9z4Wfo210lKeiKfw/bknmZbPaWtfHZ
 IjYYT18hlv5dxv/tkO1xQSt5i1Y5xxhqTljKdgQaOYXsQNvlGqXmPOl0BAmz1tJy+P0f
 24yQD8Qm2wxSCFjOgCYV0w/HkmYCAu95VRvSPkEiaUi3L1o7zIJN5VzQ/0RnFcNJvcBd
 Scx10rKFlkJnfo/PbG/mC45XrSS1gUL/LvNQxxEL2WAgAEWOh/1neUCoqC9VGw5cUz+G
 XOWFJXuqCZ6QpW3qwHcpzoZClfLt1WvBqIa6XiCkSohsC3qKIxg8qg34+2+DCERR8uQo
 8fXg==
X-Gm-Message-State: AOAM532WJchuTteBQm/HZ7dTtm3UPX4TYZnmPzD3m8SCVNYO+SdqVuDv
 9AUKwYjR/moc8dkmZTYlJ0Z1BY3GMBhrwirOCxH6Esc3TuTxFvCgh4H8oWxjUSHOKZljdD5HFy7
 3KfkfA8VTr8P01PBwFFjlDNWuxalshBTfoO1jLBQfW9f6tQ==
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr2206415ljn.456.1636405992509; 
 Mon, 08 Nov 2021 13:13:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJoQJPfASIjl/Ea54GsJrSaswI+eaDTggcHJqauek5OKm03GQ1TdlvoYCWn2ROBLnxiDFlTg==
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr2206383ljn.456.1636405992327; 
 Mon, 08 Nov 2021 13:13:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 b13sm1929260lfb.145.2021.11.08.13.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:13:12 -0800 (PST)
Message-ID: <632cb889-114b-2b44-3a75-e4b9e5bd0bda@canonical.com>
Date: Mon, 8 Nov 2021 22:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs
 i2c
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com,
 ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-6-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-6-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_131314_547001_5BB4A464 
X-CRM114-Status: GOOD (  19.63  )
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

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> new file mode 100644
> index 000000000000..bc4ea4498d35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS I2C Controller Device Tree Bindings
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +description: |
> +  This I2C controller is found on the Microchip PolarFire SoC.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Phandle of the clock feeding the I2C controller.

Skip such descriptions here and in other patches - they do not introduce
any meaningful information.

> +    minItems: 1

Define instead exact number of clocks or maxItems... but why would they
be variable?

> +
> +  clock-frequency:
> +    description: |
> +      Desired I2C bus clock frequency in Hz. As only Standard and Fast
> +      modes are supported, possible values are 100000 and 400000.
> +    enum: [100000, 400000]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        i2c@2010a000 {
> +            compatible = "microchip,mpfs-i2c";
> +            reg = <0 0x2010a000 0 0x1000>;
> +            interrupts = <58>;
> +            clock-frequency = <100000>;
> +            clocks = <&clkcfg CLK_I2C0>;
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        i2c@2010b000 {
> +            compatible = "microchip,mpfs-i2c";
> +            reg = <0 0x2010b000 0 0x1000>;
> +            interrupts = <61>;
> +            clock-frequency = <100000>;
> +            clocks = <&clkcfg CLK_I2C1>;

This is the same example as above, just with changed numbers. Skip it.

> +        };
> +    };
> +...
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
