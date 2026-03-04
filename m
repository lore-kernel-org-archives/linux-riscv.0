Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49EEB7EA0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQGkna70qnxDT2+ycqpm1fAj6tp/XLWas0+dHTjAfYk=; b=dtV9Gpi8ucjdAc
	8+J+jIjfEuAmC0DTDqpwy5p/hMLX5CBj6R/Uo7H6PEqTmyUtgP6wlTYqP7WkOJPQqRykKwZc48/xN
	bHTps5ppHRm8vOukV+rENiHi06rZiXBARtnjgyf2ppK/6rD4zd+reoxs3fd6Q5LpixXU5A3OQkDM1
	6uyJ2RvRsy6yw2eAt/6moFGyn4cFQsDvvYDANq2gvimg1F67cNzQDHm6MiGcPxmOe3R0sLjiGOlHq
	jHV/7F3tG4ro6N+J/D4mFsgpY+G0SRizBYKEDZSiG52ZURsQyDjUyHzOia6lPFmpUJb/SVa0WyRfo
	VkaTAPiK+lGGPzHyf6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWT-0000000Gjl1-49Fc;
	Wed, 04 Mar 2026 08:24:01 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWR-0000000GjkU-1O9f
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:24:00 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-899e43ae2e1so33268856d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772612638; x=1773217438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
        b=dIbjVZBnslPNHpXamFt0EnMLAm43/qm6Hf+JvfF5x7wkhD8ADjXISrHjFJAcW0PliS
         3M0G2xP+XxgGLDXw8PWRYRXqp6umpFzLvkUagXTacBd8OII434r5wdo1sK+7HcWHVG9w
         6RybX/ss6Fd10RghTYwR0G3UrbBlAWc0XJ9MkiONJpHvR7wBiYdcieefMTrj+HIKCCs4
         MHEgGU45ALYJrGIDZ9zYlQpBTUy1PYmjTk6dXrKxO5yRVomqoEhbVNzaMCqwgToBE6x5
         LKTYY6wbY6MFGo45g3f6Tqy2jwwXfCYQl4bhjBKxMlohx2z5PgXK/+E9x8tx1vAhJH8m
         slDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612638; x=1773217438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
        b=F8NX5nZK5nGp1IIGEtU76xXx0bL/EamW9MP6kWunvJ+6J3875Ox/VGVLJ4H9PqT6WM
         N8ePDywoX7Ip3H5iNAbknUld8J1YyNJKj3bh/bUI6lIql5Er8HhAo9qOAOBh0+IJXg1m
         jrxhlEstliomZWN+enEyEh/22g7wpbthbbX1L1On8tTT03BWslM85mDF6NP2QdcEyQgb
         fm1t13YOlXH0hUwPM0HCxLJ+JL35K4m9dSP3+HeJmzo6hy3hLfyQ+tcBKKAqcCVdKz+I
         qtK90dzJMaaj7bKe9AbWN/3CpCNFMDbQ9APnm3SwxP8eOWPEA0FXRJ/iF/ccds3RVioB
         3rYw==
X-Forwarded-Encrypted: i=1; AJvYcCXneTufmY/qb6CFBvu7poK+nGQ/VJmMCxPP1qYw/wAfK+zHku6xuBU4f8rabP+NxPlMLz0nyVNgeJh+Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ8UiJdGo+B5awSRsxCjObF9POKWnUTh4OIYO8KmxYx3LP2wLD
	zIR4TStcMjNrumhZQdmAufETfK4eJ7XaKpp0T7ZSmzRIWZYxdARErCPf
X-Gm-Gg: ATEYQzy0koKvGygn95DbDDcH0waYYrBilaVp399kxkCnj7Qe1M9OFpJdAvZv2eo2E+K
	L0suh0or/fJjT5kkZgOuRlz1mHl0cu/wbur/7lTTwfCGlpTw7O74Qmqvf8EnKALIsUhOQk/LKzS
	AQE0KODqDCd5wUHC+BOXo/MwKGXebmapP0GRIiA2IkynyItq56TfRjQscslXVmKNmxPtwZA3+I6
	DxmLg4VLPim/8KoJOnXqCj47/w1DwWpxWQB8hVQ9NBkE0M39pY6SBKFE8XG927durswvaYPJkCG
	s4yDSnyFqqPx908yFDjnkXzBXWWEdh+DcxOcJWz2523Cs8dqPgJomi7ry5tqKKIpQcdXraDS6yf
	F8VgUvGQnWqazOSGCdML29ESGiP6Iij3uc/eGRAdFPY3lz1xksz9tmEO1JCX0b1umW6QS5T3Lpd
	gTbu/VPHl2MkG4m8S6VkmP0vzL
X-Received: by 2002:a05:6214:252f:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-89a199a8921mr12167536d6.16.1772612637696;
        Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0fbdbcb0sm31329776d6.45.2026.03.04.00.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Message-ID: <3aba626d-7b5b-4d5b-9c91-07f6a2d7c244@gmail.com>
