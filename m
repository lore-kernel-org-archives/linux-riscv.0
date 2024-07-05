Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8160C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cNKzKvNhd1i9ufTzEs309tkRdJGfu7xUDnE2bdZHOE=; b=NzpmoudEqECCb6
	4/V9plF9fmBkT5eHbmD/mnwb1pqy+aAUHPARelL0M6vS+SVhVD98n0WXrESrVx4ntdjSg+X8OoY9t
	PZetfXUx0laZPEm8n7Hq4GvTS7+JHsvn1ilL9l1qDWxX5uUMqqEXN0vTw8DExH9PEGZWA/MyuJ5FE
	JavJbvBjMsvmPy+wKBGQpHEP/g20XcL4edxxPphmbqmh4YR1vKQw3C2aO6PWev4xgUNaZgquiNu+B
	bOGLi8Z9ZgiXszD6toTZpW+UG0Q+h2k/awIUOWGjV6CANWY9wDCEgKyMg+EIlFi4rL9ct9Su+Ag2j
	l56/dGIf6xsB/YxNNHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPknT-0000000GKGe-4C5p;
	Fri, 05 Jul 2024 15:24:28 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPknP-0000000GKFx-3coz
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 15:24:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AFA7C0002;
	Fri,  5 Jul 2024 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720193061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMVflziC1aehBJf4VTjlbQPH2LpM9ezvmYf2pbzh65s=;
	b=OL7Nxx1zP1SzNXRZ9t2/CTWdNHOcU2FY1TxN46d4gqsX3w73Cd6cmMb8QZ9kQruPrACgHW
	s9gwRa5IuDYTAOrumyqOY3AcvyGVad0Dxsx3rYgNxEfCcFuoM3kwiGgZlfmMR5PKfzkWYc
	M033MIo+s/dr582KlrKDvYVlivF+SAw65HQrwnMD7gjLXsBv9xfjTpm04G2UfuruASPNOI
	3iUSH8jkQGlgWIuUrBgAPn8B46zsKeKQFt+Ca6EcIlaXJ8zA1MFNmesoO0579VO5dOyRFc
	+disElGQ8OvsMMuepTrwgL1AVoRMj0hh8BRY8MtKORL6TrjS1pMYhoznZ3W5DA==
Message-ID: <6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
Date: Fri, 5 Jul 2024 17:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
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
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
 <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
 <20240705-unaired-pesticide-4135eaa04212@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240705-unaired-pesticide-4135eaa04212@spud>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_082424_384466_60779AC3 
X-CRM114-Status: GOOD (  19.71  )
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



On 7/5/24 5:01 PM, Conor Dooley wrote:
> On Fri, Jul 05, 2024 at 03:42:23PM +0200, Thomas Bonnefille wrote:
>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>> the Sophgo SoC.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> ---
>>   .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 63 ++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> new file mode 100644
>> index 000000000000..31bd8ac6dfa5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
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
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - sophgo,cv1800b-saradc
>> +          - const: sophgo,cv18xx-saradc
> 
> I don't think the fallback here makes sense. If there's other devices
> with a compatible programming model added later, we can fall back to the
> cv1800b.
> 

Ok I'll do that, I wasn't sure if it was a good practice to fallback on 
another SoC specific compatible.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description:
>> +      SARADC will use the presence of this clock to determine if the controller
>> +      needs to be explicitly clocked by it (Active domain) or if it is part of
>> +      the No-Die Domain, along with the RTC, which does not require explicit
>> +      clocking.
> 
> What does "explicit clocking" mean? Is it clocked directly (or via
> dividers) by a clock on the board or another source?
> 

It means that, if a clock is provided, the driver will work in "Active 
Domain" and will use the clock generator of the SoC to get the right 
clock signal.

However if no clock is provided, the controller will work in "No-Die" 
domain (Always On) and use the RTCSYS subsystem to get its clock signal.

Indeed "explicitly clocked" may not be the right word to describe that, 
maybe some thing like that is better :

"SARADC will use the presence of this clock to determine if the 
controller needs to use the clock generator to get its clock signal 
(Active domain) or if it is part of the No-Die Domain, along with the 
RTC, and does not require the clock generator."

Regards,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
