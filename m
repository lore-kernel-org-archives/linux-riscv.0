Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796C9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBdn+aRPmHar3VUZIoYCnMmwV73oRgUFcW5MrrpQI+8=; b=r+LwGifX4gmSXr
	QsW7hT/4CTs4mEGT9jIq9Nn3HYo7HvqmkAyyAHJSHg68PLqG0HxOuV8C1F8S7ap6PaCcpJPw6ko7q
	38WSrbpq+W3j1KrcOFD/6YhqKUk7FJKci/sNZdwawvQC1igB+jTar6k0CumWWT+9T6RAVZLVPmOCA
	09yU0gL5t5fGbuBD9Ah6HXhNNToO3O3a0Q2bUvccKyy+LnYhYKRn+D/4G/CXh+GPcA+t7ew9Mln3g
	MM9UD2gQO8vDYmwQriNHv2b3B1IhcvJx0cTpAiuLbCe+0TUq5JCphx01HI9lmpmpE3n0BkixbVIoI
	ZS3fIwd7Z3HjMZBrhriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMir-002laT-1Y;
	Mon, 30 Oct 2023 07:30:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMio-002lZL-0C
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 07:30:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so6577840a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698651000; x=1699255800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0feCms/EDi7R1DqNzbL7482+wMadoUcvT7iBFk8IeE=;
        b=Ih012CpwFtoEJvVK8XHgNydlBNuDuvu3QjjeaEfvAFuGqWIW+n55n0IsJDoYEdiGqe
         xp6uSk09caECTZcxtrWOhJBJIjU8x+cJwnBbi7prxNEnPQ+lL94bnZvHS4d6VnOTb2yg
         fUYNlRKn3APb7HmEHfiVEX5AWmLM6jZfK8uHUpREE8O+/FaZAmuI2BW5mHXitFSnxYEU
         EGC7/HNy+c7zghczueBPSrhypm59teCZ7wzDh1JgBfJalqV7krPyjUjwoeL7P2cWn/rC
         TmwE777NIjfrIPHWaxgOmQXawSbzIqoIrdVZFXIlumIo2cMZxyqx9QiEPFxXbtmtMa4M
         N1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698651001; x=1699255801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0feCms/EDi7R1DqNzbL7482+wMadoUcvT7iBFk8IeE=;
        b=XQjCrFmLDGPlFcxouDGgPHAJlo0b4r+jo06Y+t1KeC3NODyp+6PMSwpxcL61C0Qj+J
         QSpElw2Gbr8uqapCa1igBS5+4ntnRCp5TekqeaiXKOSC0gDQPLWp6gsYhxSfHO4AAjZZ
         JkZ3lYjj241uSFWeSGRqSDvEkp74qJcyvP8Y/BRn8XnqzanoGHWUmq3PpzkW9NQWy03D
         uwX7+sc8SbUOhCD0VygKaMGUD/cmBx12fe2cOkYmT8efRhD4fWKPrKMFf+gJvg8TKylK
         sLZnl1bGja1BuE3LUSIkEwi9OkGi+NeozMMcLGhd7QISiDKUrO5pK+rtTGV3P/wg0VCz
         C6Og==
X-Gm-Message-State: AOJu0Yxv7BvDbAWXelnKlj9znvufh48BzogcPKfnx3s8Vw5Xx8piVFlo
	ECz3cFL62eG0O5010bIfAvYPDQ==
X-Google-Smtp-Source: AGHT+IE0xLb42GJJlZEUa4vYkClgT4ZgKMIxUYBEvkx+D5ONPnLMohl+Bwjq8RSDRupWFMersp95hA==
X-Received: by 2002:a50:cd48:0:b0:540:31ef:80b6 with SMTP id d8-20020a50cd48000000b0054031ef80b6mr7469137edj.0.1698651000709;
        Mon, 30 Oct 2023 00:30:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id eg25-20020a056402289900b0053dab756073sm5579901edb.84.2023.10.30.00.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 00:30:00 -0700 (PDT)
Message-ID: <88930d12-3a55-46e6-a7a2-4abcfccfb6c3@linaro.org>
Date: Mon, 30 Oct 2023 08:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 Richard Cochran <richardcochran@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samin Guo <samin.guo@starfivetech.com>, netdev@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, kernel@collabora.com,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-5-cristian.ciocaltea@collabora.com>
 <169855920979.2226136.3264200658228005554.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <169855920979.2226136.3264200658228005554.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_003002_105213_7AAF6C0B 
X-CRM114-Status: GOOD (  12.33  )
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

On 30/10/2023 02:37, Rob Herring wrote:
> 
> On Sun, 29 Oct 2023 06:27:04 +0200, Cristian Ciocaltea wrote:
>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is quite
>> similar to the newer JH7110, but it requires only two interrupts and a
>> single reset line.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
>>  2 files changed, 54 insertions(+), 21 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	'starfive,jh7100-dwmac' was expected
> 	'amlogic,meson-gxbb-dwmac' is not one of ['starfive,jh7110-dwmac']
> 	'snps,dwmac-5.20' was expected
> 	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#

And here you have proof of missing testing of patch #2.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
