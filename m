Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18194C76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCfi+1YiINwyWQQ5TOqnZtKiSvp68puQ1SBCa3NuF8s=; b=MxuESJO2UrErca
	z8BgT0xicZvvl2A1FYoMQKsmbAlvHsnbLx5k66Gfuu7vB+AA3eNV0IWWy/7cEiWAwHoJQHaKfor4s
	6w6bga72VLJoranC1mVoyvc8r42W5P4+KT8GP2dtvEPSZoDoji8tXvXqMUUStPVH8ueDDg/X3l2xp
	5pkdK3gj2hojPMIMJOnFaNq1k/jBLoq60hZOg3pRVdRLMndLf6fFEn4dzX1JPiN3BzBRZ8mq3AoMZ
	vnuivyolvFgHYTv1IWz+EX3II11+7qUzi5VrQXQXCON0f7mI2n3ffia3ykVxZymd2nwToTShpoUgU
	k6vWgZ3Pd+kxBuU22Izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pltKj-00FQti-32;
	Mon, 10 Apr 2023 15:21:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pltKg-00FQsP-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 15:21:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id qa44so12943494ejc.4
        for <linux-riscv@lists.infradead.org>; Mon, 10 Apr 2023 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKtT8o0nbJmVFZqD5xdbccYQdI3DXqK9lUo8ZKY2dTM=;
        b=slRgyI+52iHvXahH4qL+XTlfEV2EYvwSLocgDrob8uaIhQZ3yakolVzAMrfa/SVTr5
         zw6N5MS3nEXHySmGbN8az93HXCIcM847M0OeJhKETsfurQfLrNjTE8N8EnW4371zjGlg
         GJVq2n0bi+ECEXB+yycG1nvKDHQ8Vvcq3CIx06lfAMuypio7bmFfEjsBI1De4alSCTyo
         R6wsBrFSro1UVghATZTWEumTkEy7hmL1riDtURZBUQQZNHtOJGGDoCYM459p2uSZfr9o
         T9XhhkBJYEj/ke5x/eSG9pp59xwTVmG2meoAfyri3bvyuD5wQlyxiC6zy0hV2HltnP7j
         yR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKtT8o0nbJmVFZqD5xdbccYQdI3DXqK9lUo8ZKY2dTM=;
        b=yN0G7l1c/fgPum4qeh2Tu4qYjJHPS4jxxWQ/6YxAHxMhzC8UoGA79qcQDrLGve7Suz
         lapTkXk3Bb7IGcXfNPQJkNhp5ETD7BugoJ3dRPk3BJ7qNhx2BqpI7tfUkEWYxCNxhizN
         IJzHXOEZE9jJZeJs+y1dFk/mmLU78rNf7WwZ8QJiQNXROTEZbFLrJZSxVk4rJESKtdcB
         RidA15eYz2u35GNby4oXQs54g0vH1270fmdkdbo+A7JtD5n/a1d1yUYjoZcdHLPa5mfv
         L+NkAw+S8H4lcya+QMZmuqnEtSYywEdaSIAS0DdcIHDvbS+2gHtEu/C/uGHOmo0RgGi2
         rKNQ==
X-Gm-Message-State: AAQBX9eqfrGefiz54rKdXpa0J1x+2uLRfxXRvMJNFw+7Lpj2QkIWs5Na
	PolXtonHpQOtyJ9lufFzDuXQoA==
X-Google-Smtp-Source: AKy350abdMkfY6LcbSY98RHE9h5BYQT2H/JkkaLfVPvhxnTdQpqI7LYU2qzjeoqCvj/JaN79xyfXJg==
X-Received: by 2002:a17:906:f0da:b0:94a:9ae2:1642 with SMTP id dk26-20020a170906f0da00b0094a9ae21642mr2200834ejb.46.1681140084267;
        Mon, 10 Apr 2023 08:21:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id wv1-20020a170907080100b0094c4dd34a0asm412826ejb.114.2023.04.10.08.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:21:23 -0700 (PDT)
Message-ID: <f37964c6-0a75-2900-e6a7-282f5366696c@linaro.org>
Date: Mon, 10 Apr 2023 17:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
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
 <430f1eb0-e348-8a4e-b501-16b8c3b2494f@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <430f1eb0-e348-8a4e-b501-16b8c3b2494f@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_082126_515535_315DA63D 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On 10/04/2023 11:05, Minda Chen wrote:
>>> +
>>> +  starfive,stg-syscon:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    items:
>>> +      items:
>>> +        - description: phandle to System Register Controller stg_syscon node.
>>> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>> +    description:
>>> +      The phandle to System Register Controller syscon node and the offset
>>> +      of STG_SYSCONSAIF__SYSCFG register for PCIe. Total 4 regsisters offset
>>> +      for PCIe.
>>> +
>>> +  pwren-gpios:
>>> +    description: Should specify the GPIO for controlling the PCI bus device power on.
>>
>> What are these? Different than defined in gpio-consumer-common?
>>
> power gpio board level configuration. It it not a requried property

What is "board level configuration"? Again - is it different than
powerdown-gpios from gpio-consumer-common.yaml?



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
