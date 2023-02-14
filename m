Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6119C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PExHIZQ8IV0FuEVglnOk+B5ogSINBrKXRCEpTPMYkKU=; b=bSXdVQ/ZQi/NSL
	ZsQZ14Q7gOFPen6eoOOKyOo0q9qCmxYgkbgJLcYwWmo6zr29fUlDE04pI98cwfd6OPk0vINFUElFw
	nDOOOSVT/xntaDAn2lzHpM9XVIaLIycVpcrd30EX31K575BxAMOIxkMC2n97BV5xfbn+3RUIn8eDY
	GMnVdv8k763jZPZGInG1xwjvKDCYQCFnOPGIvgFKa3c0211YCPIgZSdPplc+uBu2zfyMqmlAUVu5a
	scoR7qdTjuBqin/+IUJub2LnzyU5d45Q6dTwl1bilKrEyUUGHoPDp+L4xzVhri3eFKjRpdhWaaJVo
	FNxMPq9a0UUVgBmtsvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq4T-000KZQ-DL; Tue, 14 Feb 2023 07:49:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq47-000KPA-Ha
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 07:49:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id m14so14654798wrg.13
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 23:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BZXiTCaWioPvbzbBAn0oxPR1rxdWEb2vlLnjqL27XI=;
        b=z7VCsH7jRGtqAalXsHjnqDbnJOwUgIqohKEWtJYdaBpvEM8ZcOz18wY4L9+9f0BJ2c
         5W8msteK1ebdaW3JZF9n4zQS2XEAZI6/oaEfzgkTNjgp7q/cbQFU4xcEL1UkCFxNW/mJ
         08beHsOZ+M2W+4l5WgvjEhtFgc+tpy3keeQCRDZd0BKtAv1tb8WWUIajjjzblZD5W0g1
         DFcLfVhdhcILkd191aO8VMnkTK1WG+qromM1jOYmCp2ZypIBWdVxkoJYsCuAeNwoSHCW
         oFR3gEXws74PSwnlakA/rnYrzB+xrVkyRXlv1zjEhSn2NjnA6HrQmvmJy8gOMYtTFBUT
         gcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BZXiTCaWioPvbzbBAn0oxPR1rxdWEb2vlLnjqL27XI=;
        b=0D1R3/S4waIsb3/Udrm8IBdOkpZSNstAkNFHiyLWqT4CCUDx06eRWjD8ptdOWaKcnr
         4QAxdmcUouw2KQvQPZRxeeEcDWUVIw+tWhTlwmYr76xqTavewsmdH0oGiAQSjNa7AoQE
         lSk8I/sa23alpG8yhNnvaLb04c23EjIGP7WyIELqHZ+hdOWnFSlZnyvqXTP16P1BYfTB
         Fyt8Nnhp9owtPVtjVQbGMp5y+1G623M8Z8Y1rGMZOfdhURL/y1XL4gMjmmPJ/VrkpTZ5
         ZOchi4qh201M68w6aMs/OF8glViPWoyKrOeZDUYE0V7Cp6MP/nEOG7wpiYegG2F7fgh3
         Jl+Q==
X-Gm-Message-State: AO0yUKUO4GdNHMzHAIApDPpGBWedmRsgRzSKiLZD0zVPEy7a//kzdcGD
	UNpd+cqAobVuyk8GQtdjQdBMkg==
X-Google-Smtp-Source: AK7set+/dHZHc/900rumb6+GH5YIHrWHNb+LKx6xsaclyywsxaqdMh//Qe83ReJXXScxKeONvq95dA==
X-Received: by 2002:adf:e40f:0:b0:2c5:4c1f:3c9 with SMTP id g15-20020adfe40f000000b002c54c1f03c9mr1102927wrm.49.1676360965977;
        Mon, 13 Feb 2023 23:49:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6102000000b002be5bdbe40csm12330171wrt.27.2023.02.13.23.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:49:25 -0800 (PST)
Message-ID: <80d16935-dad6-8087-c1b2-1d5b1c3f738e@linaro.org>
Date: Tue, 14 Feb 2023 08:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230210061713.6449-1-changhuang.liang@starfivetech.com>
 <20230210061713.6449-3-changhuang.liang@starfivetech.com>
 <3fc07187-f5a0-86d1-a0fd-ba18a2baf555@linaro.org>
 <f33f3ce0-ca0f-b24e-eab6-4fb9a6ae6d4a@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f33f3ce0-ca0f-b24e-eab6-4fb9a6ae6d4a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_234927_642512_62160D05 
X-CRM114-Status: GOOD (  11.80  )
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

On 14/02/2023 04:07, Changhuang Liang wrote:
> 
> OK, will drop quotes
> 
>>> +    items:
>>> +      items:
>>> +        - description: phandle of AON SYSCON
>>> +        - description: register offset
>>> +    description: The register of dphy rx driver can be configured
>>> +      by AON SYSCON in this property.
>>
>> Can be? So does not have to? But you made it a required property....
>>
> 
> Maybe I described it wrong.
> I will change to:
> 	description: The power of dphy rx can be configured by AON SYSCON
> 	  in this property.
> It is like AON SYSCON is the power switch of the dphy rx, it is necessary to
> configure the AON SYSCON register, so I made it a required property.

Then do not use "can be". Can is optional: I can jump but I don't have
to. :)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
