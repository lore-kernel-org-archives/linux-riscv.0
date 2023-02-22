Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674CCC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9FUdSWQTlkN24sOiVD5kB6ln5bX39nCy6ww/Fra6q8=; b=aYr1AKmSrQTenh
	XszPvIKPS5aEJ49ZrS/K4iFlX5K1AYJPuEyHzPA7FdsBl9yOLqFx2ekBhjNS2hkaxvqep86Itm2oM
	iIT+Rkl2yi3cPNospib5amBknJIAnTKQrtHkUieYZZVjneXMIL8SX6FNpAIxVEY+YjyQGX8yR7vfF
	jDaXUcdKc/3AeSdlLYllcl09qN5u5UUOhUB4jmzGYs4exNx+cClBZaaniCb5mJBH5JugMmYdI5O/q
	68T4FmYHMw3uBnggt6KZ1kGEe/6ll0KY8SP2NNzhPxT+ZF5Zo/1cY00QfGD0q87gwQp3YAV4kSFgx
	YqTwZTlfZtNsx/5eIWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlFs-00BNXx-VG; Wed, 22 Feb 2023 09:17:40 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlFq-00BNWX-UH
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:17:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x10so26746741edd.13
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYNjYpqa0bbdp+1kEQD5S997SVtcSN1lChO27iPiDpw=;
        b=TtNO99vDyF+FOnem7oAHDn6G30PaKs+x4inAVoGOhs7iEdKofnLJfFq/AkS8dPiEwx
         /PkhPY4UXDKdVYirGGfovlv5KC+4uNDt8VlWMt8t28weTC2EwAACd1RRywYBV+dIEM6n
         9ZzSCRJsx+pZfNOh1Q9JysagGFcfD619jHXGFC6gPZU6+udyEAM+vA45x74asaho3lRy
         20tcPipMSNmQ9b6PftCcoMC9rqL5/JMAuffUr2g3l2URHjozHwBM+NcqlP1f6zNHOEXr
         TUZGXy+2yhIR8C3ryg3A/WVW3XEIyCeUKxhLqQ62iKpRdLBLOgNkcF9L4ZOjmUE3aZjm
         NcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYNjYpqa0bbdp+1kEQD5S997SVtcSN1lChO27iPiDpw=;
        b=RFi7rBQ4VV5vYEqfJDBUIym2NcJbg1HLLagWHVqQxFBmQVolRlQKT7FWjixOHhhf+5
         7ZycXgSGpk9VbLUqH+nUgMaOGrMbM4E2BF/pPID2QU1xN4NFbyGpsfl0MyQ2mSu1z5NS
         Zilu6Em/Yrnfwq49qU/ff3Mk5+Jd/dhQH9ZklfxumsPtT172Pmtx87k9/zWOB8k00Hbi
         O1IjPob8gDhhCv92dijW4G+Me+RWq+9KrllvE8HtH1fphjn7CrSJA3JFESe7ciuVi7+M
         npP4Mp9eHsB3E/SxzoZaXS6hpkPdfwI5rV41kDhHt/v6zCA8qBPW0km85IwFWlQpxZVt
         LXbg==
X-Gm-Message-State: AO0yUKXr18f0gRqjA7j1YcqSVqvumi6bTIlGf71Yze9WL6de6aotCsMD
	p5+2JG5z1elH9h1N8vCPq/37ow==
X-Google-Smtp-Source: AK7set+CzHz42sMYy4A1TLOMRmQ4V5WpNodweBdRk+BFWC+9HSDi+OuobpSTPV5LkXlKNQH7omU9/g==
X-Received: by 2002:a05:6402:1850:b0:4ac:c5c1:e1ed with SMTP id v16-20020a056402185000b004acc5c1e1edmr8412849edy.12.1677057455723;
        Wed, 22 Feb 2023 01:17:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g16-20020a50d0d0000000b004ad1d3cf195sm3031904edf.95.2023.02.22.01.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:17:35 -0800 (PST)
Message-ID: <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
Date: Wed, 22 Feb 2023 10:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add reset
 items
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221140424.719-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_011739_016754_29029175 
X-CRM114-Status: GOOD (  14.90  )
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

On 21/02/2023 15:04, Walker Chen wrote:
> This DMA controller needs to be reset before being used on JH7110 SoC,
> so add reset items to support this chip.

There is reset already. The DMA controller is reset already. Your commit
msg and commit subject do not match commit at all.

> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml         | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index ad107a4d3b33..c2247c65a22f 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - snps,axi-dma-1.01a
>        - intel,kmb-axi-dma
> +      - starfive,jh7110-axi-dma
>  
>    reg:
>      minItems: 1
> @@ -58,7 +59,12 @@ properties:
>      maximum: 8
>  
>    resets:
> -    maxItems: 1
> +    maxItems: 2

This breaks ABI and all other users. Test your changes before sending.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
