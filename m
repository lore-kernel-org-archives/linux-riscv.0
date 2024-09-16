Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB36C3ABD2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p9+a/MF8kZgDkJGBHMhYdjS0dVhymf6TSonlb7zZTM=; b=PhMS9m1FeUqjgJ
	xc79VO9ChyObHhvH7NdDubplmAyMqh4HjbboPMZNJm/zeUiwzQCeAOYoL5XBmct2F+NA/LLks9VsX
	eWjs4LiZy+laPIMsUpdOqO+wZhYPz5XGDcsZo9iFjL/QephN1WfhQzb1Hcm9jyZFJ5ISzxAUgZW06
	l56uHhhonE11nuSxfbHU1l0q/4V1HTL0Teyta5jCTTeVVcGpY4IocWo1RgZYInmC1du2S4G6R2SzZ
	dZLNRHuExbnYI/HIOiwnr8OQh8u9WJktVU19bOj/jTt7abuTi/XwDi26T1ThzGVPP8NWdsSVPZMNr
	M+OPl6KdN5+eawumcMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqE1f-00000004OCY-2Ypk;
	Mon, 16 Sep 2024 15:52:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqE1d-00000004OCB-2ZBs
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 15:52:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-378c2f1d0f2so247923f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726501948; x=1727106748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N8aHEEbX13A4PIQj2A95kRBvOppHaVkvAUdHxfVghGU=;
        b=SLOjPiTRcSdGzTJto6ODQAVyj2m+2LlQzB63l6t9rhhSTicz4/jSizfYSod2q1FthD
         7A3ZWqwQa3AU/EKNXqeidmK3yiJs7nGnezbwFOreUqkojPk1h606gBua19ul1cmtqf9V
         hUq0iqOTeF1UW1DoE0ZOC05VtShfAZpiVox5r4LkXYXEOthKnIefgJcPBP7ub8O/HqHA
         v5ruf15FuphXrqefRUJMktICFIdaXkdrRnjV/AZQcA9CG+p4+Y8YCIeeTqwOnNW1noHR
         prbb8eaKH2AKYRYwc7nYizcyDl3ppQUGLs77hnIRWv+/AdLMp/LgTNLIa71zwIL8+Prv
         rthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726501948; x=1727106748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8aHEEbX13A4PIQj2A95kRBvOppHaVkvAUdHxfVghGU=;
        b=ASW7up9QFOp2PHRCqbc2qB1eISFYJ8gDnq5Ss15QEseJDJtaKIoFQtsjaR69lGASg4
         J50PttueSnaUQF6Kxt/0GT8Dj8nk5Yh/MkPsdjsIdHeJF77X2nWMFFAxSr36jWzOE/Rd
         cbBg3kFb4VzNqJhN0HtGDRyUfUEG32UXPqgt8a+xml5dTCEvEfA7tHVQV0tT0A9/XGsi
         SdZvhHpKctdsFk5r10pgars8YLz0R6/AGtl/Aj5ud4mp1EC3Cz0WHlxgC5Gjoa9addwF
         5OIrSvQhjb5iJBrjqojdmbl477xks7hHf6T9mswX/xa53jc1Z9pIw0huWQnPz4mOjAwT
         bYnw==
X-Forwarded-Encrypted: i=1; AJvYcCXprVP28BkWGp8qKA/VdbLMJC1iw8viCU6yZB5uaw8PQEFj5xTVIgO+sPMatjTFlXXxQLB6YKxhQkt7bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySi/zptaJy2wG4XyDLnEEp6GJEfr5ytH8nO7BMpk+LlW/QKb/H
	br9BRnSPN6Ew812AZb7A+FlBAny17g+nlhnv2R9jJyHW3x55eLuKmUC3mgGwQKk=
X-Google-Smtp-Source: AGHT+IFXKeWX8H92ZUOExoo7GiM0cHbGXQLb4DOto6YZsFYJuXY0eIDw9GJAYpn4oZFS8AcvVCCL6w==
X-Received: by 2002:a5d:64ae:0:b0:374:ca15:e7b1 with SMTP id ffacd0b85a97d-378c2d4e3a0mr5218996f8f.10.1726501947597;
        Mon, 16 Sep 2024 08:52:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb532a8sm2767254a12.28.2024.09.16.08.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 08:52:27 -0700 (PDT)
Message-ID: <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
Date: Mon, 16 Sep 2024 17:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
To: Ze Huang <18771902331@163.com>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240916064706.318793-2-18771902331@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_085229_695060_443A9FE6 
X-CRM114-Status: GOOD (  13.51  )
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

On 16/09/2024 08:47, Ze Huang wrote:
> Add pinctrl device, containing default config for uart, pwm, iis, iic and
> mmc.
> 
> Signed-off-by: Ze Huang <18771902331@163.com>
> ---
>  arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
>  arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
>  arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
>  3 files changed, 336 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
> 
> diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> new file mode 100644
> index 000000000000..0737f50d2868
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
> + */
> +#include "k230-pinctrl.h"
> +
> +/ {
> +	soc {
> +		pinctrl: pinctrl@91105000 {

That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
that's preferred coding style in RISC-V or Canaan?

> +			compatible = "canaan,k230-pinctrl";
> +			reg = <0x0 0x91105000 0x0 0x100>;
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
