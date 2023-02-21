Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4505CC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAQBUykUiJjSf9baoG+X2VaV48rR10mJCPctMj5/AKw=; b=SO9X+5NByzf8i/
	8nX//dEOy5VxYfcTzl48R2Cjj2TqReDnwM1hIfxte8BbJdKD5gxco6nnp8YZiGDUQ7+UWrlqOheVn
	5Iddkqkw92lp3LC4qeb8nSoxlDobJQu/05uyeqx40WWLE78rBtcH6wQCQgfNyzNiBg1u3gK0UpFCR
	q4iHf7XJYsHSfd76vmw9RoCZJlrP/IOKKsrBgFwpsx2pfhpDnS+B0lr2CZM4BYZbr2HLYgsurPbS/
	ZoSO+NlUikQz3gEEcDE9osTIZvAs5OZutyIzUd5HwXTR+pNTeTAeuXu43Fk6xBp7h7xbh+DHzWSpw
	Co6uHXPILSiVJYAWTvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQoe-007ZJ0-AI; Tue, 21 Feb 2023 11:28:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQnh-007YjV-8i
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 11:27:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id cq23so15509709edb.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ETq34b+8/4BiKKBj54uxKBTL+zouxa+WZyrIv2vhc4=;
        b=d7lROgunoVvoE0v+39bzYr3dX2eNRLypRPfua5vQqf0uyVkgiCHdKSgSwmSjjfST/f
         ne4omh5LS9UUUR4zoZdD7GtghFwntlo9r4ZRdXIihSRm1kwSb204j8gVsL9hDoS19hDx
         QqJ/d95Uqho7+SfE6n45R8/acVE5V409dNsYTV5GsEklz89eSbcP9oxprDB3uPpFOskd
         inLd4wP2b8jZybpFN3OHXbuyYgmM8PU1s2tXuRRVCIrWN3QWLbl1lWV3lO533/SkroGK
         kQSLyhXqNVUvYhOcF6kqSY4zlLss5ck/8lwRRDTwXlt9DU9fKcnvWDfdQ6qv0xhA7JBj
         ruxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ETq34b+8/4BiKKBj54uxKBTL+zouxa+WZyrIv2vhc4=;
        b=F1gHoym4rpjySz8l1KdrXxvbZfm2+uJkgk902s9OFLQUIWkBf1X3pNcpKMDtp1m21b
         XJ7VTT+cJryPfJt3zVWtQjZYtF2GUJ77Ym4pkvBgHn3FvxLxVnWxab8wu6J6b3GV6S1w
         RCHfEIifIFH/DHZUq6qBWoPs3o0pIXLneqMV8fNovTWuqNuauvC0T3W6paAVLeIUc4Kr
         OuhNV0Q/TZcYXvokoD7/O1RiK8TZqjfHJeFxGlfhFxoheqdEF04xaUkLAaZYV6uJcHLp
         DEqsuSCpHegwCw3XlQt4/ByVk7FpTr+Rz2R+PuAyJn7xHz8G7Ff3oOmFhbh0elJEBybY
         oK7g==
X-Gm-Message-State: AO0yUKVJtNjrSAu/rZhp+JV3tnREE8pfCwgKw8RMW7ZkSYi4K1u+imr5
	OxSNx1HV1PXqnY7+hs1r2kWhJw==
X-Google-Smtp-Source: AK7set9Zkid+Zm3lzIDo8TDy9R/cdO+SwqsnhDqTyk4yhEQW4BIqgECPIrajKiHdtjkWj+oSarHJgA==
X-Received: by 2002:a17:907:7288:b0:8bd:dc0:3834 with SMTP id dt8-20020a170907728800b008bd0dc03834mr13639700ejc.34.1676978829402;
        Tue, 21 Feb 2023 03:27:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709066bce00b008cff300cf47sm2818085ejs.72.2023.02.21.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:27:09 -0800 (PST)
Message-ID: <ef4437e4-6f88-2f4a-6af2-7cee0b402fea@linaro.org>
Date: Tue, 21 Feb 2023 12:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: Add StarFive JH7110
 Video-Output clock and reset generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-8-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-8-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_032713_381138_9C652948 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the Video-Output clock and reset generator (VOUTCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-voutcrg.yaml        | 96 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