Date: Wed, 4 Mar 2026 00:22:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
To: Krzysztof Kozlowski <krzk@kernel.org>, lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260304-hot-sponge-of-emphasis-6864db@quoll>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-hot-sponge-of-emphasis-6864db@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_002359_418907_809A4EF7 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Krzysztof,

On 3/3/26 23:44, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 02:16:37PM +0800, lizhi2@eswincomputing.com wrote:
>> From: Zhi Li <lizhi2@eswincomputing.com>
>>
>> The second Ethernet controller (eth1) on the EIC7700 SoC may experience
>> RX data sampling issues at high speed due to EIC7700-specific receive
>> clock to data skew at the MAC input.
>>
>> On the EIC7700 SoC, the second Ethernet controller (eth1) requires
>> inversion of the internal RGMII receive clock in order to meet RX data
>> sampling timing at high speed.
>>
>> Describe this SoC-specific difference by introducing a distinct compatible
>> string for MAC instances that require internal clock inversion, allowing the
>> driver to select the appropriate configuration without relying on per-board
>> vendor-specific properties.
> 
> Pointless description/paragrapgh. Your explanation why adding a
> compatible is "because I need compatible". That's completely redundant.
> 
> Explain what is special about this MAC instance, what's different in its
> programming model or other characteristics that you claim it is a
> different device.
> 

I think ESWIN should improve the description/paragraph and properly doc
the timing issues discussed here:
https://lore.kernel.org/lkml/32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com/

I do feel the need of using a different compatible, though. I think we
discussed in depth in that thread (link above), and advice from Andrew

https://lore.kernel.org/lkml/59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch/

https://lore.kernel.org/lkml/bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch/

is to basically apply different parameters to MAC based on eth0/eth1. The
compatible string approach is a clean solution to achieve that. The reason
being that for eth1, there's no way to meet the standard without clock
inversion, given the vast internal clock skew. I don't think claiming it
as a different device than eth0 is that far-fetched. Hence, no need for an
additional property and the driver code to check for that.

>>
>> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
>> minimum and maximum constraints to reflect the actual hardware delay
>> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
>> validation compared to the previous enum-based definition and avoids
>> regressions for existing DTBs while keeping the same hardware limits.
>>
>> Treat the RX/TX internal delay properties as optional, board-specific
>> tuning knobs and remove them from the example to avoid encouraging
>> their use.
>>
>> In addition, the binding now includes additional background information
>> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
>> control registers are included so the driver can explicitly clear any
>> residual configuration left by the bootloader. Background reference for
>> the High-Speed Subsystem and HSP CSR block is available in Chapter 10
>> ("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
>> Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
>> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>>
>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>> these changes are safe.
>>
>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>> ---
>>   .../bindings/net/eswin,eic7700-eth.yaml       | 75 +++++++++++++++----
>>   1 file changed, 59 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> index 91e8cd1db67b..22d1cecea07e 100644
>> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> @@ -20,6 +20,7 @@ select:
>>         contains:
>>           enum:
>>             - eswin,eic7700-qos-eth
>> +          - eswin,eic7700-qos-eth-clk-inversion
>>     required:
>>       - compatible
>>   
>> @@ -28,9 +29,13 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - const: eswin,eic7700-qos-eth
>> -      - const: snps,dwmac-5.20
>> +    oneOf:
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth
>> +          - const: snps,dwmac-5.20
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth-clk-inversion
> 
> So just enum for both entries?
> 
> Anyway, that's the same device, so you do not get two compatibles. This
> should be a property. Which property not sure, maybe all this was
> discussed already.
> 
> 
>> +          - const: snps,dwmac-5.20
>>   
>>     reg:
>>       maxItems: 1
>> @@ -63,16 +68,29 @@ properties:
>>         - const: stmmaceth
>>   
>>     rx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     tx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     eswin,hsp-sp-csr:
>>       description:
>>         HSP CSR is to control and get status of different high-speed peripherals
>>         (such as Ethernet, USB, SATA, etc.) via register, which can tune
>>         board-level's parameters of PHY, etc.
>> +
>> +      Additional background information about the High-Speed Subsystem
>> +      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
>> +      of the EIC7700X SoC Technical Reference Manual, Part 4
>> +      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
>> +      publicly available at
>> +      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>> +
>> +      This reference is provided for background information only.
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       items:
>>         - items:
>> @@ -81,7 +99,9 @@ properties:
>>                            or external clock selection
>>             - description: Offset of AXI clock controller Low-Power request
>>                            register
>> +          - description: Offset of register controlling TXD delay
>>             - description: Offset of register controlling TX/RX clock delay
>> +          - description: Offset of register controlling RXD delay
> 
> As pointed out, you cannot change the order and there is no reason for
> doing this explained in commit msg.
> 
> Best regards,
> Krzysztof
> 

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
