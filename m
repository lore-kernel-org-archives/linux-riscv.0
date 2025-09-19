Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7276ACAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ua1o0NM6HweAI7hNBmcEUtPe/xi1kB7od5uWdSAAaM=; b=thzNThlsos9m1B
	sKl/gac6scdbeSPEGcq3gSTOWn5z5uWHv9eZdvriGdG6uBxxUqkfAcwio0DjTJz1Ss6ZbwWyohkxS
	6tJyCSXXe+VNd/p6rlImU0uHexjBc/vH917gWw5B4TIxQpy4obImNVVLL5aLQ+DynHT4uiHNdRVfu
	5vLFcuRfxYMXGewJui4oXpk7GtZ3TL8r0Lvq9DLubPtNcmeSybwDgfBkdRvS6v2EdC0cXYH/Yq+mw
	R4EUlpicR0CoUOj2Ubd7ABOFxN6SdY2jcu5PQ/GtMm/6+rBdyOemWf/cvouFaleuhLjwZqDt7rnGE
	7VekoWToOWRb88PoDhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhUi-00000003yEJ-3zH2;
	Fri, 19 Sep 2025 20:14:12 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhUf-00000003yDD-03Ny
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 20:14:10 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-42401f30515so14128535ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758312848; x=1758917648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laoMcSCfK07azaBjCslDo0m3+R/kL+S83GK1yKfDxF8=;
        b=uLU3/IefiAuxuppcDhN1Y9GrneppiaB+ucJaGaKsuJNSiolCGKAyW+fuihYoux88ik
         N+a9YqrT+6Sovz33zL/3i8h4gaNGvYnN11ZPw06Wp2TyYubuYH7RiCoHgKr+N35ji55j
         ZyJNZ3fexvc34zWqfRuMZXZUZuRnS1WOmUL/EYt5yrEbHml6xnYuThajqIHcsU4w1uJq
         rQAnvDs5UWI6Wx4RtymqdG5pfimOVwCu/I45YzYuVjvWc4aZaoqsirD+a/Ijky2Sqhn2
         H72tgZZVtw+VFzOvlFKl2c4f8Barfj0GxrDbY4zI5HV8alil9xVWIyPnjs8lYJupdAPh
         HXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758312848; x=1758917648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laoMcSCfK07azaBjCslDo0m3+R/kL+S83GK1yKfDxF8=;
        b=J1mcXbqEI+2IyFQdj2u6qTy+gZ30RJXrLQ8FaRpbm2g6ESGkvrP0MBZhXD1iL9YUw0
         VkzrvbUxOONuPdZ3CY+D6faY6e5qVP9Oxhu/tJROzMrBeA71RStxr+z60p4skoWSH9jV
         yfKQq/eO9Yecp1N10YlN/4FsueiqYOEvHrYC0uOgcEWVppECksRj9NA3DnEbmqPDIfaa
         grb2zD9HD2Z2m0N9f0E2mTd7UIbeETnf9gSrLT5JoHXDpHQ9x1kiUifj5P+i2TNVqLZY
         6YbVaPTBh4fhscsuTZG80vIz/23WTR8Cvee68qe0M+rlorA9EYWKDifmqS6/2byNptXW
         QjAA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMufgxPoDPhGm4J9yw8xvp8iGRSy8CM7aVm6fVSFv4m1g4AAjDIJm5QOJ/TNHcxLiPSV0QwMmbPz4gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJvdLJ6zzXuFTPvzyojfT/10l5y4lvNoylOLJoLw5u4SMQbvYi
	ujCGN9+4IGfCKoEe40najx8MaaXFfuvzL3P+LzXFvxYWOZg05gAiLen7o8au1lm25QA=
X-Gm-Gg: ASbGncs5f1Ej6CqasfHcztd+hnOPFCGxxMRvb+Z0eg4meKXEYETTczOo6O3FWiKc8aA
	AVxMOFVrAMhIiqfdhuyBV4FUssIdEp+9ceLGT833AeGu7nlDaEHUiU4I2X0/bBOEogyqbJEGPsH
	miwaHtl7DSuxztZY0zrYs8Aa5TRyhyL2Z1bSEWooJaV+BuWdIgoOxo6CId6Zc/EHG7dF8WykeDm
	qtohhj78Dn3Gvb6RwzAPC2Sv+aLALR9LiWlqqpTOpY2qxzmXq/6TAljQlowfoztDRDUTgst5qfl
	ygk2vmeLMxup4qzMlsig8JhpVo2vFv3U2mO4rjklnBiRk04stgVvpiNyV3iVlYKSKzVPYl9C0/h
	6v4GHTaXK4KO4IhljXVAQ8ngiZTme3IVoyEh4SR4/HtxknU/LQR7kBjJrNftmYA==
