Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB3BC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVW9PWlOISQA26s2atiu1y/zQhYxidj39WtyoCRp5kM=; b=JWCBMUVZlLcHI5
	zSf4F8XqZMYU0Fl8XsaAAwUmx1hnuQKttE+pKb3AedsS6tHDcBNElmEHmYGzK9jBZ/HR1s64+zh0S
	wD73wgws31K1U2i2aGcu31ysJdOViry7iRoGzWiOUClI6io5lu5CBZ21MDv+z3q2BuhSOVG3ttxjD
	7sRp61ImK1XvjOQQB5UkvdkJNEMmutNVIJJRfwQ86KxZRcwnyQyNfW+Eo8fAxYJjCcno6osTAL2rf
	4iqOb9C4N7GwzUqQCNk9xWY4oW2L/Yj5FErGrKxTHn2xpuhV0oV7tjJKIh4wzKBm76BXNI7s8ozhw
	aIFAC6gvPhSpNVcKXcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iYB-00GBLJ-0G; Mon, 27 Jun 2022 06:48:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iY2-00GBDV-V6
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 06:48:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id u15so16974598ejc.10
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=RWjYnqvzKyDfj8b/7IK5P24LKA/09SVZpmj45NDb/k8=;
        b=NYZ/s/Tb3UkyIWJGVPhIHRe0KWMNs9rwQ4YOsUw1UvszbA5TvQMvy+KyUh1UFtUoK7
         /KOtH1L96WVtgL9WhUpN4VeybY8vsqKQ/koqr+bwHvw/HMGBuHEHDSKR5pKAYq46PmRP
         JbVNxPjBKnofexI/kw5mShTGzugVNA3efhisLiMm6gTzwsf3OG54qwgRT0li2ULmi0q/
         gVwOxsB3d25vCgr0kJKuve2crC1u0yjACp+L9VPIMAFKK1ijJ7cA2RkVa2dP1YknLbSS
         3zcVxmOE1Os+4nCKlPdfd2BNeDbqWdnfJT5B8TKtRwbOtowOuEcNZPjPY1kp7uJmyE0U
         Mdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RWjYnqvzKyDfj8b/7IK5P24LKA/09SVZpmj45NDb/k8=;
        b=AG8SK/ywPYNsiL4emaJdyzQEuNhbQbNDl0imKePREn+hGKYPdIhEFCEobgPlKhvdlU
         MsYRbnkcr0C8ddGBsB5LvySK0XO1oRO9cK7qIzO7oL8Jjt2ObJctauunLmv/GjbmismB
         +rOrwnZNodSJyc3cbtvbliYY2gEc0J3RrjrA5BNAPZykXQd+Keu7vvnrogaaHhkynKYh
         dsi2J5eexjIvxHW2Fy+D+Rnp/cpWf0K3seOI+FxIidhKtmaLCi+HNNvhlH6gSaGpsQYq
         1Qjpv0y9apGYnZpt1tmOT41h64XAgHlZdoEe9zossnUi/zdErcLgahJbso+6GEuNLwcs
         RkKw==
X-Gm-Message-State: AJIora/TMbYIbWIt9PSvywTKL+4+L3r6Y2BYqhGzhXL8W2O0VcSxhLFI
	LNEKBa3k+IXIzVJgcBaXORJ1LQ==
X-Google-Smtp-Source: AGRyM1vJDZS0a5cPJDbxysakksp3r4tjzZ0oY+DetVZ8VFerGJs8WYrxYY1hEVLNOUj1BrAazRNjyA==
X-Received: by 2002:a17:907:3e84:b0:6fe:8c5f:d552 with SMTP id hs4-20020a1709073e8400b006fe8c5fd552mr11407516ejc.710.1656312513224;
        Sun, 26 Jun 2022 23:48:33 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h26-20020aa7c61a000000b00435cfa7c6f5sm6794624edq.46.2022.06.26.23.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:48:32 -0700 (PDT)
Message-ID: <9dbe7dc9-aac9-7d1b-eccf-5d4c8683065b@linaro.org>
Date: Mon, 27 Jun 2022 08:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] riscv: dts: align gpio-key node names with dtschema
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
 <daf4a88e-ea33-be74-7e0a-b2ff20ea734f@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <daf4a88e-ea33-be74-7e0a-b2ff20ea734f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_234839_054895_79114237 
X-CRM114-Status: GOOD (  10.10  )
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

On 26/06/2022 22:56, Conor.Dooley@microchip.com wrote:
> 
> 
> On 24/06/2022 18:08, Krzysztof Kozlowski wrote:
>> The node names should be generic and DT schema expects certain pattern
>> (e.g. with key/button/switch).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Are you planning to change them all & then change the pattern
> property to complain if "key" is missing?

Yes, I put the link to original patchset doing this:

> Thanks,
> Conor.
> 
>>
>> ---
>>
>> See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/

Specifically one of the first patches:
https://lore.kernel.org/all/20220616005333.18491-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
