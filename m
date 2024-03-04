Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E9C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbqBZXRkFNsmGts4gXXKwLVieLp0YYyAgmm5+0u+4ZQ=; b=QsAWemqbyC/GQ7
	ChUcUXKvwz/mih9fbzEjuTDeeS1AnSL7qMopHH7tAaalRgQh3urXapIYbaA5tP1mSCwG6qZUpSUzl
	y3vvvX7jvRzybcYEmHo3haHjMXCpmIXrj20GfQrzpvigCnkOJ4hUhh9jK5SAos8fJjeTVCfuaratu
	lsx0LCQP1y2c4q7zhk6wfkCi9hpJChajOGa/iwn0uTADkWs4eOYasV+ToPnLRqTJeA28MSBJZixan
	Q1FBWwp2tHI2omBhfz+d5Bju1YaoJ4yD+zoZvTuBRMX/srVF56/dRjqE6ysZrrNWoJKAdAjm3MDJ6
	zVOKRaG0TJJg+sM6p3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9pp-00000009T30-0WAK;
	Mon, 04 Mar 2024 15:02:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9ph-00000009T1z-0l98
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:02:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-51344bebe2fso1003639e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709564542; x=1710169342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8sztT78mA4ZXeKKIX005xkpR3DIfUvvOXL3CwBXH6s8=;
        b=ynKcYd5m83HmLustomX/6y8SeO3A4ODF6U2t9cXv1ALOh+KT0KIIfqmUXd6hxK9Bg/
         UeqFy5DIRVlFKCdahArJsSuqFNkNmC1zSQC079i8lHcUVQkvao/S+ko2gB82rWB/1EZJ
         Mpa7QfkNLfXvkmaociiWcuXERNgjsGqpKCBlSVIzrA0q4lpqRNWiB0LgszvZZIR/WRfX
         pC0jpheQUhs8YmKX4nRLAvWguif/CopoPHmnR4TLYbqliPoTlUCU0JMY8S/lbldyFnON
         Cxm7if8zSDQ92IsgctpdAYR+MWswuXFOowHrsvP9nzdldKc72zrTTO5UlynJpydUlGvy
         7SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709564542; x=1710169342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sztT78mA4ZXeKKIX005xkpR3DIfUvvOXL3CwBXH6s8=;
        b=DQzmGG64fgPECZODzfzAlKCBXwva6SkCZwu4R0yUmvnbJ3wFlYIvArFU9DQSVlASSL
         y6+sGnCB3chLuCvNoKvd2wzTv9c2uZqocCGDDJzVey96GZeGGAwpBizywc8cQC+kwOw8
         +5T0k/1IZQ/uHWN57CQq4diSyQqmggLzf0vVHrcxmyJJDf34Ap6tNRXXuC5FuQ/AhvmP
         nb7+OGQUsZuZnFjF8OXeDANGBS76cwNNcz9CCIYPTJH1OsRCR+KY5iUb45ibjzedp6C9
         jdQTPutEk6qosdLI5Fl7hw8smfQ3BqjgLwwEXIhhoRZdNY/PuHaVn3ouCQeiSvv5kJRg
         heVw==
X-Forwarded-Encrypted: i=1; AJvYcCXg9Oi3Hg+7Bx2+rXKWgcVX6vU4p2n1wxgqJ4wCypxCbxFWk46H6xU8twKEZMDAkcSL+LHcX4cruGcGQY2QSOXdvVmvdvQlrZN+UWYej7Pe
X-Gm-Message-State: AOJu0YwtjHVSd/cUYkB1ZXTiAUUNnohngFmqVrqTiWonPVxbHYs5DB3p
	ij7G5kXQuHvejND+7F0jlbtZ6xo7vKhWsHIPHnX5dLnzetPTDWXav23I+8iH14E=
X-Google-Smtp-Source: AGHT+IGGt0MhRhzMw9pd8Dit1e2bT2vtE1n0JuuHGL2iy2Qj/eb4ruaLOzIX4T/rTm1ryJNrqkcBAg==
X-Received: by 2002:a19:f603:0:b0:513:2137:a231 with SMTP id x3-20020a19f603000000b005132137a231mr5552748lfe.67.1709564542511;
        Mon, 04 Mar 2024 07:02:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id w11-20020a17090652cb00b00a44879da0f3sm3934073ejn.143.2024.03.04.07.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:02:21 -0800 (PST)
Message-ID: <0c957a95-9f82-41c2-8e2c-0b5bf4b061a4@linaro.org>
Date: Mon, 4 Mar 2024 16:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, inochiama@outlook.com
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
 <91f0a339-ac0e-49df-bd26-dbfe1485308f@linaro.org>
 <CAJRtX8TPz_jTvPmuBW8t=mC+BR1kWmu=GS9K1k6ys7U9u0ENFw@mail.gmail.com>
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
In-Reply-To: <CAJRtX8TPz_jTvPmuBW8t=mC+BR1kWmu=GS9K1k6ys7U9u0ENFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_070225_349814_19A4A0E0 
X-CRM114-Status: GOOD (  14.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQvMDMvMjAyNCAxNDo0MCwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gT24gTW9uLCBNYXIgNCwg
MjAyNCBhdCA2OjE14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAwNC8wMy8yMDI0IDEwOjAyLCBKaW5nYmFv
IFFpdSB3cm90ZToKPj4+IEltcGxlbWVudCB0aGUgUFdNIGRyaXZlciBmb3IgQ1YxODAwLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29t
Pgo+Pgo+PiAuLi4KPj4KPj4+ICsKPj4+ICsgICAgIHJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9y
ZXNldCgmcGRldi0+ZGV2LCBkZXZtX2Nsa19yYXRlX2V4Y2x1c2l2ZV9wdXQsCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+Y2xrKTsKPj4+ICsgICAgIGlmIChy
ZXQpIHsKPj4+ICsgICAgICAgICAgICAgY2xrX3JhdGVfZXhjbHVzaXZlX3B1dChwcml2LT5jbGsp
Owo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pgo+PiBQbGVhc2UgdGVzdCB0aGlzIHBh
dGggLSB5b3UgaGF2ZSBkb3VibGUgcHV0Lgo+Pgo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBs
eS4gWW91J3JlIHJpZ2h0LiBJZiB0aGUKPiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSAgZnVu
Y3Rpb24KPiBmYWlscyB0byBhZGQgYW4gYWN0aW9uLCBpdCB3aWxsIGNhbGwgdGhlIGFjdGlvbi4K
PiAKPiBCeSB0aGUgd2F5LCBpZiBJIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRjaCwgc2hvdWxkIEkg
d2FpdCBmb3IgdGhlCj4gbWFpbnRhaW5lciB0byByZXZpZXcgaXQsIG9yCj4gc2hvdWxkIEkgaW1t
ZWRpYXRlbHkgY29ycmVjdCB0aGlzIGVycm9yIGFuZCByZXNlbmQgaXQuCgpJIHJlY29tbWVuZCBv
bmUgcGF0Y2hzZXQgcGVyIGRheS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
