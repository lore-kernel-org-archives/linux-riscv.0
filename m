Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30BCC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 15:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBCB61413
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 15:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBCB61413
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x/YmBM0pC0HsRzpPFDhsXTJiIf+Ms59Awptr60QGUQ=; b=uk9bhtpqzN3ax6cCZOdRHl1MjG
	p3oTme33p29fPqYSGvDHnEKol3Ih6isTdhaz/GKC+I3fkahk4+k1+L3guTlBquDdTDw9qt2F5ZM33
	IKbexP76z+X1NrQWF7HH0A0kRU5x6k7yjX8fyFkVsgefxS6AmlvYora1jtSZSnd1PdSPfYcoDymgJ
	mDAXcp62CUjGqs7CyQDl0ssJ1c3hj7WnUB1Nd1bX1TR/hsxjykVxl7vd0Le6nZnc49s6OtRBS++S8
	+ZIcDkbMW7NPktDHrwTcQQ/rkHT5F4vd1ocbiOtqnkB48icntsGp6cXKU3LCSyjZZAIJv7jB8UxyY
	u4OOkTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKe7-003LYA-Cx; Fri, 02 Jul 2021 14:59:59 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKe4-003LXH-Rf
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 14:59:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9A2A02224D;
 Fri,  2 Jul 2021 16:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625237992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWy2yrkTk66WQxbgnmVpmHdWaJn/RapTlXrAofVrtKA=;
 b=fM22OssiTe4GCgmGyUJ7YDdMyNsIY/kmsOERyeYP4g4ELQkYfNOfWr0JFoVJ9aR293lgJT
 rfb47ACOX/2AevGjX5afzHIFaImldCqYHhEBny5bI8WtWGxmj45uLrrmmnZ6XV7FJPRlNm
 NdrL/SOe9I912AbrKuCnqNgw4a3Ea/g=
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 16:59:51 +0200
From: Michael Walle <michael@walle.cc>
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Emil Renner
 Berthing <kernel@esmil.dk>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210701203333.GA963857@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc> <20210701203333.GA963857@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c915172ac456b3f7b7547c065c41750b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_075957_117757_5F2506DA 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Drew,

Am 2021-07-01 22:33, schrieb Drew Fustini:
> On Thu, Jul 01, 2021 at 08:39:40AM +0200, Michael Walle wrote:
>> Hi Drew,
>> 
>> Am 2021-07-01 02:20, schrieb Drew Fustini:
>> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > BeagleV Starlight JH7100 board [2].
>> >
>> > [1] https://github.com/starfive-tech/beaglev_doc/
>> > [2] https://github.com/beagleboard/beaglev-starlight
>> >
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> 
>> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
>> drivers/gpio/gpio-sl28cpld.c for an example.
>> 
>> -michael
> 
> Thank you for the suggestion.  I am not familiar with GPIO_REGMAP and
> REGMAP_IRQ so I will read about it.  Is the advantage is that is helps
> to reduce code duplication by using an abstraction?

Yes, I've looked briefly at your patch and it seemed that GPIO_REGMAP
might fit here which will reduce code.

> I did notice that the gpio-sifive.c driver used regmap_update_bits() 
> and
> regmap_write().
> 
> I suppose that is better than writel_relaxed() and iowrite32() which
> this RFC driver does?

Its just another abstraction layer in between. For MMIO it will also
end up using some variant of the above (see regmap-mmio.c). But if you
use regmap, you can also use REGMAP_IRQ which might also be a fit
for your GPIO controller and thus don't have to implement your own
versions for the irq_chip ops.

-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
