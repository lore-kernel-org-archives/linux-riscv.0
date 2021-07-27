Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BFDC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A7561075
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A7561075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELcWQtF8DkXfZxuNG5RTC1IcLbcFaVxxDqI86hUclKs=; b=ocJMEAIm0IlU2w
	sEjsfTcWrSljUiz6kjLdUJWkUFHghMPPY931SGRdySM8N5P/6kCNo/PlQp41c0G7RDG8ZRuNLxvS1
	7rLyVSBXWC4gntrG+wTwKeyWo+N9UG3geQYbXXJ4Nr7uh1FXqbf5t0EMH7wbGQDx5uXvO4XP2Rsj0
	LZiCuSodsaqxsu+If84jbwDMWMTZKMc33/J+xAjS+azVzl5TaKSbgRFMKVDCCnWbd+f5T4xH4eykV
	PT1uSKXLCORXwVM3TLPG4mOs1gvG+DiQjU4hFEl1ob6p4LtwfHpNIqfJo28u8U5H9U9mWwcKlyxal
	69RjFDj+ujYMPbbjdeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HJ6-00Dm4O-Ky; Tue, 27 Jul 2021 07:15:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8FeC-00DQYM-Pm
 for linux-riscv@lists.infradead.org; Tue, 27 Jul 2021 05:28:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso2517683pjq.2
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sgOiW6w20j4J7SdvVbVJ67kfsguckEETP9qNYgQUNsI=;
 b=vkW/a6RTxvBKemqwE16fSx+LxXIqOQWifdOrnmSL7mF3kd5t2hHwqJTgPMvKrhLzfo
 ZL75NjT0x13hZCMFwy2JaubVl5oq6GtRYIYY8OjBcAywk9wLV2iWmIIB5tNoVT94mj+E
 p6qcV4UzeFqGC9egu10qKIfTbtoKsn3TD+Hbt6K2BZeutudjdd0/uwlN1QhrTtETDxWQ
 8ofyZ3vVN8sSrZaWn2jWz7EqSg2+xhVtJtzL1PHXiXw5Lpo2A3Doy7+3HQz3lUzELlA6
 gIzckUtvgMgvKBHS5Gr8Ej9RNmXZfJRvyi7DZCiqYSYvTGtyP9jiWW/F8YrhoDnJ8kc1
 cEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sgOiW6w20j4J7SdvVbVJ67kfsguckEETP9qNYgQUNsI=;
 b=n3MabTKOZDHOj3/j6oEM0MFOviPzjbSxgL/ELUcgMzDBJ2kgwGLRrK0/aTTWFG69op
 Wqn1DfbQHFV4dULz91elPZ5ABWhh0h3Gewe7k+q1THA49Styp114rvCGnG2OvUbfqx/d
 ZVozywTQrzAcH17PgztB5dCV5gyrIBgPE/BpT9jIqJ38BkpRsBDio9Yudlv5yaEbgsxl
 W49XObAMCUtPs11giVKNZB6m9Dh54terTUbg8NRABZYZpLHvBj7J25/oZZuQUwI82UOB
 pDQ7kDr7S2mqvzaU/T0lBhq7DrH1zrAQeTVslQA0oHz+qk76lpaP3z2wMdcQK0PD4ADN
 waGw==
X-Gm-Message-State: AOAM530ml7y1SSM4j49qxRm1qOqH0xr86kKwSYh3IQ5DHT123c+8Bcgx
 dksbziSjdw/uVys7h0ZKIltYWw==
X-Google-Smtp-Source: ABdhPJxkGabf4kyTW+5lVhJwSGUk30SgSmSNzobzKDTHp55bAtOdOiOjvhw61eE5M0zTsmPOoka81g==
X-Received: by 2002:a17:902:9a02:b029:118:307e:a9dd with SMTP id
 v2-20020a1709029a02b0290118307ea9ddmr17070535plp.47.1627363736119; 
 Mon, 26 Jul 2021 22:28:56 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id a13sm2053720pfl.92.2021.07.26.22.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 22:28:54 -0700 (PDT)
Date: Mon, 26 Jul 2021 22:28:51 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Michael Walle <michael@walle.cc>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210727052851.GA3147871@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1>
 <dad13b899b69436acc1804b7c3438639@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dad13b899b69436acc1804b7c3438639@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_222856_973771_60375A85 
X-CRM114-Status: GOOD (  34.72  )
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

On Mon, Jul 26, 2021 at 09:21:31AM +0200, Michael Walle wrote:
> Hi Drew, Hi Linus,
> 
> Am 2021-07-26 09:11, schrieb Drew Fustini:
> > On Fri, Jul 23, 2021 at 11:04:41PM +0200, Linus Walleij wrote:
> > > On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
> > > > Am 2021-07-01 02:20, schrieb Drew Fustini:
> > > > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > > > > BeagleV Starlight JH7100 board [2].
> > > > >
> > > > > [1] https://github.com/starfive-tech/beaglev_doc/
> > > > > [2] https://github.com/beagleboard/beaglev-starlight
> > > > >
> > > > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > >
> > > > Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> > > > drivers/gpio/gpio-sl28cpld.c for an example.
> > > 
> > > To me it looks just memory-mapped?
> > > 
> > > Good old gpio-mmio.c (select GPIO_GENERIC) should
> > > suffice I think.
> 
> But that doesn't mean gpio-regmap can't be used, no? Or what are
> the advantages of gpio-mmio?
> 
> > > Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
> > > of GPIO_GENERIC calling bgpio_init() in probe().
> > 
> > Thank you for the suggestion. However, I am not sure that will work for
> > this SoC.
> > 
> > The GPIO registers are described in section 12 of JH7100 datasheet [1]
> > and I don't think they fit the expectation of gpio-mmio.c because there
> > is a seperate register for each GPIO line for output data value and
> > output enable.
> > 
> > There are 64 output data config registers which are 4 bytes wide. There
> > are 64 output enable config registers which are 4 bytes wide too. Output
> > data and output enable registers for a given GPIO pad are contiguous.
> > GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
> > is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
> > effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
> > Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
> > 
> > However, GPIO input data does use just one bit for each line. GPIODIN_0
> > at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].
> 
> I'd say, that should work with the .reg_mask_xlate of the gpio-regmap.
> 
> -michael

