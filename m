Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09471CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 01:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM6vYTgM6J0jJ+g32YqxIvDxIyy02GwY4NQ/TNui+Ro=; b=MzBgp2dON1t903
	7weFh08XWcRtbsGd75iseAzIkDrGfdF07SHYQkNL51wl35TEw9KZBhGWLiAuuKWCJ4f7osNUTUYsY
	U/7DIJWiNKxZTM12duX38L80YyVueYnkCPvyCMAR0EI0QtnkGKTNWNfSObMMbLT0OmeGJpJHsK3mV
	ltpgw8GHNoVkjyZgtts0vGbsx4T1bowB2fD+yAU3Nwhzus5lUuUVEjKheSw8BgWXeGJQtE67vLhju
	88xDWxmRrPdU1ujPzA9NtyyoMvDScsS0GYEaByWd15nUk72Eoppn2Mohs/HbZrKzcE1AaI+mnIN6S
	Q1005icfOivDEts1EQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEe4w-00000005Eip-1MhG;
	Fri, 31 Oct 2025 01:37:23 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEe4t-00000005EiS-2IKz
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 01:37:21 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-4330d2ea04eso2500365ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761874638; x=1762479438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZXfwu/E+BC+JAhEUtk1GdLUOAn+XEVcnmRSn9TxWj8=;
        b=ngP75FBbCAYGEIQRHJLERVeymtSPhJaCHjK9Sx0qquxUEEeXg/Q6Nx9JbAcpeA1hk1
         8x/kkTinQ7C2G1sWFFU88+BVudy5TLdcX1l8c+ilcvVV5vFiG/P8Qb/01RHCDMmGB3u5
         U6L34ajtqJkUl0/3mAQ7x9KkiGHH7OlxnBaLKkeaz3GPxYGpD/ovjigVJk6LmNa8yZ4p
         EtnzqzSk/1cbVsiQjg/iuYA2SAebi/MkNT8gDtvZtpYdo5cc6RyeT3nKEM3TsFPejFRZ
         WtFJur7sJPOMTW4PmtqeaJtyTPvxk0XIhEBYoEj3rsIqZQP3p9byv900nb6g+6F2t8lv
         JxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761874638; x=1762479438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZXfwu/E+BC+JAhEUtk1GdLUOAn+XEVcnmRSn9TxWj8=;
        b=MHkcNxAQOiqHuXsiMnUwLPSs4EXNh2APKQ2CY0yPUQppxpnsj3mgAO/6Laz/9T/Rk7
         AItsz0COi4w3mZW+Kv3Q9AE1zOfAMgKT2DvZ4SLXCFZldzVbmLZp8cR/6PD2o7gH1OdX
         72OcKSrvCgFFXxO/YF7h6oaNK1QOPfniuzUsl0/1XuL4JRrHMrmru7x2yvyi1lEOH1vV
         CYek01lOiI8XYX641A62vZY0comz3mpozk2uSfJQwPiAE0O1L6HFdQz93IxsqjS1vCad
         Q7YSwUJzpkncjrny9rcAJWDQQ9olxzNYDARahv1l1Q3rFIbhGYnoQHTPP8LmeqKXx1D+
         V2JA==
X-Forwarded-Encrypted: i=1; AJvYcCXVz45wFvo9V3Lq1Ucs8xzwbDMM5etqSLp/hxO/RM0AqQln8dMOsEcoYh2bJ1dRhXHnPK5h8WK5vrVgwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1xyYXXBHCmtF+i8uRfiC+r8WY5RL5y/0yYqGRjRe1I1LmNDNQ
	8nkSk2DKiMlk96Hgq1KiHXKhuiDsmfxuDPrcFphq8RDy8G66FChgKqZICeOWLD0IXCA=
X-Gm-Gg: ASbGncttXp1QT9NPOtbbOD1rbMsbwRRP6LPcEcRhUp96cwZE+YDQIdCXBF/kODICE9+
	6JDoqsSkRQQT2V4FPPCt+IvliJaOQ/JGFCJU/X0vr4FKn98sSkC9ibe77CVypS8M9G/FoSL4o2t
	5Me7c2y8HmUTK3amfF5PAIFID5T9d7K0gvWGBqqY1RmreSkb4Vc4YAyqJRLo040JZwmL+X/JlWZ
	3UBfliAo+YTQT5otPAwGsrg77FizxIxYn6eFp8mMcD6+mRySVgTPjtJZisQZMwiIHy64CJZ9Gv0
	R8r0tKtZe5ZAr8XjWDjDFYRNpVkMAHyMlTGMU2F5eSK4yF4/gT8ROnOhuDwlqfRUfysyASc09pE
	y1Cs1xvpp/2AOA+RpFPGKnHheyiTQ9wzBxOBnSipIunNbiZ7GGQkWnQXDVya1bR5r/bhvi7o1nZ
	gm9f/xFWS6/2bIcXWD5qJYYRPIDvuStdFlGYWoaM66
X-Google-Smtp-Source: AGHT+IF8jKPMcN4haMJfj2iiZ24svqDtow1spkbfII1MB862Q9VVregRX2uRZw72R6OIomLop1+AMQ==
X-Received: by 2002:a05:6e02:b27:b0:430:af13:accc with SMTP id e9e14a558f8ab-4330d1280afmr28635775ab.7.1761874638596;
        Thu, 30 Oct 2025 18:37:18 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43310245c34sm1321815ab.2.2025.10.30.18.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:37:18 -0700 (PDT)
Message-ID: <9e60f7ed-7afc-4151-a301-4a0832b9105f@riscstar.com>
Date: Thu, 30 Oct 2025 20:37:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-4-elder@riscstar.com>
 <20251031005718.GA539812-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251031005718.GA539812-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_183719_974763_7CBB51FB 
X-CRM114-Status: GOOD (  16.47  )
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

On 10/30/25 7:58 PM, Rob Herring wrote:
> On Thu, Oct 30, 2025 at 05:02:54PM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
>>   1 file changed, 157 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..58239a155ecc0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,157 @@
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
> 
> Wrap lines at 80.

OK.

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
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt used for MSIs
>> +
>> +  interrupt-names:
>> +    const: msi
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
>> +patternProperties:
>> +  '^pcie?@':
> 
> It's always PCIe, so drop the '?'.

I'll fix that.

> With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for the review.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
