Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06692C48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RwNO8hBUAzC+CVYpT1uCtjwhAwAy0WiCKm2Od1xzn8=; b=V+HtkX5FxxNx4X
	342Uc44Le9qIeqpNT7d/Q7l1vLcv6wnoXTn6/w1sXltlSQsWKC76H7/NHquiDZxcYJ+xcQHRO3yeM
	01w2OFoFba/ob56a0fbYVuwgdVQoMwtIYv9vFJ1Zhk4pb0pRz4OUqAZ3hnOnKQya0E+dSB36f0XeA
	Yqd0RydtXR/MuU3FqnaWy4Damu5JjPal5Y5mcgBDztVs/UTq2ewqroGivrtVj2D8aKu9/veg2nBh/
	BurWTzzr7hc8oQRxUR2xM/3hC7YneCjsWOGVYE5yVjUHHE2QPRAjXJ/vCnuSVm1nxlBRQKXFQ0hWb
	HOI2FKtM3wOEW9CucAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHmb-00000005LNK-2tPg;
	Sat, 17 Feb 2024 10:18:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbGkI-000000055Bk-2dps
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 09:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ljoOrlx2Axwigx70XpcEQ7WijCpxq6Ld3/uWv+eU/ig=; b=fEoNH7M82peJhklhFjFWeEcaau
	cctP6+t6+3HTwaGSDdfnltJQXMa72/QuBApEe7djbAqDrNmSOvSjtI7YVrEKdIdpLM2rQGeOTtKdE
	VBILPKAjElmndge6tL/hfAmDq4U6gDcHKN9qz+y3FB9WD+C8rH+dfm7m/V7LzEIJl/t2+tUSgAnao
	M/UR1pd1ERzvjIDmayRRBdwKwybJOy0d2czvbcFXZ7P1Tw0xF0Y7aBz9lp5KLweOpDbe0FFqgNh9Q
	Sg5L1EoqOkwcicqk0OK0qBjHG/+bVe8VVzdkqxSxS1U2qXrMn7jI3Zr+4KUlLxokBSYb2ntsZkrYo
	2pWqOpkw==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbGk9-00000000HWF-11FH
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 09:12:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso3017338a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708161139; x=1708765939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljoOrlx2Axwigx70XpcEQ7WijCpxq6Ld3/uWv+eU/ig=;
        b=lhImgLnLRetlkYjxPLjWtbRv+UFibfo4dvv45srxMPcwjA270mg2kyqEjy73gNp75P
         0ZO5mPX/vu6ajANsjrLifg6nmEbE3gty/weq6xqJIIJHW0CgUpztuzcwxEwF7FJh0eKc
         aFnaOxgqTYoRqKxKoIWuN2Q4ewXsknl65UqZnfg0CJYc77e24Q1UKyQBqp1p2TMnHD1e
         W/p+PH/GiXuwMIrFV2H5dTigVhCkvB+RpvRgy5OdxaMYD7W197IzbfAOqC/1z0jkrINP
         lhhUxx4Q/9ohbRR+F0h2XaNFnPkqiWjCW6YyAOpdqxN+0D4SK23upsBd/Jb0Hbjk6D0j
         pKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708161139; x=1708765939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljoOrlx2Axwigx70XpcEQ7WijCpxq6Ld3/uWv+eU/ig=;
        b=e6ZIm05SjPjkM8ME1sMA1OpzDdQtPE3FtjOu61vV8JD+WlBF2+nEDKIxsirUkJPFHM
         TcYydh/r34AjXGOg/Wu8tkpmCubRs6SXF/UkTxqXuylz2cnZsWa+5rHhty8SEjgj0ucv
         sHth1nIxBiSEZHnf9bJH/vnPLuUM1lF8GDSxxnAFwTrybOoGcaHonsxvyZjIXIJiWTKM
         seNNDcjVzAQDy5hpg/IT6CxzAIwd/Y09kllf2mY1VHIoiXKSIeocklOYTSqE+hFSgU5Z
         HkobWW6Yvi+I3tDO62TzMmmJ8IXofxPbC53uIFm8pG52/N1Rzi5pyw8QVlpik46IgHrf
         5UVw==
X-Forwarded-Encrypted: i=1; AJvYcCXk4PuH5IjTgKm18aEfAWvCkQNs43RQAyiwJNpmzQ/tM7AqiNECU6QWCLJf8ku4YBpmpE1yUu0GG+sDrHl+9ftkHX7Bnus4j5Ie94rRWE7B
X-Gm-Message-State: AOJu0YzSMmCeu9EAL81YtCA7OPmaMOiel4t2CTq2rUTqxYFNEVfNXEvu
	o2tA4uPstDugPwLo3bjf7mqP9swRtSS707SWLwJdISwykNuI8aXcvScrzEHVMec=
X-Google-Smtp-Source: AGHT+IHaLoCjZL3dRqQt6XJR76FH4PWvXe4HLjWNYPGsJs456rnObKvnZQACffInIPZTYRvIYCjAvg==
X-Received: by 2002:aa7:c646:0:b0:563:f889:24bd with SMTP id z6-20020aa7c646000000b00563f88924bdmr2280506edr.8.1708161139557;
        Sat, 17 Feb 2024 01:12:19 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id fd11-20020a056402388b00b0056104738371sm735066edb.65.2024.02.17.01.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 01:12:19 -0800 (PST)
Message-ID: <7d7fc53f-1b5d-4f1f-a53f-f0863a79a79c@linaro.org>
Date: Sat, 17 Feb 2024 10:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] dt-bindings: cache: Add SiFive Private L2 Cache
 controller
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-6-samuel.holland@sifive.com>
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
In-Reply-To: <20240216000837.1868917-6-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_091222_261936_89F12945 
X-CRM114-Status: GOOD (  10.77  )
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

On 16/02/2024 01:08, Samuel Holland wrote:
> From: Eric Lin <eric.lin@sifive.com>
> 
> Add YAML DT binding documentation for the SiFive Private L2 Cache
> controller. Some functionality and the corresponding register bits were
> removed in the sifive,pl2cache1 version of the hardware, which creates
> the unusual situation where the newer hardware's compatible string is
> the fallback for the older one.
> 
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v1:
>  - Add back select: clause to binding
>  - Make sifive,pl2cache1 the fallback for sifive,pl2cache0
>  - Fix the order of the reg property declaration
>  - Document the sifive,perfmon-counters property

This is no v1. Please implement entire feedback from previous v2, v3 or
whatever it was and reference old posting or continue the numbering.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
