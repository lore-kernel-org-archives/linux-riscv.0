Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7EAC00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouuEdDcROEm3ZaRKQAHYr0+EH9VfZa9AdtrMF6snVjM=; b=a2IfjrKiipQ4Aa
	OSi9y+SohyoJbLhSw/747X269zWrHfnnxIRULanzJUGCF4qvTIF5CC8tvMXMODMvjRKCOLU42jZz1
	QX6kdpG7QwqvQyB5IiMHRFv51YtEyuh+J090Wr7ObKc3hjkJphwOVBnndoxiK+zZQzdtiTwUC03ly
	mKNWHHwZc13sD9vMHE43XRZVMnkIp5W8Y9uaP0LQVCqmMD3htu/jg3Mm+eHY/dHmukxfwvk8eLyKD
	aPo2nmtA+/tOJFeENy2lpSi3JJ/bHkOG8ieBrJPJBSFuPCSmp2jLHYWq4AhNbuoeLuQs9K/6Fe7c0
	4njZxQTtNHGWQbFYp1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGYi-009l8I-2l;
	Tue, 24 Oct 2023 12:30:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGYe-009l6p-36
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 12:30:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso32387355e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698150649; x=1698755449; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mdCVirhLaj7utc9tDrYryE3Zvt1KPzYcMEaRPGjcb8=;
        b=M23sLn26TXtAbP4IFgvGnHdgMcbU4RXZ2jqONPN6LQYdUVSBPKoeZ06IqOzbEjO0zZ
         8uu+7vocVRZt9MVjqxWTJc3gko0W3hPVmo0pQWBTaJm42WPOhNmy00B7gaZ54A0V3/9Y
         0a5zoWkAd2qZqTvoFA+jZEAHKUNTT5j2puj1KRwbC2V2V73e6Z1258v1UtYPHfAiXz0k
         QEpJTTcR03d4UpsNbLXDY5Lp71Gm11q+jxhkjKOoqn1VRfM3XDn+anEhUMvjvp80lQlN
         M0LwcHG+IIztH/SNFPmdhh1dIIphT+M2kPROHfGSs6j6jW+TqxRCpVoaXAoDsZVbfinn
         uC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698150649; x=1698755449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mdCVirhLaj7utc9tDrYryE3Zvt1KPzYcMEaRPGjcb8=;
        b=VeqygxiTgwHrdhqc/RkNB1UMJ859VhV5qPHbK0BF7tZRoC86aeKmXr73q2kO6vuXmv
         uwr0k12/Y3tCMddwbfg0e4biLQDXzgwBOIeq6ME4RfgZLsezuAEcoS0wck4A0+1HvfHT
         JVfXHf5Zq0g+rwtxpDiv3h9/kyfk+ygxkUlTqK6SYXzCeyVxxMgUvtEKw7byVtUcJkdy
         JaHGrnpo2EGvaT7AMLLfxTxpr4dO8PfrbLiq8jyyAATCWy0dBZLsNIInjydALRgS+dHX
         bxXHTe8xYGB42g4GqVZ834Ql3Z92+uVCyj7/ZsYVDgYKrYFaEuaF9kOuEJ9xr7i8WODX
         RVzQ==
X-Gm-Message-State: AOJu0YzbuUTS1C4xZfb0CdqYHzTyOk9aSl5MpFHKevI4yw8vT24q7pE3
	TcjnPKdRUdYIMuRLbQHtdtyxVQ==
X-Google-Smtp-Source: AGHT+IFnp+At+nxS2NnS+eEjoLejQO3kWO0TDUDuNNURJgUw7rE9TgEpE45LgJMcSSxtfNwvla80Ew==
X-Received: by 2002:a05:600c:3583:b0:408:4095:6f0c with SMTP id p3-20020a05600c358300b0040840956f0cmr10012487wmq.38.1698150648998;
        Tue, 24 Oct 2023 05:30:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600c3d0900b003feae747ff2sm16869390wmb.35.2023.10.24.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 05:30:48 -0700 (PDT)
