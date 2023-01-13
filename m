Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCD6C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA5T2RZjN9treuqn+o512vlmnaLellpzY45cwN7kblA=; b=nHRgVaIdQZAKqH
	f6DmKSkqYofawlCw1tf5AzFRE/DZEpgo+PwbbqFHwyPzruH/8du6fy0hD779CDit5l7JWF13LS4c4
	9xK1JOVNxAJgOCDM4VnvfWXH46AfwoLL//DdR9pZggfpenHUiWafHFzcgdzyua+QEuMVVN4Rp5S6z
	wt1v2ScyFFHxV20qkl0n1pZn09ruOjRHoGJVW2kEtuep6U83fDJNNQnfCQ4jBMK4aZtxYxRcpHhtU
	huPXwFb9mdL0dSeLf0kLQt6BkVvUoedVz2vpFNZtwzuvaMydeaIkbtZmV4cC9FZ6WXgHnRFR8Gs6A
	Kmw/r+kp2KNj2mDFit6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFVL-001Fli-Cd; Fri, 13 Jan 2023 08:33:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFVI-001FkF-4w
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 08:33:37 +0000
Received: by mail-ej1-x630.google.com with SMTP id cf18so44238272ejb.5
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jan 2023 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69vPfjdndDvs8QEdWRfbzSSvuuOt62gz3qB9+kdUnVA=;
        b=G0yy8cPfoiavoMyPQc3/K7FUfmxncwLLWeYLWTYO7Eh5k23/uG7jZmmlXAU3i+2m5u
         T+4X9VzZxFiLZoEf0+m1uc3vT7FIYF3QS+8pUFkgqjMDrHwpuir72UVHlU7pmG+wzh3d
         qTTgJ2qHORnGEzxoCQtk/C/gVDmiDZF8yfSukEJPxDQs1+JJuKVHhrzuPsvYWvnOdLaa
         Tw84jFKE34wPD5VnjHCMf/2swGQlwXzn/k1FP6xV2KWTBcsxzHeV9O9lZV5dd+lOMXzH
         BEBSkqPa8beFeQwqw/NarHzFP/8Mq19qyWTFQZ2roV9WU5I7QDf82+VcOg+qvEg/jm3Z
         YhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69vPfjdndDvs8QEdWRfbzSSvuuOt62gz3qB9+kdUnVA=;
        b=ur1KS9CcpOPVypnbCRQhC/a68O+bhN0bCJzUPzvE025d17gqVpVU35QO/2TNUELPqU
         izHu7ECLPSc7K8R0X3uu1n3A24Qt5Ffh5jAyc+JyFes0YeysUC3IffBdeh77yhq2osAS
         pVMD2kVHhyc8ghXt5IE6JLJCxJc6IMGtCDk40yPIAO2oh3vaPzPI/UB1huwL9x1HI23X
         eS8wEaLmX68UsVvJtmdZyGa6AtHqpAs4zjI8+9AOCJn4c8av0uuGeewdVTxGGBQxL+Z+
         Q66q8n0wsCHKQ/OI8ccCsZk6SA3XJVQULJN2Mz64T2ZBv31fnHGdUc+ki5lFpRJUxivM
         AA7A==
X-Gm-Message-State: AFqh2kodk4OsmanYQxndyZZJ1WA+8OH0LG93jzEfO9smoqmbNQCBjDkA
	Mvy/+T9Oe2jBO20i7qEnz0mn/A==
X-Google-Smtp-Source: AMrXdXs2ZJAqttVWYRXGxoX3QUG9Uarxkn9ckYoeRGcdElRtpW1qBalWUSAxDqAu65QxD49NUMt6mQ==
X-Received: by 2002:a17:907:cbc6:b0:7c0:8371:97aa with SMTP id vk6-20020a170907cbc600b007c0837197aamr71708773ejc.28.1673598814566;
        Fri, 13 Jan 2023 00:33:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007b2a58e31dasm8336587ejc.145.2023.01.13.00.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:33:34 -0800 (PST)
Message-ID: <20651db4-b0e8-ee3e-a752-c1d4ff14b53f@linaro.org>
Date: Fri, 13 Jan 2023 09:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Samuel Holland <samuel@sholland.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
 <Y8DVPvnfShdhlVHh@gondor.apana.org.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8DVPvnfShdhlVHh@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_003336_238494_05F9B0B3 
X-CRM114-Status: GOOD (  16.78  )
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

On 13/01/2023 04:51, Herbert Xu wrote:
> On Sat, Dec 31, 2022 at 04:01:43PM -0600, Samuel Holland wrote:
>> D1 has a crypto engine similar to the one in other Allwinner SoCs.
>> Like H6, it has a separate MBUS clock gate.
>>
>> It also requires the internal RC oscillator to be enabled for the TRNG
>> to return data, presumably because noise from the oscillator is used as
>> an entropy source. This is likely the case for earlier variants as well,
>> but it really only matters for H616 and newer SoCs, as H6 provides no
>> way to disable the internal oscillator.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>> I noticed that the vendor driver has code to explicitly enable IOSC when
>> using the TRNG on A83T (search SS_TRNG_OSC_ADDR), but that is covered by
>> a different binding/driver in mainline.
>>
>> Changes in v2:
>>  - Add TRNG clock
>>
>>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> This doesn't have an ack from Rob Herring.  Would you like me
> to apply just the crypto patch by itself?

But it has my Reviewed-by, which is equivalent. Please take it via
crypto with the driver change.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
