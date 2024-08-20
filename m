Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE0FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6IbvQ7tG8vUp8pQmYMCAsQ2ZtcX5JYZhR+tSZU2qvE=; b=HmFwAs9ZxZFFgz
	waX8xC0SxZ1WDxUoUzbt9ELDvqrdntYgxU/c0/R8NQkQ9s5Q+o+70qKpngRclNYwbeIS5P4VG/CLO
	WB7IyO2J314Fs7BmKItYtMsckyr3wT1m4m0FtikELIx/uAjZ+GcdcYg+yQIz8lsDaldCzb19zYB7+
	J7T0Lupy2bupt4krNWmb/iCLpU0+Gu+P9kEn6GW4tfWh2a+E0/JeiMAWwEpOxn8bUZQ80FknmZYjJ
	Kb3oTHhkDqjAtJQSJNp2hF7FrlWvvfCDJC1JUxZnkkk2LDRmcmAu7PmNlARIrVHAT8NMbXoYdy0OW
	Mhc+ev+5hws9JDUj8V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgRbi-00000005ywJ-1ejF;
	Tue, 20 Aug 2024 16:21:18 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgRbe-00000005ytq-3VRd
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 16:21:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0F0FC0009;
	Tue, 20 Aug 2024 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724170869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKCyGXB2y2Cdc43x8y99O9EX9a/Mff/KPXgIgmFwkX4=;
	b=Izyxd3JlQY3bI7qjYRGGRzXKzEjqIXWUTA8SwOGLeXBsWJ9bflw1XafR+AC3k8ODhhiI1O
	ZagoBAbsc0ixWaEUayWT4rJJrL0oHuggwExnbhpVXF5mVtampLNhrjhGX2SZTj59cz+GUa
	I87ta0Cp5NVMQrmcKglNF2zoyzlwITAyYkrDMlO4V6CD/d0nMFbKGtLklNrgYwZqxud+gJ
	zJTHLC2mVHl7iV4sKUHjsSSAGbrpSfcvDeKxK1FVkCJa6HcseWP5cRvbzM+Du+JqiGCjQg
	aBm/VIg+Fu89whSIm4a3whCGPxh4nszuZamznzowxyQefb+pDGOEtvBDjkGZrw==
Message-ID: <89aabfbe-79bf-4da7-be44-b6cbd92b72a9@bootlin.com>
Date: Tue, 20 Aug 2024 18:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo CV18XX SARADC binding
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
 <20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
 <20240812-unwary-mongrel-9f6758bf624c@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240812-unwary-mongrel-9f6758bf624c@spud>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_092115_794296_2179E572 
X-CRM114-Status: GOOD (  22.94  )
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

Hello Conor,

On 8/12/24 5:53 PM, Conor Dooley wrote:
> On Mon, Aug 12, 2024 at 05:00:55PM +0200, Thomas Bonnefille wrote:
>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>> the Sophgo SoC.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> ---
>>   .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 85 ++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> new file mode 100644
>> index 000000000000..846590808e5f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> @@ -0,0 +1,85 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
> 
> Filename matching the compatible please.
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title:
>> +  Sophgo CV18XX SoC series 3 channels Successive Approximation Analog to
>> +  Digital Converters
>> +
>> +maintainers:
>> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> +
>> +description:
>> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv1800b-saradc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^channel@[0-3]+$":
>> +    $ref: adc.yaml
>> +
>> +    description: |
> 
> This | is not required.
> 
>> +      Represents the channels of the ADC.
>> +
>> +    properties:
>> +      reg:
>> +        description: |
>> +          The channel number. It can have up to 3 channels numbered from 0 to 2.
>> +        items:
>> +          - minimum: 0
>> +            maximum: 2
> 
> Is this sufficient to limit the number of channels to 3? Aren't you relying
> on the unique unit addresses warning in dtc to limit it, rather than
> actually limiting with min/maxItems?
> 
It seems like I can't use min/maxItems on this property. I think that it 
is using size-cells + address-cells to deduce that the number of items 
should be equal to 1.
Looking at the dtschema repository it seems to be the case in reg.yaml 
with address-cells/size-cells = 2/2, 1/1 and 2/1.
If I try to use maxItems here :

     properties:
       reg:
         maxItems: 1
         items:
           - minimum: 0
             maximum: 2

I get this strange error message from `make dt_binding_check`:

DTEX 
Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.example.dts
/home/thomas/linux/Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.yaml: 
patternProperties:^channel@[0-2]+$:properties:reg: {'maxItems': 1, 
'items': [{'minimum': 0, 'maximum': 2}]} should not be valid under 
{'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/home/thomas/linux/Documentation/devicetree/bindings/iio/adc/sophgo,cv1800b-saradc.yaml: 
patternProperties:^channel@[0-2]+$:properties:reg: 'anyOf' conditional 
failed, one must be fixed:
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no 
constraints defined for the values.
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 
'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 
'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of 
minItems/maxItems/items
	hint: cell array properties must define how many entries and what the 
entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

Isn't it okay to just use minimum and maximum and rely on 
address-cells/size-cells for the number of items allowed ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
