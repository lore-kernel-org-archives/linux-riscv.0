Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01AC43219
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wf38gameqtWEgJeI9ZTCmJFcHQem+sFuuRGjicAWC8o=; b=xnzk+Uknn8IlXz
	fnB9vB5poyw6T82KQIGW2mcL1XQvOaQ3/KtLKfuFvOxC2y5phRLCY/ofvfSNa1lrMuHEig2a+zRsR
	IA+kenpPAUvNjN9tvFCetpSUq02G0XjigkHkZN8c2YdFdKUs4pP7NzhwxMBdSO56mu3tIxjz3oj/I
	sPEtBQc/KMByjIXRmrnza5yQnBLDCuEwZREv6o/Kw5MuFgN2eZrl6uEDHUOZ0dwb/Hsk3SRR23fez
	MyDzM9rNnrQM12KCOtQOgRE8t6zF8qnVfIXRuAJEooa8cavfROWN3S12Do8uVg0lvnEQKpvoSVCrr
	ymMfCVs4+YAJm/I5jJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3nk-00C9gm-Hy; Mon, 21 Nov 2022 10:13:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3ng-00C9bc-Sx
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:13:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id p8so18055287lfu.11
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXyKt1cDFcpIxmOysUOnFCPepALLvuM42ETXUOVNOr4=;
        b=MxP3yBFhLd4mDOhZZsPx3S3EpQtQfXB9MiFkvlbv+DIRRHa7Q4lW3fAgP88ylNVIG9
         c6acVC3iQDXaS+T2TkU9OI6XCXTPOC4DLEPb5JdJgiitQizUOUO3Y5jtoMgNSpfOf2XG
         emVJQ/5oQw2jqdECpkaFXvc14fEdf4+jPaU146wqe/IjyI9JsZTm9iRvXsSMIinTnDDs
         iLXaiwIQSlvCOehB5QhaiG4JEBJGlIiFB3qEUF8EMa86FL0YfD68a6Qv8KxufYvFFidG
         jJAg/sqZ6iZkRTbLHu+FnI+VLYU0gaQwjxKh0caElYuNkA5umBz55nQqC05A68xMgoNA
         dW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXyKt1cDFcpIxmOysUOnFCPepALLvuM42ETXUOVNOr4=;
        b=qkjJCcu95zC2gGALGW0K0lUWP/1fKlBn1PetQxrIxG2JvYtpeqnkH0ePK25sSf1nrd
         Sxnj9NNJ1I5N0QrTy6RNT8CihxdRTWyw5SLoD4OXFz1YLvA151GkJY0nzJXlhPoXp1wj
         X9/nxc3nD2sz8bk/8Yq9hcwoFywDqp7Uvx5EgssOLvs21F7HsVjqnNJAmHp729dxtDpU
         KkiT2Y0HK00j1TbaYBR4ICEkEKEZ8QP1j/AE6pxnBPpWweKmiC51jsMHFGGeU1plQPUV
         qRC1VUfUAJazwMf5LPszQ2n/Eyd+w/Kos8k4IHEEkCnh+UqnLkKSyvOs70lm63IIGyEI
         onyQ==
X-Gm-Message-State: ANoB5pmsxZsBIPsLAooM+RLKRPii6C3KVsERem3xJ/xwcAORC/piAsZ9
	rpOME51592jNp8Svxn4l89OF6Q==
X-Google-Smtp-Source: AA0mqf74j2xf/DYcqvDoHVEVApFcyXDBUs4OT8J1RRHrj6hCQmlzFxEr41QeBt/yTXchv6RbIxcHwQ==
X-Received: by 2002:a05:6512:3483:b0:4a2:8836:c07d with SMTP id v3-20020a056512348300b004a28836c07dmr5412482lfr.661.1669025595298;
        Mon, 21 Nov 2022 02:13:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651210c800b0048a982ad0a8sm1957503lfg.23.2022.11.21.02.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:13:14 -0800 (PST)
Message-ID: <99302e53-c0c9-cfe8-4e6a-c70e8428d9c3@linaro.org>
Date: Mon, 21 Nov 2022 11:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/4] dt-bindings: power: Add starfive,jh71xx-power
 bindings
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-3-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118133216.17037-3-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021316_995709_73AE2E5B 
X-CRM114-Status: GOOD (  13.58  )
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

On 18/11/2022 14:32, Walker Chen wrote:
> Add bindings for the power domain controller on the StarFive JH71XX SoC.
> 

Subject: drop second, redundant "bindings".

> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh71xx-power.yaml | 46 +++++++++++++++++++

1st patch should be squashed here. Headers are part of bindings file.

>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> new file mode 100644
> index 000000000000..2537303b4829
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml

Filename like compatible.

> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/starfive,jh71xx-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH71xx Power Domains Controller
> +
> +maintainers:
> +  - Walker Chen <walker.chen@starfivetech.com>
> +
> +description: |
> +  StarFive JH71xx SoCs include support for multiple power domains which can be
> +  powered on/off by software based on different application scenes to save power.
> +
> +properties:
> +  compatible:
> +    items:

No items. You have just one item,

> +      - enum:
> +          - starfive,jh7110-pmu
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
