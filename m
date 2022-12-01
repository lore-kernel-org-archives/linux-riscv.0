Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C053C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y4hDt1eiE/wO5XSJwGufzDm7G9LrrTvfJQrdVemxfI=; b=LULBWIkfjBCzdu
	88f+l2Qv0GUeL8WOOh63vHt3DY1SUBkUAI9Tr9YGJ7F7broxYxbEN9iVRGSjs3gsk3t4fVtYHSEWe
	uaEM1NNQKU4idEWD8tMCV4Ve0764u2/Y6mGz/Wdmu0gdvjm2gxpVwBl/nOiwYdoZYh57iAknexOxD
	29dOFjcAL1xKML0Njo7OsyHXC2n91g7mTaAupY6NVl3zHEhvn7AP13FviArrONi3JQwe9LVkOkjtg
	vZIDJiCAGQdI+7Ipkyfl3Ij2PT1dd2xS54Kv95hNua4sSNfbOLAqwMK586RI6o+kx74ti6lw2MGjZ
	DlOxDbmi2TQiGkifNcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hKg-006uEx-UB; Thu, 01 Dec 2022 11:02:22 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hKd-006uD2-Qj
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:02:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id l8so1425051ljh.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWN6d6ee3y7/gjA+RJaHwoAowMMQDgGlpGi4abXfpxU=;
        b=QHFcARpSCZeUlqpgZgIeJB5KzhvZ8mnlgrz6maNkmtHJup7gSx3/GtBWGeriFWj/5t
         5XHsCymS45E+Zl/W2hNAFoZ2YLEcgZVXQTIKKJdRprABj+ODZuac7fWd+tVQNcIzy/le
         f9Jm1F3ApVr2Z8OH24Z/2/r/opM7g4rlOvFY0lwkwzxn5oIyT1vnJVbLK8fVN4K5Z4Wr
         qPF5T3orMBvs6M0B/VDSFzz6rI4aahXbN08pn6GB0ZRm3P5Z8iEH42svHTjTlrvxth74
         BJaOuUl/OGRDD8U9DHQ4Wi1sLsxYCMEAwOigFUng1ELR76awP/ehWOjEuWwpiP+XthAd
         mhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWN6d6ee3y7/gjA+RJaHwoAowMMQDgGlpGi4abXfpxU=;
        b=CGJjQBNpiPcH5k5i37MEC/w8si7dlgKRSPrPv57wHy1rW9ZS0RuB77N39bqJ4S0jzm
         jQTjY9dZI8NFFk4GgNJ/JzCZAM7ap7COxx245SZArgk7iAaGNXmro9uc2ByvC+gsIJhH
         dAAiTCmVN9G2XzGXiuZOZef83zo4YqAKcB5BJYXGF8OtL8FLKztt/1+jxHvg3QFDAjZP
         acSnKmNtScBhgf8gOOCdyEep9uN+UQAyg05wVUIwQOtdoRhyVeXNqYMSUi1kCmlBoCDb
         2TIYlBIVkmfRhIPUYhkU/Ol18fuWcXtFH4bGURaNlDWgODz8kADY+M76vRmIDxyB85cC
         8ovg==
X-Gm-Message-State: ANoB5pnaFZYyzlqBWWMuq0jTpGziytgs/Y4hQfwGaQU/Rbsbp7wafuJb
	1fAbLv++fFyen6/lAn5y53zcZQ==
X-Google-Smtp-Source: AA0mqf5O6CJ+qn9YMzGPkZe6b8n6HzYvx5cIKBxDov12bCrrfFFonZ0myxPBBsvAVAmhoKC3veX63w==
X-Received: by 2002:a2e:9b17:0:b0:279:cd10:a511 with SMTP id u23-20020a2e9b17000000b00279cd10a511mr1599538lji.502.1669892523528;
        Thu, 01 Dec 2022 03:02:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g3-20020ac25383000000b00492dba3c85asm606438lfh.220.2022.12.01.03.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:02:02 -0800 (PST)
Message-ID: <fb13f339-79c5-96a1-ba4d-bf09da0b6ebd@linaro.org>
Date: Thu, 1 Dec 2022 12:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/9] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127132448.4034-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_030219_897989_5ADA35AF 
X-CRM114-Status: GOOD (  13.75  )
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

On 27/11/2022 14:24, Jisheng Zhang wrote:
> Add bindings doc for Bouffalolab UART Driver
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/serial/bouffalolab,uart.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> new file mode 100644
> index 000000000000..a8293444ca31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml

Name the file matching compatible, so bouffalolab,bl808-uart.yaml

> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> +    const: bouffalolab,bl808-uart

Rob's comments from v1 are applicable. Either fix or respond to them.

> +
> +  reg:
> +    maxItems: 1
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
