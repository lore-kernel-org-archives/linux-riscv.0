Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D4BC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZUjBXzVDthWgZhmMQk5TtATGOdec7RNXrTwkKZ7v2s=; b=sFkaHGd1LBY+4u
	tcF4INZ0t0brOIBSApnMnT+rZicrgRvtWC/+emaTMxUVZJYyOEy9eqeu6hsOaA3aBiXdV+zkPJtZ1
	xWD53UpV/f1/0l624YdvgEMbZ1nN+0DW6zatZKouN6crcTA6237WQD3mgqsHSmMhE8zyupgyDVqP6
	kpU7E1kQ8ZKH1HINgrvZSXDxNTY1L4y/7THkNNoD0W3EZoVm3seQga/oq8keM0jZVUPd/wM7kEmnd
	Ae0DPzwRztwYFOk8AsBwZAzUe1Y+qDrmw9x63y1c8Ys/5eQKPkq/BQsQqqsvSsr43Zv6ag0deDvv9
	3zFUSYfFM+LL5QRa6hEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5cQ-001Wty-0Y;
	Fri, 17 Mar 2023 08:39:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5cN-001Wsl-16
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 08:39:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id er8so5691037edb.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 01:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EomA/n20CDkYUZt9tuM0ynxqq+YecAeDoRjuMt6INc=;
        b=vaTOc9LH+cgYLqY/Rz77mcA4ZJWgSa001RXDNFebWbrvOMPdPznT7zAb6TnMDY4Vyr
         Nlw1gvG7zdomDE728zHu65C2GZs3dVyYh5TcTvEgK6r2hG5VIPnH2BlIxgrhfl7arkPH
         bx1/o+OOUbWh541mcbCTVAMpncadXVlwEA9L82v9luOwVO9O+7WrBHz2zw4H0e/ZkA8m
         utgXErJ2DQh3+t6OxeOgVWfPaDtxbuUUdSqewUe290atzi9Y3dsVP1DiSdGreX7EV1mE
         A4mm2ZpXTMRPhEmue+RRLHBRQA8F2WJY4VXGIDkxDQg605ENdtwgHJV0Oor0AeOhrPH2
         +ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EomA/n20CDkYUZt9tuM0ynxqq+YecAeDoRjuMt6INc=;
        b=T7/8GIH6EuP9Q4CC0lSlWesA/KWzQgTTArullWeUO99AFbjYPMQ6Os+XiTkOQV4h0l
         dKne6blcc89U5emqZIPS7lzdWub2ylZlzBDnfQX5ADs17TD+NHtCcM9XZ/2uAcI5Z2oC
         DHtP5i2CaLIALksQadrF7rM/j1G9Dwy7hnn6kHjOw4XeS5Tw31teIu57qhMJiSXuJNZh
         40qJQO19LTO4WXNg0hpyM36A6FP0P8129r33qGCQI5ytWTkYw9ty3LcJn65jUVmzzkUG
         gzArB0gQ4I0Lj+0WTuuEHz+EO3TwzNByU5WSG2ANo3T/FlO8A8QNNiYdA0fRlil7XR1J
         mj4Q==
X-Gm-Message-State: AO0yUKWrUZx7U+byR0Lwj06lSlMoi4894IPAQZSR0HMxT29BYKmHDg0O
	gkInZA2xa8Vku6BWZykTIT8tCg==
X-Google-Smtp-Source: AK7set9abg8fHSCfxU3N0o6BHt3OijsaEDSIA5zOwAbtKTKRYcKlml4Ijs9Yr5PZKkZvc+5L3W0kBA==
X-Received: by 2002:a17:907:b021:b0:92f:b8d0:746c with SMTP id fu33-20020a170907b02100b0092fb8d0746cmr5663825ejc.20.1679042357510;
        Fri, 17 Mar 2023 01:39:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906094a00b008cafeec917dsm701864ejd.101.2023.03.17.01.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:39:16 -0700 (PDT)
Message-ID: <f7752f68-11a6-cbf4-2f28-1de4c7ff9da2@linaro.org>
Date: Fri, 17 Mar 2023 09:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add StarFive JH7110 USB/PCIe
 document
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-2-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315104411.73614-2-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_013919_389494_355BF542 
X-CRM114-Status: GOOD (  15.80  )
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

On 15/03/2023 11:44, Minda Chen wrote:
> Add StarFive JH7110 SoC USB 2.0/3.0 and PCIe 2.0 PHY dt-binding.
> PCIe 2.0 phy can use as USB 3.0 PHY.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../phy/starfive,jh7110-usb-pcie-phy.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
> new file mode 100644
> index 000000000000..aa1c3fe93100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-pcie-phy.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-usb-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive USB 2.0 and PCIe 2.0 PHY
> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7110-usb-phy
> +      - starfive,jh7110-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: usb 125m clock
> +      - description: app 125m clock
> +
> +  clock-names:
> +    items:
> +      - const: 125m
> +      - const: app_125
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +

It seems pci phy does not take these clocks, thus you should have
allOf:if:then which will customize it per variant. Otherwise binding is
incorrect for the pci.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@10200000 {
> +      compatible = "starfive,jh7110-usb-phy";
> +      reg = <0x10200000 0x10000>;
> +      clocks = <&syscrg 95>,
> +               <&stgcrg 6>;
> +      clock-names = "125m", "app_125";
> +      #phy-cells = <0>;
> +    };
> +
> +    phy@10210000 {
> +      compatible = "starfive,jh7110-pcie-phy";
> +      reg = <0x10210000 0x10000>;
> +      #phy-cells = <0>;
> +    };
> +
> +    phy@10220000 {
> +      compatible = "starfive,jh7110-pcie-phy";
> +      reg = <0x10220000 0x10000>;
> +      #phy-cells = <0>;
> +    };

Drop duplicated examples. Keep usb and maybe one phy.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
