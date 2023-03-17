Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E7C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7XRYbfaR64HdYUdyh3vXn0M5KNAD1HHhIlPZqO0HI4=; b=BBwYll6fcxLsB7
	Sr6KH8Q1R7eVCUqKeCj70pFerznSvxqtVjPQFC6YJho1jfopNKKQEhfmtQHep+ZOMFUSgGBekIfbm
	w06kYqS2dthPdFk9S5wT9AHqouNrmSG9eL8rNf58v0vjy/F6t1b6jqBynTVE42iVegcEZUOoPJUdj
	JddZZGHt5RgJ80TCHdSs2qh+TSsgqV5OMbdCaWFUdt6AREjss4pPlgtJZgl+8jGf13flrLQMrUwVh
	mrPSH/9VbGGDzGkAYpdmn6xB8kZdNfjtU4NaJCOYhThdp1S5+9QL9/QyceD45jOte7cPejhdgPDT3
	TskDTL+wnIXb3A29FCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5gD-001XPX-3A;
	Fri, 17 Mar 2023 08:43:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5gB-001XOG-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 08:43:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id fd5so17426774edb.7
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyjsELfFw3lppmbggM22hydH2zqp9jlm3lTnEs6D8is=;
        b=HUvjbzmDbBt2pJx9PYHfYufQrQwXrdyNXF9UkWGR+N1EEfRNjewLhQ03io6sM4WuOV
         GnvIM6bMAuclAa3iPXZR5JkPODMzLPcQ4tjm+j4Uz39iyMVvN6QVv+rg6Jb0SkEzK+64
         95tWkxo2PFMEsvdvPLRJA8Y7H2PBW5FcXN8XoN768YsQoe46PbreGx4J2WE2A9CgHXfs
         FJ2qNDtOAt+9sQFra6a8V3aew870duReNp4B/SYov0YWpk92vLc3vMZjEeriWbYyMAJ9
         NucsJdcl/iFyc63O7TV7pel9hplwavP04t2dsSdhmkAhxGTu75rdVFgZuhldcLNmIG/k
         5Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CyjsELfFw3lppmbggM22hydH2zqp9jlm3lTnEs6D8is=;
        b=gjnLi+ahmUPvbmfC5oosl+Vm7GapFB5KuQBnmXi4Yzy9X0cD8SEUnA4RlzRV+hVbq6
         QIX4yyjlnEZ0rlejQRx/TBYx8CNljzkHAruHfHzXG3SkezTiN6cimQSbtpk48r3sdMks
         nWiZgnpGRW1nhbGqTB5IshVMVNjH3KzjFOqBrxKXNt7MyoeIxJG5ZaepDO3LmWJenUVa
         XIq/Cbsu7SQQHieUnphD3/hgwfpQ+HO7Bflpgekxvl5tWwEXSGP99QHyi85PJc/C1OaC
         SWe4ICBKbWzWZWcM67chbwDLYecN9g6Ca1TJmrCv9gKaavAR0W3joROx5F2DQ5yhmAjP
         tThw==
X-Gm-Message-State: AO0yUKUp34mGQgE/1ZsTWemBdhsJboBuUgWn7MoSG3W/XrlPU6Dj4eC5
	10ZlVtcZ0+HpJNlVknXlzcBPDw==
X-Google-Smtp-Source: AK7set8/JFYEHKdhIyD71Irxi9tirZUYjiWurePXG0zdgWoXg9pW/ioBLAFfYrD2WHCFd+uU8pnQuQ==
X-Received: by 2002:a17:906:f914:b0:88c:6345:d0e7 with SMTP id lc20-20020a170906f91400b0088c6345d0e7mr12442194ejb.36.1679042593540;
        Fri, 17 Mar 2023 01:43:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709060d6a00b008d044ede804sm688481ejh.163.2023.03.17.01.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:43:12 -0700 (PDT)
Message-ID: <451c8112-c7f3-f435-5d90-840f01c60bd5@linaro.org>
Date: Fri, 17 Mar 2023 09:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/5] dt-binding: Add JH7110 USB wrapper layer doc.
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-4-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315104411.73614-4-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_014315_225768_57B40A93 
X-CRM114-Status: GOOD (  17.17  )
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

On 15/03/2023 11:44, Minda Chen wrote:
> The dt-binding doc of Cadence USBSS-DRD controller wrapper
> layer.

Subject: drop full stop. It's not a sentence.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).


> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> new file mode 100644
> index 000000000000..b1a8dc6d7b4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-usb
> +
> +  clocks:
> +    items:
> +      - description: lpm clock
> +      - description: stb clock
> +      - description: apb clock
> +      - description: axi clock
> +      - description: utmi apb clock
> +
> +  clock-names:
> +    items:
> +      - const: lpm
> +      - const: stb
> +      - const: apb
> +      - const: axi
> +      - const: utmi_apb
> +
> +  resets:
> +    items:
> +      - description: PWRUP reset
> +      - description: APB reset
> +      - description: AXI reset
> +      - description: UTMI_APB reset
> +
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to System Register Controller sys_syscon node.
> +        - description: offset of SYS_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of SYS_SYSCONSAIF__SYSCFG register for USB.
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle to System Register Controller stg_syscon node.
> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of STG_SYSCONSAIF__SYSCFG register for USB. Total 4 regsisters offset
> +      for USB.
> +
> +  "#address-cells":
> +    maximum: 2

enum: [ 1, 2 ]
(because 0 should not be valid for you)

> +
> +  "#size-cells":
> +    maximum: 2

ditto

> +
> +  ranges: true
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    type: object

missing $ref and unevaluatedProperties: false

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - resets
> +  - starfive,sys-syscon
> +  - starfive,stg-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
