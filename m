Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B1CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 15:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Fs43JCKY343aKBAghT8A7LIodIK0WYwwmuZfN0vAuk=; b=FkdccLnpz17DIf
	iVtX32VdmQic8ortjIttQPVQlUvQnXJdopeXqSvcyQiBhSF1/L3+IsEnI68uFRhY8oUyshIe5KT4B
	574R4r/pYG/e7CKWz81uGWKC7Xr1Oynm0f39PsSZJ7tABnhVn4bdl69ewxJfQWrFmhWmgn4ar+Qxv
	X8OCrj8/5l+j2b6FZcF16Y7JMs9qckGjR2TVIx0vWuS1ArZUzYv9HYw2kOHgDT8sIr5ADm5vh1SMI
	4aHYZONHVILrAWVLamWnUw8mNE0E0qVxRqiu7DQFG+LTFJXZP6qI4pB4kkWRfMbyEeqwORdpLbXld
	XxQZ9qxehtI9jsoxCe4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfc9-0000000BzCT-2ULW;
	Fri, 02 Oct 2026 15:56:01 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfc6-0000000BzB4-2Zus;
	Fri, 02 Oct 2026 15:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790956548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mKtMMk5AjJR7g3kCzeJHSQp3Xuaf4BC9Txxg7bumRH/cO2iqz3DWC+tesvsX1Vz1cgofK5kCx3luiKYLjKT8jBZt9ZJBEfs1x9Yn8YqKROjA6KTmgd1/J1+tRO0hDX7ouUGLGk5LViV/QosCzilkyS4t8RWKztrPoP0wTfMLxEc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790956548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nGdebKi33JOCANGOuNqNBIPtdhflulaW1yf0wVEOqV4=; 
	b=Z5HLRglxLHn2BnfSbM7xrP2rTwaaV2Q8pl2JpHBevh3Qh9WBfNbHK3p8WvH9cR9No1u8gG2vu3lHI7B/4fKFaVtPhEwne78eXDAhItJFq3oQRwygnvdpWkg3iWT/GLYl9XIJHF+Io2w/LJuDYif6uSrH6/WujGfG4XZqRnZOksY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790956548;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:Reply-To;
	bh=nGdebKi33JOCANGOuNqNBIPtdhflulaW1yf0wVEOqV4=;
	b=eIXcs4O9jOeiEoATsNM81XHbAzZvN6nqpdRrZCE+hmPYpenOgNeBKcYiHAIoN+xE
	diaqzg5vByF2VOVvxWvVqbi1FwuxutD9Cx6dL5P5pBCGacu3+Z4y4QCLYGAXTLNNO9s
	V8+kHiuQ9nbC59l4NLOVeJU5vFVrI+3VcenyqZqM=
Received: by smtp.zohomail.com with SMTPS id 1790956546300716.3663133196663;
	Fri, 2 Oct 2026 08:55:46 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 02 Oct 2026 23:55:38 +0800
Message-Id: <DLUH3VOWTYNR.9OI9L5Q3K5OX@pigmoral.tech>
To: "Conor Dooley" <conor.dooley@microchip.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Conor Dooley" <conor@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Brian Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
 <20261002-oozy-reversal-e65157724bc3@wendy>
In-Reply-To: <20261002-oozy-reversal-e65157724bc3@wendy>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_085559_019225_C7276EEA 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Conor,

On Fri Oct 2, 2026 at 3:17 PM CST, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 02:07:00PM +0800, Junhui Liu wrote:
>> The external CAN and WDT clocks are optional inputs routed from the
>> board; the main oscillator is the only required clock. The binding
>> currently requires all three clocks, which forces device trees to add
>> stub fixed-clock nodes without a clock-frequency to satisfy it.
>> 
>> Allow the clocks and clock-names properties to contain just "osc",
>> optionally followed by either or both of "can_ext" and "wdt_ext".
>> 
>> Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
>> index 11a92588e494..8bd7b78a58d8 100644
>> --- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
>> +++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
>> @@ -17,16 +17,26 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> -    items:
>> -      - description: Main oscillator
>> -      - description: External CAN clock
>> -      - description: External WDT clock
>> +    minItems: 1
>> +    maxItems: 3
>> +    description:
>> +      The main oscillator is always required. An external CAN clock and an
>> +      external WDT clock may additionally be provided if the board routes these
>> +      clocks to the SoC.
>>  
>>    clock-names:
>> -    items:
>> +    oneOf:
>>        - const: osc
>> -      - const: can_ext
>> -      - const: wdt_ext
>> +      - items:
>> +          - const: osc
>> +          - const: can_ext
>> +      - items:
>> +          - const: osc
>> +          - const: wdt_ext
>> +      - items:
>> +          - const: osc
>> +          - const: can_ext
>> +          - const: wdt_ext
>
> This need not be so complicated. The following should do the trick:
>
> clock-names:
>   minItems: 1
>   items:
>     - const: osc
>     - enum: [can_ext, wdt_ext]
>     - const: wdt_ext

Thanks for showing me the simpler way to express this. I will update it
in v2.

>
> pwbot: changes-requested
>
>>  
>>    "#clock-cells":
>>      const: 1
>> 
>> -- 
>> 2.55.0
>> 

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
