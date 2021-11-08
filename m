Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A24C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A91261361
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A91261361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFQh0Dsu8+qxT3ZGWDgG6rp9OLzyEK4fYMgJUnid0p4=; b=YAnNbCxqoIvjzr
	W3filJVhe5wc+oAYPno4Yzvy7WDRwhMuXXTnvrjr7Bd5U9vHLZWK3G/0UMl6Ng2QTWoSkJ/Snr9Vr
	w13hciL7nN5bPXZA98uTGBFNyBvB1czeGemuAAeNAa1swGFuQj5HSMeoLQyigcN8ZHEx8PXQichax
	r9YvJP9D6Rtio4WduUU4gGgzVt7Xt21AWUFHI7VOJNgA3i7cnK8Q3YzcFbF1/Uifdif6ObXfeQU0z
	i4s8zkckKQrTymTwS4qprGvQp6HDBzo7GoAy4Df+SKXQOFFeYlgpRbMsT0keSu4TXIEAgndIPAQbP
	a8hMBRJDmVpvfRcJ99yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkCBA-00HUUI-6P; Mon, 08 Nov 2021 21:27:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkCB7-00HUTk-Jw
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:27:47 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5814E3F1E9
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636406864;
 bh=gsSzukojkEIKbZ4C7biaTDNc7cqvWWRMW5pLSQwL88I=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=WMqik+ql6N3WqK7Bzrcb1s0SLaRdaqer2ZVelGTDOiVwKpvf3FcUmJmC+sYUToTlC
 5g1ueYY9MMdVojbbhOSrxdlQyyTdmSySDsNSm2WzCBNM4QSYt9J5FTiTveST1uakby
 zWG0u9QYyKuULUc6b60Rxxc6fCaR5rGbp/yBg4e0kBK9lf5+QqPbtKAQy5oBp+l4fT
 8INL6sILBEewg4rsL9mmkU8wapxN28VaHj2gFZHIySmPwvJApWS5ZiZsuxeidX5C+Z
 E5VrVQO2iK0sUrUnwMrHqCQyFfgmy+SoTZaixSFu1U7oOgdI1Q/L8vMbij4vvVzkDR
 4tUQaF9D9cx3A==
Received: by mail-lf1-f70.google.com with SMTP id
 s18-20020ac25c52000000b004016bab6a12so7016678lfp.21
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gsSzukojkEIKbZ4C7biaTDNc7cqvWWRMW5pLSQwL88I=;
 b=kkDZxiWmm3Ul4/ziKClUs2bszS/j0nVmbwjhi53c1MbBjZtqZ0nb1gff7+qv9OjO4k
 rweS9LDLjZGnN7kKBf7jjM8qomW116fsBKlrl3p6Tij5EEYQkusLOnXOcFBhVoeKGoVB
 LzXAq5JwafN+6Gp5IxlNVpv00d2nv+t1sr1pPOpgP5PLST60mxGs8sy5XbgN83FJCCgR
 4r0hd2JNTaBDOCox2rMuPI4K2iYuh3uSzvA1JNaBOIXTu5wQimv9GEoQ15WREo3bj5cs
 V3e+BnGeFCpFpKScyRMoWnLLyTxq1Y1FnvuGO/Bx2oVjo+4Zc92PP4CqSoRGWey+NFs4
 +T3Q==
X-Gm-Message-State: AOAM530Q9v089YkuvwgoGLPP5K7z0vvBFeWaTdedE3plE/yHwKNB8sd1
 E7696hn8l+v9cIU2TrQsIJOgvWp6shaVaQdRHTsi3XQhGe0VNzeOUVTt5NReIvG8pBhm8bAObZU
 zdXd7ZsGjYREsBBQlS9W5iDp5jWr313CgiuzpUDcWMXltjg==
X-Received: by 2002:a05:6512:10c5:: with SMTP id
 k5mr2126558lfg.677.1636406863682; 
 Mon, 08 Nov 2021 13:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGKgvZJkQA/4SyxVeMlcPDkjIat9cPad52UQIcFQ9i8k9Fl9QQidq5il9q/ZKjlaYE9irTVQ==
X-Received: by 2002:a05:6512:10c5:: with SMTP id
 k5mr2126517lfg.677.1636406863498; 
 Mon, 08 Nov 2021 13:27:43 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 o10sm1060383ljd.30.2021.11.08.13.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:27:43 -0800 (PST)
Message-ID: <6e8065cc-5688-b820-0bdd-6fb887ae3261@canonical.com>
Date: Mon, 8 Nov 2021 22:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs
 musb
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
 <20211108150554.4457-12-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_132745_828557_95AFFA24 
X-CRM114-Status: GOOD (  17.44  )
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
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> new file mode 100644
> index 000000000000..b867f49e7d70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This USB controller is found on the Microchip PolarFire SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-usb-host
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    minItems: 2

minItems should not be needed because you define all expected items below.

> +    items:
> +      - const: dma
> +      - const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - dr_mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      usb: usb@20201000 {
> +        compatible = "microchip,mpfs-usb-host";
> +        reg = <0x0 0x20201000 0x0 0x1000>;
> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
> +        interrupt-names = "dma","mc";
> +        dr_mode = "host";
> +        status = "disabled";

Skip disabled in example.

> +      };
> +    };
> +
> +...
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
