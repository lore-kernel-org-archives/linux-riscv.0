Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C02C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AazoMcCnoAsYQL8RmBuf53UUMvQK+A0aQkWBPn2PVdo=; b=eAppSLOavG9SHs
	G6vm5lZEKrz3Z7GlK/azFN6nz9YZfdBGoPutohmbTx9tTJm2z/9ebJJj5axP2XGDswSZJueIrtjGP
	691gZALHNn/Jg52Euc0OrmmBAXJMqtbop2kEeDfjA89ITIAI+c3y65au65FncplgeHkRap+1TmYD6
	pcIHFI7lX1wLzXnHmMU5GI+h/MOWLBPxvYh4RUaOd3zzZsgVP5r7xXShQnGJD7hEVbTs9X1aniRwM
	gxd2f4/0b7Ezeo/C4giiNaeHc/OBhohIAMZUBbo5iNLohv1aoXoKTCZ0bMj24VROpvBAKAefGQQ8t
	TfMWH7qXlsMCXfWhplJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZZn-00CCsG-PK; Thu, 20 Jan 2022 15:42:15 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZZk-00CCq9-E1
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:42:13 +0000
Date: Thu, 20 Jan 2022 15:42:06 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: conor dooley <mail@conchuod.ie>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, linux-rtc@vger.kernel.org,
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, Heiko Stuebner <heiko@sntech.de>,
 Lewis Hanly <Lewis.Hanly@microchip.com>, Daire.McNamara@microchip.com,
 Ivan.Griffin@microchip.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <Op5n9imM72IZnLCmMZ8lEZ7GxZD-r4cYZDB6zF0DcNNRu5dwpGEgi7PyjsAfQFnTMEtB8DTS76wLNWcnTtfDMUa1KDZYO3_geq-oOVXOr50=@conchuod.ie>
In-Reply-To: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
 <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
 <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
 <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_074212_653609_9DF12B21 
X-CRM114-Status: GOOD (  19.95  )
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

>Hi Conor,
>
>On Thu, Jan 20, 2022 at 2:42 PM <Conor.Dooley@microchip.com> wrote:
>> On 20/01/2022 08:30, Geert Uytterhoeven wrote:
>> > On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
>> > Wouldn't it be more logical to have:
>> >
>> >      items:
>> >        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
>> >
>> > ?
>> This would be fine for mpfs-i2c since corei2c is a "superset" - but how
>> would that look for the fabric core? I don't think falling back from the
>> fabric core onto the "hard" one makes sense. This would mean the
>> following two entries:
>>
>> i2c2: i2c@44000000 { //fabric
>>         compatible = "microchip,corei2c-rtl-v7";
>> };
>> i2c1: i2c@2010b000 { //"hard" mpfs peripheral
>>         compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
>> };
>
>Oops, I missed that you have both forms.
>But in se, they're the same IP core, just hard vs. soft? Then the
>below makes sense.
A lot (but not all) of the peripherals on Polarfire SoC are "subsets"
of the IP cores: I think corei2c is almost identical but for others
the hard version has some of the optional features disabled or slight
changes made.

If the IP is already written why not use it ;)
>
>> But this generates errors in dt_binding_check w/ your suggestion - so
>> how about the following (similar to ti,omap4-i2c.yaml):
>>
>>    compatible:
>>      oneOf:
>>        - items:
>>          - const: microchip,mpfs-i2c #  Microchip PolarFire...
>>          - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>>
>> Is there a prettier way than this duplication?
>
>I'm afraid not, and the above scheme is used a lot.
Fair enough!
>
>> > If the IP core is reused, it can become:
>> >
>> >      items:
>> >        - enum:
>> >            - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>> >            - microchip,<foo>-i2c # ...
>> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
>> >
>> > That way the driver can just match on the second (fallback) value,
>> > and no further driver changes will be needed (until v8 or later).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
