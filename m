Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7D1CD8CB9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiKIWdI/jxvg2P/R6aWWk9NN3wcvX/oKg9Ib9FAuAiI=; b=PHdiuSJIRoIueR
	oRdY0qzEzOOyjqtzdN1PRLo5ieCfAXxTEnrKsa2nUtuzE+yJQX6tob7Lgs4ZRR9Wgn1rpabTCBSrl
	FYCoxykdeIwcxRurHpZ8b3RJALchttQ/4Aa/s+56kJnCIRJuf6JfLLXOAkYYrCgWyuZ2hr3MZQZYh
	Uc0wL8a0+GgxORkV7IsIJUp6jat6NWuCt/hFVeZ2R+cCYnDRk0/ahQADObdQpVxVAkOxVXvtFVDkI
	oWN2er0pbrLQze7itwZDIpheYZ2dw/+sGjICyn/STiO7HgECVTN3ybGabG09mT+Ndhx/5qbvndVKI
	sdBKr2vSufrvHtViWRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz30-000000060KJ-3PES;
	Tue, 09 Jun 2026 16:11:26 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz2x-000000060JD-3aIB
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 16:11:25 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-485ecc0f2dfso4435823b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021483; x=1781626283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1jWZCzmLm9wzBxE++FfHpmTEYKEQ9CFhlrClkcQyz0=;
        b=H3ufjC7DVvJ/U9b14zUYOpaSbdExezoINNb2Bah2RzNayjp3fnIZMVoLJtEywcXGR7
         MbpikR/UsZeLNRKqdS/IzLfzlWq0H3jzUAVc5aeuSwf5tX1I61omBuBsKf9R5JgctNjh
         wxsjo1ARSweL0WkmT7JupC4ysZ5xRAuoDax6Xnpce5Hi+3wr3uA0yMoMjwhZ1SCrg6qn
         5vQUlMngzCP4r0BY9z98gWOh4/jc3z8oBx/voVchYQZB/N+V2Ns4ifoEsonFklMTpA5Q
         BjV/UKt2eRfXtDdmmmSUCGpRM2f7wDyb0WJR3tqSMBXR0uKZDeuMKxXKDL6pPSeYcL1q
         FGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021483; x=1781626283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1jWZCzmLm9wzBxE++FfHpmTEYKEQ9CFhlrClkcQyz0=;
        b=FFV+Eha/TVd9t8iJWBQwPFq8H0VPFL3f/Wa93ATlvZJHYdSuQiwIifyS7bx8AadAvc
         HfUroCASArz0bXVdL1OSHBlPrFxfVWvMbS+GpPh5Zeb3FmN4Np+jK9RAGqVPpKuCCnrK
         srlr9Gne7TeZx/aVXU7TaLLGUZ6vFs3cE3LyxSkffaBdTEiQlIzKjoMqPITXLFvF7BKs
         NRo0OjVr4fV3bFMwJGj4jVPXNyTY7cCxnaOE+GcxsW8Ze4CwUgaUSPcUUoKfwCSuX3SO
         kl6Fov6vTqeUVmXRypySkf6Cp1zVB9z+64hWAxhqer0In0GZpeUdU35E0J8zX+crO6fZ
         9o1g==
X-Forwarded-Encrypted: i=1; AFNElJ/3Ms8s6GDT8c+HPn/cu9ZRKGL1YiPWSLDFGhUbHfazrvY4IqQ4svaDvpxLzUPxX1orBr4xwWMu4sk51A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGoEnNO/6gk5n9KkeKrk6aatS1pUptp4PgTjGrW/CKnOeJdz3h
	Q5ooa9kl7kD2IvL45WCd2mEI3WSHRViqIldeo5sswu6keUnNP5TghhWsFIXE8BSd1WM=
X-Gm-Gg: Acq92OHgtxkznXmRqv0GroVHOlanhSiIxhoZGWzB+Gvr43/LkcJplqjPG5Q0KxnosS4
	NMBdjM/kj+s9Yh4Dkkme3TlrBKaOxVdem/B3lpL7cruMLqnq4FPOB6UNxS8HWRE7j8zwqMlDgo1
	hD74b5Xx4g/DEP8hSSSIKT4ht/zTtoalPLpJTAlaBss0H9ELPjW1v8XX6WsBMqq0k6BdztDgdSZ
	NBYB8EVM6G/5d9bO0vj3CS2YlAOdxCI/mQg9bbwEN0kf0rIpv9F84QjPnG75cPzKwTvSUx+kb+8
	AoOHL3LlhOkCgKM9I4e4Fmmvj9UVkUFRH+1MYD/uedRv/6TCaA1ZXaF54gnpWhvLlDzDvI3T/jm
	z1BKWdOuIqt/beq3I+yzi+1vcLPt/aNqOtkNTGExwUT1v38EY+Clm2KOWoGwKdgtp4aEyKovVcn
	KTr5yrDNIxjFq9bc88+idwmOfXJgxR+QWVbQ==
