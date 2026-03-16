Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27D7F506D7
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHYeh464UHQgSm8E2sXr6Wpk3r3sg2iWXh5KPcnFWb4=; b=ykXIK2cE0pgo0XO2V5PqsWEqtT
	oolG5NPAyD1UCH0Ag39e2KlRPXonZpA7h+UzG1fRAv445cvlS9ffh/ZXB5SN8155cyskwbt43uV5h
	VpvsJ1tdZs4bWu5C41FxVqR3bZ6tl7h+gIKhqsfR+b9WaC9pPMHdOFaRCNzzgAW6HpvhS1g9kYIlb
	NzOjjLKvCGUAwZLeujNh//rccJCkwginauT/S7Zokk/5FwKYwX9LySIfSQgcTe5dd8IjpOh2MrGXv
	YTMgJ47+exVWIEfVxCXd6n0brZuKYU2EO37D1sSQDqyW3XMrGwaA6O7POh2ni8CDC2EGujTdk7ws/
	Ywn7tFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28hK-0000000499H-3gEl;
	Mon, 16 Mar 2026 14:13:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28hJ-00000004997-433j
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LQ0mg0iTQfY7doxy4pSiWFN/FrO9Rma90YeZ4+gFic8=; b=QOzNTQcRa1a2waI0ZXcINgIfux
	9NdqagFZFPZ30g4h1crSVgrQOiwVOawiV6XCL2xtt9X20iHHdCVWvIsWN8+EHa708auQ06kkJfRbh
	YvPKibsWDD+iOcITwk9Bb7sOk1BQQ56un9BHG/QKIkilf7zVzyzkxV3Ch7ybsTR3QBlcYzUj5QHgH
	J7g4YnwHVMI/QH15RxMpzHZGZrWVRlkUnkz6Abky4u9nI55hTKckn1EewU0MXLI7meXG//GeWA1iY
	QVozZF3GdEruAsS6Y6d34W8h3QZzCjmrRX4QXm/XXUeV2op/G6LJyaS4U7sfw1neOu1UEitiOGE+P
	2hWRwJ7A==;
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28hG-00000006v3A-1fUd
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:13:32 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1273349c56bso6681774c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773670408; x=1774275208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ0mg0iTQfY7doxy4pSiWFN/FrO9Rma90YeZ4+gFic8=;
        b=KsNFTYbxms9fu72EDYmZLanAHQdkAzNK97RIAosyptzHtGRNjA/ew7rgwLDfLhnF+0
         oyvgsFwaKeSB4hvYjHv7gQL0Vb0/49TKkm3rjXJiHbZupjP1lDfJ3hWcwrGbjxqhy8Nh
         SBHKq7t8otRLzXdeWnvN5dw9KvmL1S9GkkiAi4oC+dgOjT8edHWoiXw4uQo8MpG7ykOO
         5wYKmrv+cLNYsTMx11hcs08LMRQ316iPjEoRWtmpYDHC5rYqWrhtZrqNsrvXNwaO1BoO
         P4YNyFlTdGNWCr3fpzWlaiuAeJz/vv9z2a86N5rlJnQ7T+SmIKXxvLJFEsl2X0Rr6Q1v
         Ku7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670408; x=1774275208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ0mg0iTQfY7doxy4pSiWFN/FrO9Rma90YeZ4+gFic8=;
        b=UXb7T8QQbl41y+cQFFi0yN6gX9EDwKN3+CsdOjI40+v91iG+zpbwTs3I7JILgP1qMJ
         qlCXAcLQ0o90ch8yQ5Thiby4E6fkOzAyVhqKIK6u0LuLwdOJgGxXSjHzlEtN30y5rW1K
         /VoKbGbjWjWSdUhgkShmxAPQZjZnGHeVKLEyIYoGk8vxs15m9I/SXBe6L7gA9qAnHAoi
         FPEngMssznrTTgYTFBZIoFTppNCFsU0vTXLynSzcAIm9XZvmmZfx0PKSFLOwmIRIPcP+
         WblpIjCteE31wSdEX1J88jLtnsGAPuA9p9P7kHk2m49Ghxb0+9j2X77zc0G++GKZ7NgG
         wmkw==
X-Forwarded-Encrypted: i=1; AJvYcCUqmXsy//f8ROgJGTruzShKqjHc4b+7p/+hRr0/LjZbCTWYQI5RjPh22fDJQHUlCbHIw21VViHQoiLElg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh3iBe7IvFaCS13lAJJwA/gqEvF42GRVXSQeO8zbIJVx/yu1Um
	tcL7X9JSSpLxW3P8N5Gf1AEpYwinxaQysa+yMoeGdguRq4mu/sU3qb7G
