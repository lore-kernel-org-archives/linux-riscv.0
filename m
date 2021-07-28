Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873C6C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 11:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E9FB60FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 11:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E9FB60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDU8K3XqVpWAdzB/e4b2V6MiNEG4s1X0Dp1g0umBabQ=; b=co2s2wPhzks5JvKQ7tfs5K10XT
	G/8FmLPpvezaWAOvpdueSlr77iEu5Rex3kw1TXlNq56uMzf57F9725zpPwylDz+9GGak7qMEU/pO/
	4gdHEC+hI1Rzyxcx+AW1SjH7gohZ7jMKm9ivgXdOzPt4XGWaLy+xh1jErL5RPxWmpqpAp9HLE0Koo
	ujA6tBhATWnfM/TGHvhDdaN73E1C0GTsv6krMsQ81J50nAk/8mjm4xG/cfwZuHsJ8R9H1VS+J3qNf
	S4L8LaqzDkRqLaiEsU6tEnGsASbhmx/1Y5v+oq3RFDXySbZzuORpfb7BLMHGzV3y7dLC7fVI+WwuR
	L2f4Nuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8har-000XHl-4k; Wed, 28 Jul 2021 11:19:21 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8han-000XGs-Ie
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 11:19:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 703A622175;
 Wed, 28 Jul 2021 13:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627471154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gd/q/9Efd319bq9/Xek1Wzgq86ZS5+DbyemxYnLNbM=;
 b=EGpSJ0lCMS2uDVS4hfL0F5Grk6GKZ+3lPJ/TYuKdNMDwuYvMWSDoszzP1EX+m+yDFru2f5
 3F8co3OoqPGVJseQSZIdrJ14thRZ0YXF/pZtqtIGqa/ygiS/qvbFc5pZTtZhXttCF5ZU2Z
 5ckhGIXV7n5uZKmyyPAxw7CMAqV4vWM=
MIME-Version: 1.0
Date: Wed, 28 Jul 2021 13:19:14 +0200
From: Michael Walle <michael@walle.cc>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Drew Fustini <drew@beagleboard.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu
 <michael.zhu@starfivetech.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <CANBLGczfrmv1tzFm=Fu6B_S8nZ=ckwd3DOBkN4x7BUZtAg7bdw@mail.gmail.com>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1> <dad13b899b69436acc1804b7c3438639@walle.cc>
 <20210727052851.GA3147871@x1> <ff76b62927e3f5f016f6c4c11ca16ccf@walle.cc>
 <CANBLGczfrmv1tzFm=Fu6B_S8nZ=ckwd3DOBkN4x7BUZtAg7bdw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a15823a88515f944cad6d77bdd65555c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_041917_974940_55189B6B 
X-CRM114-Status: GOOD (  27.92  )
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

Am 2021-07-28 12:59, schrieb Emil Renner Berthing:
> On Wed, 28 Jul 2021 at 11:49, Michael Walle <michael@walle.cc> wrote:
>> Hi Drew,
>> Am 2021-07-27 07:28, schrieb Drew Fustini:
>> [..]
>> >> > > Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
>> >> > > of GPIO_GENERIC calling bgpio_init() in probe().
>> >> >
>> >> > Thank you for the suggestion. However, I am not sure that will work for
>> >> > this SoC.
>> >> >
>> >> > The GPIO registers are described in section 12 of JH7100 datasheet [1]
>> >> > and I don't think they fit the expectation of gpio-mmio.c because there
>> >> > is a seperate register for each GPIO line for output data value and
>> >> > output enable.
>> >> >
>> >> > There are 64 output data config registers which are 4 bytes wide. There
>> >> > are 64 output enable config registers which are 4 bytes wide too. Output
>> >> > data and output enable registers for a given GPIO pad are contiguous.
>> >> > GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
>> >> > is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
>> >> > effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
>> >> > Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
>> >> >
>> >> > However, GPIO input data does use just one bit for each line. GPIODIN_0
>> >> > at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].
>> 
>> Mh, I'm not sure I'm understanding the datasheet/registers. _DOUT_CFG
>> and _DOEN_CFG seem to specify the pad where this GPIO is mapped to.
>> Shouldn't this be some kind of pinctrl then? Apparently you can map
>> any GPIO number to any output pad, no? Or at least to all pads
>> which are described in Table 11-2. What happens if two different GPIOs
>> are mapped to the same pad? Bit 31 in these _CFG seems to be an invert
>> bit, but what does it invert?
>> 
>> Similar, the input GPIOs are connected to an output pad by all the
>> GPI_*_CFG registers.
>> 
>> To me it seems, that there two multiplexers for each GPIO, where
>> you can connect any GPIOn to any input pad and output pad. Sound
>> like a huge overkill. I must be missing something here.
>> 
>> But what puzzles me the most, where do I set the actual GPIO output
>> value?
> 
> Yeah, it's a little confusing. The DOUT registers choose between a 
> number of
> signals from various peripherals to control the output value of the
> pin. Similarly
> the DOEN registers chose between a number of signals to control the 
> output
> enable of the pin. However, two of those signals are special in that 
> they are
> constant 0 or constant 1. This is how you control the output value and 
> output
> enable from software like a regular GPIO.
> 
> You're completely right though. This ought to be managed by a proper 
> pinctrl
> driver, and I'm working on one here:
> https://github.com/esmil/linux/commits/beaglev-pinctrl

Ahh, I see. So for the non-gpio function you have to set a value other
than 0 or 1, correct?

And as an implementation detail you have to set the corresponding OE
pin if the non-gpio function will need a tristate pin (or whatever).

So, the _DOUT_CFG will actually be shared between the pinctrl and the
gpio driver, right? (I haven't done anything with pinctrl, so this might
be a stupid question).

-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
