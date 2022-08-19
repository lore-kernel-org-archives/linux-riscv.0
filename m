Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FEAC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzRQQ4hyKEbl64Uin6FYY/phcodrsVbk/ZR0VPWHlME=; b=vjFk1UPjCfjZ1o
	v2GTW19zgL5KARipF2EfAlRrStMtyP/hK37MU6kV7Z0Q4Zxt9oQOxiyz8Ov7VD6DC1gbKaBSN4SBl
	5TstUVFZkOHznGl44jH62AGB/9nu/FFOLRaABPGR/gxDlXOG/rvW/ufe/rzorsG2C4nt/tY7S+GUs
	wFjja6eTjPHLjRypBp//ZFnxcbmwZ/UzMVeT6L5N09BJszs6AJySXfDHNFzAb5Tj+N+ZXNIyP13pE
	ivcWecPf6/rUxDuvPZpZDcZ24D+FMVYe9mmT4cIztZOkLG1j2VcunKoaiHrr+n5jUToXWzPccPGUE
	fJtoYOIN1KktlT5We2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2tn-009Sbd-1m; Fri, 19 Aug 2022 14:22:59 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2tk-009SZT-5n
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:22:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b38so3719844lfv.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=W6XLvvBGoke5+DVCHO7jgqha7YhANK6x+3Vpkq+XWDE=;
        b=D8TRi6N573AdxP8uKx/TO+c6SXG/77vA7hDcrIL8d3gsE1xQJjQ699vUK+9c88fr/F
         PAiowGh1zHmR8r4PPKnEbTlr4WpE9O0mq9qzYs9ZQ9AAkWkFvwxlKowTS0l1rl5yCQGP
         S1qCUwCEYxBTAu/IaaflLGnomugR39kEjvFQlr8alzIst6MYdeHVmkXfldw6M0WUXGcy
         zgaHi6WX+Tqvd6U+vtNRmAA3SgLTnygrf2nBxheJ6M/W1Ms2VFTDJSoENXq/1+T20RF/
         RSy1Smu+6gHpoSmgLVKxkvlyaEB4fNrPBNQqwcekbL0mNQIxcqo+IuTGvhg5AZlXravn
         pNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=W6XLvvBGoke5+DVCHO7jgqha7YhANK6x+3Vpkq+XWDE=;
        b=gS7YBF+CCqvVbcSsVTHmbblnNqOSj6gFloFRPcn9RcvQgIFk2eBzamNurzfUrxtYMh
         MnExQt0oWLrG6K08nzkwt9fWY49uH37ruu3Ucd6Q0EhpE1er5hgEMt2zWLfky8x3L04v
         YAcVBKdyMa/GwUf9OeNfZdHzp7L4icfwLSt6nDe/csH7SFx2L37NSGbM0MSbZSO7JxXL
         D7A0lil8EK5dQzjti8Wk+tF1R7aSXp7z4bU22jKlUBBML0ZNu81G8ppFnicVkswZN+Ec
         65McgdQ4WMl00ZMe0re5VHbHXaFjNGOXj6MA7DeqnbauRYiJlAuWmI9kXffq5MBDigop
         bndw==
X-Gm-Message-State: ACgBeo0GxxBj2YC/BjyPJ+Yd1Vnty0ZoUr3i8TB81tGDF6wZz60oNP2X
	1D7+4c21Xgf+0C4zDQfa0zsjag==
X-Google-Smtp-Source: AA6agR6fwp6wpOn4Rzpjtks40Fom/eMSJFk8J9dE0Zc7x0M4BR6878593MBNvSYv+LbauP3H96P2tw==
X-Received: by 2002:a05:6512:4011:b0:492:cd8a:e22 with SMTP id br17-20020a056512401100b00492cd8a0e22mr739256lfb.248.1660918973099;
        Fri, 19 Aug 2022 07:22:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id u3-20020a2eb803000000b0025e5a7bd522sm630556ljo.30.2022.08.19.07.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:22:52 -0700 (PDT)
Message-ID: <4e12e8c3-2170-eaab-d910-f674bcc93f79@linaro.org>
Date: Fri, 19 Aug 2022 17:22:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To: Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 Daire.McNamara@microchip.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
 <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
 <138af26e-8e36-63a0-d3a0-5af866318839@linaro.org>
 <f8496006-7487-7b7e-1a53-ec38492dfe70@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f8496006-7487-7b7e-1a53-ec38492dfe70@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_072256_270023_BEC7D096 
X-CRM114-Status: GOOD (  16.57  )
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

On 19/08/2022 17:14, Conor.Dooley@microchip.com wrote:
> On 19/08/2022 15:06, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 19/08/2022 16:48, Conor.Dooley@microchip.com wrote:
>>> On 19/08/2022 14:28, Krzysztof Kozlowski wrote:
>>>>> Maybe that is me exploiting the "should", but I was not sure how to
>>>>> include the location in the devicetree.
>>>>
>>>> Neither node names nor clock names are considered an ABI, but some
>>>> pieces like to rely on them. Now you created such dependency so imagine
>>>> someone prepares a DTSI/DTS with "clock-controller" names for all four
>>>> blocks. How you driver would behave?
>>>
>>> -EEXIST, registration fails in the core.
>>>
>>>> The DTS would be perfectly valid but driver would not accept it
>>>> (conflicting names) or behave incorrect.
>>>>
>>>> I think what you need is the clock-output-names property. The core
>>>> schema dtschema/schemas/clock/clock.yaml recommends unified
>>>> interpretation of it - list of names for all the clocks - but accepts
>>>> other uses, e.g. as a prefix.
>>>
>>> So could I do `clock-output-names = "ccc_nw";`. That would work for me,
>>> with one question:
>>> How would I enforce the unique-ness of this property, since it would be
>>> a per CCC/clock-controller property? Maybe I missed something, but I
>>> gave it a shot with two different CCC nodes having "ccc_nw" & dtbs_check
>>> did not complain. Up to me to explain the restriction in the dt-bindings
>>> description?
>>
>> Uniqueness among entire DTS? I don't think you can, except of course
>> mentioning it in description. Your driver should handle such DTS -
>> minimally by gracefully failing but better behaving in some default way.
> 
> It fails not-too-gracefully at the moment, but that could easily be
> changed. Truncated base address I suppose would be a meaningful thing
> to fall back to afterwards.
> 
>>
>>>
>>> FWIW I would then have:
>>> ccc_sw: clock-controller@38400000 {
>>>        compatible = "microchip,mpfs-ccc";
>>>        reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
>>>              <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
>>>        #clock-cells = <1>;
>>>        clock-output-names = "ccc_sw";
>>>        status = "disabled";
>>> };
>>>
>>> & in the binding:
>>>     clock-output-names:
>>>       pattern: ^ccc_[ns][ew]$
>>
>> Yes, although this won't enforce uniqueness.
> 
> I know :( I'll respin next week I guess, thanks again.


The issue with this is that we are getting close to tying bindings with
your Linux implementation. What if other implementation does not use
these names as prefix and instead creates some other clock names (as
clock names are not considered ABI)? Your binding would still enforce
such property with a specific pattern.

The clock names should not really matter, so if you have conflict of
names among multiple controllers, I think driver should embed unit
address in the name (as fallback of clock-output-name) and the binding
should not enforce specific pattern.

I can easily imagine a real hardware board design with
"sexy_duck_ccc_pll1_out3" clock names. :)

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
