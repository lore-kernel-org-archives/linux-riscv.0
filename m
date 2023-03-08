Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ECEC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhR7jrz7KDlj4Lx8+q8KpyVmqq+LEhB+j29V3o4XXyM=; b=GotI3Q6EYwcDja
	Bvxq8oCmdexPfaXxHvQYL+60lqvVeV5J+eNp6PINJ7dLk+Z/Rj68fJIj8lKk6VYKwpvbXPLdViabt
	jpSPI9NtlOM654/zEZ2iBVr7ggrb53LyoJue2vA4IM7ANwGjGN2HOqv/055JBDIpmsKbA5eH8Kb/x
	2LaFVVN8xjBnuKj/ZWISbMaNr6VNBe3D6OxoCPu6MoRXTGY06BgeJgmXN4X5HN4Sar3A0M6KuUDXp
	aVd3mYfuXR8hmNvczoV4a9Ft52e7j2YJ+j8iOBgBI2lJfWiqauWfZL+RjpH5YBWkN/9x37qR3lMet
	gaQ/by42Xsr0Q9Smtxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyHL-006KHL-2k; Wed, 08 Mar 2023 18:12:43 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyHH-006KEn-RT; Wed, 08 Mar 2023 18:12:41 +0000
Received: by mail-ot1-f53.google.com with SMTP id q11-20020a056830440b00b00693c1a62101so9487684otv.0;
        Wed, 08 Mar 2023 10:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v3Me2y7t7dCURwLEAGtEDEw0TqjC7V3ocAkq0mf58g=;
        b=Qvn1oE8XiD1294TRiktxDuCxMpiXB9SJzFS3XvVwUHr6bmfzeVU9lNcPXd2XOmulEJ
         KMUZ8qR6572cq1ArObGHyPrQLH7I+J/0PT78WLXhbPPDoGnrv+XXLwXG++2BB+Fab91d
         oMz5njjcSwGM0/UnLe2sLuNEw1cl9mIroIXHzILWeNt7Pd4tIuHDv+1wP8IfbWPyJG/5
         LMLCnB1yVlDa9DWXcgeYRAEmmnat9bD3gz+4Tfyc1zs0ml9sYrfYMgDdf4ONX/9LWXRK
         Rs0gmbS43kEe1RBlNNVhfu5zWxNV4DB8VMn8NZnk4rM0GUPypbl17Q5tmdw758fG3zhq
         D+4A==
X-Gm-Message-State: AO0yUKUoqJQkSXCTzt9Q0CQHERJaUB5PazfyfrhhqYVUSGW1bIaW86MS
	fAPUqJFLLfvqmWcDsambcA==
X-Google-Smtp-Source: AK7set+9aSSHh9EYLXwvCVkULUEr9F1S3fp5AOhM216juwlOAQ55mt9toBGuxByRpZcKPLlBVPwBlQ==
X-Received: by 2002:a05:6830:920:b0:68b:c60c:de58 with SMTP id v32-20020a056830092000b0068bc60cde58mr11918010ott.7.1678299157654;
        Wed, 08 Mar 2023 10:12:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t20-20020a056830083400b0068bbf5f2e49sm6678351ots.37.2023.03.08.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 10:12:37 -0800 (PST)
Received: (nullmailer pid 3527197 invoked by uid 1000);
	Wed, 08 Mar 2023 18:12:36 -0000
Date: Wed, 8 Mar 2023 12:12:36 -0600
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add StarFive JH7110 USB
 dt-binding
Message-ID: <20230308181236.GA3512870-robh@kernel.org>
References: <20230308082800.3008-1-minda.chen@starfivetech.com>
 <20230308082800.3008-2-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230308082800.3008-2-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_101239_911928_F1E32521 
X-CRM114-Status: GOOD (  22.58  )
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

On Wed, Mar 08, 2023 at 04:27:58PM +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC USB 3.0 phy dt-binding.
> USB controller is cadence USB 3.0 IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-usb-phy.yaml | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> new file mode 100644
> index 000000000000..daa88d065deb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml

