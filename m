Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068F4CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKNLv67WVoaSmXWPtXH8lVYRbP8GZ8s5YVkwmBweE7o=; b=pHZG52TdmOsW3Q
	ZLP1svieHSAADBp9NQSFMhM/o6+mWxDD5nf307R7OWQEVRAv9vPfTwqJIwOjnyi3WzJ4i7abh7a4i
	ysm05Z1RwZgWrLBfiOdka+uCZ8UN4dkng9cI5c0bAm0ksT+MovTjHBVj6ib1jzmym23kzb/dXkESh
	lc9yvQYruOv8qhU6rwvGMH5PpZ+C702ra2ZU25n1pgkZ4N2mmhkkoRD5PFfPFEnK5421IFx62iI/Y
	JKNtT7Zai2ExghXLYHwi8ZiRmoHKpl3KWO2zJb51pBiIDoYWZ/8aZQiUdq3SPeya9l/WyYFmCUo5O
	sf+aA42rA3WlUAiDHh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSnp-00000005j4i-3sPC;
	Wed, 10 Apr 2024 07:55:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSnn-00000005j3R-12kB
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:55:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3C07C000C;
	Wed, 10 Apr 2024 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712735720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDI/zeKH+yD7jjNfXUrLM7ZD8dXBkFQWz20udRtTqdM=;
	b=hEdarTcD4lflcfgPdpLzn00x8yijybteucx6Umk2XvH8uJdr3aO5EKQ5QqznlyHVDQP54v
	loZm6iZzFbmb1eBMNXmFbcUeK0IoSYGoXs83eM9wWrUvbWds9obRxe17Vf+hLv6S2oeZWc
	BMn1Yc4IFQiCjZ6lsF/V0yzewFneSs8CgbRnRnuq1auUOzNEgyrlraBlm1xdQLdfX7R1WD
	2kKWDViI/MaF1qsnSwckokZpKIupYq5aJeZfU43r8pneT12Z/aqVvaCMmoYzbl2+LejUve
	lTYu5wwOGYvI+srveEzjK9jaYSpMceuvu8eGoKqLRss5eMQOIgX6UL4ZVlxGCg==
Message-ID: <115662f6-a390-497e-903e-5a9bbb15e08b@bootlin.com>
Date: Wed, 10 Apr 2024 09:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: add Milk-V Duo S board
 compatibles
To: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>
References: <20240410062254.2955647-1-michael.opdenacker@bootlin.com>
 <20240410062254.2955647-2-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532EC9B654B5B1C2538851BB062@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB49532EC9B654B5B1C2538851BB062@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_005527_464096_72F5FFE6 
X-CRM114-Status: GOOD (  12.83  )
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

Hi Inochi

Thanks for the reviews!

On 4/10/24 at 09:19, Inochi Amaoto wrote:
> On Wed, Apr 10, 2024 at 08:22:53AM +0200, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Document the compatible strings for the Milk-V Duo S board[1] which uses
>> the SOPHGO SG2000 SoC, compatible with the SOPHGO CV1800B SoC[2].
>>
>> Link: https://milkv.io/duo-s [1]
>> Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
>> index 9bc813dad098..1837bc550056 100644
>> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
>> @@ -21,6 +21,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - milkv,duo
>> +              - milkv,duos
>>             - const: sophgo,cv1800b
> Why not adding sg2000 property? They are different series.
> IIRC, it at least a cv1813h not cv1800b. I suggest checking
> the vendor SDK to get the right board compatibles.

Here's what there was in the vendor provided DTB, if I noted it correctly:
compatible = "cvitek,cv181x";

Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
