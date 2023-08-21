Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9D6EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nmeETph0kOk34zf/50UZ+mEGYVapNCoX5G4GU4aqYA=; b=Bli7D6WjofEbON
	P8eDZTZAVwmfpqr48tUCnTMOthPtMQbEq2RvUz/44XKUh+ZlfKiugPODx9NoZxdm55In3mW52pkpL
	VTUgRTXzErY+BfV0MJGawaRlXbxXQUfU1isxMgFT4hyQjETm6i5KyfojRxShNlv5i6DtSS86l2eEQ
	Zn8Qmsq0W8lJ1Oq2w4bBeBKx36I/Mr2bSgTfN3RHK+OuFvzxN9IFN2hEfvl5x/VB5lbeEL5aYE6dZ
	1+Vhhy604w1ucqDGT8Sug+7v1jrwqyqIq8keqAjzpaPD90vGcOPz47CfTCB0MrCiUJ19iCuDgu0wR
	1zxTvC+St5Y2PCBYUkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyPe-00DGFR-2z;
	Mon, 21 Aug 2023 06:29:18 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyPa-00DGDS-2X
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 06:29:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c93638322so612194066b.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Aug 2023 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692599352; x=1693204152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jqHn5WqQaJCtg0AUJN1FB+zw67/mJle7arazhBOmko=;
        b=uBhtrmUWcQZYqn4uY2bSvQU2eud7UeI4VaPCawfTs8lFgDgS4S6oPVwHPGi/J9JSi9
         Cg8t2/x3c9XBn7O2ZyzPmAa24lRvVSS56PbNRD8WZZy6uXNC7vSRqI/mEFUQYiFtw82n
         QaAe6CwzMeadrUWLErPi90FmPSizT7npPdN807HHxfQ0ETTTy/8g2I0+rE9upci26NjO
         4q9QkuIwRxz6Wf4VpZ+NqpPEaIE/xpwICIzuQ+c7zIu8BvbwwJUpJzvP2hsEvDYbkObr
         Vqnwj0FO0s8LL4qTBPyGsn0llyb/7JC1OBKfQGzlOZVvhLQ41PJlUlyAHlhXi5L8SuyF
         ExTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692599352; x=1693204152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jqHn5WqQaJCtg0AUJN1FB+zw67/mJle7arazhBOmko=;
        b=YNrvg596adJRZnNSX+ElvxNd87CaXMaEAGCuYZ5gYEjDVWP6H+7B9Z7W1Yk6YirsQs
         t9S1PaV4H76PPEEFhvj20CfwBWsM7uG2tllLfNwQ4/SwtfdVQQK7LexE9BAYkS1mBOtf
         jy1AeYRE1X/3gZqhfj+qTLp9FlczpzOlBoUe+KnHxCCC+L4v7mz011USnJQLXV4WOwWE
         Syq2FWoS04yDwgrJI6UqQnNu3voEur+8BWCOga2rwLxGtr7hRhJnrwYTYasGT35dW0oZ
         xrVjWrJKRZ6JEE0FyVWrXLT3EhW/JnvfyM3/9C2JSIPz5VCCX8m10tEWF0qRPEVtIDRV
         Hw3Q==
X-Gm-Message-State: AOJu0Yyx8ndKa1XzDsMu6KmM+QU7n/ITvw1WZyjw8SGfH9TqJlEw88xi
	tCXjeF+Q8hGbb1YNQHB/wiBmAQ==
X-Google-Smtp-Source: AGHT+IHd6+ypVwsYhxnMdbL1UGq6ySkQpWZQ9iHuM8cgfdj0lw84KWdQOHSNV2yTMAzl8mMt2IyJ8A==
X-Received: by 2002:a17:907:9483:b0:99d:f274:316e with SMTP id dm3-20020a170907948300b0099df274316emr5384047ejc.2.1692599352343;
        Sun, 20 Aug 2023 23:29:12 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id kj20-20020a170907765400b0099cc402d3ddsm5836644ejc.202.2023.08.20.23.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 23:29:11 -0700 (PDT)
Message-ID: <946ef7a0-a60b-b6ab-69f8-b169343f36f9@linaro.org>
Date: Mon, 21 Aug 2023 08:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: add T-HEAD dwmac support
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230820120213.2054-1-jszhang@kernel.org>
 <20230820120213.2054-3-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820120213.2054-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_232914_844667_D93AD4DE 
X-CRM114-Status: GOOD (  11.01  )
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

On 20/08/2023 14:02, Jisheng Zhang wrote:
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Thank you for your patch. There is something to discuss/improve.

> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD DWMAC glue layer

Describe/name rather the actual device, not some layer.

> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - thead,th1520-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-dwmac
> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: AXI clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: axi

Isn't basically axi clock a pclk? You should rather use the names from
snps,dwmac

> +
> +  thead,gmacapb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - thead,gmacapb

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
