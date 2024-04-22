Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4FFC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 04:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyvEf9eQv/7XtmFbIUlGqMh9g7kL54R3fbGidKgzX/0=; b=gVtqfvI00Tjaap
	FwnxqXtDyiLimJIw1Jp8xI/U3T30/zSxOgjtq5zID4xv4v3PLpX7FQ6VZ7f+/GKtW+GDTgFzlg/Kb
	UY/A3apzUmQy4uVLk1WPpLckBR5e/tZzQNTZ9ARwS00PkMGp0hOs8PNSRBbTrG7e2stE5SeDkMrKG
	bg+sO8+ewRgTH6rJZXIP3PR/iTpZAbaM8Qjdt4SngHcsDRx6DtivjSDyhLsjh6PbQ7BshqP6dPm5N
	0x37k3uaISH3iuyRzRM8vBYo4KWVR//Ku9tp6MKd7G3w7mJa9CwiFltlFf+/eMvXFxdUdLxTQmNcq
	JYnoJUWWDRcmEYEV8d9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylE7-0000000ByaJ-0AYk;
	Mon, 22 Apr 2024 04:24:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylE3-0000000ByZm-2uJW
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 04:24:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-343c7fae6e4so3574709f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713759858; x=1714364658; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fSaSGiGvfjC+mZWTNxqkMqV3neG4fZMVdkdPk+gn2dY=;
        b=EdcPfOBahorUReEtChiEw222LqNXVxcsBRBe/WOMaLU8NsQLimk8QaaGo2dfY8+eOO
         ulooQe+iMVhe3RCpTjVddtjfDMoCONDdQQtIqEcqmvc4L9egplSYF7/Vq244n2gyIfv8
         O1gz5pkfG7Vh+mKERkBFETIPVNHnqRIUoH6jNuxIfWsH+olR1E+0lFaX4ZCeISgbEATm
         cNWOWLakr4DNa1JybtqAcotHSgGdxuF4oC6zEj4iEQ7BB4+FbEj/HtJf8od23XfAGdDe
         0c+vjODY5TiGLGYbUIBsAxMZVxfiDAO2B9iVw5pL1uEREYBxwtiisk3ap/JyQNukF0B9
         4v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713759858; x=1714364658;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSaSGiGvfjC+mZWTNxqkMqV3neG4fZMVdkdPk+gn2dY=;
        b=myahEq1FIKRgIDrcII2m3BLI4986Oi9EQA0tBnF654exNFWsiGZqK1zcPbx68JTb6i
         kw/v6IzzHszxLcXNHcCVsG8aAsJes2AAQlEAtauF+9gkjlT5eFC1pHmg3J60IJUMsRKr
         igawx/vrCFKdEba+Z1OM0gFFBs1pE6zid45F5mV+qRa/oU+m9+b3pEoJr6SO4Z4+aEEM
         yrUCgmWcOFs9LohwxpREXIeGDseBP7k8F5SsoEg+H8aXcNhs3zzhrnwFkTkI5J3VKFYY
         mOAtbfkQRDIyVlpxYUaIoFEhWqrHpghqnKEJ0pJIQ8/jze70yylNbOO8N+K0jKlO/UHQ
         MbaA==
X-Gm-Message-State: AOJu0YxBlAfcqn0pPv8NSPTYUrv+GVOAq3FcOsqYOnWaYZrhFjLdqREX
	a7Lov925c1Kb2ieXt9WODnuBdyQGsjgYoUOnRLlieeTz9fvDXymzjCB299KcsQU=
X-Google-Smtp-Source: AGHT+IGv2OFu0AoXFD5onc3TVvcVrO0/Q/OpR1hRZGiXrFpLKSawnw0+FOej9cwEjlmRuoKgztS02A==
X-Received: by 2002:a05:6000:4008:b0:34b:88f:a62f with SMTP id cp8-20020a056000400800b0034b088fa62fmr1361928wrb.10.1713759857274;
        Sun, 21 Apr 2024 21:24:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b0041892857924sm15225398wmo.36.2024.04.21.21.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 21:24:16 -0700 (PDT)
Message-ID: <71f2e031-41b0-4a47-9bdd-e8fb6334da5d@linaro.org>
Date: Mon, 22 Apr 2024 06:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: riscv: add Milk-V Duo S board
 compatibles
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
 <20240421055710.143617-2-michael.opdenacker@bootlin.com>
 <c30cc11a-209a-4919-a382-7588daff0d71@linaro.org>
 <b1f59075-f2b0-4f2c-aea3-bc596ac45f1c@bootlin.com>
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
In-Reply-To: <b1f59075-f2b0-4f2c-aea3-bc596ac45f1c@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_212419_900078_FB359E77 
X-CRM114-Status: GOOD (  12.26  )
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

On 21/04/2024 20:55, Michael Opdenacker wrote:
> Hi Krzysztof
> 
> On 4/21/24 at 16:12, Krzysztof Kozlowski wrote:
>> On 21/04/2024 07:57, michael.opdenacker@bootlin.com wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Document the compatible strings for the Milk-V Duo S board[1] which uses
>>> the SOPHGO SG2000 SoC, compatible with the CV1812H SoC[2].
>>>
>>> Link: https://milkv.io/duo-s [1]
>>> Link: https://en.sophgo.com/product/introduce/cv181xH.html [2]
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>> Where is the changelog? It's v6!
> 
> Oops, it was in my cover letter 
> (https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/T/#t), 
> which you didn't get because of get-maintainer.pl. As the recipients are 
> patch dependent, am I supposed to describe the changes in all patches 
> and not only in the cover letter?

If you do not send the changelog to everyone, then yes, please describe
respective changes in each patch.

It's your choice, but if you decide not to send cover letter to some
folks, then *it does not exist* for such folks.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
