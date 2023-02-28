Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEA0C6FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/PlflBiAv5ohk50R2V3qdayGA+cD5SSNw6mQabQDuQ=; b=lfiWkrMEmQa8T3
	SH4r1xHMnM3mukJeD0aquMkQ3wfl2MIYpEb+kbkIfLDziPEIDMDS0DfTfqC5vvrdm7+pcDoMH+eVw
	YaZq6TJZrToMazulpQqe4zRwdFg3+e31uY8sUgcIChxyexKYqvO5+P5bmygkxuQmhhmm7pifNLDs+
	J+Hw7VJY2vKNkid7ZOcGCe8RGFZdOMTXFToelQteAObdKcylXCIxG9yug6bR+/6+UyHse1av+oM7k
	4mmG5/mDe+NdZuXNJNZ2EBXTzhsc4Df9N/xS505sgpqMNkGQR2g0uMKMQCECbH+U/V3V00uY341l7
	4YwlPjbMePA9/LzkRlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1d3-00DbxN-GP; Tue, 28 Feb 2023 15:10:57 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1d1-00Dbwg-HV
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:10:56 +0000
Received: by mail-il1-x12f.google.com with SMTP id i4so6487134ils.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0hFgCVYvdf8qCio/mcfsT/HFMMai5H9F95nC41WxplU=;
        b=dijrorNv9fDP9TTW1Cs81VGsu1XCztj0Z2xPY7I9NWdwoIiqm/LKgimo/i6O2xaMLR
         yzO0K0yqc+hQZL25Vvoly6iZBrakjAHqmGhnXrK+npdDeH0UokiBGgYyi4Yhsedvc8on
         pJ5ZZZhqZH/4JcwVJxjJ4GHUsz0wizN2i9HYjsCLYiGhTgSyaVQ3p3N6M3HPj4DQXi/H
         2BW/swGHEI1Qhpu/AKdH3ur9UBbIvcdkvOShLPwADfDQxDzuFmwGD7KVupZ9IikRl/17
         mXzUpZ+uPVzJYf08j/rWYYyOCtn+QG3AjRVoj0mav667JNh/tAu9VjuxeBovRWgbL7v2
         MLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hFgCVYvdf8qCio/mcfsT/HFMMai5H9F95nC41WxplU=;
        b=rnjwzsiNjVpri5Ce0+TxU8bLcgPB1Sjg2QIXvvXgzmbcLOsfJNGm2ayeXC+46E03ue
         b1+t5JllwXkpycZAiy3BsMOql6WnqRAKafh7jCqz9tiVA3IPgNDMZF+u1Bq6T++7KTCw
         vNBI7IKLD0NWcgRO+vPjFlv59PM9ZuntoSCzRVWsz5uePx8iPJ36sRVocqXvhonqd9AI
         oFjw2hqxrtr+PgWCPczKDrL0EXQKKYtwB7C6IsG3VEFUP66Y2lI5I7L6HKsMUsKcMh2+
         Fqm6+JwTAAZroHYiI5H6k/9HHZaZU8oHRcyccTerH5iVKR2YgKQ7bP1HlyvYfLiGDhhY
         Ke0g==
X-Gm-Message-State: AO0yUKUaneJXamnTJbxL429yskL1Bd44bQ/B8EccXauWFi8of0clDppm
	i+FIidNyfLXAm9z8saqt3ck=
X-Google-Smtp-Source: AK7set/G+92FN/0hLG5LTDqB/5HLO+jsglkAAhxlxzfORyNGXB0Myo5noi0wmboxoHyoUt8qSFqJcg==
X-Received: by 2002:a92:cd89:0:b0:315:34b8:4c6d with SMTP id r9-20020a92cd89000000b0031534b84c6dmr2888115ilb.17.1677597053373;
        Tue, 28 Feb 2023 07:10:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b13-20020a05663801ad00b003e9e5e1aacasm2778973jaq.143.2023.02.28.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:10:52 -0800 (PST)
Message-ID: <d2aada79-61c4-0cc7-7b09-058564ed9fce@roeck-us.net>
Date: Tue, 28 Feb 2023 07:10:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy> <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
 <Y/3hVlp/YPnWHDCX@wendy>
 <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_071055_609832_8B5044E6 
X-CRM114-Status: GOOD (  17.34  )
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

On 2/28/23 05:16, Xingyu Wu wrote:
> On 2023/2/28 19:11, Conor Dooley wrote:
>> On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/02/2023 11:51, Conor Dooley wrote:
>>>> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
>>>>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
>>>>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>>
>>>>>> So the dt-bingdings need to rename, and which one could be better,
>>>>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>>>>>
>>>>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
>>>>
>>>> I feel like a common comment I see from the dt folks is to not put
>>>> wildcards in filenames & just pick the first compatible.
>>>> I could very well be wrong on that front though...
>>>
>>> First compatible is a bit better, unless you are sure this will cover
>>> all such compatibles now and in the future. For many bindings the
>>> family/wildcards were fine in filename.
>>
>> Ahh cool, good to know what the specific policy is - thanks!
> 
> If this watchdog driver is improved to also support JH7100 in next patch,
> it seems more reasonable to rename the dt-bingdings to 'starfive,jh71x0-wdt.yaml'.


Up to the devicetree maintainers to decide, but I for my part never accept
wildcards in file names. You can not guarantee that all of jh71[0-9]0 will
be supported by this set of bindings. On top of that, when / if you add
support for anything outside that range (say, jh7200 or jh8100 or jh7101
or whatever) you'd have an even worse problem. Are you then going to suggest
renaming the file to jhxxxx-wdt ? Or one digit at a time ?

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
