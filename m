Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C07C3065C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vb3xEzBWUU9XZfXJL7KSIUTaKfVjxVEhqq3lzf2oQ1U=; b=kYW1JaOxDQlndw
	KfhEPSOJF2YcNA6APXO/9fvFvDGzKeO7YsYy0pG0px+IEP9pTIrjANqd/Vle5Nz9Dey9dY7hVUnIo
	V8wikFty57Z9xZ1x1z5C4wp2L9EaECkF1TXEQoZxu5Y0CH81wxc0rK04BeYnWEaTu+3nw4a91DQ2C
	OgYuHMOM+Gq2TNWUdJcvvuuwEWbadfG2n4Gvei1xSLjqWw1tINkbxwNC65Cx7+TB9NXA/E5SvU8VZ
	b+UAhrnZ2dry2/uA3+PjDAVBYpa7wQxZGI62T4tBnKnZiYLEaAGegX3+XlgBMmmtZXhVS8kViDoxj
	BOjZ53BW8yhvYxAjcRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHwF-0000000CbgT-1op8;
	Thu, 04 Jul 2024 08:35:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHwC-0000000CbfN-0sR2
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 08:35:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A56C3E0006;
	Thu,  4 Jul 2024 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720082128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWar8m3O4fo/jZOi8A6VIxRWgKYWwe4SDSJKBXm4MU8=;
	b=WUyqWIIgLtb7ykFLsUTyM+0/eHHcIhl5IRjvw2bfVzhIjxXfCwGVhH1pwDAF7crb5ffXu4
	cORDlXxTlzHgnTdNGHo8uxhVGRZKgXBA9owVfPuSPdG3tcV8HN1G8CBnQopHwcG5SJeK8H
	BvBfeOHHL9L9NoEuDbh24zce/yRjNMbY6HLX39ovWFAXjSe9Jr40Veeuu209ulSqFDaSFD
	X1hUKGz6XVt34aElqd5YYkObjRogHKEAdZqAXHnDnLp2kP6g5wEHE6qv59gLVmY/SCSMkZ
	SABmtWRB7y6xLa1EKLnaz0mID5g2lObdb/lF9i6JUanYXdQi+TFsY1yJaQlrlQ==
Message-ID: <8d368347-7cee-41af-a033-c495eeb62e2a@bootlin.com>
Date: Thu, 4 Jul 2024 10:35:25 +0200
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
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <b7913f90-7405-4a77-9c57-97ef124de6e1@kernel.org>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_013532_581780_DB7E1438 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,
Thank you for your feedback

On 7/3/24 7:08 AM, Krzysztof Kozlowski wrote:
> On 02/07/2024 13:52, Thomas Bonnefille wrote:
>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>> the Sophgo SoC.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> ---
>>   .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 51 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 +++
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> new file mode 100644
>> index 000000000000..21fd5dc8e24e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-adc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo 3 channels Successive Approximation Analog to Digital Converters
>> +
>> +maintainers:
>> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> +
>> +description:
>> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv18xx-saradc
> 
> Except that this was never tested... wild-cards are generally not allowed.
> 

I realized I made a mistake when using the "make dt_binding_check" 
command, which led to some errors in this dt_binding. I have now 
addressed all of them, but I'm not sure I understand your comment.

I don't see any wildcards in the YAML file. Could you please provide 
more details on what you expect?

Best regards,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
