Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71326C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnkWVQFKxFeeOFVtWqPD0j0XGhsI5Dl/a/bzOJpJtec=; b=GeqAwSxMaVQVhm
	WF0Zb9po3pB+/jqNhHvpM83oHC7BwSyn4kS5B+LPtPzMb0OruL0WNzCVlDJXiNpEqnH5cEcBGeAFK
	CbEnM8dQNyxpx7cN7rnJjnwdcAVItiG4LqUmWu+D57xND0PAhitbUjhqP1hkVknfbzml4ZgphHRRw
	0k3Xj7ghADqtutbUBLXRoB966Ovv70HwyiSQGiEctelOoq0F9j+aQ7UjTRcrtd8XFxrKEJKGonE5V
	3j6CzZ5YRZ0htlwpMjIc/MCMHtIPfudTs0+RqqIqyOTQtDRIpQwJCnIifqe7sdvLPt82qDYUSJ/X1
	7+1wMtvIu8WjDRDLiO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3jh-00C73E-7b; Mon, 21 Nov 2022 10:09:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3je-00C71I-Kw
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:09:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id s8so18058084lfc.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxrwoV4uWAErf9DL6sbWjIb3t+zcjaVCbt4w4586XkY=;
        b=Wed0FFJ81XFeo/OAhCrlzD6g9EDFNqhjFc6GWDE+gFplOeMHnMYKzJe06LfyI8dihk
         dX2CQCikjWSKjz+bBsAMq6DXgQRrR4f4jjYOH1cEFlxtN4/OSlU/ZxBFc+R/E3hmh4lQ
         yrfzBynHDAvigzlXz2rwhPv7+aKa09hrMZ0VcOiXsU1cZ+1YtaCgRFV7vw6LL0oahIYB
         Sx+eHl44hLwcd1qhkHn4pUilfYQdfKDa9WC3VtsavFbS1pA64Wen1F23TqyRWG18s5kP
         j4z8qQOtl+0nLwm4XB0KOlMz/zoA7hc6eVozDfFiv0wS6wk/zAg8oEcAxs/QxdT03ay3
         vC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxrwoV4uWAErf9DL6sbWjIb3t+zcjaVCbt4w4586XkY=;
        b=GMu8Fe3vf9xd5pQxS7md1pT2houjdljwwIjt8mrckI/jX98/hwl7+w8ttC5aENPQxx
         EmJO6R46x4X2h38MiQqee7OGVySSEWO2drMWcMbFQks56VrKxeiEQTvgljQpgcci4iYz
         vpzVUSgeeWi0P5hpYjrD0yo0u9Ky9h7l717Gc/CU9bd0rk+wkX03hfogNejMAKD+NzN1
         /I6Suh0RiH57kXDKYWgMCwuq5Ux/FbQcNsm1+eJ5wKW4LwqAx3HRyoWeldY+v3uGcg82
         da6xdxnxPVShzdfcKYRU8+ZiducuFVHEM1ibXb54PsFnqZwwH9qfIaD0FJThyKFswOUg
         oH2g==
X-Gm-Message-State: ANoB5pn8iGh7ru1RPUKGuSvu9wj2xqPhME5dVvpTEBl7oox+/je1b/Nw
	2W5sboS9B2vhmYnW8p01VkGLAg==
X-Google-Smtp-Source: AA0mqf5GeXjgbrXXdWAXxvd6orgjBRuVp8zzcCyfmnYfi/NNmTb9WEE8schAAo/sbXXSZ/qNgDNyxA==
X-Received: by 2002:a19:7001:0:b0:4b1:8fbb:d3f4 with SMTP id h1-20020a197001000000b004b18fbbd3f4mr5968366lfc.70.1669025344352;
        Mon, 21 Nov 2022 02:09:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d20-20020ac25454000000b004948378080csm1953159lfn.290.2022.11.21.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:09:03 -0800 (PST)
Message-ID: <1774dce0-b9eb-6b75-c9c2-98dbc05db04a@linaro.org>
Date: Mon, 21 Nov 2022 11:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/7] dt-bindings: serial: add bindings doc for Bouffalolab
 uart driver
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221120082114.3030-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_020906_719124_7830ED07 
X-CRM114-Status: GOOD (  14.10  )
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

On 20/11/2022 09:21, Jisheng Zhang wrote:
> Add bindings doc for Bouffalolab UART Driver

Subject: drop second, redundant "bindings doc".

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/serial/bouffalolab,uart.yaml     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> new file mode 100644
> index 000000000000..6cef956d33d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both lines.

> +
> +title: Bouffalolab UART Controller
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: bouffalolab,uart

No model number? From bouffalolab there will be only one, exactly UART
model? No new models in next 5, 10, 100 years?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    aliases {
> +        serial0 = &uart0;
> +    };

Drop aliases, not related.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
