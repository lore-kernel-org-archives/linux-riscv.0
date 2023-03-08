Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF42FC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 22:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poGbDrpkdkcu9MszcUHIDA68MOYcwwF5zrj6ExlPMds=; b=LC+F3afWKiC25d
	Qyd1xT1j8iXEpvU65yoO1cckI/ecuxxNM/a8oiSwS06+TVssS56gJMWbWoWo5ew/ihzW+YkG+FTy0
	RnQyXICi6sO4589DUkIqyfEiRClfVcNICbiK/AaMZEmSKpC/wM6/XTjNqGGV4mKGTJydZoEKw66WZ
	/y0YgYW0sVggBxG0VZfQijlaZD0sGxTa8l52KF80N/mjKBXR9MzjMKJVgSVkCwKtSCpskYJXH4dyH
	zB4DaarL+U+AK55vE5RLFHfF0P+8mZ5YmPCE45OJP2e+sTayoLcUHZQ6GRcGeB4dOooQqcQZlP191
	J1QGKrhbPOaUuuAL+BXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1sW-006v1S-BR; Wed, 08 Mar 2023 22:03:20 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1sQ-006v0V-TX
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 22:03:19 +0000
Received: by mail-ot1-f44.google.com with SMTP id l15-20020a9d7a8f000000b0069447f0db6fso24720otn.4
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 14:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H1xZsO9sdRZyA8gZC8r55Vi2llw8sEWwYx39dSujuw=;
        b=0EYHIFrmd0AF4V9PzMsEfdtWfsFkHKz6zVBMTMD8wAI2tVKNDpNhn5LcMzDmM69IkR
         gBPIfHf9O7NvFxbvF767GEXWicS2/5ilmFFbfhPwTmNJGj3RRVcJw870iELGgwIdxwuS
         DAw5eDh8CNEDTQhBjzcvxEdQHwdCxMpluNP5mfBoEcXJzaWesAJSfCy0f2bwOkItRY1D
         i7yOm2NsDRiYkFHxqlcZaxVo2Psphyn1meaFgThj/8Cmt8VisDQRm4FRKpisglgqi0t5
         kHBoCUN3sfYe+XIFBE5vf1jgJ22a0mlBIBjlkcqh/uSafe2mOp9m9KeIO2ViTIH80HOn
         XJDg==
X-Gm-Message-State: AO0yUKXaXrx4SYDviSlcX1793+LOC0MRQYNgiY0iefXN2EInVcI8IbsW
	AU2rioEDQS5JBUgzHSv/6g==
X-Google-Smtp-Source: AK7set8j/Ty7lxEdGegJ4aQZTitSIzTHicNnBX3DhgGM19m8ws9dl2kuKR2wZrxKUQHXbvg0vyfafg==
X-Received: by 2002:a9d:3e7:0:b0:694:88ea:671a with SMTP id f94-20020a9d03e7000000b0069488ea671amr3094525otf.14.1678312991323;
        Wed, 08 Mar 2023 14:03:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a26-20020a056830101a00b00693ea7bfdc2sm6856004otp.76.2023.03.08.14.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:03:11 -0800 (PST)
Received: (nullmailer pid 3923609 invoked by uid 1000);
	Wed, 08 Mar 2023 22:03:09 -0000
Date: Wed, 8 Mar 2023 16:03:09 -0600
From: Rob Herring <robh@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 07/12] dt-bindings: net: starfive,jh7110-dwmac: Add
 starfive,syscon
Message-ID: <20230308220309.GA3914591-robh@kernel.org>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-8-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-8-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_140314_991259_92C95A8B 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, Mar 03, 2023 at 04:59:23PM +0800, Samin Guo wrote:
> A phandle to syscon with two arguments that configure phy mode.

This change belongs in patch 4.

> 
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../bindings/net/starfive,jh7110-dwmac.yaml         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index ca49f08d50dd..79ae635db0a5 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -58,6 +58,18 @@ properties:
>        Tx clock is provided by external rgmii clock.
>      type: boolean
>  
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures phy mode
> +          - description: Offset of phy mode selection
> +          - description: Mask of phy mode selection
> +    description:
> +      A phandle to syscon with two arguments that configure phy mode.
> +      The argument one is the offset of phy mode selection, the
> +      argument two is the mask of phy mode selection.
> +
>  allOf:
>    - $ref: snps,dwmac.yaml#
>  
> @@ -96,6 +108,7 @@ examples:
>          snps,en-tx-lpi-clockgating;
>          snps,txpbl = <16>;
>          snps,rxpbl = <16>;
> +        starfive,syscon = <&aon_syscon 0xc 0x1c0000>;
>          phy-handle = <&phy0>;
>  
>          mdio {
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
