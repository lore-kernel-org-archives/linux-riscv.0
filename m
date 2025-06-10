Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F04C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HstoxzL1WTa2D7PPay51jfK3KmkndSxyKs5uCm0urM=; b=4gzhBXZ/BvAUi/
	5N6hBMORC0IsR8GNBTZrGdN1Get57L6F7+A/AF61Bg0PsyHbtuEQcoCotS4Fni8EmOV/ubDatMEiC
	AkawpNmwaIg205qKPllKqNKHLDca/RQBWYf6X84wETYLxcZdrv/4h+5iM2UYufd/Mqg6QtgvgxiOd
	0APcaMaftNT6wNLs9GW0yXRBsxGx5jPKl/vFhOoukjNXKOq7VOC7WlKtAG84qllSVVN4Mff6NOmgv
	aPygciLj+eS9F5+d5VmQz3sGre7u6xhTBjr6vt6Zuon4pIqc9nyzJJ0smq5tyf/XQxmJ86mcvChYW
	OAjRUWOsv2tmCO1Ch87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7me-00000008HEf-0qn6;
	Tue, 10 Jun 2025 22:49:32 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP56Y-00000007yrq-0uXy
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 19:57:56 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3db7b3de375so49284825ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1749585472; x=1750190272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8arP5MQ8o2r6kwstCGi8yYOLU/0CwgGbynmW/R6CU1w=;
        b=OqUuJxipXBNGiSpkXXsSU28r/oOXpO8OSmgNa96xRghhOjJgOsmyLTL7iCzPFFsA3f
         WsEgBFMjen+fLZPnR/ETaq2ckseIldZKou325ZxSFYSWVBOzBwNeeVq00hHYLPbcfA7t
         iKrvMyHs079Xpm/SbwQ+m8q8MmYO96ZIvpjA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585472; x=1750190272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8arP5MQ8o2r6kwstCGi8yYOLU/0CwgGbynmW/R6CU1w=;
        b=K8Njn4EFnSrxrl0R8bqZaxdgzpV6gQVE9pLs4s7N4UCmXn0+19NQnf/i1V81cT506I
         j6pfNm//TJy9TVYk3KEb1kFSLuAv/iiIsqq6YvSLqT//0swybjnykqATQSHUThF1l3w2
         lB1fwEIkytzkVKsFVStliAVM7lmvOeWj9kU7c5tl3CYfVc2Zxb5MdsJM4cjo0la71bp2
         eLxa+0wgPsoa3Epz4/B7mmu1wJNnh9UbM/mllMzwqD+VAW42DR6H3U7ARBp3PwmGcWFI
         VUntKOnj3N6i2MSFzhE/gn9pQnbmIe4usxJVd9JIgQNp2a3YWAxZb3aIjCehBD5bw1NG
         eVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW/7+tbPZr7OSheGd2JLeBOh4fqzz2PghYhhHtiS0ZkyHMN41y0oAALJkuUZN8gPypnDU6KwDHBx0avA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAHU2R5ltTKHpr+PVC+woL1xl5Cs6uWB8u7va8poEbH/LyOUu0
	7VB7Lr8Jt1RaLoskItzfFA1uS0YTuJClsX97vF9hQA/AjQsys0E5C9Lws8wsPyD7GLdxzW9xyj+
	AP2Y=
X-Gm-Gg: ASbGnctdtbOyduqueP93tR9Nh4iFQQXN5UWqCyNJuCBNZEGm2PwV2k3+Z39Uxx5iRC0
	yiBx3GY3eenUV6YE1TudPezshlKSHKW5ivNcFHlum+vZ9ezPzEl3ibCsKInb6afdnjHmA9QmSZa
	g8RpZL0GZ0IdSwZn8GCo5bmCjaR1U/8b2yiahZ/8N/JidVpKP6CGALkKbPg+QUexAWw1u0D5EIY
	gDDAclrtLFA6hu6bwy+/1rwVZx0qSpGATasdXYgkxCeShrl8k9cjDlcx8uev6Y6sJJOX2QG/CwV
	rdP4jPdtzhxR+HaNPGByWDuoVRA2YgxMASP81JLsq7IDa+5//KhCc9RxkFdmEaYDCeh0kJmG+GZ
	7tlhM8If65j+bWhO80AAE
X-Google-Smtp-Source: AGHT+IHA9PT4YsWq3Yi8UtnOBccsoGJ8i5Yqo7UNIrwpHrqWTEgWuM/Hzq+BjXEkalsT57ohB6FBsg==
X-Received: by 2002:a05:6e02:1528:b0:3dc:8109:d64b with SMTP id e9e14a558f8ab-3ddf4d54d2amr367215ab.5.1749585471672;
        Tue, 10 Jun 2025 12:57:51 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5012aaa2869sm52955173.69.2025.06.10.12.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:57:50 -0700 (PDT)
Message-ID: <5084a99a-9140-4c4f-9873-f5478f48a49d@ieee.org>
Date: Tue, 10 Jun 2025 14:57:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junzhong Pan <junzhong.pan@spacemit.com>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
 <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_125754_287484_E1FC33B3 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/27/25 7:01 AM, Ze Huang wrote:
> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
> 
> PCIe portA and USB3 controller share this phy, only one of them can work
> at any given application scenario.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
> Signed-off-by: Junzhong Pan <junzhong.pan@spacemit.com>
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

This PHY has an interaction with PCIe port A.

In practice this PHY is only used for USB 3.0 (not PCIe).

However I am told that only the PHY used for port A is capable
of performing a resistor termination/tuning process (not ports
B and C).  As a result, the PCIe driver needs this process to
complete on the PHY for port A; it can then read the port A TX
and RX calibration values (4 bits each).  It uses these values
to configure the PHYs for ports B and C.

For this reason, this PHY code (and binding) should not be
merged until we are sure that the solution will also satisfy
these PCIe requirements.

					-Alex


> ---
>   .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..93f7a3bb06bba380def77f87f6db0184af26e9e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 PCIe/USB3 Combo PHY
> +
> +maintainers:
> +  - Ze Huang <huangze9015@gmail.com>
> +
> +description:
> +  Combo PHY on SpacemiT K1 SoC. PCIe port A and USB3 controller share this
> +  phy, only one of PCIe port A and USB3 port can work at any given application
> +  scenario.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-combphy
> +
> +  reg:
> +    items:
> +      - description: PHY control registers
> +      - description: PCIe/USB3 mode selection register
> +
> +  reg-names:
> +    items:
> +      - const: ctrl
> +      - const: sel
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      Indicates the PHY mode to select. The value determines whether the PHY
> +      operates in PCIe or USB3 mode.
> +
> +  spacemit,lfps-threshold:
> +    description:
> +      Controls the LFPS signal detection threshold, affects polling.LFPS
> +      handshake. Lower the threshold when core voltage rises.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 0xff
> +
> +  spacemit,rx-always-on:
> +    description:
> +      Affects RX.detect, enhance compatibility of some DFPs in device mode but
> +      increase power consumption.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@c0b10000 {
> +        compatible = "spacemit,k1-combphy";
> +        reg = <0xc0b10000 0x800>,
> +              <0xd4282910 0x400>;
> +        reg-names = "ctrl", "sel";
> +        resets = <&syscon_apmu 19>;
> +        #phy-cells = <1>;
> +    };
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
