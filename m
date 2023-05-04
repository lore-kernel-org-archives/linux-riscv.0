Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832FFC77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=me0b7jNrQIYd8yTRqaTFkwUi7DpNuf8UnQ3ile559OU=; b=DHK60fLUVpp+ci
	eU4aR7YJWYgQP/m0txzoL491xQPybZOt3Slh9sZmpaG6b05zNI6jfVAHkrhHNDgME3LDrzgv5Q0mj
	xez/DMNJgmspf0kRC4LxuCe0oxgbx7zAqyHn8A+JA+lnDVHUkZlFujyirZQI2oO/8g+gAJ97h133N
	RyqUQMbNmsi1RvAa9WTGPrlJ258X3M32fUBvzkw5X3EHCjMFiQnz3y56e7bMhuhs/+UHpzjs7VEzF
	6xCbYc0NI/hD61yLXXLUvNNtuv3mYR743yUPDcnJSdv8fYLr504mtxZ6gznq3YycvHSwAm5e3DKbz
	A8Dl9aflVK/qVaXyWiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puVNs-007IQv-2M;
	Thu, 04 May 2023 09:36:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puVNp-007IPA-0q
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 09:36:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94f910ea993so33557766b.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683192973; x=1685784973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRcoOC8fngP6Il2rAzvXIOhnaTFot/xB1pDV/8xXBhI=;
        b=MM3fLTuvY1THuF+Jes6bTaFgdLgelBxjG9Qs0YrJ62r2rXYT0XrFa3z3syIzosle/b
         ndQzUCfwxP0iURGIxMkTVDjBIChW3aQKQa5lej+0hWz/zOU+BYcZpLtkfqufI9lhZ7es
         qhlX/+ZSVEuTfyzLRaTd7wSuwjcjxrMHgq8WR24DyKR0x1kNqmw1BPJywXnPdZSaw/uQ
         v66XZknaiYzEr+EDAw3mGYpAzFgZ8hMx+Krhne2k4sav+gyjx359mGzZ3ot1qt34/94A
         ghRo/Cb+pg7QBb8ZQd8FiQIU4dfjKh2kVt6C+eOHJNmtQ6FMaiDDLxp2MrDt/PzbP4MN
         7bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683192973; x=1685784973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRcoOC8fngP6Il2rAzvXIOhnaTFot/xB1pDV/8xXBhI=;
        b=AQ0nEDUttUNcT2gNQdLfAQtEZl0KprtAyIWyc+sUBbjKayIUS08UN5ddlxuya4XLUx
         pgGRwXBnrZrfYqAfuJ6KuMBAP1EO9VbcDb2rz6ENHqmKDdbUT/RFGzdtaGNQkos3kIp8
         C8mbtbkJ40CAStj9LehyP9Za+4AuHFbFenD4ZgrXqoL/FIN2iQHtAqBSbILW0cdjcAlI
         x+L3UNQFJBN90FhG1v2c15GSMiaE9CzIZCvNxU0fzqyJEPLtRIYFGeAR3T44zAHzB9Sv
         IgurG+XjirP34Z3LvZHuqgWPp7M3JxbKykrhnyPr7afVCAMVczzk4r1rvLh1U14SG9WW
         Ru2g==
X-Gm-Message-State: AC+VfDwTVUsN8Kg7nMTAeINiLeHaNSar78KHVj31cPrNWmWdowMS8OY0
	LVfzqu4NhXc7NuPXSa1NMMk3Fw==
X-Google-Smtp-Source: ACHHUZ76/GLGEckds5wB/s6mHv5yN0exDgClTi+UZl555s4ZPAcE2DRB69WKyTxronDQzYc5TFp31A==
X-Received: by 2002:a17:907:1b08:b0:957:1df0:9cbf with SMTP id mp8-20020a1709071b0800b009571df09cbfmr6548125ejc.19.1683192973372;
        Thu, 04 May 2023 02:36:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id sb21-20020a170906edd500b0094f4d2d81d9sm18480946ejb.94.2023.05.04.02.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 02:36:12 -0700 (PDT)
Message-ID: <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
Date: Thu, 4 May 2023 11:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 vkoul@kernel.org, linux-phy@lists.infradead.org
References: <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
 <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
 <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
 <20230425-resale-footrest-de667778c4fe@wendy>
 <663e9933-b9b3-a48f-98b6-2207215a8ed7@starfivetech.com>
 <20230425-commotion-prewashed-876247bed4ab@spud>
 <0b0f9187-ad6b-a1d9-6ec4-beb8989ca731@starfivetech.com>
 <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_023617_307654_3FE76889 
X-CRM114-Status: GOOD (  11.35  )
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

On 04/05/2023 10:43, Changhuang Liang wrote:
> 
> 
> On 2023/5/4 15:26, Krzysztof Kozlowski wrote:
>> On 04/05/2023 09:20, Changhuang Liang wrote:
>>>>>
>>>>> Krzysztof,
>>>>>
>>>>> I am confused about what to do next. How to add this power-controller's
>>>>> node in device tree?
>>>>>
>>>>
>>>> You just move power-domain-cells up.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Like this? 
>>>
>>> aon_syscon: syscon@17010000 {
>>> 	compatible = "starfive,jh7110-aon-syscon", "syscon", "starfive,jh7110-aon-pmu";
>>> 	reg = <0x0 0x17010000 0x0 0x1000>;
>>> 	#power-domain-cells = <1>;
>>> };
>>>
>>> If right? I will tell the syscon patch's owner delete the "simple-mfd" in aon_syscon node.
>>
>> Yes, but your compatibles are now wrong. Just compatible =
>> "starfive,jh7110-aon-syscon", "syscon".
>>
> 
> If compatible = "starfive,jh7110-aon-syscon", "syscon". My pmu drivers need use 
> "starfive,jh7110-aon-syscon" to match.

And how it would even work with your proposal
"starfive,jh7110-aon-syscon", "syscon", "starfive,jh7110-aon-pmu"?

Try...

>  And my pmu series will add this 
> aon_syscon in yaml and device tree, so the syscon patch's owner don't need 
> to add the aon_syscon in its yaml and device tree?

I don't understand. But if you need to drop syscon, sure, drop it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