X-Google-Smtp-Source: AGHT+IF/1Bf6FjG2s85ZEcZvlS57Mzf5kDdUZySVUGALWKCNyJGWzPVLZfqNWOxGh/9d2jvI0LV4rw==
X-Received: by 2002:a05:6e02:2163:b0:424:2c9:26b5 with SMTP id e9e14a558f8ab-42441af5e02mr127967325ab.9.1758312847889;
        Fri, 19 Sep 2025 13:14:07 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d5399014dsm2475887173.59.2025.09.19.13.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 13:14:07 -0700 (PDT)
Message-ID: <804ea57f-699f-41cc-a27c-844f107e627f@riscstar.com>
Date: Fri, 19 Sep 2025 15:14:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
 johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-4-elder@riscstar.com>
 <tmdq6iut5z2bzemduovvyarya6ho2lwlxvvqqhazw6dnnyjpq3@72xrd2pij42h>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <tmdq6iut5z2bzemduovvyarya6ho2lwlxvvqqhazw6dnnyjpq3@72xrd2pij42h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_131409_310218_C8B267D1 
X-CRM114-Status: GOOD (  25.38  )
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

On 9/15/25 3:14 AM, Manivannan Sadhasivam wrote:
> On Wed, Aug 13, 2025 at 01:46:57PM GMT, Alex Elder wrote:
> 
> Subject should have 'pci' prefix, not 'phy'.

OK I'll update that in the next version.

>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>> new file mode 100644
>> index 0000000000000..6bcca2f91a6fd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>> @@ -0,0 +1,141 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-rc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Root Complex
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description:
>> +  The SpacemiT K1 SoC PCIe root complex controller is based on the
>> +  Synopsys DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-pcie-rc.yaml
>> +
>> +  reg:
>> +    items:
>> +      - description: DesignWare PCIe registers
>> +      - description: ATU address space
>> +      - description: PCIe configuration space
>> +      - description: Link control registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: atu
>> +      - const: config
>> +      - const: link
>> +
>> +  clocks:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) clock
>> +      - description: DWC PCIe application AXI-bus Master interface clock
>> +      - description: DWC PCIe application AXI-bus Slave interface clock.
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
>> +      - description: DWC PCIe application AXI-bus Master interface reset
>> +      - description: DWC PCIe application AXI-bus Slave interface reset.
>> +      - description: Global reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: global
>> +
>> +  interrupts-extended:
>> +    maxItems: 1
> 
> What is the purpose of this property? Is it for MSI or INTx?

It is for MSIs, which are translated into this interrupt.
I'll add a short description indicating this.

Is there a better way to represent this?

>> +
>> +  spacemit,syscon-pmu:
>> +    description:
>> +      PHandle that refers to the APMU system controller, whose
>> +      regmap is used in managing resets and link state.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  device_type:
>> +    const: pci
>> +
>> +  max-link-speed:
>> +    const: 2
> 
> Why do you need to limit it to 5 GT/s always?

It's what the hardware overview says is the speed
of the ports.
     PCIE PortA Gen2x1
     PCIE PortB Gen2x2
     PCIE PortC Gen2x2

But I think what you're asking might be "why do you
need to specify in DT that the link speed is limited".
And in that case, I realize now that it is not needed.
I will specify dw_pcie->max_link_speed to 2 before
calling dw_pcie_host_init().

If that's not what you meant, please let me know.

>> +  num-viewport:
>> +    const: 8
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - spacemit,syscon-pmu
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - device_type
>> +  - max-link-speed
> 
> Same comment as above.
> 
>> +  - bus-range
>> +  - num-viewport
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    pcie0: pcie@ca000000 {
>> +        compatible = "spacemit,k1-pcie-rc";
>> +        reg = <0x0 0xca000000 0x0 0x00001000>,
>> +              <0x0 0xca300000 0x0 0x0001ff24>,
>> +              <0x0 0x8f000000 0x0 0x00002000>,
>> +              <0x0 0xc0b20000 0x0 0x00001000>;
>> +        reg-names = "dbi",
>> +                    "atu",
>> +                    "config",
>> +                    "link";
>> +
>> +        ranges = <0x01000000 0x8f002000 0x0 0x8f002000 0x0 0x100000>,
> 
> I/O port CPU address starts from 0.

First, I'm not sure what this comment means.

But second, this ranges value (which I'm sure I just copied from
the working DTS file) somehow got munged.

I know there were other errors in this YAML file that I have
to fix, and I'll fix this too.

Thank you Mani.

					-Alex

> 
> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
