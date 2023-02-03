Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F24DC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPca3cQxcJJ/uI1qzul/42esejmMvKwP4Sc4u/wf228=; b=d8zHb8wClyWmLk
	DpBr8Bqt1GQzpxVrO7epirliZwVP7MlUKWhmEDP2zpgOqauqQhTGchQNEe4IpfUWyawsob9TSp2hw
	sIHlygHFfm4u27WlKw3gyb1gL3SRpdWzBp1X50KSyif06naOrm8tgzIszb6eRZwVe5Cj9OZ5dkBXu
	BXqeBZJRp9PQNpVZoRrY9Yl2CQdh5wsHN1W8p445gz19BL0vBm5TbA4dHGNdkdo8c+2ZNrqTq+RIY
	iS3M14QtRQeEj74Pz9yghCU8xE694wMVbLIn8KNhH23KeZe5kj22EqD3vrAugVyBcAgWuQddPYoRa
	yWztzYy2f7YA8FjhKHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqCX-000ihj-Gl; Fri, 03 Feb 2023 07:09:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqCS-000iei-UV
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:09:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id a2so3504231wrd.6
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91H7aAbtElqTaptJ9Vb0dyS9FKfuyA5IbH1LTzOZk1w=;
        b=kxIW9UUpSvaia8/H81GLavJ4mQWTC9NVIF/UM8mTgquarXVcOYW223Tp1ZbgavI1u7
         2OCqXuAkDBtFRPciI5sntZWnwYqZEjZzskVKWufTIDy7NQNMgH0pg4MV8gAHiHtY9VR3
         0hcBk2FtFixn+Ot9diJncYJwYaKiytsJiCtQwf6CgqZ06g1fXS+SlbtLcGyRyt5gcHRA
         hpzfB3KH3SfxhQth5axvjIiwVLi1AmSiljimg8k/I84mFBVytz1RSqGvqTLcVC6tL6D/
         sqElxkSTdl5eV/XCsViXTGPTK5YR18lY7c5xvF3BF/eWlofQ9DuvgmoT7LYI+Gmg/j3I
         7K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91H7aAbtElqTaptJ9Vb0dyS9FKfuyA5IbH1LTzOZk1w=;
        b=lrLuVxa0DLzASygjEI+j/WWMq3bzfPBm1vnDv5pfsvHrF9DfNJ5+dxYelDATws5bvO
         F/n4hJadqnjxBR4FggABjsnKikNq+BsHT4ZEfIINwDwOukR/9F8g9RvaEMizuiMVz6ON
         Jc5gAMbGHcdnAlcKpj9xbePd05mdjeMd1jGLcX3z7S6RVfzblguwMAOhW34xkby7qOBX
         0apQjWe/pN/whiUFD5BI2XOu7mqgWbEQ2GEDxDFZ/7s8zNez1jrChzYGL0XOa5jLx8uj
         OrsVlBhk96DMIuCkdXCW548RIBofJC8sV/Aws0/e/NWsPk2h9r6Nsb+AEYxCOroANyFu
         dR/w==
X-Gm-Message-State: AO0yUKWSkd8yXYWYwa9KUtW4og5EM53NWHD3fkkSAhv9r8s49aW+r6eq
	PK39tmfyxIJ3JKA4Ea0HcAZ2qw==
X-Google-Smtp-Source: AK7set8TwQRjsPo9v5JN/ENZh1nluMWyKJJlKIkzIlbEhiGRce7jfa72hOsMKBiovU00TszO03eK6g==
X-Received: by 2002:a05:6000:184a:b0:2bf:d2fe:8647 with SMTP id c10-20020a056000184a00b002bfd2fe8647mr11234697wri.70.1675408170631;
        Thu, 02 Feb 2023 23:09:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d4dc9000000b002bfb37497a8sm1245058wru.31.2023.02.02.23.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:09:30 -0800 (PST)
Message-ID: <870f6ec5-5378-760b-7a30-324ee2d178cf@linaro.org>
Date: Fri, 3 Feb 2023 08:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-7-yanhong.wang@starfivetech.com>
 <55f020de-6058-67d2-ea68-6006186daee3@linaro.org>
 <f22614b4-80ae-8b16-b53e-e43c44722668@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f22614b4-80ae-8b16-b53e-e43c44722668@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_230933_069388_8BD558B5 
X-CRM114-Status: GOOD (  19.40  )
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

On 03/02/2023 04:14, yanhong wang wrote:
> 
> 
> On 2023/1/18 23:51, Krzysztof Kozlowski wrote:
>> On 18/01/2023 07:17, Yanhong Wang wrote:
>>> Add JH7110 ethernet device node to support gmac driver for the JH7110
>>> RISC-V SoC.
>>>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>> ---
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
>>>  1 file changed, 93 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> index c22e8f1d2640..c6de6e3b1a25 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> @@ -433,5 +433,98 @@
>>>  			reg-shift = <2>;
>>>  			status = "disabled";
>>>  		};
>>> +
>>> +		stmmac_axi_setup: stmmac-axi-config {
>>
>> Why your bindings example is different?
>>
> 
> There are two gmacs on the StarFive VF2 board, and the two
> gmacs use the same configuration on axi, so the 
> stmmac_axi_setup is independent, which is different
> from the bindings example.
> 
> 
>> Were the bindings tested? Ahh, no they were not... Can you send only
>> tested patches?
>>
>> Was this tested?
>>
> Yes, the bindings have been tested on the StarFive VF2 board and work normally.

Then please tell me how did you test the bindings on the board? How is
it even possible and how the board is related to bindings? As you could
easily see from Rob's reply they fail, so I have doubts that they were
tested. If you still claim they were - please paste the output from
testing command.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
