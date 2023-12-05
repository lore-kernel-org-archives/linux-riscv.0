Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C543CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0imYlkVDUf9XIrRcQgtVV4nRdqvVk1Tb+nLG/hIIT/k=; b=k9kju0KJ7+VOgq
	JNmchBoBCg82QZgUzrrF1AKVRQw9gUihACbL8AhUA5nHi44/uWTerThJ+IchIWL4ijHg065I84b3n
	MGJgqCbnKg9/P4m5R1WmL5vtEtPdOwtQBWqPCgHZfOThISL005Jz6kwokJsobOcQuMHeeBIz341fj
	a0UhEGDMgRoUbfgBRKElJ1UIg8QngFaTGBqov+Dlc8CxkWnLF3n7VOvK1FKhmFNGUruSiSXKNVrO0
	bokERDNzODelfaJjXnqUXU7fHidCEGoFVcpjcF7gCa9tevDOnCk6KTL5TDCSlhQlgszhI9omQ2S2O
	bdFXqzM7sJuMUCGW0fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAPLM-006RZ9-2q;
	Tue, 05 Dec 2023 06:55:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAPLK-006RYR-2v
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 06:55:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so31067715e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 22:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701759339; x=1702364139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZC+pqbiszrUBoshJFbD4jXG8ybaewehB/NwEnHJlydc=;
        b=LiXY2x2M/P98xozGTxlXh/rqXR+iEfviClX6Hhtv7xAA7Tt/hdplC+XbFtw5KWqzXo
         B3sHPQliHGLyRN2za0tbCRz/HMsJOVvdxlzoQDOZSnHN9mUJIeAzHN0P6wn7eiBYv78e
         pzlaTxGX+PqwatVaJOsFSVyBH0xyu7twI+NuBTyb2VWQgvGxLv9MllIOoavncMC/Ye2U
         /q4Eidpju+vdutbYg+rtGlgU9LtiQLku8iYXyhAcwhxb1Pxqv3t0FDrQPi9VIgNb/kG1
         /smAMqGRDVgYelH8h1fCtwvs/18KmqBrrnblLLTz0ZJsq3x0j0VqA7KRXT6WHlup/Khr
         /7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701759339; x=1702364139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC+pqbiszrUBoshJFbD4jXG8ybaewehB/NwEnHJlydc=;
        b=FabLCWrEUBSfXk7/rZ3oAXFz/siBThJuDHrlWO8hJujf8WO+VOBLAruku9Pu8l/vpP
         YubUz8vIUfFrnO/JholOjfPXQ6FIKJeMZmrTKNWfLEje+dGXo0OYCjNkiufy34mADOdJ
         5kgoGVP6fkyHTCN5cQ5x/tEGTpQb6yC6EVqp6U+Yi/fWVxHv+/7drVRMAoefCL/tV/2k
         u4pVW2HCz+P+iReRFxNyX0cBpUgU7Vd70Yiz/OViiwb1A5nbcsgh/tjY0WkOFdJzoAVq
         sxLD6zwlk7pfY9yzaPvJ1EE8M7gXN2LiK97i5F8drRn6vi6oKB+aG46T6HsjvhYHA9ju
         133g==
X-Gm-Message-State: AOJu0Yz3KD9hRsEPYJRlQNwAGYx9WR+cJQxFIoQN1HcG9+6H3ovv1MuW
	bePRYg5WSevAfWrbj8bJmbqRJQ==
X-Google-Smtp-Source: AGHT+IFwNfght72GXJ2ftnC1RmH4rxhWLWvoFra7uBhEvmy2MXjAIz5hmBqv6DraN4Vg4yEcQ2uErg==
X-Received: by 2002:a05:600c:468b:b0:40b:5e59:f727 with SMTP id p11-20020a05600c468b00b0040b5e59f727mr1538960wmo.153.1701759338958;
        Mon, 04 Dec 2023 22:55:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600010cc00b0033340aa3de2sm6751763wrx.14.2023.12.04.22.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 22:55:38 -0800 (PST)
Message-ID: <cf5e4cc0-f011-4915-b551-853cc9646ac7@linaro.org>
Date: Tue, 5 Dec 2023 07:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 0/6] DRM driver for verisilicon
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 xingyu.wu@starfivetech.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, p.zabel@pengutronix.de, shengyang.chen@starfivetech.com,
 jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com,
 maarten.lankhorst@linux.intel.com, suijingfeng@loongson.cn
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_225542_970189_2C03278E 
X-CRM114-Status: GOOD (  10.02  )
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

On 04/12/2023 13:33, Keith Zhao wrote:
> This patch is a drm driver for Starfive Soc JH7110,
> I am sending Drm driver part and HDMI driver part.
> 
> We used GEM framework for buffer management,
> and for buffer allocation,we use DMA APIs.
> 
> the Starfive HDMI servers as interface between a LCD Controller 
> and a HDMI bus. 
> A HDMI TX consists of one HDMI transmitter controller 
> and one HDMI transmitter PHY.
> (Sound support is not include in this patch)
> 
> This patchset should be applied on next branch.

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch` helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