X-Received: by 2002:a05:6808:251a:b0:464:3d5d:d9d4 with SMTP id 5614622812f47-4868df031d7mr13579710b6e.39.1781021482752;
        Tue, 09 Jun 2026 09:11:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:22 -0700 (PDT)
Message-ID: <8010bb91-77e1-42b4-9f19-d9e70e385d00@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-5-inochiama@gmail.com>
 <kwan2ci7umcckod2623tt2ebwaz6v7ypczz3bqmhfxc6awrkfc@jrjf73wzehcc>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <kwan2ci7umcckod2623tt2ebwaz6v7ypczz3bqmhfxc6awrkfc@jrjf73wzehcc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_091123_918532_61D7E44B 
X-CRM114-Status: GOOD (  20.41  )
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

On 6/9/26 9:03 AM, Manivannan Sadhasivam wrote:
> On Sun, May 17, 2026 at 09:48:39AM +0800, Inochi Amaoto wrote:
>> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
>> This controller is almost a standard Synopsys DesignWare PCIe IP,
>> with some extra link and reset state control.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Why can't you reuse the existing spacemit,k1-pcie-host.yaml binding? I see very
> few differences which could be added using conditionals. Also, this binding
> defines the PHY property in the controller node, which is a way backwards as we
> now prefer to define these in Root Port node as spacemit,k1-pcie-host.yaml does.

I agree.  I have another couple of comments below, including several
things that just point out what's the same and what's different.

					-Alex

> 
> - Mani
> 
>> ---
>>   .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>> new file mode 100644
>> index 000000000000..46147a37a9ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K3 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Inochi Amaoto <inochiama@gmail.com>

If you would like to maintain the (common) SpacemiT K1 host
controller binding I'd be OK with that.

>> +
>> +description:
>> +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP. The controller uses the external MSI interrupt
>> +  controller.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k3-pcie
>> +
>> +  reg:
>> +    items:
>> +      - description: DesignWare PCIe registers
>> +      - description: Data Bus Interface (DBI) shadow registers

The above is new (different from K1), as is "dbi2" as its name.

>> +      - description: ATU address space
>> +      - description: PCIe configuration space
>> +      - description: Link control registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: dbi2
>> +      - const: atu
>> +      - const: config
>> +      - const: link
>> +
>> +  clocks:

Clocks and resets are the same as K1.

>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) clock
>> +      - description: DWC PCIe application AXI-bus master interface clock
>> +      - description: DWC PCIe application AXI-bus slave interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  resets:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) reset
>> +      - description: DWC PCIe application AXI-bus master interface reset
>> +      - description: DWC PCIe application AXI-bus slave interface reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  msi-parent: true

msi-parent and phys are not present in the K1 binding.

>> +
>> +  phys:
>> +    description:
>> +      PHY phandle from the Combo PHY, the lane number does not depends
>> +      on this, since the number of lanes provided by Combo PHY can be
>> +      1 or 2.
>> +    minItems: 1
>> +    maxItems: 6
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 6
>> +

The following property is the same as K1.

>> +  spacemit,apmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle that refers to the APMU system controller, whose regmap is
>> +      used in managing resets and link state, along with and offset of its
>> +      reset control register.
>> +    items:
>> +      - items:
>> +          - description: phandle to APMU system controller
>> +          - description: register offset
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - msi-parent
>> +  - spacemit,apmu
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      pcie@80000000 {
>> +        compatible = "spacemit,k3-pcie";
>> +        reg = <0x0  0x80000000 0x0 0x00001000>,
>> +              <0x0  0x80100000 0x0 0x00001000>,
>> +              <0x0  0x80300000 0x0 0x00003f20>,
>> +              <0x11 0x00000000 0x0 0x00010000>,
>> +              <0x0  0x82900000 0x0 0x00001000>;
>> +        reg-names = "dbi", "dbi2", "atu", "config", "link";
>> +        device_type = "pci";
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        clocks = <&syscon_apmu 89>,
>> +                 <&syscon_apmu 56>,
>> +                 <&syscon_apmu 57>;
>> +        clock-names = "dbi", "mstr", "slv";
>> +        msi-parent = <&simsic>;
>> +        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
>> +                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
>> +                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
>> +        resets = <&syscon_apmu 76>,
>> +                 <&syscon_apmu 78>,
>> +                 <&syscon_apmu 77>;
>> +        reset-names = "dbi", "mstr", "slv";
>> +        linux,pci-domain = <0>;
>> +        spacemit,apmu = <&syscon_apmu 0x1f0>;
>> +      };
>> +    };
>> +
>> -- 
>> 2.54.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
