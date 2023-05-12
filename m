Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C20DC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5jtWjf84VOs9UA2NCaVTbiw/pAQVkzikO4S7nJ2vvo=; b=eS8eyaynchHDqh
	yNEtxT6+3buD2Bk0JeyMcCuLyKnclUlg3CQ9OUTOXr8walNgAkRorLZ92W8JnIV4y+6q4pti7lNlv
	F/eb1Vhy9z/00mH1/ph53Ry/EugFpjDhx9r9rblwJK9CbfObnJGaOUyhNa1RTz1WaLf+P8BGQMEsz
	M28n33WkL8UQArSzjcvV23oC/WfC+N/UT29sT2pRWHmlwJfrH6k5W42puCuklR7GxuHtIMsgB32Xo
	RN4IR+wfeiKQemDE6Xj47L9/1oEZF9q3tr1XzEzBRohA8KNR+7pg8cWn4J+cWEwhTP56A+wUbVa5S
	qI1fePDxknV+mjnKaaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMNa-00B5Ti-22;
	Fri, 12 May 2023 06:35:50 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMNX-00B5Se-2J
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:35:49 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so17499819a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873345; x=1686465345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTgXqw1DQiVxfPuVhpWdkrrVopkfZHC/fCmNPR7iEmw=;
        b=ijv3t4S3+ROAAhh3+bMTEFjg8ZUs0YTiAc26pykuzAxOzjR650GGOHIszIsTKdv7e5
         edv36KAU1FW9cjS/WYMJE0jPX7q5yM8aQ9L5YFjmhZdf8/6CFq66g92PZpppWqtwz5Pt
         eXDtMApIONch2DReTW+6j82CFZUFBjejQLutd92NFxkn8yWuqUdqFE2loxb/zZR6bpwn
         iZ52Rcj9yFx3f1+Q3dDVYZMbRS1RHIsO2liVGRLBHX/MVUkU1dqa3yk+/uCta83fxNRZ
         LxfDrwse6A/Fmx4Y7mOm29/3hUb09AOOVTuVSBfRCY4CwU9CvV6C1XmZNV85Wtit0aYS
         1FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873345; x=1686465345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTgXqw1DQiVxfPuVhpWdkrrVopkfZHC/fCmNPR7iEmw=;
        b=Jhz8dHMRMRt9n19+ncZcMn+X34EZ3zFVkk7ITbvvsFc9AdWdky6PxSsxQUOEJMb7B6
         0SlPHilUbWBb8eN0NSI25H3DmVGzKTcYEGuiaNqYiTQRbY9ZEaD0sDEhJCaPfvBxz6oA
         iF0/iBT7ObBEUQBr+v8vUib/20yQZX2yZBVsAu/rjiIe7R/hy972tGyUs8CnBGobef91
         M79q8ateYFl1iyon3o1gPHjAFWZM53UXS4qJUWHHuIS27TyR/lKoS980MjCTtJeouBZa
         YsiYxiUoofbgCpvQhxt6/dBoTjxa/qiWB/975geH8pMI7ht5Ksx4Fe/ARviRIFHuuuTu
         fpnw==
X-Gm-Message-State: AC+VfDyojMh+h8Vr9nZjqRFppTcchXMWjuChDHL5qSqjaOLP7wouBFBm
	im65kF4k1qy5aXprrGGs5YRotA==
X-Google-Smtp-Source: ACHHUZ73iH41QdZJrSGj6lKTg012fYOj2ZUG7b/uT7YMwaVbxaR4Hzc92pN9p2zKO81JafHjkbcmUw==
X-Received: by 2002:aa7:cf16:0:b0:50b:f654:8846 with SMTP id a22-20020aa7cf16000000b0050bf6548846mr18432311edy.19.1683873345196;
        Thu, 11 May 2023 23:35:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id d16-20020a056402001000b0050dfd7de30dsm1100820edu.94.2023.05.11.23.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:35:44 -0700 (PDT)
Message-ID: <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
Date: Fri, 12 May 2023 08:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512022036.97987-6-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_233547_754138_DA4C478D 
X-CRM114-Status: GOOD (  17.98  )
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

On 12/05/2023 04:20, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

You made significant changes. Explain them in changelog here and drop
the tag.

> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 67 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..26dc99cb0c89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  "#power-domain-cells":
> +    const: 1

Add it to the existing examples.

This part confuses me... why aon appeared here?  Why power-controller
disappeared? I don't think that Rob or me proposed any of this.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;
> +    };
> +
> +    syscon@13030000 {
> +        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +        reg = <0x13030000 0x1000>;

Why simple-mfd? You do not have any children here.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