Date: Tue, 24 Oct 2023 14:30:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 06/14] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Message-ID: <20231024-c57e7349131ee8c81bea9c07@orel>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023172800.315343-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_053052_995552_D88D6261 
X-CRM114-Status: GOOD (  29.09  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23, 2023 at 10:57:52PM +0530, Anup Patel wrote:
> We add DT bindings document for the RISC-V incoming MSI controller
> (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../interrupt-controller/riscv,imsics.yaml    | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> new file mode 100644
> index 000000000000..84976f17a4a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> @@ -0,0 +1,172 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Incoming MSI Controller (IMSIC)
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> +
> +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> +  for each privilege level (machine or supervisor). The configuration of
> +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO

an IMSIC

> +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> +  fixed number of interrupt identities (to distinguish MSIs from devices)
> +  which is same for given privilege level across CPUs (or HARTs).

which is the same for a given

> +
> +  The device tree of a RISC-V platform will have one IMSIC device tree node
> +  for each privilege level (machine or supervisor) which collectively describe
> +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).

s/at that privilege level/for their respective privilege levels/

> +
> +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC

An IMSIC

> +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given

an IMSIC interrupt file at a given

> +  privilege level (machine or supervisor) encodes group index, HART index,
> +  and guest index (shown below).
> +
> +  XLEN-1            > (HART Index MSB)                  12    0
> +  |                  |                                  |     |
> +  -------------------------------------------------------------
> +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> +  -------------------------------------------------------------
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qemu,imsics
> +      - const: riscv,imsics
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      Base address of each IMSIC group.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  msi-controller: true
> +
> +  "#msi-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      This property represents the set of CPUs (or HARTs) for which given

which a given

> +      device tree node describes the IMSIC interrupt files. Each node pointed
> +      to should be a riscv,cpu-intc node, which has a CPU node (i.e. RISC-V
> +      HART) as parent.

as its parent

> +
> +  riscv,num-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Number of interrupt identities supported by IMSIC interrupt file.

by an IMSIC interrupt file

> +
> +  riscv,num-guest-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Number of interrupt identities are supported by IMSIC guest interrupt

which are supported by an IMSIC guest interrupt file

> +      file. When not specified it is assumed to be same as specified by the

the same

> +      riscv,num-ids property.
> +
> +  riscv,guest-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +    description:
> +      Number of guest index bits in the MSI target address.
> +
> +  riscv,hart-index-bits:
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Number of HART index bits in the MSI target address. When not
> +      specified it is calculated based on the interrupts-extended property.
> +
> +  riscv,group-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +    description:
> +      Number of group index bits in the MSI target address.
> +
> +  riscv,group-index-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 55
> +    default: 24
> +    description:
> +      The least significant bit position of the group index bits in the
> +      MSI target address.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - msi-controller
> +  - "#msi-cells"
> +  - interrupts-extended
> +  - riscv,num-ids
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (Machine-level IMSIC files with just one group):
> +
> +    interrupt-controller@24000000 {
> +      compatible = "qemu,imsics", "riscv,imsics";
> +      interrupts-extended = <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg = <0x28000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +      msi-controller;
> +      #msi-cells = <0>;
> +      riscv,num-ids = <127>;
> +    };
> +
> +  - |
> +    // Example 2 (Supervisor-level IMSIC files with two groups):
> +
> +    interrupt-controller@28000000 {
> +      compatible = "qemu,imsics", "riscv,imsics";
> +      interrupts-extended = <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>,
> +                            <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
> +            <0x29000000 0x2000>; /* Group1 IMSICs */
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +      msi-controller;
> +      #msi-cells = <0>;
> +      riscv,num-ids = <127>;
> +      riscv,group-index-bits = <1>;
> +      riscv,group-index-shift = <24>;
> +    };
> +...
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
