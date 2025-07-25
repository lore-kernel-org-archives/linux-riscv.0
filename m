Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD98C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 05:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD/gGWE10466qULy2mGaFJswi4M0N05qW8j5lKImxjM=; b=mjC84Ypbxn6gyT
	Q6Pnxg+JSiM1JBXXozCItSwQZst0ZWJY9gWbekIcVhJQjMNLJnzWyEw3rH8HSg5/kRNskffF5qqsh
	Krs2cGQZzrGgsCvxtY6dbDsar5VyDSWBdB1Fo4FD+McQCrFx9/xnmiEHCyXj8E6idi/w7LbUeNbn1
	iGRCcXfEey20aToFRfbxRAwBZdFvDnjghYpdaObFipbDlhG56czCIsd8oTc1aSU5BN5zsTNnC75i0
	rOFCv47f7zZOxUnC1R59ZLiW4oRWrOjF+JMQ1NVRLD+Oi7N2EU44k1OoQyZhxwLQ3vSnk6Wsi/OHf
	owXsDWJlu67/pSQONcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAko-000000094UP-0xxa;
	Fri, 25 Jul 2025 05:13:58 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAkk-000000094TY-30Ab
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 05:13:56 +0000
Received: from [192.168.2.54] (unknown [98.97.27.28])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 655D2B4D0045;
	Fri, 25 Jul 2025 07:13:49 +0200 (CEST)
Message-ID: <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
Date: Thu, 24 Jul 2025 22:13:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250724075600.239522-1-e@freeshell.de>
 <20250724-equal-limb-2922f240961e@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250724-equal-limb-2922f240961e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_221354_941386_A21AD3D4 
X-CRM114-Status: GOOD (  28.72  )
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

On 7/24/25 09:51, Conor Dooley wrote:
> On Thu, Jul 24, 2025 at 12:55:53AM -0700, E Shattow wrote:
>> Drop no-sdio property avoids a delete-property on variant board dts
>> having an SDIO wireless module connected to mmc1.
> 
> I'm struggling to understand why this change is correct.
> 
> If there are specific boards that have wireless modules connected
> instead of using sdcards, how come the no-sdio property isn't moved to the
> the boards that do have sdcard slots?

Why is 'no-sdio' property there to begin with...

> The property was added for the visionfive 2, and only on mmc1, so should
> it be retained for boards that match the visionfive 2 in terms of how
> they use mmc?

Ref.:
https://lore.kernel.org/lkml/20221207131731.1291517-4-william.qiu@starfivetech.com/

My theory is VisionFive2 board hardware can support connecting up some
SDIO module there with ready-made available adapters, it may be possible
(if unusual) that would work? SDIO is 4-wide and some voltage
requirements, and a couple of GPIO, so I'm aware that's a stretch of a
statement but it could be done without soldering. I wouldn't expect it,
but why restrict this everywhere inheriting from jh7110-common.dtsi with
'no-sdio' and then (needs testing!) if it doesn't matter one way or the
other for VisionFive2 just drop it I think as being inaccurate/unnecessary?

JH7110 CPU supports two interfaces of SDIO3.0/eMMC so it's not clear to
me if there's some reason for 'no-sdio' property to be there. Does
allowing SDIO (?) break eMMC and SD Card devices, is it destructive?

Not knowing what 'no-sdio' does technically I dropped the property and
tested with the hardware I do have. The 'no-sdio' property
present/absent does not appear to do anything user-impactful on Pine64
Star64 that has SD Card slot on mmc1, and as would be expected on Milk-V
Mars CM Lite WiFi when there's an SDIO module at mmc1 it then fails to
initialize if 'no-sdio' property is present.

> 
> Could you add an explanation for why removing this entirely is the right
> thing to do, rather than only removing it for these variant boards?

Yes, I can rephrase a bit like "relax no-sdio restriction on mmc1 for
jh7110 boards", or else reconsider the approach. I was going to approach
with `/delete-property/ no-sdio;` later elsewhere but after testing on
Pine64 Star64 with similar configuration to VisionFive2 mmc interfaces,
and knowing that Milk-V Mars CM Lite WiFi detects AP6256 SDIO peripheral
at mmc1 when this property is dropped (and with a few additional
things)... I prefer to reduce the problems that would need to be avoided.

I have done all the testing I can do with hardware I have. As-is it's
just like I wrote, we'll have to solicit some testing feedback on that
and wait to learn what this does for the other boards.

Aside, anyone want to chime in what is the utility of 'no-sdio'
property, how do you know from a schematic if it is appropriate, can it
be simply dropped as I suggest for JH7110 boards?

> 
> Cheers,
> Conor.

Thank you for reviewing! -E

> 
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 2eaf01775ef5..a315113840e5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -299,7 +299,6 @@ &mmc1 {
>>  	assigned-clock-rates = <50000000>;
>>  	bus-width = <4>;
>>  	bootph-pre-ram;
>> -	no-sdio;
>>  	no-mmc;
>>  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
>>  	disable-wp;
>>
>> base-commit: 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1
>> -- 
>> 2.50.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