Filename should match the compatible. The filename seems more correct 
than the compatible...

> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive USB 2.0 and 3.0 PHY
> +
> +maintainers:
> +  - Minda Chen<minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jh7110-usb

What's the USB controller called?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: usb3
> +      - const: usb2
> +
> +  clocks:
> +    items:
> +      - description: usb 125m clock
> +      - description: app 125m clock
> +      - description: lpm clock
> +      - description: stb clock
> +      - description: apb clock
> +      - description: axi clock
> +      - description: utmi apb clock
> +
> +  clock-names:
> +    items:
> +      - const: usb_125m
> +      - const: usb0_app_125
> +      - const: usb0_lpm
> +      - const: usb0_stb
> +      - const: usb0_apb
> +      - const: usb0_axi
> +      - const: usb0_utmi_apb

usb_ and usb0_ is redundant, drop.

> +
> +  resets:
> +    items:
> +      - description: USB0_PWRUP reset
> +      - description: USB0_APB reset
> +      - description: USB0_AXI reset
> +      - description: USB0_UTMI_APB reset
> +
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:

Are there multiple entries of phandle+offset because this says there 
are. You want '- items:' here to limit it to 1 phandle+offset.

> +        - description: phandle to System Register Controller sys_syscon node.
> +        - description: offset of SYS_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of SYS_SYSCONSAIF__SYSCFG register for USB.
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:

Same here.

> +        - description: phandle to System Register Controller stg_syscon node.
> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of STG_SYSCONSAIF__SYSCFG register for USB. Total 4 regsisters offset
> +      for USB.
> +
> +  dr_mode:

Usually this belongs in the controller node.

> +    description: PHY mode.
> +    enum:
> +      - host
> +      - peripheral
> +      - otg
> +
> +  "#address-cells":
> +    maximum: 2
> +
> +  "#size-cells":
> +    maximum: 2
> +
> +  ranges: true
> +
> +  starfive,usb2-only:
> +    type: boolean
> +    description: Set USB using usb 2.0 phy. Supprt USB 2.0 only

The 'maximum-speed' property in the controller should be enough. Why is 
this needed.

Being a PHY, you are missing #phy-cells.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - starfive,sys-syscon
> +  - starfive,stg-syscon
> +  - dr_mode
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      usbphy node should have '1' usb controller subnode.
> +      It could be Cadence USB3 DRD controller.
> +      Cadence USB3 should follow the bindings specified in
> +      Documentation/devicetree/bindings/usb/cdns,usb3.yaml

Why is the controller a child of the phy?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbphy@10200000 {
> +      compatible = "starfive,jh7110-usb";
> +      reg = <0x10210000 0x1000>,
> +            <0x10200000 0x1000>;
> +      reg-names = "usb3", "usb2";
> +      clocks = <&syscrg 95>,
> +               <&stgcrg 6>,
> +               <&stgcrg 4>,
> +               <&stgcrg 5>,
> +               <&stgcrg 1>,
> +               <&stgcrg 3>,
> +               <&stgcrg 2>;
> +      clock-names = "usb_125m", "usb0_app_125", "usb0_lpm",
> +                    "usb0_stb", "usb0_apb", "usb0_axi", "usb0_utmi_apb";
> +      resets = <&stgcrg 10>,
> +               <&stgcrg 8>,
> +               <&stgcrg 7>,
> +               <&stgcrg 9>;
> +      starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +      starfive,sys-syscon = <&sys_syscon 0x18>;
> +      dr_mode = "host";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      usb@10100000 {
> +        compatible = "cdns,usb3";

This needs a platform specific compatible.

> +        reg = <0x10100000 0x10000>,
> +              <0x10110000 0x10000>,
> +              <0x10120000 0x10000>;
> +        reg-names = "otg", "xhci", "dev";
> +        interrupts = <100>, <108>, <110>;
> +        interrupt-names = "host", "peripheral", "otg";
> +        phy-names = "cdns3,usb3-phy", "cnds3,usb2-phy";
> +        maximum-speed = "super-speed";
> +      };
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
