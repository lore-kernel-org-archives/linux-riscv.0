Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29383C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2991u0NaUXp+98Qzk6IZStx3BwUG7DrxiqaBVOdcsk=; b=Sj658MZJgPdjxK
	iBYIkMaIC0kOTFTsQ3VOrCGZL01Nqk2QEza/J85sh1sgNb7mxO5cTRn1bnPKDRWX4HeteGNTs73kT
	52mkIdxj/5BNJiP6MliCrktwMKZ9uQ6LHY8E+WAAEB5+NFAEJ29A3jF58aVvdPYv82VFPIr+i31Cx
	0UpkpI0XmKUnEeHcIsRmtd7NgvJOqBEqesWcKq6Z+iAjtY3MKNmVHbSfH6TNg9xVXW2YK2HQFaWjo
	+Vd4lAy39KUt4NLexf/C6KDLRNYM6RwU1Z1I8kNW4R6uL0o3H8Gn05A51vG4f7F6iXLnlU5ZWKP0F
	vBZvir7AIfKPWERl0FUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSZmp-00FNal-SN; Fri, 11 Mar 2022 07:34:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSZmn-00FNZe-9B
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 07:34:07 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A82C3FCA1
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646984039;
 bh=FwIsaa6346BnNKKT5tvMxkFu/0GEn2QQ2fVNeegANkg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ShhO7QVpj2/qqVow6bIhgZNzFEqbMy2QEJjLd8Xwd1rNOpCsy55FfvM8CUu6XtvUW
 tmVBg1XcMlqhPHM7+QS66DMFy/S4G6a6F3S6Bilr8tvqPhq8q37iLbYa8sJ5c6jsAI
 fb9vCzNRO95GTApYtTgkNuyDA36Splp/Mca55Db0vWhTXrcVQRTR7Qu152Xl+o6qjf
 XxpnnjmCmEfb8a4oDwfo4JrylNI2lKlE/e1WOgKuQ6+fhkv9z6fb7xpY9UvWG78/SY
 lei90kTq0xg1oLC0ifJWXbnAfAOJN1A93xBxkQsZFE44p7ASPdXRkZ/ja94svoR3rM
 emJ1iWECDfjsg==
Received: by mail-ed1-f70.google.com with SMTP id
 cf6-20020a0564020b8600b00415e9b35c81so4370596edb.9
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 23:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FwIsaa6346BnNKKT5tvMxkFu/0GEn2QQ2fVNeegANkg=;
 b=ubkRrdWtozxceiWwM2bhyTJXkqGUk8tFKO4H433/yvr5JZtWAHuOAhoV3bWHSPkuIa
 SJliryQEO7g814rqWndbpxgxz/Le+qPFX88Q1T1o7XQwqZT9o2X1H+TraXu6pH1JrH3c
 CglL4MXSBrF4uXDUgG2c6nHekoQaP6Dl+INnWT/4r6KwdylUNsxJPN0Lh+r3eEIAPEpc
 CjtKFUbb2g8bQmU1sA/ZvoeDFvOiw3H1DAZgZ95c7jhD5ZF5RiiGVxYPJGZJ4UV9wRYp
 oapKU4jEcljzZIKtDKw8cUts7wH5ERu6EA7tWuXMZPViM/uD1DTn7DzYJ1SPBublK4Jc
 ROfw==
X-Gm-Message-State: AOAM533CP8fDmrvfCak+jBz7ScTSGylAHArbjn4BUMjN3KBvl9BDHxLc
 El1Ya8D6F0ChaTjukX/RW3dvFcJUdLSAg6Z6mG6E4KqzRaxBctpc3eUvtmpyM+l5vTOSHoTtSPD
 aHajp7Cxkmo7hJqIxdvpK72Blukk04KcKzvS4QW8O8TSV8w==
X-Received: by 2002:a17:907:72ce:b0:6db:aed5:833e with SMTP id
 du14-20020a17090772ce00b006dbaed5833emr400597ejc.420.1646984036607; 
 Thu, 10 Mar 2022 23:33:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHSkeNxfQPFajgsgZR2Yv3RA/WJuoMeMF7qYuAnmerumRUXFThKxmJtDF/IuTUkeXY1Sj4WA==
X-Received: by 2002:a17:907:72ce:b0:6db:aed5:833e with SMTP id
 du14-20020a17090772ce00b006dbaed5833emr400571ejc.420.1646984036392; 
 Thu, 10 Mar 2022 23:33:56 -0800 (PST)
Received: from [192.168.0.147] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p14-20020aa7cc8e000000b0040f13865fa9sm2908347edt.3.2022.03.10.23.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 23:33:55 -0800 (PST)
Message-ID: <ef965982-0c21-9cc7-1e5a-69726671ba1f@canonical.com>
Date: Fri, 11 Mar 2022 08:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: sifive: drop Yash Shah
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
References: <mhng-b01b9acc-de77-4d1d-9cdc-f3830a6c569a@palmer-ri-x1c9>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <mhng-b01b9acc-de77-4d1d-9cdc-f3830a6c569a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_233405_467075_AB0D7C82 
X-CRM114-Status: GOOD (  15.40  )
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

On 11/03/2022 04:14, Palmer Dabbelt wrote:
> On Mon, 14 Feb 2022 00:23:49 PST (-0800), krzysztof.kozlowski@canonical.com wrote:
>> Emails to Yash Shah bounce with "The email account that you tried to
>> reach does not exist.", so drop him from all maintainer entries.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     | 1 -
>>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       | 1 -
>>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
>>  MAINTAINERS                                                 | 6 ------
>>  4 files changed, 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> index e04349567eeb..427c5873f96a 100644
>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  title: SiFive GPIO controller
>>
>>  maintainers:
>> -  - Yash Shah <yash.shah@sifive.com>
>>    - Paul Walmsley <paul.walmsley@sifive.com>
>>
>>  properties:
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>> index 676b2160bada..605c1766dba8 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
>> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  title: SiFive PWM controller
>>
>>  maintainers:
>> -  - Yash Shah <yash.shah@sifive.com>
>>    - Sagar Kadam <sagar.kadam@sifive.com>
>>    - Paul Walmsley <paul.walmsley@sifive.com>
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>> index 2b1f91603897..e2d330bd4608 100644
>> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>> @@ -9,7 +9,6 @@ title: SiFive L2 Cache Controller
>>
>>  maintainers:
>>    - Sagar Kadam <sagar.kadam@sifive.com>
>> -  - Yash Shah <yash.shah@sifive.com>
>>    - Paul Walmsley  <paul.walmsley@sifive.com>
>>
>>  description:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ebf7a75a6bec..87eeac970ca2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7090,12 +7090,6 @@ L:	linux-edac@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/edac/sb_edac.c
>>
>> -EDAC-SIFIVE
>> -M:	Yash Shah <yash.shah@sifive.com>
>> -L:	linux-edac@vger.kernel.org
>> -S:	Supported
>> -F:	drivers/edac/sifive_edac.c
> 
> Looks like that leaves this unmaintained?  I'm happy to volunteer, I've 
> got the boards lying around somewhere and sort of feel on the hook to 
> keep this stuff alive given that whatever's in there is partially my 
> fault.  That said, I'm happy to stay out of it so if it's OK to have 
> otherwise unmaintained EDAC drivers that works for me so
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

The patch was already merged. EDAC SiFive is now covered by generic EDAC
and SIFIVE entries. Feel free to restore the entry with yourself.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
