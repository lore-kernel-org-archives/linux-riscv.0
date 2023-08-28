Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E1BC83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li0ZaezkSYhOZ4ra2rtFJ46ow/BjKxzoEfgVG1dl4aQ=; b=y79MCfHAuzoPT4
	/jU9edBJ6q4Odd7jvsJ5HX+fksFjyiI7QXY1xsTSMnr2N2iOP/sBMqV7TzF5rDltdyxdMdCTNh+DS
	tFJh2FgQwx+jiJxyp7DFVzY3vXd+SxjENV0bD2M6sRgFQVLCgxNUgB7kgnztQlNo/Zi9uU4PR3Wi6
	dbBPbZO9pFjlTt9O35F0uC4KNbj9Vcbf+pUyUiUjU9D8wyakYfW5eyy3tO3ulyseEebupKdQmrk3x
	REKqedowxYU4ILLx8KADAQ4NTaVFvnLDGan/HoN6dnE7i59LzIinE2ji1vvMHsnvFio4grIfE/1QV
	ZInYGMU8xfUErH8hBgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qac6k-009caP-33;
	Mon, 28 Aug 2023 13:16:42 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qac6h-009cZs-2j;
	Mon, 28 Aug 2023 13:16:41 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso47048741fa.2;
        Mon, 28 Aug 2023 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693228597; x=1693833397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFmS+lobOszZw6W/QjUfDnJ5/Wvc31my2B1+5jBa7/A=;
        b=OQDAjV8mL2PUcye54nJcr6yKcKc1uYXBEejW9G0o+zfSHAPiUae7LS2RRT+CdJav1d
         j8gXyy7HXBObI85M8fhu1vAyA086jT9dhzVbit+NxLf4dCvQXPbW+Wl8qFRUt13Iquka
         GLvsON1Oc3cdnxwHgpbYt0cweaWvqknrNFy/CQnp5RcalL0G+xeUzARgt5H4pWJ0sBfF
         8vpzXWXvpAkLSgOx28M2huZunrNYiRx+mnxzxEyaJbVdlP+aUscSjhVGZfs9lmwFl0B8
         0+NjXU5YXcuaIrUgPD4s+YKG060zx1NOgmPkMxO8C+oSag77EIejkjB5KsHjdQzw0+Pe
         46Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693228597; x=1693833397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFmS+lobOszZw6W/QjUfDnJ5/Wvc31my2B1+5jBa7/A=;
        b=NjErcK+1WXOduiePgwFexr5EnogbMyJ3X8bDzlEXS15EZQzqzMGf6Mvtp9ilELHwyS
         1XGkOg6pz1AA5zCInrAjnRxTK/hFRWlGsgO2YPN8wUHiFzxDHw0M+JXh3cYVpXV9Y7bv
         FSp2WPcFp1/+2RTAyXNpo30HOwAedJOzotDBbixdMOHI7IodTY3Fmb338cSpf0CEpHgZ
         7f3Mp8aQgzkhLCpDuG5d6PM/hEBX6D1+Abeg8sx1kX9qSpyYDKGIXgkNnwgmSDU3J6Qe
         QJxeE89piuk+w9fPu8m1Cx5iIJLOKCXOzaQxVgTEbtJ6tXr+EK7m1WkaeMkUQhFB4akr
         spbQ==
X-Gm-Message-State: AOJu0YxBxnbfYUHP9oBJazDjEKSBTDWj7eTbR/vtatLyD8AgLQsfl55/
	E3qqQFq8qflvYeb4N9m/43E=
X-Google-Smtp-Source: AGHT+IGSl1gon6Mw15MQYmfOY6/9wlPue4ynOnk1kyxKFHnkqnQl6GNsj4QdZfkhjBmEOXhmF7zt6A==
X-Received: by 2002:a2e:a201:0:b0:2b5:9d78:213e with SMTP id h1-20020a2ea201000000b002b59d78213emr18323279ljm.22.1693228597433;
        Mon, 28 Aug 2023 06:16:37 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id l17-20020a2e7011000000b002b9f1214394sm1754206ljc.13.2023.08.28.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 06:16:36 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:16:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime@web.codeaurora.org, Coquelin@web.codeaurora.org, 
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/3] dt-bindings: net: add T-HEAD dwmac
 support
Message-ID: <koiz2vlo3juah7kgvefjiyvxkh7k6tu3an3v7uewpmtdurkico@sazvvhpwvzg6>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827091710.1483-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_061639_887141_EF5B6424 
X-CRM114-Status: GOOD (  18.39  )
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

On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index b196c5de2061..73821f86a609 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -96,6 +96,7 @@ properties:
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - starfive,jh7110-dwmac
> +        - thead,th1520-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> new file mode 100644
> index 000000000000..bf8ec8ca2753
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD DWMAC Ethernet controller
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - thead,th1520-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-dwmac
> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +

> +  thead,gmacapb:

BTW what is a point in having the "apb" prefix in the name?
The property name like "thead,gmac-syscon" looks much more suitable
since it refers to the actual property content.

-Serge(y)

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - thead,gmacapb
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@e7070000 {
> +        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
> +        reg = <0xe7070000 0x2000>;
> +        clocks = <&clk 1>, <&clk 2>;
> +        clock-names = "stmmaceth", "pclk";
> +        interrupts = <66>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        snps,fixed-burst;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,pbl = <32>;
> +        thead,gmacapb = <&gmacapb_syscon>;
> +        phy-handle = <&phy0>;
> +
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "snps,dwmac-mdio";
> +
> +            phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> -- 
> 2.40.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
