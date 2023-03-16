Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C158C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 02:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgfUWDH+Lvwx8x4z/qI2iTuOaMSnwc6ew9IRXw4Mogg=; b=ym0V1bXLCkr8IS
	REScqNsG8mDqPyONoSJRKZYofzK6IyGt5n8hkA1AsLxELTWkyEonrJcNSNhc4YCYbrSC2LfOwCYG3
	Vzc0Lv609/FmaydkrrlVxVhfWNnxBGa3hNJgChUtnSwOW2c7ZnsI53CxJLwSimcLptubWYgnVSzU8
	cnim+XyMaJrLd5NoC1USZQNgWnDU8STzkRN3InUGsocFTo6RXh1szShx3kfE+sDroiHUPu1bKe5//
	xCvYQze4TJUHsuTKfHpixIV/ygeALy/iPhhnydF7i0cwx3tuEuA/p7+4nUM1S0eo6KhVjesevBK1n
	TAmqcDhorh+HvDp195gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdb8-00F0Ww-1b;
	Thu, 16 Mar 2023 02:44:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdb4-00F0VZ-20;
	Thu, 16 Mar 2023 02:44:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2896D61ECC;
	Thu, 16 Mar 2023 02:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C67C4339B;
	Thu, 16 Mar 2023 02:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678934645;
	bh=zz9xEzT5cED6grYC5Kti2HVNH5dd+gyoAb1TyGjY9Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+ssvIi8L9ejF8JCKhqx5kqj97Dh7IXeYOQAkou+O/nNThwMNZjsBWg8Nmn5NH5Wm
	 f7L5SU1R1UAltROG4B/4VR01xbp97Xhdhgag/WXjUKHm32x/1ZzGyvLtY7YdE8QNZA
	 gg8FWGLT3CvZoFlQdbZQbgrpdXz0x8ZvFeRJ8TN97AgczUxpG3DLnccdL51hWwHTJO
	 si2PkFUBUYGVJZWyRIlpbhCoFkVatrpADRbFPaI/IbP/H9OQtJSsxi7BUlf4ZMMUdz
	 YONBvB0vZLcd20VFFBmWeP9aJ2NAX0oiW3TYL1fYH6TpFfP+pQOMPWB+T83FwDHpjd
	 9yUQ565xaRmrw==
Date: Thu, 16 Mar 2023 10:43:52 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 3/5] dt-binding: Add JH7110 USB wrapper layer doc.
Message-ID: <20230316024352.GB2322573@nchen-desktop>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-4-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315104411.73614-4-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_194406_741462_CEF73561 
X-CRM114-Status: GOOD (  17.75  )
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

On 23-03-15 18:44:09, Minda Chen wrote:
> The dt-binding doc of Cadence USBSS-DRD controller wrapper
> layer.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> new file mode 100644
> index 000000000000..b1a8dc6d7b4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-usb
> +
> +  clocks:
> +    items:
> +      - description: lpm clock
> +      - description: stb clock
> +      - description: apb clock
> +      - description: axi clock
> +      - description: utmi apb clock
> +
> +  clock-names:
> +    items:
> +      - const: lpm
> +      - const: stb
> +      - const: apb
> +      - const: axi
> +      - const: utmi_apb
> +
> +  resets:
> +    items:
> +      - description: PWRUP reset
> +      - description: APB reset
> +      - description: AXI reset
> +      - description: UTMI_APB reset
> +
> +  starfive,sys-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
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
> +  "#address-cells":
> +    maximum: 2
> +
> +  "#size-cells":
> +    maximum: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    type: object
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - resets
> +  - starfive,sys-syscon
> +  - starfive,stg-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb@10100000 {
> +      compatible = "starfive,jh7110-usb";
> +      clocks = <&syscrg 4>,
> +               <&stgcrg 5>,
> +               <&stgcrg 1>,
> +               <&stgcrg 3>,
> +               <&stgcrg 2>;
> +      clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
> +      resets = <&stgcrg 10>,
> +               <&stgcrg 8>,
> +               <&stgcrg 7>,
> +               <&stgcrg 9>;
> +      starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +      starfive,sys-syscon = <&sys_syscon 0x18>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges = <0x0 0x10100000 0x100000>;
> +
> +      usb@0 {
> +        compatible = "cdns,usb3";
> +        reg = <0x0 0x10000>,
> +              <0x10000 0x10000>,
> +              <0x20000 0x10000>;
> +        reg-names = "otg", "xhci", "dev";
> +        interrupts = <100>, <108>, <110>;
> +        interrupt-names = "host", "peripheral", "otg";
> +        maximum-speed = "super-speed";
> +        dr_mode = "host";
> +      };
> +    };
> -- 
> 2.17.1
> 

-- 

Thanks,
Peter Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
