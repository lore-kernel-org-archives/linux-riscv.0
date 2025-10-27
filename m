Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA43CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUFx7mzcO7tURcZfNBrV4XC1G62V9/9I4upxGbYXb0s=; b=fnE3tDj4+BuaPN
	XYpyq1+ln5t1gO2nA6SlpEAaQxYySxjDbQ9zxAQyjmpBBUCGyzP92kxVHhs8L8MgZ10xf8Mbj3kKq
	w2j9JKDbr+M7tiFNOWRgp0e6BQI5ysfQHzRVHPk93rSsC3HdiF5b/OtZid5Z7Wr3h+NoVNLFKBmw5
	8TK7AkE2K4LBj7JRiSjxaexbrDrLt1VQ8MGPO7kPMH/NpUwOhtIpna7CQhVdlxCU4c+hc66yx+CTX
	2iLuUb63UKOTGNv/Whjd6R/cNbP9qOHO3QfM8PM71c31ylzSZXm3S8lTD+4NzD1kD72/ok5o/w//n
	+iFhzaZZM8AutrBxstUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVdp-0000000ErTG-05cv;
	Mon, 27 Oct 2025 22:24:41 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVdl-0000000ErSH-2Ksu
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 22:24:39 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-430d4cf258fso20029865ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761603877; x=1762208677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wM5uwMP02IQy2fgQls6S0qQat4rqlu7HXn5+aaktR2Y=;
        b=eWXo2xJy5jbCdDi/tX40ne9JLlDrSmxIniDmPY71H1mrUr7OGdDHPh144K6vDKzR3q
         B0YWPAV40/7rNXMUJaR5E3TShJCTYIVKvhpinf6jf8KklpPRhri+U5TUuhxAzY2pGP0d
         HzuI4BorOoVMvjNXDIPFbMF1IELv1tqoZ0SyNWt0nFAYvpWZROLTDuo4MZm0zTXjqyMB
         wCQat3NqBs2uenCQbZ6XPC7krWMUU+RX7uL1/xQbpUbWd2a6uz019sKqcbEX1B5afNki
         fvgQcNmWnt7upmkh6sgBc7ajeL+thy8R0/dZgTIduZQjTTBBAyWbFhey/ms1N9piOCZk
         zlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603877; x=1762208677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM5uwMP02IQy2fgQls6S0qQat4rqlu7HXn5+aaktR2Y=;
        b=vxZShrN6xnwyNP2+hVmCgom9qcBFIaf4vz01pB/br/7f9LPRsvg0sOIDBujk1d5iCy
         mRwqZrsvMk80QdEhanvUIIr/5NqPp79izdJYofjcUcYmkEiwDeQlgf95+TZEY/WB9oot
         hPOqMlyrFbo8JdRP3MXLF0K7PHPDU2yoFiB0X3q0N1apouhfo9zkXKzTBuBocaen0JYP
         zmgkdfBXUv5fBAf1AlVnEY52W+yg7oXbrFg21lXToTcJOjqae6jfLtTJe8l21NY2FnGz
         2wXECrVsES5s5HvBo8qPQhdV6EuYmLTUQrP+BzZRoROomGkkqJdsYWMjqz3stoIPlL6x
         zaIw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6FR6wREgT2XPwcD+jxlAIFxMsNHE0OuJOPRcd1h1tDAxKTdombug1DG021l8+viAeyzjGG4BvEQ8Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7iUJfw1IPCITIH/SkAhneTGQfwhspCNWoZFKzwPAm40+HUShu
	yoPlTtGRVouC3cfSSPjj8O+QQFbkBlT2cBvr4aiG62SgKfddkpx5+E72wFsOAQFODEo=
