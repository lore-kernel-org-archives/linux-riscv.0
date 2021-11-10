Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 07:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BB2611C9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 07:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15BB2611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4M0BS/erNcfKR7mNz28kTb1PIl+Vk2sDNK6ouDtIASM=; b=zt5Abzl4GCrTZL
	aNVAp58osPIW08n5QZL1EXd3LpC+V0GxCyNnojppdJyYdTc1Kj4RqY8AjwcW0/GOnDVnxEH/hK7TL
	HXGNLPoNP5HXUAxE9DE8cpraSKloALzdv5HoCiJXdqsjNWnAeHjGgU6yvizyqfGIF7XwVNJlnGFbE
	ojTLBhGjR5usjGa3hL9RUEUeoo9dsakS4gGZKr9NQJwbAEZm5FQErA7SbpVUuCffruyEt33QOhgro
	ALDgY2dz8HTLypM2tjLto2VCiJkoCoqdkXx+L8sBhcfOZWQhxfxIXIi4heZb3YC7uGvboCvkusk5W
	1v5kD3xvYTyMhoL84pCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkiGX-004hVG-Kc; Wed, 10 Nov 2021 07:43:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkiGU-004hUm-Gx
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 07:43:28 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B1A7F4000F
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 07:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636530203;
 bh=kNwihk9+TZU7Lmf8DShsoXNExCm0rcNJhlWEmsYrxyI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=S3UkVhwva7oXD/utTsbLvSEOWYPiQqe2HNz8ceBv2wbBzkKHz6IhKBPSfQAf2aUa5
 RqLbxjRPhL0vrKTYju4tCxspXZM3dG3T7BBApXZbTnB2xtf4tMWl5iaMHnpJ72X7SU
 VhMGqAXabo071GJF4VS5vfugd7pEqdqEpb5sMk4rctE7nkZmC4ptRRhZGiid+Hlhpo
 m+IudOXzks+ptp2rqMJ31ns3G5NcYF3FvUmJIILSKz2IWC6WhRRsUsIJX3x64fu2j8
 Sxazf3TC4YEVsX3Ca04s8CD+WZPrzIryQ/fTrlvo+h7nsBAHKiG27TlUr/9JUfty9O
 rEXPFOV/KNtpQ==
Received: by mail-lf1-f69.google.com with SMTP id
 s18-20020ac25c52000000b004016bab6a12so888659lfp.21
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 23:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kNwihk9+TZU7Lmf8DShsoXNExCm0rcNJhlWEmsYrxyI=;
 b=zClTB2VRGiSc56gCGwvECHWQk42N5eawLulvWXynngIg5gxj0cktSk5IMZBTZSATql
 b+jziiJ0vRUDpnJtiFeQ1nNwxoOmIdMjsw+68z8pmTTMyLyGZJh3ggDV8ZcelLKmF+22
 n1XGwAPYo5AHKU9Z6zr1qNl6vcb0QcqBPNMFV6JKS8yVvWsq+GYthUHuJagKt2FE5iAv
 In/YeUg8bQCk8k35/E85DHY1XwLyZ0LkGdeNsX5TabnggC6dCQNBjzp3DiYi1M15KQzn
 vZY7WHhANrgZEOWcOCXzH9Opg/jd9wqZSby371EcYcisvZqxitlCGIzh6Xn0w46T8fdJ
 bArA==
X-Gm-Message-State: AOAM5322UnFx2QCpdw3jZrxJpBmKhsv57Xz65XLXUUYvJfRpTeU5l4Va
 Wbysgo3y3zW9+MB1XUUnDUDksPPAIi5O3hRtsnn60mvWrfrArK3SgVVu0uy6nlhC0xSQivLqWEX
 ne02fQvVU+nGzohvJU2g6+Up7GyDKzPQO2/Ur1h3AsUmc/A==
X-Received: by 2002:a19:495c:: with SMTP id l28mr13327766lfj.484.1636530203160; 
 Tue, 09 Nov 2021 23:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX+kjYjN8x46mRk3Aya4zrud8jozXCf15P8hF9wfWX3cQCPgmfP5uU1NUQOpol1NYR50a10A==
X-Received: by 2002:a19:495c:: with SMTP id l28mr13327746lfj.484.1636530202958; 
 Tue, 09 Nov 2021 23:43:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 a12sm1669240ljb.19.2021.11.09.23.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 23:43:22 -0800 (PST)
Message-ID: <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
Date: Wed, 10 Nov 2021 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Content-Language: en-US
To: Conor.Dooley@microchip.com
Cc: broonie@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-usb@vger.kernel.org, bin.meng@windriver.com,
 linux-i2c@vger.kernel.org, alexandre.belloni@bootlin.com,
 Ivan.Griffin@microchip.com, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, a.zummo@towertech.it, gregkh@linuxfoundation.org
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
 <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_234326_753408_4765F735 
X-CRM114-Status: GOOD (  21.40  )
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

On 09/11/2021 14:36, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 12:56, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
>>> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Add device tree bindings for the hardware rng device accessed via
>>>>> the system services on the Microchip PolarFire SoC.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>    .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>>>>    1 file changed, 31 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..e8ecb3538a86
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>> @@ -0,0 +1,31 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>>> +
>>>>> +title: Microchip MPFS random number generator
>>>>> +
>>>>> +maintainers:
>>>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: microchip,polarfire-soc-rng
>>>>> +
>>>>> +  syscontroller:
>>>>> +    maxItems: 1
>>>>> +    description: name of the system controller device node
>>>>
>>>> There are several issues with this:
>>>> 1. You need to describe the type.
>>>> 2. Description is not helpful (just copying the name of property) and
>>>> actually misleading because you do not put there the name of device node.
>>>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
>>>> please use existing syscon bindings.
>>> 1 & 2 - Correct, it is bad & I'll write a better description for it.
>>> 3 - Its a system controller implemented as a mailbox. The syscontroller
>>> is the mailbox client, which the rng and generic drivers both use.
>>
>> I understood that pointed device node is a mailbox, not this node. But
>> here, what is it here? How do you use it here?
> The system controller is the means of access to the random number 
> generator. The phandle to the sys controller is provided here so that 
> the rng driver can locate the mailbox client through which it requests 
> random numbers.

I am asking this to understand whether there is a generic or existing
property which should be used instead.

If I understand correctly, the rng driver needs a mailbox client?  If it
is mailbox client, then there is a property: "mboxes". Use this one
(look for existing bindings, e.g.
Documentation/devicetree/bindings/firmware/arm,scmi.yaml).


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
