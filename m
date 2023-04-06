Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FD2C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq7qCyFKDRcoXmiZDXjX82ghq3WD1Cv/H3acOME1H1I=; b=vMj0lGzGsIzezM
	iWWbkiUWUwKPbuoxPxOIoFoeNEokizVXLIpK2LUbDrU9ZpyTMq1z3gRSm0l+4EqasyElgNGkkQP++
	96wKqg8F2947NMBa7l27oHPOEhH1nd3AXiDksio4y+W5zDWLezXZ9lUOGiLVh0ZLS+ojtaelE2hFc
	MDBr7e1K95MSn6wdAb6K2FfMicWncaMT0K3CGKMFDbdCsxyDrbc1iu8JLHGUP4rHkZS2uO7Py/gJe
	ZDhfD9a50PPSSIAm+c3hJJrmYrh/hR7/LoYGL+BuhTFmZCQ/T427mq/vD/MMsFo8M2IwqtD48y2qp
	QColOTsdNNa5OrP0dIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUih-008JTI-2S;
	Thu, 06 Apr 2023 18:52:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUie-008JSi-1J
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:52:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5047074939fso2253478a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680807141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrhLW1wbWunykZQuk7rWh+aLPzkfPdyrzg855Rv1CC0=;
        b=OaKgd8Q3eIvAk3dfIAinRvzLlH3Y8HQCxJ2bDVYbCFX7+lVVoFg419mM/7U4yEoPhV
         ZqrjC4RhHtwo8d9Gu2d/2noJeUE/4dpDoWCHozpas2GyzxtLPfVYyVDPqZqXBPLRBDvN
         xCISl03ZkgYVy/gDl0tEyXS1EGq+7e9GCofDB43ARMRYwxQvX2qH+uvKtyr00ZbWr2Ln
         Qet7xdSannl+UqtG2pVXEJf/bT2B6yQznjP1rFBsO+NVc3LfTwFp1KEosh3jGGmG56TV
         U9Bh8WtP0ecw9+fan2B700lmQRQkCmP5ib4j+nIvlz27qEpuxiy+aPc5oBkTtwmD5viK
         kK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrhLW1wbWunykZQuk7rWh+aLPzkfPdyrzg855Rv1CC0=;
        b=XWLQhsWfJcCerFFhJgWj7Wb/FB4QxDCYM01/Ft7eWQ6RJHQo3VIZppW4VCNdZ3z4tQ
         fjwQDQ6R7y/z/VMqSPDZ7lCpLm+GLfjQAKb1EE/WjgXKoK3Eh0xEV0JfvCLtsxuTwMGA
         lFPTGCLBBiT5RbOYI5lqeJ9WWHUIgZdDuqiHV+zlJxDARM2IkuoYTv3yGoPar5A1pS+H
         WGvvER++nFLNf+LGPTaYnRKDnEOmtKDsvvEBbkjY4RKmAFZlyBPP6Ax5XAznE7pNsmCN
         xoeMZ/KPowVKCXUno01Jw83EJQzOInL8AE8CZGlVcYJUeIXPqNkF2JKg1x5ZOTJku8yg
         wqeg==
X-Gm-Message-State: AAQBX9dKJiB0muAK6DTNKf6mN9S0x12aNTgcP0CS4GTs20VlHTWVhsWI
	I+cTs8fyKbEi6LwKmeUocLgtbQ==
X-Google-Smtp-Source: AKy350ZJs5t1rE5waKeG80x624AGOma/729jSi4OiOCKS9N8/7OjFDtBqoml11ylguqjP21qCf0h4g==
X-Received: by 2002:aa7:da88:0:b0:4ad:738b:6706 with SMTP id q8-20020aa7da88000000b004ad738b6706mr5919891eds.2.1680807141470;
        Thu, 06 Apr 2023 11:52:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id y30-20020a50ce1e000000b0050470829dbesm651614edi.63.2023.04.06.11.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:52:21 -0700 (PDT)
Message-ID: <fb78a687-9b01-de8b-b78a-9e62ddd3b9c0@linaro.org>
Date: Thu, 6 Apr 2023 20:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-2-minda.chen@starfivetech.com>
 <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
 <20230406-revisit-patchy-a0063d964070@spud>
 <20230406-cinema-profile-1bfed00e4a5f@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406-cinema-profile-1bfed00e4a5f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_115224_574004_7E159016 
X-CRM114-Status: GOOD (  14.55  )
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

On 06/04/2023 20:45, Conor Dooley wrote:
> On Thu, Apr 06, 2023 at 07:35:09PM +0100, Conor Dooley wrote:
>> On Thu, Apr 06, 2023 at 08:24:55PM +0200, Krzysztof Kozlowski wrote:
>>> On 06/04/2023 13:11, Minda Chen wrote:
>>>> +
>>>> +  interrupt-controller:
>>>> +    type: object
>>>> +    properties:
>>>> +      '#address-cells':
>>>> +        const: 0
>>>> +
>>>> +      '#interrupt-cells':
>>>> +        const: 1
>>>> +
>>>> +      interrupt-controller: true
>>>> +
>>>> +    required:
>>>> +      - '#address-cells'
>>>> +      - '#interrupt-cells'
>>>> +      - interrupt-controller
>>>> +
>>>> +    additionalProperties: false
>>>> +
>>>> +required:
>>>> +  - reg
>>>> +  - reg-names
>>>> +  - "#interrupt-cells"
>>>
>>> Keep consistent quotes - either ' or "
>>>
>>> Are you sure this is correct? You have interrupt controller as child node.
>>
>> I know existing stuff in-tree is far from a guarantee that it'll be
>> right, but this does at least follow what we've got for PolarFire SoC:
>> Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>
>> Both PLDA and both RISC-V w/ a PLIC as the interrupt controller, so in
>> similar waters.
>> This note existed in the original text form binding of the Microchip
>> PCI controller:
>> | +NOTE:
>> | +The core provides a single interrupt for both INTx/MSI messages. So,
>> | +create an interrupt controller node to support 'interrupt-map' DT
>> | +functionality.  The driver will create an IRQ domain for this map, decode
>> | +the four INTx interrupts in ISR and route them to this domain.
>>
>> Given the similarities, I figure the same requirement applies here too.
>> Minda?
> 
> Further, if, as I currently suspect, there's a lot of commonality here,
> should the binding as well as the driver be split into common pdla bits
> and microchip/starfive specific ones?
> 
> Suppose that's more one for you Krzysztof.

Yeah, looks like only clocks and resets are different. At the end it
depends how much code you would remove...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
