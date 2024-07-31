Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9528BC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJK1+JnmUJ+glfFrMg4+xuV/aJMU6ZwmJIoAwGI9ZtQ=; b=CrjzwPWxPWTO30
	0b/eUDQoQ9XQEuVTHbPGfeSH8PRN4FLbCygf8qsXxTEeo3opXfp4jGYczDExNCyPkbGxZY/rgESPk
	HPSNBD9VcbrRbdBihIEzoTEB3io8DpCp8SdI//QnZSehmQm0C74EoClKFwN30Nz7cvJ3iGs0dy0pN
	hlkFXd0bJJ+8XX6qGCgHpikFQ/yhuyZt8gAhsmRs5VGU8T4WmZSvHuURgTGDG2OVRIcQlguuh6WMD
	aXRklif72zxaafweiOmJNFTUDQhxcemI4FRyH+rbFgKrPnrBfPNKwiUisNDTAFGUYH5GE+/6K8TRX
	l4mUv1cEw83stIBWlOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZAcf-00000001Yjz-1CJb;
	Wed, 31 Jul 2024 14:48:13 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZAcc-00000001Yj5-0wAY
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 14:48:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6188C0002;
	Wed, 31 Jul 2024 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722437286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYb96CYTFrtvLLMBBd+KpMxW0vaxTI7+SnwCTQcAYKc=;
	b=ctjUUWua/Ob720TUPNUK6WWBEHCjArvTvAM0iWtrtiP/zZHCB/DIJDRi12amGQeHWeNVUc
	jBfQ/7DmDV8/ZXfUaxPWVULUSyRHEhfoEHe2loWHUR+3G+QchUW2+e8pZEOqXmX7AbGIdr
	5SBwwgJl4oOTfOttvu0fh9HOPyTTuT0/wt5k8sjdxMAwt8iGsoOs0FbmSca1Cm0ZeEivkC
	iYuIRYSI/xUqtvtzPC0ELxN6kbAkrFQ6jw2qbK51lW+ie6z5+wQHunbCWbM0BQPJPWjaEH
	5AcdDpNGM+BCLh+ighoRwk05mHSsQgjPMcu4q/xn9dwlnyADgQMmTxKPZKQkWQ==
Message-ID: <184916b4-8e7b-4ed1-913e-dc03e5f61364@bootlin.com>
Date: Wed, 31 Jul 2024 16:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
To: Inochi Amaoto <inochiama@outlook.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
 <20240731-sg2002-adc-v3-1-5ac40a518c0a@bootlin.com>
 <IA1PR20MB495346557FA84CC694D184A0BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <IA1PR20MB495346557FA84CC694D184A0BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_074811_074510_AC9DD616 
X-CRM114-Status: GOOD (  17.49  )
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



On 7/31/24 2:41 PM, Inochi Amaoto wrote:
> On Wed, Jul 31, 2024 at 02:24:14PM GMT, Thomas Bonnefille wrote:
>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>> the Sophgo SoC.
>>
>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>> ---
>>   .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 48 ++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> new file mode 100644
>> index 000000000000..79d8cb52279f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>> @@ -0,0 +1,48 @@
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
>> +          - const: sophgo,cv1800b-saradc
> 
> There is no need to use "oneOF" and "items"
> 

Thank you very much, I'll do that.

> Suggestions: add a compatible like "cv1800-saradc" as fallback
> and add use "sophgo,cv1800b-saradc" as specific compatible.
> Use the "cv1800-saradc" in the cv18xx.dtsi and override the
> compatible with specific one if necessary.
> 

If I understand correctly, maintainers doesn't want the use of wildcards 
as generic compatibles [1]. They prefer to use the most basic SoC as the 
generic compatible.
Is the CV1800 a real SoC or is it just a kind of wildcard to say CV18* ?

> For example:
> - items:
>      - enum:
>          - sophgo,cv1800b-saradc
>      - const: sophgo,cv1800-saradc
> - const: sophgo,cv1800b-saradc
> 

To avoid the issue of falling back on a wildcard I planned to do this 
instead:
properties:
   compatible:
     const: sophgo,cv1800b-saradc



> Regards,
> Inochi

[1] : https://lore.kernel.org/all/20240708165719.000021b9@Huawei.com/

Thank you for your comments :)
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
