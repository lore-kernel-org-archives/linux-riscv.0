Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC9C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrRXAGdMtFXS1mfIbLDiVRjw49Ofqg3LcemiBEjKKfY=; b=OjHvPR4UIZcATX
	FcTp29/+ckpg96xZvkMdpwPGR4js+/8p7iMfRlskxVuvLr3mpdPHh1BH7v5QCzT/SpIrojYkEdDTV
	k8EVPOD5yTp+B5NjMzcpRGM0XCuN6ywnXjMS9HnquS85rASbLa/cQsgB6XxkXvueUPE6EZU5mGLS1
	KNxgzOQAlbbeFUNlLi7FJ5PHoSMzu+fRdp/0ZJiOGYMZoOQjdv9NiRqnG2dJgj8GH9zWdWzoA6kdT
	eYpFXPYw4I5ihykLwqWGERg1Hi6hJ3Zn9UlKkuvF+x8gbDjd5ksPa8qubwu5pSuFHqhjGVrMnHLpM
	ND8qu1BNLpVhtIFcFG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNTvu-000Xxr-19;
	Sun, 23 Jul 2023 07:55:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNTvs-000Xwe-1O
	for linux-riscv@bombadil.infradead.org;
	Sun, 23 Jul 2023 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VBGw1PF0jZ7+7V3u8SysFDItCKCdjyIb2nTwukud9ek=; b=RGwql9Q6kGVWu2huYSsQ7d8Cbg
	BoSBSPIW3Mkb9IpAR3L03iTpGocmT+lI4ej9qxmmsv5tmfPS62evdgRzSjGi5/TaNyjuQN8xtBpbP
	qDOCMpHTwLyMtyyeAmEMgWYnoSBBwtHfhMUy/el8xfNqyyOo2STbGyLDD2XLkP/8I9+dgpO6Vqfs+
	S2Eg93a4qonSwh5uDlyigsN59fKAvo72YQUhWk9/NfZdI0Jr396uiSBpNYVYSr6Q/MiMg8FuTU3jT
	cKiFtg+sMLQBU9YeVzM+F3uji+BG93WQvwdAnHS81061h3wPn1N4OOEzY/mozjkhW0qmkFn4Zdyl2
	W2Qp5E/g==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNSiB-001lBi-0W
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 06:37:01 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992f15c36fcso569590366b.3
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690094216; x=1690699016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBGw1PF0jZ7+7V3u8SysFDItCKCdjyIb2nTwukud9ek=;
        b=NQ/G6ofVVln6yFXYklg7/cI8tPXrTOhtVa93dBTgBqtrP5cmARzi/KhhXHfEFgEgH0
         xDT4QaNNZR805FhsZpKOq+Dg08BlM6jV1uTOm8y4T4ak0P1o6v9ocsICZfx5LnhLxpeG
         AwtxmSc8bQh20Hgwjt9nUS0xEeDHt3hYi1rsagR4ZP9WQsipZKGPQ/JjK2pANoVNP1kM
         GqvPNWSwpP6Uc4o9QK2lIukhC19W32ZqwK1CvtEQsGKioKloKeNWw/V4wHskIEr+TJrV
         K2gxhV01oshYIJ4dpSP2LRP5ZJyNizFb1L1s56FDaAfy+p+Qolp3yOgdwJrRFOtICgkk
         BaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690094216; x=1690699016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBGw1PF0jZ7+7V3u8SysFDItCKCdjyIb2nTwukud9ek=;
        b=OWaj4UkT//9nIJIQ7HQHM8q0zEOdq55PIP8T9FPC7pOtAHzfP68Ffo50rFeILP56Z2
         gOp1bILhVlUWLaK2iKobTp71G/kDyXhK46XZQ2GrFQhYMKfL8TWJmMAIZ920iPMJ8Z3D
         2NoVh+NzCz6Zwo/PYxpLZEdwPdRFhSn4cBTplCMNmC62eKxPNGnaxhEndlP7u+lHfU1T
         m4F71NTewMSbX96owxLLcFJqNgbcr4jIGs325ZoqfeKUMcQ2gcoPQl+3UAjFTwayWr5P
         9//lpLz95B6kVURuBFCTHOxEOXhiqx19xHyvyEVlC1Mrhvo736EnAepEbBOnPmlYiAY/
         f+Pg==
X-Gm-Message-State: ABy/qLYD/wSwow14sOJbb4L72NP59NG8yYOEmuhk2RSqkebzG1WuqzT+
	9wMZafCxkp536mrf7ly/NwYM8A==
X-Google-Smtp-Source: APBJJlEl4XZ3NafWS50iCuMfgGWVby9zFbRSittlnITgM5mTeUHVeje0Ae2c+94KNc8wsxqcRmNHqQ==
X-Received: by 2002:a17:907:77c9:b0:98e:1b9b:aef7 with SMTP id kz9-20020a17090777c900b0098e1b9baef7mr6557161ejc.64.1690094216474;
        Sat, 22 Jul 2023 23:36:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rv26-20020a17090710da00b00993470682e5sm4595544ejb.32.2023.07.22.23.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 23:36:55 -0700 (PDT)
Message-ID: <fe1ba45f-97dd-43ef-9979-bbc1834897f7@linaro.org>
Date: Sun, 23 Jul 2023 08:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] dt-bindings: riscv: Add BeagleV Ahead board
 compatibles
To: Drew Fustini <dfustini@baylibre.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-2-ccda511357f4@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-2-ccda511357f4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_073659_367583_A8A52BFC 
X-CRM114-Status: GOOD (  13.43  )
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

On 22/07/2023 23:55, Drew Fustini wrote:
> Document the compatible strings for the BeagleV Ahead board which uses
> the T-Head TH1520 SoC.
> 
> Link: https://beagleboard.org/beaglev-ahead
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index e62f6821372e..3b8b24812a24 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -24,6 +24,11 @@ properties:
>            - const: sipeed,lichee-module-4a
>            - const: thead,th1520
>  
> +      - description: BeagleV Ahead single board computer
> +        items:
> +          - const: beagle,beaglev-ahead
> +          - const: thead,th1520

You should keep some order in all these entries, not add to the end.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
