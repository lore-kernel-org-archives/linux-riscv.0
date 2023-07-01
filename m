Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA35C001B0
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYTpSMDSAjBibHXOunzgIvBdn8mMRSYoN9fd63R/nGc=; b=a/zTE9zHYLjl+1
	lKlIboTj8cXJ0yp2iVXcO3le3/FwNjOVEkIYnilUu+UfPtTJezwdhDistCPoLCkoZiObBIm52usc/
	DMnGNEmHulW39XtXUBHoaaPgvbRFzgSndz10bJXONxnu9Et5sY1EySJO7GZxZ7lPhSgvax1nT5z2U
	KkyW4gIr6cMnTQc8rjz11FeEhUKp1m8G9pJ/H3fBNmHJzW1bIMXguS+AwzXO7toVhO9dPlgPQuil4
	llJQgvGQMld2Fr24s8ih6NgvbFHI9s2+Vo6OUknWknu1LMMkmlVGBLNZR9FSTFGjrn1LGfnhu2pM9
	iVLBjGS4lKq9VSxabWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFVnp-005Rit-2s;
	Sat, 01 Jul 2023 08:17:57 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFVnn-005RiR-10
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 08:17:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-992ace062f3so300722566b.2
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688199473; x=1690791473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFUtqRuFYxZPNfD4i3kr3X3ptU2+o2FOiAEweLLRh0Y=;
        b=hZ/FFeqa4g54JerJ53qoyxU4QTmUnUf0v73u41e+vOdiGZyUnWeNIEbTY9zWw4XMQw
         zX2EuskfWe+XkRlT71jQ/Imrl935VrguDYwH/WJAC6FgSzab8UDCYWrLrjfpaV5+mcEx
         4vjRkfjXAzH8mjoZyJvU6x0Ms+Qxl+jZqu9S7m3AQtatRtdY4C3jxzFPj1iNK9j7tvsj
         fiS79qaZO6xV8jW4vvzP6xdrGYKSsjN4qM4hv01/6t6X6bNKti8xozXaZAEsDIvpgXT5
         CEP1COSjeAsWkkylM7qBrO5SfimMr8i59FAO7XMV/o8vqa2s1MfsNPE+6Xqc69fDc5C1
         C7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688199473; x=1690791473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFUtqRuFYxZPNfD4i3kr3X3ptU2+o2FOiAEweLLRh0Y=;
        b=hhZnZrVJAoJEF7AIFcc7g0dFyai6ZSSJKSrsSz0qgkpfeN98em8KUhiXrkj0AzpV78
         xlanUwbhb3t5xFJqqC9Fqk9TVYDSr7Yqp3Qu2iQg4MtEeALyD+It/Gw+Osn4uP87teFV
         cKFQfx2qa/3rUuB3JRTpYQwM/6wQquQSWjoOxLbdsLrOPqCFPr1muAjmx6GKOt/SMIVa
         2FwgTaM6j+sNDMRyYKX872XRrww8oyIkSGuJmgv05YOYpTLuwQOlcw2nVlCQHs/MSx1X
         6CLYGGZV/dOhYPUbioagghKpaTlF/EwinWloagQgq0YFgB41tLJtYaC6wicwLw/USCEz
         V+XQ==
X-Gm-Message-State: ABy/qLb6m2onxQOJQLAbDFpgvEcYyToR8Digz6assMjSGqYYcIRFntAn
	kJZkJmX3UHHfyaXi7zljzpmdpw==
X-Google-Smtp-Source: APBJJlHl6fEgoqPBsy1ZFFH2uK0Gpmfi0RiZj0Uiu8sQs4UkbbfdT3pVNRrhM6i2vh5cofEh0GFVtQ==
X-Received: by 2002:a17:906:3650:b0:974:1d8b:ca5f with SMTP id r16-20020a170906365000b009741d8bca5fmr3422697ejb.9.1688199473199;
        Sat, 01 Jul 2023 01:17:53 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id jj25-20020a170907985900b00992b1c93279sm2693469ejc.110.2023.07.01.01.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 01:17:52 -0700 (PDT)
Message-ID: <c0244a98-4c91-93d8-a3e4-5210d0b3f205@linaro.org>
Date: Sat, 1 Jul 2023 10:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-2-hal.feng@starfivetech.com>
 <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
 <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_011755_384488_1C16AA50 
X-CRM114-Status: GOOD (  13.98  )
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

On 30/06/2023 03:57, Hal Feng wrote:
> On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
>> On 26/06/2023 13:09, Hal Feng wrote:
>>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
>>
>> ...
>>
>>> +required:
>>> +  - compatible
>>> +  - "#sound-dai-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    pwmdac-dit {
>>> +        compatible = "starfive,jh7110-pwmdac-dit";
>>> +        #sound-dai-cells = <0>;
>>
>> BTW, I don't see any resources here. Neither in the driver. I think you
>> just added this for driver, not for a real hardware.
> 
> Yes, this is a dummy PWM-DAC transmitter as described in the title. The
> StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
> dummy codec is needed for the driver.

Bindings are no for drivers, therefore with such reasoning the answer
is: drop entire binding. If you think otherwise, please give me some
more details about the hardware.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
