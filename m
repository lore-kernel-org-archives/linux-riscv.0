Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9CDC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hY94VKMC/t1I+uJo9frMXqyatgrtmgV5t1AKZZlRdIg=; b=ATSEucBfcYId+C
	ZOT8gC44Ueljzj584wFjt2Bwuuy1rT5Ynm9GaxOwFqt57hyOi0rRHpim+mC+wdQQGzkW2oycG9ZIL
	30QqvIvEZ1I9BL1Jfa8XcIxbCppmCtbsWu9PtJRSbhY+m0XYE1v8kL4Y+91brzNiWzT3Hl7T0hTCw
	7i/onM0X/qLnwMtwGV5gYl/cT3lO8kTLmj+Uqu+Fk0VHkfQOTZjfuJF3Mw1vRK1AANhw8ZdzhzEtE
	U1q0L+jUjDJIeEmo3+zEBXgJKMktiBcWtXH8cF6IUtt8XpyqRtPvqEqfmoKlBxYn47xk6YSFlyC5i
	Su9e2rv8ji6Xehb3xBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1KLO-00000001dQZ-0lJH;
	Mon, 29 Apr 2024 06:18:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1KLJ-00000001dQ4-2LQp
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 06:18:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so4159017a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Apr 2024 23:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714371503; x=1714976303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6OSHcF0DscCNaMApD/9fxDqjNfdtcu5lM0oMff7W5GE=;
        b=bb77jNzM+A+iriuTzVDSQzfpR+4leJq2DyR9yXIrCDHjd1lazFPVcFvz6WzLjnwlcQ
         k6dRrjbz6j2sPX3Xf1as2m1cYHqb2bk0AtllOiJmEcWI6/hA08gU/dS3agX2GWBy+eD6
         H/43uhgPSopH+dLlP6PhJCn+poyXE11HZH2VyGNJ54dIj9/2uv8VeMJL9Fc5EsRzT6Vw
         OoRQwbyi3kUzw8+fvdprHj9+Lr4vR0DiBYdsebbxSazN4+h7mRaEgjLnWxmrFyhDHSYj
         PHLmjHCHQix4ML6R0OH9hQ5XfSI+dP34U7YBPkNpE2s7WUfTUOPXcOTgGZ3Czrkzn1VI
         XJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714371503; x=1714976303;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OSHcF0DscCNaMApD/9fxDqjNfdtcu5lM0oMff7W5GE=;
        b=UaRZIQPv+iK9VWY6XbjHwRzjfazGu+5Q5vu1L7a9rrzKdSswmBCzFfPNfeVp5a8CEZ
         jayAHH9oAWN3783qclmHO9cjyJ35GxGq7saVr2RfGCg0sZ7Hn0WHbRUVND0zL5TXe0FI
         EaWEw9gF0WF+JVDU5N0QUGI1TbvFpZf6iDKVqkhDLaHdj9PndL2Ape7KQF9AeVSQBueU
         6dx3SNEsINCgfoXjgcUEXbRcU00f4lAT7XjhkmydnLVxiQkUxZSO8NrXFP9wLiilhP3b
         yNYsvbkBS0WAM2lNSYWZME/2s+17Sgi8rZ9edh0/dkRgs2nzQa6G8MoRk1n6qLwYtu/m
         euoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvb1O+FCqtKrTokYPTfPzvsoxb3MKk3bUPUeaq6yNhqhJrYE6NbvmPjAscsQHebUK1FofZpIVA6jpXE28hjQ+D/vcuNGbjb0l64qU5ZWj5
X-Gm-Message-State: AOJu0Yw58Gea9rWSagStoIuA3nYPvJRzKuu/K6KCJH16PAQyVMQTf+N5
	GFggQrYz8ZCCkkaT2XqEEetfDYrsj1zLfEeD6BqBjsUKD+EaMmF9uA5od85Qd6s=
X-Google-Smtp-Source: AGHT+IGLANFVWHe8EE4z58eE9oJz2BA/NXRAYwi2DipvCTG9A2of1v4DQtCQq4Cg4tJvCclMirW1Wg==
X-Received: by 2002:a17:906:40d4:b0:a58:873e:a058 with SMTP id a20-20020a17090640d400b00a58873ea058mr6256671ejk.27.1714371503543;
        Sun, 28 Apr 2024 23:18:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p2-20020a170906614200b00a588e0e0d9bsm6234685ejl.93.2024.04.28.23.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 23:18:23 -0700 (PDT)
Message-ID: <40eee0ca-fb15-40c7-80be-a1198f37663d@linaro.org>
Date: Mon, 29 Apr 2024 08:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, broonie@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: dlan@gentoo.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
 <20240427075426.662671-2-qiujingbao.dlmu@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240427075426.662671-2-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_231825_639072_57F183F2 
X-CRM114-Status: GOOD (  11.88  )
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

On 27/04/2024 09:54, Jingbao Qiu wrote:
> Add YAML bindings for cv1800 spi nor controller.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  .../bindings/spi/sophgo,spi-cv1800-nor.yaml   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml b/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml
> new file mode 100644
> index 000000000000..121a80fbf2d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml

Filename like compatible.


> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/sophgo,spi-cv1800-nor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI controller for Sophgo RISC-V SoCs
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-nor

A bit unusual that compatible has nothing in common with tile of the
binding, thus the name of the hardware block.

> +
> +  reg:
> +    maxItems: 1

No clocks? No interrupts? This looks incomplete.

> +
> +required:
> +  - compatible
> +  - reg


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
