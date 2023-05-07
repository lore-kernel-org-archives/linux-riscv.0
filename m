Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C8C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 07:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sViUEYLDJt/agRQd1Li0zZftCkQ8xh3ZdLqlStzHpMU=; b=4M2Ki9dZDnZLj5
	x/ZzrkfjdxrDWag1RkLWsWMXcRnA56LazRFV48rvvOQst+DM4aUTr+HAgbWKzOWPSLPNX0C8QU22j
	COeqQ0o2+fi5YBxrU72oXGYhhtoiBxEKElMHJJpDyQOiM995oT4BTtZaClzWGxj1Rs+sAbi2l3Jzx
	Bh0YOkMQhDfCf//nH9Lb2Wlv7M+3mOV7ilhEm83JVPfvW1OA81ctsSMJeuTegJfwhfTfHXQroNA4i
	6zoOs9Gm8pY3grjQwbZ+/9PfSTXV6Ot8OCbc2rj9E0u/hsbwYRDKf0f9HKdTUqYbpJNzBqguM+vGD
	l1xxPEhTdCoE0eQyFT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvZ3r-00FSF3-1u;
	Sun, 07 May 2023 07:44:03 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvZ3o-00FS7f-0v
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 07:44:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94a34a14a54so685801866b.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 00:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683445440; x=1686037440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X7J0rVubekG+DrRrQuBm6C1ywPBgjwPpumVcwGX+HQ=;
        b=rWcUEwlQJpV+ycrxz/+0KJoAxqQmMQrWo5GfzIqEGoPRyDBz2d+L+9XPBTpuPW1BEE
         7inHPMTKghSfeJUSlzMt86K5tsOSxTMXP5xgRr5v6RQZr+XoSBXOqu0tVMfEK8indjkg
         amJt97l/vCXBHr5voY09o91QhrNvuqv/COZGiDHzxQQlFvzA7LT7lr6Pn+MdmiDIt81r
         SmO8prh7tQTVsEGg7Iws7vQJGL1joiSAYJG8VVopngkhm0M4Ed4Mr4vSpYHTU5riPO9C
         6jrsbrvwvYYrMbkqolOpSF9y+nTjtI7KUM28I9V8gQNZCiZ2roM+GHncS/R2ljPwVSZg
         qmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683445440; x=1686037440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X7J0rVubekG+DrRrQuBm6C1ywPBgjwPpumVcwGX+HQ=;
        b=T2hC+9GiN57o9IaCtR0AaXqjhyHdhch+7r5KTVvQ1T4wKkTrd8oepRGsvt/JUfCXni
         lJ2Imm0HzUIuoNEcL+I8Y3Pslf3Ugs21H0eMr7xs53dDkGCk0rAUtssGvHKSOCvBaMVk
         HFcm3/99ihJrufI/0djfMjVlrfWAcdhc0zHDGh3STLH4rX/uJewmCAsTU0iHaIWxtZ1J
         jFHNDFVzRoixA+Aa1j3vYMTUFpKuu1zN7h24K8Q07IR/KgDb5Y/BQRc/rZPAvJiv9Wf8
         /Qw4LvZxrr5CyLENtKUHmG8dr3AgZPbskxaieSPdd7Xe3fcBvAGmK3zlsHFs+PqzSmLA
         haWA==
X-Gm-Message-State: AC+VfDyYd+QeICM4iiRtQKISFjI+CkrvaLCSojltsw4p+/d4xe0zvM2P
	xzGrqGrQB2FhV18RCRpiFCZbGg==
X-Google-Smtp-Source: ACHHUZ5JGEdSovi3dxyHchKR/hKO87oq5KWsTOg10yOhk2jCXZqX6mRsswt41WqNAgRTvqy5CBpc2A==
X-Received: by 2002:a17:907:360c:b0:94a:845c:3528 with SMTP id bk12-20020a170907360c00b0094a845c3528mr5491362ejc.45.1683445439836;
        Sun, 07 May 2023 00:43:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a? ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906348400b009659cdb2f98sm3319965ejb.23.2023.05.07.00.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 00:43:59 -0700 (PDT)
Message-ID: <ec31e502-6b40-ca5d-1294-2e5f174a37b9@linaro.org>
Date: Sun, 7 May 2023 09:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/5] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329/D1/R528/T113s SPI
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-2-bigunclemax@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230506232616.1792109-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_004400_330535_ADAED9C7 
X-CRM114-Status: GOOD (  14.78  )
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

On 07/05/2023 01:26, Maksim Kiselev wrote:
> Listed above Allwinner SoCs has two SPI controllers. First is the regular
> SPI controller and the second one has additional functionality for
> MIPI-DBI Type C.
> 
> Add compatible strings for these controllers
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index de36c6a34a0f..807dde457e3b 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -21,6 +21,7 @@ properties:
>      oneOf:
>        - const: allwinner,sun6i-a31-spi
>        - const: allwinner,sun8i-h3-spi
> +      - const: allwinner,sun50i-r329-spi

Keep the list ordered.

>        - items:
>            - enum:
>                - allwinner,sun8i-r40-spi
> @@ -28,6 +29,12 @@ properties:
>                - allwinner,sun50i-h616-spi
>                - allwinner,suniv-f1c100s-spi
>            - const: allwinner,sun8i-h3-spi
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-spi
> +              - allwinner,sun20i-d1-spi-dbi
> +              - allwinner,sun50i-r329-spi-dbi
> +          - const: allwinner,sun50i-r329-spi


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
