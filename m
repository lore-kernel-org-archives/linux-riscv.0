Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2379ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfBkMVcK9Baw2KD/DZIUlNeoINcx4kowXp6GwAtrUns=; b=WKE8xPHYpWbk0o
	HuueMY+y9WAOIsKUmDz1pIkX3uwwqTlUNoJRfzgFO4hz6x9Fjvi90AYhdP68tmDO+1NWdcw10vwR4
	Y3J9aLz78xq2rFGIFJAe7DoirIJB8Y1LFIfrAg3aBA1vjcQfsPWmr0Kf0GvoLj11cMmQsS4DFDZkO
	ls+fDWUAGHZNU2wDtcmbQ+QlRqcg/8Q1CsQlgKAH/nsctmrujQRNWUnmpXWQdydmjVQD0G1qnOH3Z
	kAduOaKascfRwx9tteLkEzrbawW6KnYy7CiLn/fFj97syn2hUhx9Ilowtjk2aL8cPyT8LCBEAhjpd
	D66IjSNi1zFXrGH6tkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT581-000tN0-UK; Tue, 30 Aug 2022 17:34:22 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT543-000rCS-QD
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 17:30:17 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q16so12112212ljp.8
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4oLornOVjulEhAP01pKqWVy9qULQoBVG2owDVTSt2sY=;
        b=JqQvaKAyf4NiH7wH0XvTGOv7bwgM02SZ2JlPTqBr+6bjakQ88TGk6oKBe14UVEMDfe
         HMO1MtVqLdcXBs7NtWWeekV6URrE3hVxnSAb8JPxoMd9af1aJBAbthn3NmOryfdAJhdh
         ah2NqPyrBlwfY4EOxBMU85j4+XkJsQ4Shy2L2o2zyBoIFqwwLrIxleWNuUhwrwh6Z+WN
         o+AuVEvbnHSg6x/xyWOrKJUgED8OE1oppPESoxyZXbCuk8eFX5z9/vbXgdaZu6Qsrbdg
         gk/sYfHZjwthuI4Czn9yIB9wTVytIoZ6cfz8pvNtENcfwTt1ucC9zBV8Z+SoMdDNsKwI
         2kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4oLornOVjulEhAP01pKqWVy9qULQoBVG2owDVTSt2sY=;
        b=DBZpflLAniobulnXt+o2oqKn/4jbs5uFvB0WkdwbNnVQsyuGGZQrvfWikZOcXHXDQd
         swSYcJdfwQv3wKgirM3PGSsx1UQH2bHNt/IP+esAlIYcDmOzEE62s/M451YCKHKmcAog
         sq894gww6ES9aINCtCoz6yQqVEA4S9+mjXb5qkwAH3VmESlSnCW/YefYMLfyAu7jiBgO
         N1wImwDiC42ogcrkrq9lKH1r3s34i9/jmj1pXNe06kfI6M5KsKxXrz3bUb3bAlcRY4EP
         n4mEXpSxQnc38MW9muMYldBtiXGtY1AdRf4GOWIJG+tQ2dIIIfVRYCH92Rh4DkvLLsNX
         OHow==
X-Gm-Message-State: ACgBeo22kmUGeJ5CsgkOMjEH6IYSNjWTZ6t86/HbgIZyzm0OabiMzyqQ
	nIcSDTr3gEAgAEApz1PDoOtf2Q==
X-Google-Smtp-Source: AA6agR5LlXfJrdqDnVn0v8peNaVh8plpRRfBgPhdV098SOCTZ2Bo0ipZxlJJHCZdZCRPOLbkya6dKw==
X-Received: by 2002:a2e:9c88:0:b0:263:d696:75b7 with SMTP id x8-20020a2e9c88000000b00263d69675b7mr3926487lji.461.1661880610307;
        Tue, 30 Aug 2022 10:30:10 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b002641ede39e1sm1112468ljb.9.2022.08.30.10.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:30:09 -0700 (PDT)
Message-ID: <dc3bd6c6-852d-30a5-2ec1-ab5f7fd1488c@linaro.org>
Date: Tue, 30 Aug 2022 20:30:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Daire.McNamara@microchip.com,
 Shravan.Chippa@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Cyril.Jean@microchip.com, Lewis.Hanly@microchip.com,
 Praveen.Kumar@microchip.com, wg@aries-embedded.de,
 Hugh.Breslin@microchip.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
 <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
 <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
 <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
 <69027950-f18d-c9a7-9f0b-d73ef68197c7@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69027950-f18d-c9a7-9f0b-d73ef68197c7@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_103015_917654_9B8044A9 
X-CRM114-Status: GOOD (  11.84  )
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

On 30/08/2022 19:59, Conor.Dooley@microchip.com wrote:
>>> w dts were
>>> needed so that the gpio-hog could be set correctly. Out of curiosity, I can
>>> have the same compatible in multiple devicetrees right? In that case, it
>>> would just be "aries,m100pfsevp" here and I could put that in both?
>>> Would make things easier..
>>
>> Depends, but I would say for this case rather not. The compatible should
>> identify the board. If the boards are different, one compatible should
>> not identify both of them. Imagine U-Boot (or something else) trying to
>> match the DTS.
> 
> It is the same board though, the way the bootloader works is that if it
> detects an SD-card it will use that to boot from, and if not will fall back
> to the emmc.

Wait, I might miss that part. So this is exactly the same hardware with
the same SoM/SoC, same eMMC and SD card, except that one has plugged
this SD card (as it is hot-pluggable)?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