Thanks, yes, I think trying to figure out how .reg_mask_xlate would need
to work this SoC.  I believe these are the only two implementations.

From drivers/gpio/gpio-regmap.c:

  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
				      unsigned int base, unsigned int offset,
				      unsigned int *reg, unsigned int *mask)
  {
	  unsigned int line = offset % gpio->ngpio_per_reg;
	  unsigned int stride = offset / gpio->ngpio_per_reg;

	  *reg = base + stride * gpio->reg_stride;
	  *mask = BIT(line);

	  return 0;
  }

From drivers/pinctrl/bcm/pinctrl-bcm63xx.c:

  static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
				    unsigned int base, unsigned int offset,
				    unsigned int *reg, unsigned int *mask)
  {
	  unsigned int line = offset % BCM63XX_BANK_GPIOS;
	  unsigned int stride = offset / BCM63XX_BANK_GPIOS;

	  *reg = base - stride * BCM63XX_BANK_SIZE;
	  *mask = BIT(line);

	  return 0;
  }

Let's say a driver calls gpio_regmap_set(chip, 0, 5) to set line 5 to
value 1.

I believe this would result in call to:

  gpio->reg_mask_xlate(gpio, gpio->reg_set_base, 5, &reg, &mask)

Then this would be called to set the register:

  regmap_update_bits(gpio->regmap, reg, mask, mask);

From datasheet section 12 [1], there are 64 output data registers which
are 4 bytes wide. There are 64 output enable registers which are also 4
bytes wide too. Output data and output enable registers for a GPIO line
are contiguous. Thus GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54.
The forumla is GPIOn_DOUT_CFG is 0x50+8n and GPIOn_DOEN_CFG is 0x54+8n.
Thus for GPIO line 5:

  GPIO5_DOUT_CFG is 0x50 + 0x28 = 0x78
  GPIO5_DOEN_CFG is 0x54 + 0x28 = 0x7C

Enable GPIO line 5 as output by writing 0x1 to 0x7C and set output value
to 1 by writing 1 to 0x7C.

Using gpio_regmap_simple_xlate() as a template, I am thinking through
xlate for this gpio controller:


static int gpio_regmap_starfive_xlate(struct gpio_regmap *gpio,
				      unsigned int base, unsigned int offset,
				      unsigned int *reg, unsigned int *mask)
{
	// reg_set_base is passed as base
	// let reg_set_base = 0x50 (GPIO0_DOUT_CFG)
	// let gpio->reg_stride = 8
	// let offest = 5 (for gpio line 5)

	*reg = base + offset * gpio->reg_stride;
	// *reg = base:0x50 + offset:0x5 * reg_stride:0x8
	// *reg = 0x50 + 0x28
	// *reg=  0x78

	// Each gpio line has a full register, not just a bit. To output
	// a digital 1, then GPIO5_DOUT_CFG would be 0x1. To output
	// digital 0, GPIO5_DOUT_CFG would be 0x0. Thus I think the mask
	// should be the least significant bit.
	*mask = BIT(1);

	return 0;
}

Let's walk through what would happen if gpio_regmap_set() was the
caller:

static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
			    int val)
{
	// for gpio line, offset = 5
	// if want to set line 5 high, then val = 1
	struct gpio_regmap *gpio = gpiochip_get_data(chip);

	// reg_set_base would be set to 0x50 (GPIO0_DOUT_CFG)
	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
	unsigned int reg, mask;

	gpio->reg_mask_xlate(gpio, base /* 0x50 */, offset /* 5 */, &reg, &mask);
	if (val) /* if val is 1 */
		regmap_update_bits(gpio->regmap, reg, mask, mask);
		// if mask returned was 0x1, then this would set the
		// bit 0 in GPIO5_DOUT_CFG
	else /* if val is 0 */
		regmap_update_bits(gpio->regmap, reg, mask, 0);
		// if mask returned was 0x1, then this would clear
		// bit 0 in GPIO5_DOUT_CFG
}

Now for the output enable register GPIO5_DOEN_CFG, the output driver is
active low so 0x0 is actually enables output where as 0x1 disables
output.  Thus maybe I need to add logic like:


static int gpio_regmap_starfive_xlate(struct gpio_regmap *gpio,
				      unsigned int base, unsigned int offset,
				      unsigned int *reg, unsigned int *mask)
{
	<snip>
	if (base == GPIO0_DOUT_CFG)
		*mask = 0x1U;
	else if (base == GPIO0_DOEN_CFG)
		*bit = ~(0x1U);

	return 0;
}

What do you think of that approach?

Are there any other examples of regmap xlate that I missed?

Thanks,
Drew

[1] https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
