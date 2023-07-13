Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371D9EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPBPclsdiUv3M0dV86AMRP6+n+t49yrLaJirEMqoO2U=; b=iQvdZfYZsOUvvV
	gxa4AuMYXr5kEIx7DwRimGf1cE/IpBrO6GwQDe9mOewGR+Lj0ldgv8f8W/j+pVrmjYETUMJ7g9tTQ
	hPu0blOtxEhHYrloclDw9T4MeDAEmE5dGBjr/CT1hynXvAyixdydoFjrQ48wJn+MdLxsJ6CnEbmVN
	3cseA1ss72hj+TWSW+54zC7iLF+1hwuXf5hchFe34mEwrzb3tJOwJeJYijouYbzrVIonoH3g7iH5K
	xwrmAgDrUTuRuuVZdoX3LrFWzcFC6MRq7ZAfgCyptqgqBtIvfafXMoWcGzW7tBdDUtLbHaVq4K9JM
	Bg3Mq+XhN1WIrMcXqFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtK3-002m5b-1V;
	Thu, 13 Jul 2023 10:13:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtK1-002m3e-0S
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 10:13:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso4420675e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689243192; x=1691835192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqpKvKjFPgrm1n67w2HkQAIAqrytD1SlOgdR7vfHDQ8=;
        b=luQTcZZe6aiRlfbeHU74EPHO1RuPrO2PLZ970jQJPWvapTOL62IS1iOxSd4rSMpCKG
         J78Y6wuPPK3OfB2vEizBbxHbK/dcqaVHYk/E97oJ4wQC+Ew1B2lV2xKldbhrierpLWVd
         CeI+JXfmy3jNhg0kfusp5zBh+IfwvWLpgZ8y9/qz27lNXGSbRlXYmcZzDCPUh6BjFCIz
         VK5liVRyZAvWcZEyO28lvCNnCmui8LUmtkPhlCa5YrHNa3bAb+StcFtU7EEODg3X7GvO
         To5Hq/TIAUwknPK1cdxQ8xgWHqLkk6cBdUBrEVKI0lXh9PiSGgFlBjW09Y4YwkVFtrri
         ZXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689243192; x=1691835192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqpKvKjFPgrm1n67w2HkQAIAqrytD1SlOgdR7vfHDQ8=;
        b=K2zhmx/owMt3vXBVPVpOFouAo3fAI4H+fwQfMR//ybEc10JWn57OLFpLiagiUFxXAS
         F6IJMbvJIsmPHxkpKGp3XmrDgkRVtS2uMnhqsPG2Qy6xeJRVwGEQaK9mZ4glCuHK27jQ
         FFzISPD1FPIGtLxDsFKI88d7dlWmp+86ut5tWIzQ52kMyY5OMfFDgQeAWlHOpWshvlSB
         V9X0jtKhegVQ4eGhjJnuVB401TIkxAWstuoUGm+tL3YUD2Sux1jC85nR9wZpf25gB0uD
         1fc+b19OSuw1O0nZjFZ7N9+wTltHjUNmC3hPyntIzUb+kzS4cwMBoKtVX2XXzn1q6Sy5
         vViw==
X-Gm-Message-State: ABy/qLYwIj52XFlkReGw2RiXp600r8HhvWJH8XSviv90FsCT8TAiukt6
	6QjGQr+3J/XDWCEVbwUD/AbqlA==
X-Google-Smtp-Source: APBJJlGoxNaV3VLPlfuinnivZHpasDjPzdV6g0i7WaJV8KKe9bghQK3WWPZrUI/A1anDv9oLHhCTdg==
X-Received: by 2002:a7b:c8c9:0:b0:3fc:a8:dc3c with SMTP id f9-20020a7bc8c9000000b003fc00a8dc3cmr938821wml.37.1689243192221;
        Thu, 13 Jul 2023 03:13:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc30c000000b003fba92fad35sm17853977wmj.26.2023.07.13.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 03:13:11 -0700 (PDT)
Message-ID: <c1b6708d-3fa2-7b67-273b-f03aa59efc7c@linaro.org>
Date: Thu, 13 Jul 2023 12:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks and
 clock-names
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713090015.127541-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_031317_180473_42E6DEE3 
X-CRM114-Status: UNSURE (   8.26  )
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

On 13/07/2023 11:00, William Qiu wrote:
> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
> so there add minItems whose value is equal to 1. Other platforms do not
> have this constraint.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
