Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C44C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPHtmbCx/D/XahPPN82xxdInBFOEcrLqD1BuHpkucz8=; b=GeSMIoTA+GELkj
	OtPF2WUlECeQItkOA+1S13nI7TocTthuzOngp0cIuEvgFfHIKB8pdmjkH4lg0toEXvSz+eSfmmVwr
	AF2ITYdsukGpr/CL8FFoXL/HTWH0YnfqhaqweAQHiOrsqG/NafNQYFUizfjrWwzH/Hck9OA5RvyQ0
	9Mi2xGKd0gCL+QCFFGLEVQPvpQkczyzZsjDiJNezFYUI/3eVJPfo525FfE12wSvU69AqHmIDgeb3h
	aB+8J5ZWV5HBjzR06eCkBQrA8Y1TL2c1UDyhVpJCzG6ZM67BeaHeIHFtGCkSXCv01x7FptTFHrTUh
	H5w/fpsJa9FZD28Zfp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPICL-0000000CeKl-41uK;
	Thu, 04 Jul 2024 08:52:13 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPICI-0000000CeKB-1euQ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 08:52:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E3BF60014;
	Thu,  4 Jul 2024 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720083127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDKEjeOdgfEzXewLaWpZ2kvSxdcVTfMIj4W1FAZEaKo=;
	b=QvbeuyiHV0xdNYQtUPU5sR8XmOZ4dwHKnjvtXtTTlYa4aTJuaZvsZXv5tV8mVUsn7E+PM9
	yOvzG3rLiaOvFXIxA6qeyO/gBdOnhxLhe2Y3Irv8/dm2aL25YSxD+xaQuO7ml2C37ot5pC
	5ez3laFbifKSS35JPIhrioDcGeMiih1M4zJ26WldmiczpHxGQskCWubzfX7Ry+GCby4qmh
	DPRo4tk419q5PaxSDcFWOh8o1yWsNjzTJtcrNCur1x9JjFTusyYdMG/dIphN+TPur/DHo3
	EdowHlLe0K7KraEFSfWvc0ZgBVWX4vq3GqgM2BdacqnZ5u7IB46ImBqDgSfDEA==
Message-ID: <0d50df10-4b4e-47c4-930f-cd8f645a7e2d@bootlin.com>
Date: Thu, 4 Jul 2024 10:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add
 Sophgo SARADC binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicorn_wang@outlook.com>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
 <20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com>
 <b7913f90-7405-4a77-9c57-97ef124de6e1@kernel.org>
 <8d368347-7cee-41af-a033-c495eeb62e2a@bootlin.com>
 <577a5623-6dd8-4229-9c07-61e131a01aa8@kernel.org>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <577a5623-6dd8-4229-9c07-61e131a01aa8@kernel.org>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_015210_772189_6525B198 
X-CRM114-Status: GOOD (  16.63  )
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



On 7/4/24 10:39 AM, Krzysztof Kozlowski wrote:
> On 04/07/2024 10:35, Thomas Bonnefille wrote:
>> Hello Krzysztof,
>> Thank you for your feedback
>>
>> On 7/3/24 7:08 AM, Krzysztof Kozlowski wrote:
>>> On 02/07/2024 13:52, Thomas Bonnefille wrote:
>>>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>>>> the Sophgo SoC.
>>>>
>>>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>> ---
>>>>    .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 51 ++++++++++++++++++++++
>>>>    MAINTAINERS                                        |  5 +++
>>>>    2 files changed, 56 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>> new file mode 100644
>>>> index 000000000000..21fd5dc8e24e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>> @@ -0,0 +1,51 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-adc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Sophgo 3 channels Successive Approximation Analog to Digital Converters
>>>> +
>>>> +maintainers:
>>>> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>> +
>>>> +description:
>>>> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: sophgo,cv18xx-saradc
>>>
>>> Except that this was never tested... wild-cards are generally not allowed.
>>>
>>
>> I realized I made a mistake when using the "make dt_binding_check"
>> command, which led to some errors in this dt_binding. I have now
>> addressed all of them, but I'm not sure I understand your comment.
>>
>> I don't see any wildcards in the YAML file. Could you please provide
>> more details on what you expect?
> 
> What is "xx"? Sounds like wildcard. I do not see such SoC compatible.
> 

The point of cv18xx is to have a single compatible for all SoCs of the 
cv18xx series from Sophgo (cv1800b, cv1812h but also sg2000 and sg2002). 
I used that as a reflection of the cv18xx.dtsi used for all those SoCs.

Should I create multiple compatible for all the SoCs of a same brand ?

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