X-Gm-Gg: ATEYQzxrk6o7bER5NLxpGMU88GGK30gV4Fk3IWMTbdacgloQ3lVp81KGJ70Jph2A0YI
	0TNisutTlNWyvmC0wBNDQC8IRVlP3vL2d3tNNs3BrNYLqkiwsKUKG4qMTXtpQrP+UY5CSOeHiBi
	40UOy8oiQ1KpKMAPzoVybOnYRE7+a4v+jktXya2PT6RG57nmCu1p/wiFzS1HOsMVgQtWFlcgJ9g
	uyZKZGanfE0dew5MgUIYqyqo7mHHyad2IvYGYgs1aGTlhHCMyi1e42swsO0oh1dZj9o7boagW2R
	aDjUS/R49yIzBErUbxeAF21prAJTjVNs5iuRNREWSuxeVI2T6Mvx368sEsm9AacooGJ5s4I0+jN
	PMkmVmzajpaveEKrAOq+dL0LM8CoAb9I9DGapiMZtgDt13RFl1u56s4ABBM3dZBmM6u7UkXFXZt
	dVp7HLlDKhuAyCo/dGLPa31q70bSzommPYMd43aqQcdJAlmYdYvFFxUPeBNq60NTeBt8nNf9g2
X-Received: by 2002:a05:7022:458c:b0:11b:9386:8265 with SMTP id a92af1059eb24-128f3e1d951mr6117870c88.42.1773670407752;
        Mon, 16 Mar 2026 07:13:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62991c7sm12119295c88.5.2026.03.16.07.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:13:26 -0700 (PDT)
Message-ID: <d8c3d6be-1c4a-449e-bf38-69e71f544513@roeck-us.net>
Date: Mon, 16 Mar 2026 07:13:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
To: Conor Dooley <conor@kernel.org>, Drew Fustini <fustini@kernel.org>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn> <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud> <abbTwrAALGy3QbxN@gen8>
 <20260316-handshake-subdivide-9de6c4410927@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260316-handshake-subdivide-9de6c4410927@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_141330_545737_18115FF9 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/16/26 04:09, Conor Dooley wrote:
> On Sun, Mar 15, 2026 at 08:44:02AM -0700, Drew Fustini wrote:
>> On Sun, Mar 15, 2026 at 12:12:13PM +0000, Conor Dooley wrote:
>>> On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
>>>> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
>>>>> The G and J coefficients provided by T-Head TH1520 manual (which calls
>>>>> them A and C coefficients and calls H coefficient in the binding as B)
>>>>> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
>>>>> respectively), however the binding currently only allows coefficients as
>>>>> precise as 100 milli-Celsius (1/10 degree Celsius).
>>>>>
>>>>> Change the multipleOf value of these two coefficients to 10 (in the unit
>>>>> of milli-Celsius) to satisfy the need of TH1520.
>>>>>
>>>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>>>> Reviewed-by: Drew Fustini <fustini@kernel.org>
>>>>> ---
>>>>> Changes in v3:
>>>>> - Added Drew's R-b.
>>>>> - Fixed some typos in the commit message and slightly reworded the
>>>>>    precision sentence.
>>>>>
>>>>>   Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>>>> index 56db2292f062d..7d57c2934a8a1 100644
>>>>> --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>>>> +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
>>>>> @@ -105,7 +105,7 @@ properties:
>>>>>         G coefficient for temperature equation.
>>>>>         Default for series 5 = 60000
>>>>>         Default for series 6 = 57400
>>>>> -    multipleOf: 100
>>>>> +    multipleOf: 10
>>>>>       minimum: 1000
>>>>>       $ref: /schemas/types.yaml#/definitions/uint32
>>>>>   
>>>>> @@ -131,7 +131,7 @@ properties:
>>>>>         J coefficient for temperature equation.
>>>>>         Default for series 5 = -100
>>>>>         Default for series 6 = 0
>>>>> -    multipleOf: 100
>>>>> +    multipleOf: 10
>>>>>       maximum: 0
>>>>>       $ref: /schemas/types.yaml#/definitions/int32
>>>>>   
>>>>> -- 
>>>>> 2.52.0
>>>>>
>>>>
>>>> I have applied this to thead-dt-for-next.
>>>
>>> That's odd, why is a hwmon binding in your branch?
>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19
>>>
>>> I don't see an ack on it from the relevant maintainer either?
>>
>> Sorry, my mistake, I should not have applied the binding. And you are
>> right to point out that there was no ack from Guenter or Rahul Tanwar.
> 
> It was Guenter I was thinking of, but there's not one from myself, Rob
> or Krzysztof either.
> 

... which is why I didn't apply it yet.

Guenter

>> I will drop both patches from thead-dt-for-next and wait for agreement
>> on the binding.
>>
>> Thanks,
>> Drew
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
