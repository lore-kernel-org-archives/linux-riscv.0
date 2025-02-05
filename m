Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC063C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFh3QM2znkfTq1346xRA84gaDFgzJSLwB+FM6+bZ9Jw=; b=IdZtiT+lKvcM67
	j7RnJTfEwRb3FufN5b4vAIWTBJyFgpTFOmJOVIEQGclaAZemLsZrUbFmJ7VnD7wAhtY54Li65ln4r
	Xu/pLVUSDE9/TgA0bkZ6IUT/vDQOpUvzX82pfyvG2n/3OgoFwO1Pncxwpd4nGsIcQsD2C/pJOd0nh
	7Byn8hQXUb63LwTG91ZjmjgTZitg2cG+qnY6pO2RNedXEnmdot2d3PwbeJERibVQKC8D3KBIfDxAD
	DbjIDR4l8A7ZB0ThUaWb5O7ZJ2tNfE9yrnbzX2M9aAjNZ04A620yxoQH1WzSzg9QJ3QaqZEs8spo0
	SnZYRqULX3RGyfaDTnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffLE-00000003Nj7-0ct7;
	Wed, 05 Feb 2025 13:21:20 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffLB-00000003NiK-3TIx
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 13:21:19 +0000
Received: from [192.168.2.35] (unknown [98.97.25.24])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E28DBB4C025C;
	Wed,  5 Feb 2025 14:21:12 +0100 (CET)
Message-ID: <33b971dc-1266-4d13-b9b7-620c58e5a804@freeshell.de>
Date: Wed, 5 Feb 2025 05:21:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-3-e@freeshell.de>
 <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z9s4FMCmGaGPGBdcJWxoTNO1gupMLAq2a1fExiho5W1jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_052118_013870_EC501E0A 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Emil,

On 2/5/25 02:18, Emil Renner Berthing wrote:
> E Shattow wrote:
>> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
>> better compatibility with operating system and downstream boot loader SPL
>> secondary program loader.
> 
> Here you should be explaining why these values better describe the hardware. To
> me this just reads as "u-boot does this, so let's do the same" whith doesn't
> really explain anything.
> 
> /Emil
> 
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index a5661b677687..8a59c3001339 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -317,8 +317,8 @@ &qspi {
>>  	nor_flash: flash@0 {
>>  		compatible = "jedec,spi-nor";
>>  		reg = <0>;
>> -		cdns,read-delay = <5>;
>> -		spi-max-frequency = <12000000>;
>> +		cdns,read-delay = <2>;
>> +		spi-max-frequency = <100000000>;
>>  		cdns,tshsl-ns = <1>;
>>  		cdns,tsd2d-ns = <1>;
>>  		cdns,tchsh-ns = <1>;
>> --
>> 2.47.2
>>

That is true, there's not much to explain. It works at delay 2 and
100MHz max. I tried many delay values with the pre-existing 12MHz max,
they did not work. I don't have more information than that except what I
wrote about on the U-Boot mailing list [1]

[1]
https://lore.kernel.org/u-boot/ZQ2PR01MB13072E932737DD9D65E3A250E637A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/

The parameter training code in U-Boot when given max 100MHz has this at
somewhere between delay 2 and delay 3, where delay 3 almost appears to
work but there's data corruption, and delay 1 is totally non-functional.
With all testing so far the delay 2 and max frequency 100MHz is reliable
and also is a common occurrence in the Linux code base for similar qspi
access.

My testing methodology was pretty extensive and I wrote about the result
on the U-Boot mailing list, however here we're taking the success of
that in U-Boot and literally just applying it to Linux where it also
happens to align with some common similar assignments for other boards
in the devicetree code base. It works and there's no deeper insight here.

Welcome to hear from anyone that might actually understand this hardware?

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
