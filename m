Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D52C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giK2bFgSnr3ZQv4i6U1ihYlSrRD/tjxaNgK+COiWaD8=; b=usPHyboOFA8T3e
	UPXwmBDdb7/BuwhqnQbi65B9INmIbDMIGEG3tRVgLb5Wl4ll2MgyTysdujOBsuru+KBkapuYZdlRW
	LRGoXmZvs+r8FppqcB2tg7GS5p9qQtXqp6dvHdEw/h/N6KarHecMZuh35FPray8Pqa+P8PczUnxuR
	NH8Ya5wULWODlMwzmL3e3ctJPeij1aIUPBQCW9e3n26EhgI5FCkAVyFtoHhs/qubFfp3xzE0Ti7hD
	vIJapAwemy6K4V+StNFDrSem2sYRoEf7SreciKcfPiVi9xVaMXLicrHr+q8/47rcxMVL6cLR6SV6R
	9j9oWyT8mtFugP9f9dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2w6j-005e3l-OL; Wed, 07 Dec 2022 15:13:13 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2w6h-005e0v-28
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 15:13:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id p36so24817981lfa.12
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 07:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwuV0n2FcadO46u8mq+gLHcFjCqs4mgvgde47beSgFk=;
        b=ZvS9jSQhUfL8WcXq/TxjyksIXloX15Ag5b6M8G03A1zo4+dvHKYj8t3a8r40mu0zUD
         M2UVP7NtSB1bzo/jAucazJWb/W/54+/U+mC//YqsA4AmlQQgsTPeaF2bp/Q2fzsI6OGT
         imkn5Y7HbXYKqZf1tA1kLjtpHdJIjCJx0GR9ufvTcuUfWjPhtUsrAOAgjoC70cQ37dZ/
         Wa3Yk2L8Z1SS5cojk6pU9smxwWQ4hJi5nEVC96MZgjOzjP4wegHIg4v1q1KuNEkEu59Y
         66Pb14vJxPITtwp8AGoKMUfUE7+wLmUIaLW+5uIIxpzwIoroodtdFUuONVOwugpDCrol
         xmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwuV0n2FcadO46u8mq+gLHcFjCqs4mgvgde47beSgFk=;
        b=salODiqGsdfE50AEfalDqU6Cvjvw881VAfIA7G8Y4P68oUoKiXuGlSOifFPICCtbKi
         kHx2iu0qZXIHQooxJFkxSt8ZP2uCIBw5k3KSZ3JI6lM90Lh/MowoxplDymmq8sQcYuWo
         vmLZd0pT4ILEV9dzMaGRrLFNT297rMWFKLTGDvO0MX8NeK0pVYQPFMCQCSq+KNb5QNxj
         9/JclHEcs3xHlLHVhNQQJ343YQbU58lNI5fb9sELh5/GGYi990pJIgjVFqOuaeyJR/To
         1nx1Z1GgtS2Uic7xGhmKm5490tyQqk2Vwx0nIyyFPuRznZ+sUADmd70guIQsRlDnzJs0
         YIoA==
X-Gm-Message-State: ANoB5pk+qrnFMx4M3J36smp30wL/JTScOnrT4Mjcao+iu7SOAcG21/ij
	as0AExViwlD8njHHX77e2a733A==
X-Google-Smtp-Source: AA0mqf7H/u1TTdUDubpP4RFHzJ+Z6dInp9jhB+5+WVPVTc4JVsGKqJfFgAD2IAyI7TXnhs+eSOZW8A==
X-Received: by 2002:a05:6512:3454:b0:4b5:8240:5bcb with SMTP id j20-20020a056512345400b004b582405bcbmr3082136lfr.388.1670425987664;
        Wed, 07 Dec 2022 07:13:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi27-20020a0565120e9b00b004aac23e0dd6sm2893718lfb.29.2022.12.07.07.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 07:13:07 -0800 (PST)
Message-ID: <d7ecbbbf-5d6b-3254-b645-dbea369447ae@linaro.org>
Date: Wed, 7 Dec 2022 16:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207131731.1291517-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_071311_149809_9B9682E9 
X-CRM114-Status: GOOD (  19.95  )
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

On 07/12/2022 14:17, William Qiu wrote:
> Add documentation to describe StarFive
> designware mobile storage host controller driver.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/mmc/starfive,jh7110-sdio.yaml    | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
> new file mode 100644
> index 000000000000..4f27ef3cf4f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/starfive,jh7110-sdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Designware Mobile Storage Host Controller
> +
> +description:
> +  StarFive uses the Synopsys designware mobile storage host controller
> +  to interface a SoC with storage medium such as eMMC or SD/MMC cards.
> +
> +allOf:
> +  - $ref: "synopsys-dw-mshc-common.yaml#"

Drop quotes

> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-sdio

Why do you call it sdio if the interface is for mmc as well?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: biu clock
> +      - description: ciu clock

I don't think the card interface clock is optional... are you sure you
have designs working without it? No clock line at all getting to the memory?

> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: biu
> +      - const: ciu
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The desired number of times that the host execute tuning when needed.

That's not matching the property name. Missing number of items... this
is anyway confusing. Why number of tuning tries is a property of DT?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7110.h>
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +    mmc@16010000 {
> +            compatible = "starfive,jh7110-sdio";

Use 4 spaces for example indentation.

> +            reg = <0x16010000 0x10000>;
> +            clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> +                 <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;

Align with previous <

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
