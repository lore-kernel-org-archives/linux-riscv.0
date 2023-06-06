Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1FC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTU7Md41FWDtx1IOICzLhh7Afz4lDtyWLbwcT3KqTnM=; b=mHQlQv0BG1IVC3
	ulmZiAccBmysPrwrusqTyYOiDykZZnnfyZEM9LNX5dWpvHUV2odpXrzJi6sqzFNsCQ1gSvSPK+BC/
	+Uf1FtZ0AZMx8qAdN+oTmt7qCQLOxd9bcX7ad6VtXcVZ3/HKkt9bR/jjw1CtZzdwzkSmV7ieNhCYs
	gGJdxLmDNzI2okJsh1sTdPXNGoM8MICdaY5IBwk5FSNRCqxSHBaeugKGtK1pBJtKPQIv+Mf/rci2p
	Fcru0NEluRBwzOzIX1Sg70sjTr5eAB25y9HQQWBmhjExCIvPC7C0Hs3cGDyGFhWmrUh/w6Ixe3akH
	SEqWgpW9W5icKs5IkrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6W2P-001hBR-2a;
	Tue, 06 Jun 2023 12:43:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6W2M-001hAF-21
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 12:43:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-977d0ee1736so394944566b.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686055418; x=1688647418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mK220acPIp0Asjpx7WaUgqj2OH9AJX77DYV3xxqd5iA=;
        b=Cr+0sfqBACoG5qRB689ltZloU3SiTrSDK3yRSMTcaISF7FGdum9egCI2nWA5gxmRaK
         daLOjhx4q2TDLeXael2GAEIpJ3MY6rNaWvlmqQtVlzOuUj52kLeOD/W/1YTEKLcvS7y6
         RxCOX9icXKTpyNMZ5yktWxvMTafFaEOYJStoz17+gOmrKpHS5ThtoVczItCNjcUT/qPH
         Cb8guFYO9ai5gR8ixCbF5WSDIAtUCY7PkM0kqphHq+xAi/xNUzysDaooV54ffoXgmwov
         wd+rmvepiTVyutsV1BhxZfYw+tLcyTNzQlZtP4IHfSLG1YZqWiv9/tfxIEkWWHZibGoO
         eqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686055418; x=1688647418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mK220acPIp0Asjpx7WaUgqj2OH9AJX77DYV3xxqd5iA=;
        b=GztEEr/JTJw1UK9wtvkQV1qYEyNETCg47v2awQ6oyyDaDBWCzjMHWqDgGMxejfjvWH
         kBixX6Rurr16uevhD1iiyWGJE7glm3uM/TMwtKh5vZOqRbyQTjwfLzF250vUm7q27i2Y
         j2aZAkUd8JnTxC+UgJ9CwJlrqnbIXRbdvNFd4oSuYlfafTm+jBisZWaJMV9nEsqqIOgn
         DcR0oiqBhCq3Vg/RM1uMUPHxfSGOTYtB7YOD+UBbaiL+gpCcuumiU8QCfercsPlJutT9
         Jl0e9veV2aWlYhAl/TBTcYMuBGPGR/DYv61CPFByeR/i+rSc6iq02M1aDP7heWnpWiql
         5x5g==
X-Gm-Message-State: AC+VfDyysvdLD5KqjbOSjb+Kf7+Xyt3YWJOtlAopZuORmJz6QzFObLLz
	uEdlwlUJRLJw96Oq3vy3HfDxWw==
X-Google-Smtp-Source: ACHHUZ5XRAYpRQYNod5PLa/diyi4g2ViUz8nWrxI8quciVUCIMB853yrvygjxAT8AI5273ZGNyDfyg==
X-Received: by 2002:a17:907:7b9b:b0:974:5e14:29c5 with SMTP id ne27-20020a1709077b9b00b009745e1429c5mr2615396ejc.32.1686055418440;
        Tue, 06 Jun 2023 05:43:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906815500b0096ace7ae086sm5589502ejw.174.2023.06.06.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 05:43:38 -0700 (PDT)
Message-ID: <e148c599-8521-3264-f994-529ffc18f836@linaro.org>
Date: Tue, 6 Jun 2023 14:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230602084925.215411-1-william.qiu@starfivetech.com>
 <20230602084925.215411-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602084925.215411-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_054346_686358_E6D29919 
X-CRM114-Status: GOOD (  11.15  )
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

On 02/06/2023 10:49, William Qiu wrote:
> The QSPI controller needs three clock items to work properly on StarFive
> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
> platforms do not have this constraint.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>



>  
> @@ -69,9 +81,6 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    maxItems: 1

Properties should be defined in top-level properties. Don't remove them
from here.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
