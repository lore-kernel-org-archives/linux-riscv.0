Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727DC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBdJZMjchyya/H4CLBCoO1BVmqjBOKn6cBaJm2Hp6gk=; b=dxTOir62dF3/ia
	KqCzoMtKztOxcQzvjvn/NE8+o30us8CzyChFDuHiMTIBRI0BmgJVZtgFZ32EIfcooYQhlSLvaHL+S
	UVouEg8F7WMNHYlhWakF8HCoI/lJT/eMLJVJ9fleVIsym6seNE93+06mU3tf8bKZG9QciSW1ZjRJG
	etVU4XNq6qNkpGV1f9v19L0HmnZIYNfXMtRWFM7ddFwUGMlWTTqAuru8I8B5Ix/GF3mv1O+lEzXNn
	1f9TfSvOrJOr3RtAalgrECKqn9Lbwx0Eqbe/yioC7p21bWCh6Zktg8ASIKp4b94WGq0NUBtfTrJUD
	LmEN4UlrPSF3FxdV4DpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmsq-002wVv-0M;
	Thu, 30 Mar 2023 07:39:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmsm-002wTi-1p
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 07:39:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id br6so23332433lfb.11
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 00:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1BFQFEcp+Yc7eK7+gRqJuLKGd2zLsXk3LDs9OcFmZs=;
        b=ruldmbq64NM+hwrT/y0is2vQMgd+GIg71Oboaq2lJYwssqBaw6eK86sRZ2/R9RWiWb
         qZGN+9RZW8Hob34SVoK1OPpL7PTvxVES2P37JZsx/bI5K3VPsMxTmqbIwMAsAFDP3jgR
         T9C9SpPHR2VTbi2RXgEVjnJ881PG78j/N1bSrbfYc8FyzzmbDrY1kNi4QESoxY7PWhXX
         Zz+UC8n1m+4CUFohK0Yzqz7RbGeBP6u84ND8MOgCw5xw1EZOC1LX63X5yQwcNFxVM3P0
         Z3ublQZNxVx67c9jRHkN7OFj4gfp82jHCEmbRP2axY0oiNuIwEHShdjoVOaKESnCGBcB
         3hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1BFQFEcp+Yc7eK7+gRqJuLKGd2zLsXk3LDs9OcFmZs=;
        b=7g3vUEvZksQOu2o3Az3M/606fObnCRsfvzFMHkVhRovbfHJMApjPws3em/m6a6Ns5T
         VE2JbPxTpYMVrIMdrXQrZnTRF2O4evkjYUXU5a+mb5RaBA1gP4cu3sLioTjJoQQpbyms
         dNAKdCZxzizMjCQUnGso6ot0CMNVmZw7QkrvKVA6EJq/0yBPgAP4CjAgK7nsss8Xn0rD
         o41gB9nj8LjpRhfJZlnuUlGy6DO4ILuP8TwuW7li+NEwZuN6g9NmdgM0mtGlAdJSkQrz
         PiycbIaiB8jSqbU+YQaJnvMRz/5fiq3abF1XBC7gxYk4uvBfeBGtfbzwCIpClikvhqHL
         C+4g==
X-Gm-Message-State: AAQBX9czjl1s86yFZONGSjzYIg4QBM0A+b0XgwqNHriXGtd+NM5EuNLl
	5UgVye+x1EikRfBabr2i8TNy4Q==
X-Google-Smtp-Source: AKy350bAQUuZJ9AdRREDwN63mloWL2b2FNGC4p1ekLCHdHGiBahv9ED14kOttKyL58M6k3Pwu6iDbA==
X-Received: by 2002:ac2:5458:0:b0:4ea:fabb:4db1 with SMTP id d24-20020ac25458000000b004eafabb4db1mr6418948lfn.1.1680161978106;
        Thu, 30 Mar 2023 00:39:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512219000b004d85895d7e0sm3956796lft.147.2023.03.30.00.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:39:37 -0700 (PDT)
Message-ID: <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
Date: Thu, 30 Mar 2023 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329153320.31390-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003940_608414_BDBEB8A4 
X-CRM114-Status: GOOD (  16.04  )
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

On 29/03/2023 17:33, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> new file mode 100644
> index 000000000000..d65b9ed781ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 TDM Controller
> +
> +description: |
> +  The TDM Controller is a Time Division Multiplexed audio interface
> +  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
> +  audio over a serial interface. The TDM controller can operate both
> +  in master and slave mode.
> +
> +maintainers:
> +  - Walker Chen <walker.chen@starfivetech.com>
> +

Missing allOf: with $ref to dai-common.

> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7110-tdm
> +
> +  reg:
> +    maxItems: 1

(...)

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tdm: tdm@10090000 {

Drop tdm label, not used.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
