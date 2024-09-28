Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A949CF649A
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdAHDDyaxQWUD4fCMxzZxRmjlTlBGs1BOdQMGZIWJ3w=; b=d2Is/JQUYWmnpy
	n3eojisRlwTVGDZ3hXIXBxYpv3S30QgU7ruz2H+ooN6983iU/Ck3grnkh3uvSOJSTMkPn7g/zAL5y
	9C0QUtly7GRgBRMCUeIxgelVRuJx8kRjKrb1cmQoCbKKF2y2lH60QiMpBvYoj9iqPZKi/M05PPE4A
	kVBbs+N1N5FHtd3QaJTUIX/omtT9FMRQYRcLzigVOWJbTmT+c94BJdKXBcHJTeDoHELKA7v9C4/xo
	tibtxm+9nQS0iwEN+qgyDK6qAh5q9d4XOnZunxKDhmwpOba7GI61d5IoA8TceGTdQmnwa5ZsC8ktv
	WMJ4nsjto2L94uvv0YgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suRsk-0000000CkDZ-14PT;
	Sat, 28 Sep 2024 07:28:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suRrU-0000000Ck6Y-1xx5;
	Sat, 28 Sep 2024 07:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E12A95C436C;
	Sat, 28 Sep 2024 07:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C82C4CEC3;
	Sat, 28 Sep 2024 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727508447;
	bh=VtEhDPbrmFi1yUDyOT1ZAa0flBzfQV54ftpM9FZnIOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oam4lTIew4knRuvoaST1mDGl86r/QfSm4GdriNLftUyw0qjBsPm+dwBUcHzW4DZ0Y
	 79Ry+yf9j+JJ16mt/B/yELPe2OtOJ8/YkMn1QEGspBzpxHJgb4wPEX4scCaYV1uwG4
	 uen1a4dlUo4QpVCV74VC2khxc8vYuktJlv++9yN5/plLNZ5PBwSYZAGyFdeK8ZHSdo
	 2I39UFwmuOPg+87w+zirYSDLp8j+ROaz/ZulA1/DCK0NNPfm5u5gxjrFKp9jB7TCgi
	 xR6UScbixoLvdXQ5cfbplmibHD/FOFX1t9utGNaJ2xw/VebSr4013+v5ExKw0J04uO
	 V5Kaz34XMrSYA==
Message-ID: <1efbf081-6ac6-43bc-97b9-53b24a8d130d@kernel.org>
Date: Sat, 28 Sep 2024 09:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: Add T-HEAD dwmac support
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-1-f34f28ad1dc9@tenstorrent.com>
 <4pxpku3btckw7chyxlqw56entdb2s3gqeas4w3owbu5egmq3nf@5v76h4cczv4z>
 <ZvcawOIcufEHXCHU@x1>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZvcawOIcufEHXCHU@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_002728_634906_58C87B0C 
X-CRM114-Status: GOOD (  23.52  )
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

On 27/09/2024 22:51, Drew Fustini wrote:
> On Fri, Sep 27, 2024 at 11:34:48AM +0200, Krzysztof Kozlowski wrote:
>> On Thu, Sep 26, 2024 at 11:15:50AM -0700, Drew Fustini wrote:
>>> From: Jisheng Zhang <jszhang@kernel.org>
>>>
>>> Add documentation to describe T-HEAD dwmac.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>> [drew: change apb registers from syscon to second reg of gmac node]
>>> [drew: rename compatible, add thead rx/tx internal delay properties]
>>> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
>>>  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  3 files changed, 111 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index 4e2ba1bf788c..474ade185033 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -99,6 +99,7 @@ properties:
>>>          - snps,dwxgmac-2.10
>>>          - starfive,jh7100-dwmac
>>>          - starfive,jh7110-dwmac
>>> +        - thead,th1520-gmac
>>>  
>>>    reg:
>>>      minItems: 1
>>> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
>>> new file mode 100644
>>> index 000000000000..1070e891c025
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
>>> @@ -0,0 +1,109 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: T-HEAD TH1520 GMAC Ethernet controller
>>> +
>>> +maintainers:
>>> +  - Drew Fustini <dfustini@tenstorrent.com>
>>> +
>>> +description: |
>>> +  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
>>> +  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
>>> +
>>> +  Features include
>>> +    - Compliant with IEEE802.3 Specification
>>> +    - IEEE 1588-2008 standard for precision networked clock synchronization
>>> +    - Supports 10/100/1000Mbps data transfer rate
>>> +    - Supports RGMII/MII interface
>>> +    - Preamble and start of frame data (SFD) insertion in Transmit path
>>> +    - Preamble and SFD deletion in the Receive path
>>> +    - Automatic CRC and pad generation options for receive frames
>>> +    - MDIO master interface for PHY device configuration and management
>>> +
>>> +  The GMAC Registers consists of two parts
>>> +    - APB registers are used to configure clock frequency/clock enable/clock
>>> +      direction/PHY interface type.
>>> +    - AHB registers are use to configure GMAC core (DesignWare Core part).
>>> +      GMAC core register consists of DMA registers and GMAC registers.
>>> +
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        enum:
>>> +          - thead,th1520-gmac
>>> +  required:
>>> +    - compatible
>>> +
>>> +allOf:
>>> +  - $ref: snps,dwmac.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - thead,th1520-gmac
>>> +      - const: snps,dwmac-3.70a
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: DesignWare GMAC IP core registers
>>> +      - description: GMAC APB registers
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dwmac
>>> +      - const: apb
>>> +
>>> +  thead,rx-internal-delay:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: |
>>> +      RGMII receive clock delay. The value is used for the delay_ctrl
>>> +      field in GMAC_RXCLK_DELAY_CTRL. Units are not specified.
>>
>> What do you mean by "unspecified units"? They are always specified,
>> hardware does not work randomly, e.g. once uses clock cycles, but next
>> time you run it will use picoseconds.
>>
>> You also miss default (property is not required) and some sort of constraints.
> 
> I should have stated that I don't know the units for delay_ctrl. The
> 5-bit field has a max value of 31 which seems far too small for
> picoseconds. Unfortunately, the documentation from the SoC vendor does
> not give anymore details about what the value represents.
> 
> Andrew Lunn replied [1] to my cover letter that it is best to hard code
> the field to 0 (which is the hardware reset value) if I don't know what
> the units are for delay_ctrl. The hardware that I have works okay with
> delay_ctrl of 0, so it seems these new vendor properties are not needed.

Then just say that this is using register values directly.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