X-Gm-Gg: ASbGncvFlUkRrCt7q7VNbHU3odzUM3KJALlkCRknYpAzcTVr4Hq1BeEebrjJSUMbWBW
	KwGcz5JaGhnjnPURMS985KRWHgMowW0shqge0vUSkRAG2hJX6GWignlTe+TaqT/9BibX/hATzAG
	89TV89DHtWJrNqLOuWX5pju3sECG3+igEaM6VP+KTuaqddQHX4KWCpZ4lAprfds500rLYXsO4jM
	RZmjLg5s29LTOutAp/2ojjyHweiggONHqoL4ESXAq7lgZl7e0qIL0TjfJVFW8efznkKFXVvTf1X
	2jzjtzrmT/X9KmPclptHTn826rhUpu0GaD44P6U+iU4DUQaGHvwVBYJMiarNwaTZatCopVBJx8c
	EzGVCO8Hr9swv0HQViDnGB+Qkw/aMyNed9UPWnGB40tWugLHBmc15nIK+3TvEc6chjlmkTfbfUH
	6JGcZmRzDiYJT9us1jv2IWJEP7AG8YycUcRxntL9XxYspBFhRX6Z4=
X-Google-Smtp-Source: AGHT+IEJrN3+Xz84SulzDfIciOJjJZgogpTlOlzimDxgN5DQZNhrRyWMLSpNLPzrSBpfR6FKNexDlA==
X-Received: by 2002:a05:6e02:348f:b0:430:9bc3:e1d3 with SMTP id e9e14a558f8ab-4320f7be914mr26591695ab.12.1761603876603;
        Mon, 27 Oct 2025 15:24:36 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f67dcb0csm35005605ab.5.2025.10.27.15.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 15:24:36 -0700 (PDT)
Message-ID: <ae92d3f4-5131-46be-b9b1-e8ec437c9ae9@riscstar.com>
Date: Mon, 27 Oct 2025 17:24:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com>
 <u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152437_850313_7B1312D0 
X-CRM114-Status: GOOD (  27.44  )
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

On 10/26/25 11:38 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Renamed the binding, using "host controller"
>>      - Added '>' to the description, and reworded it a bit
>>      - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>      - Fixed and renamed the compatible string
>>      - Renamed the PMU property, and fixed its description
>>      - Consistently omit the period at the end of descriptions
>>      - Renamed the "global" clock to be "phy"
>>      - Use interrupts rather than interrupts-extended, and name the
>>        one interrupt "msi" to make clear its purpose
>>      - Added a vpcie3v3-supply property
>>      - Dropped the max-link-speed property
>>      - Changed additionalProperties to unevaluatedProperties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..87745d49c53a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description: >
>> +  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP.  The controller uses the DesignWare built-in
>> +  MSI interrupt controller, and supports 256 MSIs.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-pcie
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
>> +  spacemit,apmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle that refers to the APMU system controller, whose
>> +      regmap is used in managing resets and link state, along with
>> +      and offset of its reset control register.
>> +    items:
>> +      - items:
>> +          - description: phandle to APMU system controller
>> +          - description: register offset
>> +
>> +  clocks:
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
>> +      - description: Global reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: phy
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt used for MSIs
>> +
>> +  interrupt-names:
>> +    const: msi
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  vpcie3v3-supply:
>> +    description:
>> +      A phandle for 3.3v regulator to use for PCIe
> 
> Could you please move these Root Port specific properties (phy, vpcie3v3-supply)
> to the Root Port node?
> 
> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

OK, I'll try to follow what that ST binding does (and the
matching driver).

> For handling the 'vpcie3v3-supply', you can rely on PCI_PWRCTRL_SLOT driver.
I looked at the code under pci/pwrctrl.  But is there some other
documentation I should be looking at for this?

It looks like it involves creating a new node compatible with
"pciclass,0604".  And that the purpose of that driver was to
ensure certain resources are enabled before the "real" PCI
device gets probed.

I see two arm64 DTS files using it:  x1e80100.dtsi and r8a779g0.dtsi.
Both define this node inside the main PCIe controller node.

Will this model (with the parent pwrctrl node and child PCI
controller node) be used for all PCI controllers from here on?

Or are you saying this properly represents the relationship of
the supply with the PCIe port in this SpacemiT case?

>> +
>> +  device_type:
>> +    const: pci
>> +
> 
> This is part of the PCI bus schema itself.

That means I don't have to specify it here.  I'll remove it.
I will also remove it from the list of required properties.

>> +  num-viewport:
>> +    const: 8
>> +
> 
> This property has been deprecated in favor of driver auto-detecting the iATU
> regions.

Yes, that got removed in v3 of the series.

Thanks.

					-Alex

> 
> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
