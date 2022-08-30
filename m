Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A32ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpBVJBkgO4A4ESCEHtbF5L+X3BVY7DBiZSPclIZPu4k=; b=JWcdxrstvcfJOn
	ejFsq3sZsMpkW/JES7FiL/7VwjnmxClKwDvW5dgeOItzWHnalwNxCu2j0FR+kM88qVwErhb34oHc4
	e9/GFKNFAlyPF9xwftkK7zmYyPD7EC+SCe8Vt5LmKmzbDlJp0aik2/rpl5YhgSz58vO5G3aHQNTH/
	tKTyRV2bggBdLid/oiscXzp8+KNceewFXnF3OdRsK7glb7zNVG4g0NTRKABWTNd/qBjv/Ml765y5T
	ZXXXRmH9Qdahcyo8An4Wc4Smy3NzYxtMsEoeIidtNOKqv8FTpVwbqq/6jP1GWwWHzONRch4w9l8No
	13KNxQdMAlpYEKvlppEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4Wp-000eEo-OO; Tue, 30 Aug 2022 16:55:55 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4Wm-000eDe-NT
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 16:55:54 +0000
Received: by mail-lj1-x230.google.com with SMTP id z23so9158426ljk.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Wtbpa/TU/UVvG6l5cM7I57cwKv6TjGE2IRy/n2NlvH8=;
        b=cMRjqV0y4Hw5Gevy9PhVk8bcNnSQ2heXx1mf3hGi/9WUfYrYbbUNC6+x2l0fFIF5bl
         gjJF9k/4icTUHR/na8HOT3AcLhZcnszsdCAn9CDmzo4jV8mitV7k0SCrgFigcGCOfqnf
         hxFG2UvZ8mtG5qerP9EYWBRi03Sj2BqEFfTBlLlyZ+xt6Dyut4HJTZwWoETV12ezZ21q
         pTMWJ8vpPnf0C21NX98FPj+3YG/LVwNecX1OWFd7vjYmFKmRLTXAeaI2FCJXpNyL9VDQ
         YM1+Q9hXiApWt/QSwLbkFuJMKVOHLBqV4Btnc+KIuPpxG0/a+uhpTfv4aHAaHOs78bSz
         K28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Wtbpa/TU/UVvG6l5cM7I57cwKv6TjGE2IRy/n2NlvH8=;
        b=zpeXixibMP9672UA0UvGODYzNMHFosop0gOJe1L1szzinrc7X3EjpVFiiOGYCB7z9c
         WvzEfGLYd3dyOv6kzeDnf62YIjIkhnae9twa9ZsXAW5VLg8tD+DjZr5zgiR1F9aBx0L7
         4H4Ve48dPOlzpI4yXgIfZpdvRkt6oQYuQjJdKCWBMgiIixYU9okhMEf7XMavp7D3ehGj
         tf1WNt7VXmNUyIH3FHt6MgsOvzVZcGbqWmCCIIGQzXhpNkx8uIydavec0dQYz1sgJrEK
         bQMkRmHIfPCxywbQBomxPuUPtIW2gW6X5xdVBRb8M5v+hXOzVUqk+UHKBo8ALr9+vi3c
         pCQw==
X-Gm-Message-State: ACgBeo1o1diTqTV+p6myBD9zxbK3r8bji0dqQkCkvnf6ok2K5c1nms/J
	EUdA36sXGnrtMoRHxdoMSwQ/sg==
X-Google-Smtp-Source: AA6agR7yTClqQKYpNWFYkL+HxX6EKhzfUXFgL84ffTm/hRU1N31ME2ALvGOeJml2kv4XcFnI7BxQeQ==
X-Received: by 2002:a2e:6e09:0:b0:261:be09:6339 with SMTP id j9-20020a2e6e09000000b00261be096339mr6847202ljc.15.1661878548935;
        Tue, 30 Aug 2022 09:55:48 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u4-20020a2eb804000000b00265ec8ce420sm743371ljo.122.2022.08.30.09.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 09:55:48 -0700 (PDT)
Message-ID: <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
Date: Tue, 30 Aug 2022 19:55:47 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_095552_793642_D46573F7 
X-CRM114-Status: GOOD (  16.98  )
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

On 30/08/2022 18:25, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 15:37, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 30/08/2022 13:17, Conor Dooley wrote:
>>> Add compatibles for both configurations of the Aries Embedded
>>> M100PFSEVP SOM + EVK platform.
>>>
>>> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  Documentation/devicetree/bindings/riscv/microchip.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
>>> index 485981fbfb4b..04ebd48caaa7 100644
>>> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
>>> @@ -27,9 +27,12 @@ properties:
>>>
>>>        - items:
>>>            - enum:
>>> +              - aries,m100pfsevp-emmc
>>> +              - aries,m100pfsevp-sdcard
>>
>> Usually sd card is pluggable, so what is the actual difference here? For
>> example this one:
>> https://shop.aries-embedded.de/evaluation-kit/m/m100pfsevp/445/m100pfsevp-250baab
>> has eMMC and SD card...
> 
> Yeah, both are there but it is muxed by the bootloader using a GPIO. For
> icicle this is done by a mux in the FPGA fabric instead. T

Ah, this is still just one MMC controller - either as eMMC or as SD-card?

> w dts were
> needed so that the gpio-hog could be set correctly. Out of curiosity, I can
> have the same compatible in multiple devicetrees right? In that case, it
> would just be "aries,m100pfsevp" here and I could put that in both?
> Would make things easier..

Depends, but I would say for this case rather not. The compatible should
identify the board. If the boards are different, one compatible should
not identify both of them. Imagine U-Boot (or something else) trying to
match the DTS.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
