Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8841EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 07:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F239611C9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 07:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F239611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dhe2a0KBrA+gjyRRqA4ZqViRkrYvziB3Zfhu2UT3+Y=; b=QMAESPDrq3KyIk
	nA4MZp5jgZKjdYx5zgAULQHNBXVVIv7L7JzPrUMuu/gb5E4+1MC4FUZeU7+1QMN8ruzv53vEMKmSg
	LC0plQeKOM0uV0IRbn0rCn/Z2qNsiWtu7ZZfzpkQX+obJbk8Vt/ICnQg749mfN56q/0wOaXbvTxzK
	6OcpzLoOAsoUJautg6uTcdBHgFaTCt9hdPoVS25oRbeDpEOQbmVbC8CGBExWHpUst/NjAXeA531CH
	XkI72dH8qPo+FSXfc6XSq0llVSKPLjtH781gUi2QZbYESAiHH5JTQP+Je8XFkAU/VMj8nLpAvNZbc
	D4cJCDwkOGeU2YuLkJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkiIV-004hjA-Cm; Wed, 10 Nov 2021 07:45:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkiIS-004hif-CC
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 07:45:29 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1EB613F19B
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636530327;
 bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DrjT1UGU6tGN12zPCrmSmBheEVMGEr0bAg14ms71wqc11rWWUeCRZHGB+NgDg8RWR
 CZNunqRTDBgYWhoJ27OM1k/QUAtPFg8C+E5/bQeHk18IqhqKiGmHls1yNu5YIULHbh
 AR3AKeoNeaDyDrr3Vx0sxw2dQDDsk0doT52nc9z+hc4JSZETbc2kYKcrKZBWnhYVlF
 Pl14s/EXqMFzZJFYH0DDXkYlMP3ul+8VC2b1a6nPfwj62FnpiLmukFAHHc1dS7uha/
 PDczwIkfFENeBlPrLYmm4qOAXun1BxGs9T+1xN7lhMwLmPbDOZzIjYpo24VIRn20Ii
 LRoO4VZ5iqc0Q==
Received: by mail-wm1-f69.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso738405wma.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 23:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
 b=FLz7s/3B8FJEvC11lLW/AicruarWgw/f0CKrPxRzrbqzgHqDDXdXVe/fiXhKHgOOrQ
 S4TPG5zVtM8S/OdZ1z8zpaDXPznpFoZ3P7PqlFEs26Zc4NYVvwAvdXFnNTbJXPIpu/3r
 ksWFwhip4oRLy562njugMWrCQ/3lm7t6uUAs4/+1X9D1MMhjjEEFYgLS1wAya7OB8Te0
 kytLTLTFlnQYa9p1SqVSp+rmf8dzaLY11bW21a5uS+kOLlwMG4mCKCpNMGmgW/n0U9DU
 GD4U6lE196r3Yn5B2tiSTuxRAQwZ2EPS7ulwgj5tA0l2kK0aY9Vdp+67ep6jcIG7GJRu
 MkKg==
X-Gm-Message-State: AOAM531liIrez8Bsn0zyAcg2gQdv8wr5ymfYf8tG2qfZLMuPKFd/XR9e
 qYh7+GoNdXMG0HE/jA1XqJpnr87Ctyrxq4MxPiNCFLfjuJ8QDFR8ozR5ZklEsBmFGm0srwVnuOy
 kuCOsYAs36OfeNTbYXpRvVrBrybuIe4THq7YS1mvhHkKlCw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id
 z15mr13724637ljo.30.1636530316533; 
 Tue, 09 Nov 2021 23:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj/L+35JjL2smH5MiuFZkelZYQSjo3AZ/1hVDezSpzMKpDS3vieitpkj9D1r3Hbn/gkMU6Bw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id
 z15mr13724596ljo.30.1636530316282; 
 Tue, 09 Nov 2021 23:45:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 b22sm2384886lfi.67.2021.11.09.23.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 23:45:15 -0800 (PST)
Message-ID: <978563c0-95fd-1c76-42a2-5e0ab9cbc61d@canonical.com>
Date: Wed, 10 Nov 2021 08:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh@kernel.org
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, 
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, linux-usb@vger.kernel.org,
 Daire.McNamara@microchip.com, linux-spi@vger.kernel.org,
 geert@linux-m68k.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
 atish.patra@wdc.com, Lewis.Hanly@microchip.com, bin.meng@windriver.com,
 alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
 <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
 <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_234528_585625_FC930F57 
X-CRM114-Status: GOOD (  24.18  )
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

On 09/11/2021 14:20, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 13:04, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
>>> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>
>>>>>>> Add device tree bindings for the {q,}spi controller on
>>>>>>> the Microchip PolarFire SoC.
>>>>>>>
>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>> ---
>>>>>>>     .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>>>     1 file changed, 72 insertions(+)
>>>>>>>     create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>>>
>>>>>>
>>>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>>>
>>>>>> yamllint warnings/errors:
>>>>>>
>>>>>> dtschema/dtc warnings/errors:
>>>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>>>       19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>>>> Rob,
>>>>> Should I drop the header from the example or is there a way for me
>>>>> specify the dependent patch to pass this check?
>>>>
>>>> The error has to be fixed, although not necessarily by dropping the
>>>> header, but by posting it. How this can pass on your system? There is no
>>>> such file added in this patchset.
>>> I linked the patch adding the clock as a dependency in the cover letter
>>> [1], which is why I was wondering if there was a better way to do so
>>> that would get picked up by the checker bot.
>>
>> It's not only about the bot, but dependency when applied. If you did not
>> warn clk maintainer that clock bindings should go via Rob's tree or
>> should be provided as a tag, the patches here cannot be applied in this
>> cycle.
> It was not my (our) intention to send the clock patches via rob's tree.
> And since this is my first time trying to upstream wholescale changes to 
> a device tree I honestly didn't expect this series to get accepted in 
> this cycle anyway.

OK :)

Assuming your new bindings pass db_binding_check with
DT_CHECKER_FLAGS=-m (on top of clock patch), I propose to keep the
header here.

Another idea would be to submit without the header and use raw IDs
(numbers) and convert it later. I prefer the first- base on clock patches.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
