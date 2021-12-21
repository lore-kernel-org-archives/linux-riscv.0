Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8803C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Snh5FsuabVVMs411er/l5AVPHXl+zsX41/m+XxhPwAM=; b=ucc5wshA75oJcY
	VNYaovAEtdcHVlhLQXmh8teyEGcJLcsR9do/DTBiMmzwelHMUMHa1goNIShrtROua9Fq7odU8xNMa
	j3fqdd9v4YGgGY3PXAeQDMDLVryDblNrLO6IgEvpbhatak5OUn1skS5HsIT3aBI0+bdO3Hd8ykFZC
	tx/Cin0NYGGXjsy4I3eNskCuwDVWNTWLmYGDyWQelsq1Rcsxph4gNGEL0wB77WA/wFoBKq129KYb/
	v94aYG4nJ7rB9J9xBXuoy9PH1uczXsMD/dxNEcHdrfAMxxVgt2Wm8b3lzXm/mTy8xllWijr94iPYQ
	MAYyTDfp+wEeLlKUzC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzouK-008kVQ-0Y; Tue, 21 Dec 2021 23:51:00 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzouG-008kUZ-LG
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 23:50:58 +0000
Date: Tue, 21 Dec 2021 23:50:47 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: Rob Herring <robh@kernel.org>
From: conor dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, broonie@kernel.org, gregkh@linuxfoundation.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 03/17] dt-bindings: soc/microchip: make
 systemcontroller a mfd
Message-ID: <YfGEPBe6qV6ieFoD_Xk-rEkBwvyWlVDCxk1PNycMfHsRYK1zMpawiDI25G1EZorczGJGj8e-epWgPs_UB8_-DP4keo1ivgfrLOXJNliFRxE=@conchuod.ie>
In-Reply-To: <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-4-conor.dooley@microchip.com>
 <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_155056_902738_90267094 
X-CRM114-Status: GOOD (  10.24  )
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
Reply-To: conor dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tuesday, December 21st, 2021 at 17:55, Rob Herring <robh@kernel.org> wrote:

>On Fri, Dec 17, 2021 at 09:33:11AM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Make the system controller on the Polarfire SoC
>> a "simple,mfd" so that the services can be child
>> nodes of the system controller node.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/>Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> index f699772fedf3..014cb44b8f31 100644
>> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> @@ -13,13 +13,34 @@ description: |
>>    The PolarFire SoC system controller is communicated with via a mailbox.
>>    This document describes the bindings for the client portion of that mailbox.
>>
>> -
>>  properties:
>>    mboxes:
>>      maxItems: 1
>>
>>    compatible:
>> -    const: microchip,mpfs-sys-controller
>> +    items:
>> +      - const: microchip,mpfs-sys-controller
>> +      - const: simple-mfd
>
>'simple-mfd' means there is zero dependency on the parent for the child
>nodes. Isn't 'mboxes' a dependency?

I suppose it is. I was going off what had been done for the bcm2835
firmware for the rpi its also a mailbox providing "services".
(arm/bcm/raspberrypi,bcm2835-firmware.yaml)
>
>> +
>> +  hwrandom:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-rng
>> +
>> +    required:
>> +      - compatible
>> +
>> +  sysserv:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-generic-service
>> +
>> +    required:
>> +      - compatible
>
>There's not really any need to have child nodes which have no resources.
>The driver for microchip,mpfs-sys-controller can create child devices.

I am assuming by this you mean say, take a list of boolean properties and
convert those into child devices? There's a fairly decent number of services
provided by the system controller and these children just represent the
subset that we've implemented so far.

Conor
>
>Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
