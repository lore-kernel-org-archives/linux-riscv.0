Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BCC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78C660F53
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E78C660F53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJqZOAsSh1XMk9D5A1umEPezo08/x/Zp9CKjpIwAk9c=; b=hOPx2a1d+3533SFLiWoE7EX8+d
	4EFrchPERRhIiQaUBEy2ZkyV8k3EfGioGJh991KKzX2pIaDkkWXcZQc4vMnRWap+VldMLYIF0kCaf
	/IWWCwcQPHQ8UtdmMoIOFbtaMlJGLAjAdj2U+kskcu7n/ZaEeyp3qgYtZRDwHFFU5lZTeQ0FNbuW4
	shEoCQZwunUh9WCwrwgXoiyk0F485UMZaZo+knQmDYZ8ALYBwahtJjtSkpe+B6Pmdw9x/DVJ9JVOX
	ozc4e4s2dhpK7v4eBewGlv0ZlCZ8M+2aVea+1pvwAx9SbzZRSnpAekFAbv65y5Vnnof/my2dyk5UE
	HLo62osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7uw4-009tlR-Mx; Mon, 26 Jul 2021 07:22:00 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7uvn-009tdX-Js
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 07:21:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9BA582224A;
 Mon, 26 Jul 2021 09:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627284092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buAfjcLR7fPMvNNPaqEniqQuht6PIhq7VepmuEtbukM=;
 b=d4AnwWs/wVsXCvpOc1ES4tlK7A2t8P+dVfiyyRz2zkQMmAoJvVPnMeKmKXX0K5yKezneM3
 h8yG7/e3J+UcfEipB0TI6OUEE9rxPqZFgjCLsuY9bQk0Lx/ZNiBwCoA7pWjZLSUnUFln5/
 Hsux3av4yhkx7wlzcuYm6uSC0SMWUww=
MIME-Version: 1.0
Date: Mon, 26 Jul 2021 09:21:31 +0200
From: Michael Walle <michael@walle.cc>
To: Drew Fustini <drew@beagleboard.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Huan
 Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210726071124.GA9184@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dad13b899b69436acc1804b7c3438639@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_002143_885204_D1D17806 
X-CRM114-Status: GOOD (  23.47  )
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

Hi Drew, Hi Linus,

Am 2021-07-26 09:11, schrieb Drew Fustini:
> On Fri, Jul 23, 2021 at 11:04:41PM +0200, Linus Walleij wrote:
>> On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
>> > Am 2021-07-01 02:20, schrieb Drew Fustini:
>> > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > > BeagleV Starlight JH7100 board [2].
>> > >
>> > > [1] https://github.com/starfive-tech/beaglev_doc/
>> > > [2] https://github.com/beagleboard/beaglev-starlight
>> > >
>> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> >
>> > Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
>> > drivers/gpio/gpio-sl28cpld.c for an example.
>> 
>> To me it looks just memory-mapped?
>> 
>> Good old gpio-mmio.c (select GPIO_GENERIC) should
>> suffice I think.

But that doesn't mean gpio-regmap can't be used, no? Or what are
the advantages of gpio-mmio?

>> Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
>> of GPIO_GENERIC calling bgpio_init() in probe().
> 
> Thank you for the suggestion. However, I am not sure that will work for
> this SoC.
> 
> The GPIO registers are described in section 12 of JH7100 datasheet [1]
> and I don't think they fit the expectation of gpio-mmio.c because there
> is a seperate register for each GPIO line for output data value and
> output enable.
> 
> There are 64 output data config registers which are 4 bytes wide. There
> are 64 output enable config registers which are 4 bytes wide too. 
> Output
> data and output enable registers for a given GPIO pad are contiguous.
> GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
> is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
> effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
> Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
> 
> However, GPIO input data does use just one bit for each line. GPIODIN_0
> at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].

I'd say, that should work with the .reg_mask_xlate of the gpio-regmap.

-michael

> Thus the input could work with gpio-mmio but I am not sure how to
> reconcile the register-per-gpio for the output value and output enable.
> 
> Is there way a way to adapt gpio-mmio for this situation?
> 
> Thanks,
> Drew
> 
> [1] https://github.com/starfive-tech/beaglev_doc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
