Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EAEC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws6FIfwJrp+i0J3wPSXnTzfSVmUGWqsqmmr6jCnqprE=; b=lvBVRV9R4qT7hA
	I4AOifvOIhrY6gHWP21lWp4FKgO1aWNmr0JwGJRWZTe2ZE6aihK0CW/CH0r/3F95uJWvigtd69pLS
	MQapvWRXLkF91a4haU1FC4lnaTeO/bHYXOx779iVVfZe2/fhh73e1+UhclKTaYwQJEB5uu2f1Ylh2
	8LyTp4/Pasn/J2Kdsgoerq9+Dghz9B85Ezfhw6masld63QVjtwNcWBxkd+ozJxp2duWu8MzoVAxVz
	Kx1RiwLAdK/gPRp4e7N6+F/eQzhDHinfDeOXGndwXJZxFB1/xYmWyviC5t3I98MNDtwJ3QdAApGD7
	A5fzYqe+KRSlczSYzjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZqu-003Cbs-2X;
	Wed, 12 Apr 2023 12:45:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYfu-002pew-0K
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:30:08 +0000
Received: by mail-ej1-x62b.google.com with SMTP id j17so18282466ejs.5
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681298999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJyqTEHoLZS3AbdsFdXhAUrC5DrToCewd/skrvNJpNI=;
        b=aWUihRyiFOSRdhy+QAXifz6dmGMrUxWJOYkhA1L8xDFjix9a6ZCB7JdM+Nf9OshSYX
         DS3//Jd7TSowWzvIryVIHN725R+T+4KPeJJgtyvX/PysOZtAS5aGivGTW93yOX/VDY4j
         VKsNhM1UhyEx4aPy6dbFkyrLEO9K42kWD+qy5upC62c1Xa/fjkboeWaVLvzojMN92r94
         Sg9wJLnCLyiWQyR6C5a0Hht5O81P8NmfnoxmSKqFlLORhJyHRWsMROGTinqKtxIOoUk9
         hx0uRmfTuB8vGIOzZAurbvk9hDIo2M9L30ofh6gB5GjeFcJi2u4nzotuwtF36Kt8LaEr
         gBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681298999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJyqTEHoLZS3AbdsFdXhAUrC5DrToCewd/skrvNJpNI=;
        b=3vvMukbhCr1X0RUirQ2DKv5g0GVmuYgUGmrSjZVpHIXSuc8QU39cd6I61HAmyX0cPZ
         elYJ2fMTGTYxVjaSUIbA5Gq9cBcYE6hF0r7CgZoBUFGKO3fCvmL9bDiDrw/ctPe6JjzO
         jgiEPgiHPJiucHH5h69HQ3rcwwYAswx7ZX1wiai9uWIvcAaU90PVoZP3ZnD7LDvczQAh
         2dfD9X4b7p/a0dM04b+dlQ2fq1XkrgwlaloCa18xyxL6aF6E2aB8SOQWWN65XrgWdnuW
         Vabgr+G+XWfimWs27TfoXJVV3rvQOkcND0ogzS3pEgbUTr4R9I3QYzhWt9YV4lZ7hqsj
         5C2g==
X-Gm-Message-State: AAQBX9fFz+COEiw+YRGbRTdaM4Hz0zCn1dqe4qeFgtp+2eu0EmZnJdYn
	vgH+YL2QBfxlBA6Y12DTQaMRIITFV6p4aUIIN6w=
X-Google-Smtp-Source: AKy350br4Y9CUS+K7knoYE8kFb8eku7TCZzpnUfEtRlKwcgWkPZSs/wUM8aZVxbWOeE72ExZALTlzA==
X-Received: by 2002:a17:906:a4b:b0:94e:4700:7a66 with SMTP id x11-20020a1709060a4b00b0094e47007a66mr2587909ejf.6.1681298999193;
        Wed, 12 Apr 2023 04:29:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id pv5-20020a170907208500b0094a8d25f7d1sm3079153ejb.82.2023.04.12.04.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:29:58 -0700 (PDT)
Message-ID: <d59439c1-bce1-b4a1-0e05-77afc4fc2ebb@linaro.org>
Date: Wed, 12 Apr 2023 13:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
 <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
 <20230412-trifle-outplayed-8a1c795fab8b@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412-trifle-outplayed-8a1c795fab8b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_043006_242237_924083AD 
X-CRM114-Status: GOOD (  14.83  )
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

On 12/04/2023 11:42, Conor Dooley wrote:
> On Wed, Apr 12, 2023 at 04:51:16PM +0800, Changhuang Liang wrote:
>>
>>
>> On 2023/4/12 16:35, Krzysztof Kozlowski wrote:
>>> On 11/04/2023 08:47, Changhuang Liang wrote:
>>>> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
>>>> interrupts properties.
>> [...]
>>>>  
>>>>  description: |
>>>>    StarFive JH7110 SoC includes support for multiple power domains which can be
>>>> @@ -17,6 +18,7 @@ properties:
>>>>    compatible:
>>>>      enum:
>>>>        - starfive,jh7110-pmu
>>>> +      - starfive,jh7110-pmu-dphy
>>>
>>> You do here much more than commit msg says.
>>>
>>> Isn'y DPHY a phy? Why is it in power?
>>>
>>
>> OK, I will add more description. This is a power framework used to turn on/off 
>> DPHY. So it in power, not a phy.
> 
> Perhaps tie it less to its role w/ the phy, and more to do with its
> location, say "jh7110-aon-pmu"?
> There's already "aon"/"sys"/"stg" stuff used in clock-controller and
> syscon compatibles etc.
> 
> Krzysztof, what do you think of that? (if you remember the whole
> discussion we previously had about using those identifiers a few weeks
> ago).

Depends whether this is the same case or not. AFAIR, for AON/SYS/STG
these were blocks with few features, not only clock controller.

This sounds like just phy. Powering on/off phy is still a job of phy
controller... unless it is a power domain controller.
Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
