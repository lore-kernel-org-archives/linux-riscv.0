Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93EBC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 970D86109F
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 970D86109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfR0jLGO8BEHW4NoZ4DhfLxZB/UmfH15QJ+fx5GW1wk=; b=4jGaJp2Jb0xEge
	H2U0MhQtDqjhdjVt5igr6Nk1c45e5/Lh6Vi9yYoesSyRET+aVf8p7vzUGe24BteQH9Yow3cKBULom
	MzKEO6QOcZXSnVj0QHjQ62ykRlJeoouyg3zAF8H4XT3YoAocyrE1YMKvlh9zEUVX8FCxe3wZ5/qzS
	PWNwAwEW5eHScUAN5TwWp6df8xBnshIXmD2RSyXiz4kE1hiC23JNAj8nz62lihYIx0RVqjiWv1UN/
	1CRaNTSMZCS7eV44xTNNM8nw5llnNIGd0B69RfxMuTg2ug1FvyEjMmqFXoIVw+bwprb72YBAokHCG
	zUnk4qt0ZWgeKUaB73PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQgP-002APi-RF; Tue, 09 Nov 2021 12:57:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQgL-002AMo-JG
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 12:56:59 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AB3A40797
 for <linux-riscv@lists.infradead.org>; Tue,  9 Nov 2021 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636462615;
 bh=yZUG7Tb7m1UqX5nCLe8b1PQIfsTUxqRuBTIMx3/ftko=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=D898EUzhhoElf0sywtzsUznZ36Op/5YBxwsBhHFD0m8DnlugqjDtj1RS3Q/C5RFaX
 8tYrYzaiKczM1SCuQ8LOY6BR0qDsikWiAH/drxnwjz5qS7y6WF1eL8auLVe409GofX
 lu7PZPI1JeAAqh+9GhaKMuOtogVNDGUDU3Q0+KQpiD/lUAizNihpSUNXLxcDtrns/r
 6Rk9xs4VZbXFGahmQZjLIUX2e7yYA6FNhKO5qDCB2ZMlh23mL7eSC3iiVaS83CmJt8
 tP0AGxhJC8gG4rfMITA3WggNea7flHGNg+zx2OUnI84Ts8yTjQHYer2Qn8EFPwuMv9
 2POczwnP8MT2g==
Received: by mail-lj1-f199.google.com with SMTP id
 q13-20020a2e750d000000b00218c953d0b8so1742535ljc.21
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 04:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZUG7Tb7m1UqX5nCLe8b1PQIfsTUxqRuBTIMx3/ftko=;
 b=MiNzQ8RrVFJNSYXL6BDg2TRcNCOrRsX/DJPy/gih7VK7oQpTzMRJlssOEzg2lP9xE8
 ld/UMngn0f9tNGebjAYnP15fvY/fsIOry/8EhqzCZc7dRGQeJ2STxta4QmMvDsFfn8/G
 eQV6iZwIn8yd8Vb5QBW5EXTAWsYgID8/IvQUsJ0fuy33q0fevi13QzkcMQu8R/FlFzDu
 m0+9bePfKv7n5xxk/MzP1kUSj2GCj4bh97G52dv/lTBpHvPmtLLL8HdOfwDrSjnkoJtw
 wd8SMNiZcoRfjUKw9ksbB4wRU4hTZr+3NXlHHvrp5Sv+bLTkDBjDGVfUbwLqwMI246yj
 7ilg==
X-Gm-Message-State: AOAM5313kcDSNFGxLC/omQHLT6NvkhV00xLH+CtSeL8u/GuvGPDc+b8p
 vCSwWOviG7rHsmFvNKGvQbNW/z2/AGq29DarayTZCclZ4noSUPUTKb+3YQpYKWt3eJawF2cfipR
 BPvbLucIzahnY6wP70kQgx9IsvzCHZLzt0q6iGmuixrsCQA==
X-Received: by 2002:a05:6512:1045:: with SMTP id
 c5mr6954941lfb.115.1636462614636; 
 Tue, 09 Nov 2021 04:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwITYDenNraLQf7L9QCEZpNJX/wzJp+LTTIyOssbyLIHoaCcJ+w/+l+RGCCEXGOEyjZkvgRIA==
X-Received: by 2002:a05:6512:1045:: with SMTP id
 c5mr6954909lfb.115.1636462614426; 
 Tue, 09 Nov 2021 04:56:54 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 n7sm2131681lft.309.2021.11.09.04.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:56:53 -0800 (PST)
Message-ID: <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
Date: Tue, 9 Nov 2021 13:56:51 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_045657_845064_094A27D6 
X-CRM114-Status: GOOD (  16.89  )
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

On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Add device tree bindings for the hardware rng device accessed via
>>> the system services on the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>>   1 file changed, 31 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>> new file mode 100644
>>> index 000000000000..e8ecb3538a86
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>> @@ -0,0 +1,31 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Microchip MPFS random number generator
>>> +
>>> +maintainers:
>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: microchip,polarfire-soc-rng
>>> +
>>> +  syscontroller:
>>> +    maxItems: 1
>>> +    description: name of the system controller device node
>>
>> There are several issues with this:
>> 1. You need to describe the type.
>> 2. Description is not helpful (just copying the name of property) and
>> actually misleading because you do not put there the name of device node.
>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
>> please use existing syscon bindings.
> 1 & 2 - Correct, it is bad & I'll write a better description for it.
> 3 - Its a system controller implemented as a mailbox. The syscontroller 
> is the mailbox client, which the rng and generic drivers both use.

I understood that pointed device node is a mailbox, not this node. But
here, what is it here? How do you use it here?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
