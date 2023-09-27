Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36635E82CCC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DXqTsinFfIJtE+tIgIUACeDqfY/s+D4m8F7VNwNsXs=; b=VaveF2zW3NFkiT
	f146P+sUeYkylhK41KMPQSVOzigvDfYCs5eygsfMopi/VlWOAoyuaW3RdwFE1twSBS4R7xomuozF4
	ui9VHakX+BSFpJ+G7UEbp4aGkzG9GImZtuPQFI6LHiGtfMYuRBnXi05qfUbxITh5uFe3A1JUGdt8P
	8BIiikUDMjN9lmyf3lDrf2h/QYrmNjFxuTlbkKdGtbIBZ5EluxZU79BDcxyi+OIViCb6+iScCadzc
	B7YrqaRBasL6NNKJwynRYKCjAccE2OxmMBNUXohiiXAdLUzJjyTa2HNNGoXJ1N955QMlabQn1NxWX
	f3to+x2/65uk3C11OoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaib-001hM3-1N;
	Wed, 27 Sep 2023 20:01:09 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaiV-001hLF-2j
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 20:01:08 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-418148607c2so39569741cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 13:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695844861; x=1696449661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDVLMXBa2XfaEHREeVH6PICOgKFD+LcSP9ho+5+MSRo=;
        b=FANNJpnAF1Fubfde1DYep+tcDx4NkcKqNN56o+hJP3acm2YKN4zuTdJnfHuQu1XhvI
         Ct7dVpZcdORgQhDyT+/oavH6amUWFtdGfYKZejYL8xK5pkEAhgbTA11sc+8/3KCaaGVJ
         NCztcTOvVOxfCoUDHu5307oXVJ/FK2j32kRenDlKglLCBERIg28duRpjmNJ6O0ZxAobu
         hi8GD7ASUmm0s2bSLoNJnX1fpvUaFdY2w4njNJrAcIL5+Vhlfh5TKskcIDTHKuiTZwqS
         Bx3dCQJidrdVpCoB+bhJmj9kCv4qum2YKlbVcDrf1/c1ffdqObnJBNca7iicxGHysyKU
         FDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695844861; x=1696449661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDVLMXBa2XfaEHREeVH6PICOgKFD+LcSP9ho+5+MSRo=;
        b=iUUYo5TL5jOkox+t1mJivuKKNt1aO9RjrH8zxAShGsr4V4wsQYEjfPHY33cM3gc3A+
         xO7J7BHCfa+vy0nBLF1G5qrLYa6t84uxC46P3TGGSSpjzdxAjIBjtEFCNzwD9jSU9oPv
         0sSudhL4+HP0IsUQBI0HMOZvzMBnHek1C3disA7qqQ153iASHF7BffmRyLCog1b7ns6X
         vKPztLYORiWaROSpDBhOguohSGUKBkW/Bolw5xS1q/8dz3wqxlU2HEFedxeg2KeMnQdU
         sbFB8keIv9/mUrHbgjdZzKsIMqp1gYaO2hm3xKeGAp1qIHmtR/kvLvrQ8FeO8RMw9FX+
         C2mQ==
X-Gm-Message-State: AOJu0YxsVRsMv70WRJ53MnkLcQl68Kj4KO6nKH+p6VchWj6j1fgyoNtg
	QvWFRldTPlM5FY+fxrgq1AQdTw==
X-Google-Smtp-Source: AGHT+IESw2wqCLleqmOMMct8rcQaxMts2l4nFzmNamRccfP/nZV4TTrMJ3qu+Nurw6mbsWjhkSVjbQ==
X-Received: by 2002:ac8:5f12:0:b0:417:a74f:69b6 with SMTP id x18-20020ac85f12000000b00417a74f69b6mr2365851qta.65.1695844861069;
        Wed, 27 Sep 2023 13:01:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:40d8:421c:60ef:36d5? ([2600:1700:2000:b002:40d8:421c:60ef:36d5])
        by smtp.gmail.com with ESMTPSA id d8-20020ac81188000000b00411fcc18cc1sm5560876qtj.64.2023.09.27.13.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 13:01:00 -0700 (PDT)
Message-ID: <cf68f6f1-e405-4c20-b4e1-da04189d0e2f@sifive.com>
Date: Wed, 27 Sep 2023 15:00:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-2-jszhang@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230927164222.3505-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_130103_925916_DFD55B82 
X-CRM114-Status: GOOD (  17.80  )
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

On 2023-09-27 11:42 AM, Jisheng Zhang wrote:
> T-HEAD TH1520 platform's USB has a wrapper module around
> the DesignWare USB3 DRD controller. Add binding information doc for
> it.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> new file mode 100644
> index 000000000000..afb618eb5013
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 DWC3 USB Controller Glue
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-usb
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus_early
> +      - const: phy
> +      - const: suspend

Except for "phy", these clocks are already documented in snps,dwc3.yaml. Are
they necessary for the glue/PHY, or do they belong only in the controller node?
They are not used by the driver in patch 2. Also, the PHY clock probably belongs
with the PHY node.

> +
> +  ranges: true
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: snps,dwc3.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - ranges
> +
> +additionalProperties: false

The driver in patch 2 uses the thead,misc-sysreg and vbus-supply properties,
neither of which is documented here. Also, depending on the other bindings, the
VBUS supply should be referenced from the USB PHY or connector node, not here.

Regards,
Samuel

> +examples:
> +  - |
> +
> +    usb {
> +          compatible = "thead,th1520-usb";
> +          reg = <0xec03f000 0x1000>;
> +          clocks = <&clk 1>,
> +                   <&clk 2>,
> +                   <&clk 3>,
> +                   <&clk 4>;
> +          clock-names = "ref", "bus_early", "phy", "suspend";
> +          ranges;
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +
> +          usb@e7040000 {
> +                compatible = "snps,dwc3";
> +                reg = <0xe7040000 0x10000>;
> +                interrupts = <68>;
> +                dr_mode = "host";
> +          };
> +    };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
